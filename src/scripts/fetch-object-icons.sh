#!/usr/bin/env bash

set -euo pipefail

#
# Import per-object icons from the misp-objects submodule into the icon set.
#
# Source of truth upstream: vendor/misp-objects/objects/<name>/icon/icon.svg
#   plus the file-type variants vendor/misp-objects/objects/file/icon/file-*.svg
#
# They are copied into src/svg/objects/<name>.svg (the "objects" variant), with
# the root <svg> width/height stripped so they satisfy validate-icons.sh and the
# normal build pipeline (optimize -> fit-ratio -> png/webp/css) can take over.
#
# Provenance for every imported icon is (re)written into metadata/icons.json
# under variant-qualified keys ("objects/<name>") so they never collide with the
# bare-name keys used by the simple/hexagone/attributes sets.
#
# Re-runnable: it wipes src/svg/objects and the existing "objects/*" metadata
# keys before re-importing, so removed-upstream icons disappear cleanly.
#
# Usage:
#   bash src/scripts/fetch-object-icons.sh            # use the pinned submodule commit
#   REFRESH=1 bash src/scripts/fetch-object-icons.sh  # pull latest of the tracked branch first
#

SUBMODULE="./vendor/misp-objects"
OBJECTS_SRC="$SUBMODULE/objects"
DEST="./src/svg/objects"
META="./metadata/icons.json"

SOURCE_NAME="MISP Project"
LICENSE="BSD-2-Clause"
URL="https://github.com/MISP/misp-objects"

#
# 1. Make sure the submodule is populated (and optionally refreshed)
#
if [[ ! -e "$OBJECTS_SRC" ]]; then
  echo "Submodule not initialised, fetching..."
  git submodule update --init "$SUBMODULE"
fi

if [[ "${REFRESH:-0}" == "1" ]]; then
  echo "Refreshing submodule to latest of tracked branch..."
  git submodule update --remote "$SUBMODULE"
fi

if [[ ! -d "$OBJECTS_SRC" ]]; then
  echo "❌ $OBJECTS_SRC not found. Is the submodule checked out?"
  exit 1
fi

#
# Strip width/height from the *root* <svg> tag only (inner <rect>/<path>
# width/height — used by the file-type pixel art — must be preserved).
#
strip_root_dimensions() {
  perl -0777 -pe \
    's{<svg\b[^>]*?>}{ (my $t=$&) =~ s/\s+(?:width|height)="[^"]*"//g; $t }se' \
    "$1"
}

is_kebab() {
  [[ "$1" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]
}

#
# An icon fits the set only if it is monochrome and follows currentColor.
# We look at the *rendered* markup (defs/mask stripped, since white/black there
# is the legitimate masking technique) and reject anything that hardcodes a
# colour (#hex / rgb()) or never references currentColor at all. This filters
# out the handful of full-colour raster-traced logos upstream ships.
#
is_conforming() {
  local rendered
  rendered="$(perl -0777 -pe 's{<defs\b.*?</defs>}{}gs; s{<mask\b.*?</mask>}{}gs' "$1")"

  if printf '%s' "$rendered" | grep -qiE '(fill|stroke|color)\s*[:=]\s*"?(#[0-9a-f]{3,8}|rgb)'; then
    return 1
  fi
  if ! printf '%s' "$rendered" | grep -qiE '(fill|stroke)\s*[:=]\s*"?currentColor'; then
    return 1
  fi
  return 0
}

#
# 2. Reset the destination
#
rm -rf "$DEST"
mkdir -p "$DEST"

imported=0
skipped_name=()
skipped_color=()

import_one() {
  local src="$1" name="$2"

  if ! is_kebab "$name"; then
    echo "⚠️  skip (not kebab-case): $name"
    skipped_name+=("$name")
    return
  fi

  if ! is_conforming "$src"; then
    echo "⚠️  skip (not monochrome/currentColor): $name"
    skipped_color+=("$name")
    return
  fi

  strip_root_dimensions "$src" > "$DEST/$name.svg"
  echo "→ $name.svg"
  imported=$((imported + 1))
}

#
# 3a. One main icon per object: objects/<name>/icon/icon.svg -> <name>.svg
#
while IFS= read -r icon; do
  name="$(basename "$(dirname "$(dirname "$icon")")")"
  import_one "$icon" "$name"
done < <(find "$OBJECTS_SRC" -type f -name "icon.svg" | sort)

#
# 3b. File-type variants: objects/file/icon/file-*.svg -> file-<type>.svg
#
while IFS= read -r icon; do
  name="$(basename "$icon" .svg)"
  import_one "$icon" "$name"
done < <(find "$OBJECTS_SRC/file/icon" -type f -name "file-*.svg" 2>/dev/null | sort)

echo ""
echo "Imported $imported object icon(s)."
if [[ ${#skipped_color[@]} -gt 0 ]]; then
  echo "Skipped ${#skipped_color[@]} non-monochrome icon(s): ${skipped_color[*]}"
fi
if [[ ${#skipped_name[@]} -gt 0 ]]; then
  echo "Skipped ${#skipped_name[@]} non-kebab-case icon(s): ${skipped_name[*]}"
fi

#
# 4. (Re)write provenance metadata for the objects variant
#
echo "Updating $META ..."

names_json="$(
  find "$DEST" -type f -name "*.svg" -printf '%f\n' \
    | sed 's/\.svg$//' \
    | jq -R -s --arg src "$SOURCE_NAME" --arg lic "$LICENSE" --arg url "$URL" '
        split("\n")
        | map(select(length > 0))
        | map({
            key:   ("objects/" + .),
            value: { source: $src, original: ("misp-objects:" + .), license: $lic, url: $url }
          })
        | from_entries
      '
)"

TMP="$(mktemp)"
jq --argjson add "$names_json" '
  with_entries(select(.key | startswith("objects/") | not))   # drop stale objects/* keys
  + $add
' "$META" > "$TMP"
mv "$TMP" "$META"

echo "✔ metadata updated with $(jq '[.[] ] | length' <<<"$names_json" 2>/dev/null || echo "?") object entries"
echo ""
echo "Done. Next: run 'make all' (or the optimize/fit/png/css targets) to build assets."
