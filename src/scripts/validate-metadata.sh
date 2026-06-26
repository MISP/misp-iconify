#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"
META="./metadata/icons.json"

echo "Validating metadata..."

#
# Allowed variants
#
VARIANTS=(
  "simple"
  "hexagone"
  "attributes"
  "objects"
  "galaxies"
)

#
# Imported icon sets (objects from misp-objects, galaxies from misp-galaxy) are
# keyed with a variant-qualified key ("<variant>/<name>") so their names never
# collide with the bare-name keys used by the core/attribute sets. Map a
# (variant, name) pair to its key.
#
metadata_key() {
  local variant="$1" name="$2"
  case "$variant" in
    objects|galaxies) echo "$variant/$name" ;;
    *)                echo "$name" ;;
  esac
}

#
# Validate JSON first
#
if ! jq empty "$META" 2>/dev/null; then
  echo "❌ metadata/icons.json is not valid JSON"
  exit 1
fi

#
# Normalize JSON order
#
# Group MISP Project icons first, then everything else (e.g. attribute-type
# icons sourced from third parties), each group sorted alphabetically by key.
# This keeps the attribution file easy to browse while staying idempotent.
#
TMP="$(mktemp)"

jq '
  to_entries
  | sort_by([ (if .value.source == "MISP Project" then 0 else 1 end), .key ])
  | from_entries
' "$META" > "$TMP"
mv "$TMP" "$META"

echo "✔ metadata grouped (MISP first) and sorted by key"

FAILED=0

#
# Validate SVG ↔ metadata consistency
#
for variant in "${VARIANTS[@]}"; do

  [[ -d "$SVG_DIR/$variant" ]] || continue

  while IFS= read -r file; do
    relative="${file#$SVG_DIR/$variant/}"
    name="${relative%.svg}"
    key="$(metadata_key "$variant" "$name")"

    echo "→ $variant/$name"

    if ! jq -e --arg k "$key" '.[$k]' "$META" >/dev/null; then
      echo "❌ Missing metadata entry for: $key"
      FAILED=1
      continue
    fi

    #
    # Strict validation
    #
    for field in source original license; do
      if ! jq -e --arg k "$key" --arg f "$field" \
        '.[$k][$f] | type == "string" and length > 0' "$META" >/dev/null; then
        echo "❌ Missing or invalid '$field' for: $key"
        FAILED=1
      fi
    done

  done < <(find "$SVG_DIR/$variant" -type f -name "*.svg" | sort)

done

#
# Orphan metadata detection
#
echo ""
echo "Checking for orphan metadata entries..."

while IFS= read -r key; do
  #
  # Variant-qualified keys (e.g. "objects/<name>") point straight at the file.
  #
  if [[ "$key" == */* ]]; then
    [[ -f "$SVG_DIR/$key.svg" ]] || echo "⚠️  Orphan metadata entry (no SVG): $key"
    continue
  fi

  found=0
  for variant in "${VARIANTS[@]}"; do
    if [[ -f "$SVG_DIR/$variant/$key.svg" ]]; then
      found=1
      break
    fi
  done

  if [[ "$found" -eq 0 ]]; then
    echo "⚠️  Orphan metadata entry (no SVG): $key"
  fi

done < <(jq -r 'keys[]' "$META")

#
# Final result
#
if [ "$FAILED" -eq 1 ]; then
  echo ""
  echo "Metadata validation failed."
  exit 1
fi

echo ""
echo "Metadata valid."