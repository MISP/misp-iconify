#!/usr/bin/env bash

set -euo pipefail

#
# Import per-galaxy icons from the misp-galaxy submodule into the icon set.
#
# Unlike misp-objects (which ships ready-made SVG glyphs), misp-galaxy does NOT
# store icons as files: each galaxy definition (vendor/misp-galaxy/galaxies/<g>.json)
# only references a Font Awesome icon *name* in its "icon" key, e.g.
#   threat-actor.json -> "icon": "user-secret"
# We therefore download the actual glyph from the Iconify API (which mirrors the
# Font Awesome Free set) and store it as src/svg/galaxies/<galaxy-name>.svg.
#
# One file per galaxy (the entity), named after the galaxy — mirroring how
# fetch-object-icons.sh stores one file per object. Several galaxies share the
# same Font Awesome glyph; each unique glyph is fetched once and reused.
#
# The downloaded glyphs are Font Awesome Free artwork (CC-BY-4.0), so provenance
# is recorded against Font Awesome under variant-qualified keys ("galaxies/<g>")
# in metadata/icons.json — these flow into ATTRIBUTION.md automatically.
#
# Re-runnable: wipes src/svg/galaxies and the existing "galaxies/*" metadata keys
# before re-importing, so removed-upstream galaxies disappear cleanly.
#
# Usage:
#   bash src/scripts/fetch-galaxy-icons.sh            # use the pinned submodule commit
#   REFRESH=1 bash src/scripts/fetch-galaxy-icons.sh  # pull latest of the tracked branch first
#

SUBMODULE="./vendor/misp-galaxy"
GALAXY_SRC="$SUBMODULE/galaxies"
DEST="./src/svg/galaxies"
META="./metadata/icons.json"

SOURCE_NAME="Font Awesome Free"
LICENSE="CC-BY-4.0"
URL="https://fontawesome.com"

# Iconify mirrors the Font Awesome Free set. MISP renders FA5, so prefer the
# FA5 collections and fall back to FA6 for the few glyphs FA5 lacks.
ICONIFY_API="https://api.iconify.design"
PREFIXES=(fa-solid fa-brands fa6-solid fa6-brands)

# A handful of galaxies reference an icon name that is not a real Font Awesome
# glyph (MISP would render a broken icon). Map them to the intended glyph.
declare -A ICON_ALIAS=(
  [ninja]="user-ninja"
)

#
# 1. Make sure the submodule is populated (and optionally refreshed)
#
if [[ ! -e "$GALAXY_SRC" ]]; then
  echo "Submodule not initialised, fetching..."
  git submodule update --init "$SUBMODULE"
fi

if [[ "${REFRESH:-0}" == "1" ]]; then
  echo "Refreshing submodule to latest of tracked branch..."
  git submodule update --remote "$SUBMODULE"
fi

if [[ ! -d "$GALAXY_SRC" ]]; then
  echo "❌ $GALAXY_SRC not found. Is the submodule checked out?"
  exit 1
fi

command -v jq >/dev/null   || { echo "❌ jq is required";   exit 1; }
command -v curl >/dev/null || { echo "❌ curl is required"; exit 1; }

#
# Strip width/height from the *root* <svg> tag only, so the icons satisfy
# validate-icons.sh and the optimize -> fit-ratio -> png/webp/css pipeline.
#
strip_root_dimensions() {
  perl -0777 -pe \
    's{<svg\b[^>]*?>}{ (my $t=$&) =~ s/\s+(?:width|height)="[^"]*"//g; $t }se'
}

# kebab-case a galaxy name: underscores -> dashes (a few galaxies, e.g.
# branded_vulnerability, use snake_case; everything else is already kebab).
kebab() {
  printf '%s' "$1" | tr '_' '-'
}

#
# Resolve + download a Font Awesome glyph by name, cached by name so a glyph
# shared across galaxies is fetched only once. On success sets the global
# RESOLVED_REF to the Iconify ref (e.g. "fa-solid/user-secret") and leaves the
# downloaded SVG at "$CACHE_DIR/<resolved-name>.svg"; returns non-zero on
# failure. Called directly (not in a $(...) subshell) so the RESOLVED cache
# persists across galaxies.
#
CACHE_DIR="$(mktemp -d)"
trap 'rm -rf "$CACHE_DIR"' EXIT
declare -A RESOLVED
RESOLVED_REF=""

resolve_and_download() {
  local name="$1"
  RESOLVED_REF=""

  # alias bogus names to their real glyph
  name="${ICON_ALIAS[$name]:-$name}"

  if [[ -n "${RESOLVED[$name]:-}" ]]; then
    RESOLVED_REF="${RESOLVED[$name]}"
    return 0
  fi

  local prefix
  for prefix in "${PREFIXES[@]}"; do
    if curl -fsSL "$ICONIFY_API/$prefix/$name.svg" -o "$CACHE_DIR/$name.svg" 2>/dev/null; then
      RESOLVED[$name]="$prefix/$name"
      RESOLVED_REF="$prefix/$name"
      return 0
    fi
  done

  return 1
}

#
# 2. Reset the destination
#
rm -rf "$DEST"
mkdir -p "$DEST"

imported=0
declare -A REF_FOR        # galaxy-key -> iconify ref (for metadata)
skipped_icon=()           # galaxies whose icon could not be resolved

for json in "$GALAXY_SRC"/*.json; do
  [[ -f "$json" ]] || continue

  galaxy="$(basename "$json" .json)"
  name="$(kebab "$galaxy")"

  icon="$(jq -r '.icon // empty' "$json")"
  if [[ -z "$icon" ]]; then
    echo "⚠️  skip (no icon key): $galaxy"
    continue
  fi

  if ! resolve_and_download "$icon"; then
    echo "⚠️  skip (Font Awesome glyph not found): $galaxy -> $icon"
    skipped_icon+=("$galaxy ($icon)")
    continue
  fi

  resolved_name="${RESOLVED_REF##*/}"
  strip_root_dimensions < "$CACHE_DIR/$resolved_name.svg" > "$DEST/$name.svg"
  REF_FOR["galaxies/$name"]="${RESOLVED_REF/\//:}"   # fa-solid/user-secret -> fa-solid:user-secret
  echo "→ $name.svg  (${icon} -> ${RESOLVED_REF})"
  imported=$((imported + 1))
done

echo ""
echo "Imported $imported galaxy icon(s) from ${#RESOLVED[@]} unique Font Awesome glyph(s)."
if [[ ${#skipped_icon[@]} -gt 0 ]]; then
  echo "Skipped ${#skipped_icon[@]} galaxy/galaxies with no resolvable glyph: ${skipped_icon[*]}"
fi

#
# 3. (Re)write provenance metadata for the galaxies variant
#
echo "Updating $META ..."

entries_json="$(
  for key in "${!REF_FOR[@]}"; do
    jq -n --arg k "$key" --arg orig "${REF_FOR[$key]}" \
          --arg src "$SOURCE_NAME" --arg lic "$LICENSE" --arg url "$URL" \
      '{ key: $k, value: { source: $src, original: $orig, license: $lic, url: $url } }'
  done | jq -s 'from_entries'
)"

TMP="$(mktemp)"
jq --argjson add "$entries_json" '
  with_entries(select(.key | startswith("galaxies/") | not))   # drop stale galaxies/* keys
  + $add
' "$META" > "$TMP"
mv "$TMP" "$META"

echo "✔ metadata updated with $(jq 'length' <<<"$entries_json") galaxy entries"
echo ""
echo "Done. Next: regenerate assets — e.g."
echo "  ONLY=galaxies bash src/scripts/generate-pngs.sh"
echo "  ONLY=galaxies bash src/scripts/generate-webp.sh"
echo "  bash src/scripts/generate-css.sh && bash src/scripts/generate-catalog.sh"
echo "  bash src/scripts/validate-metadata.sh && bash src/scripts/generate-attribution.sh"
