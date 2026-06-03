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
)

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
TMP="$(mktemp)"

jq 'to_entries | sort_by(.key) | from_entries' "$META" > "$TMP"
mv "$TMP" "$META"

echo "✔ metadata sorted by key"

FAILED=0

#
# Validate SVG ↔ metadata consistency
#
for variant in "${VARIANTS[@]}"; do

  while IFS= read -r file; do
    relative="${file#$SVG_DIR/$variant/}"
    name="${relative%.svg}"

    echo "→ $variant/$name"

    #
    # Metadata key is based on icon name only
    # not the variant
    #
    if ! jq -e --arg k "$name" '.[$k]' "$META" >/dev/null; then
      echo "❌ Missing metadata entry for: $name"
      FAILED=1
      continue
    fi

    #
    # Strict validation
    #
    for field in source original license; do
      if ! jq -e --arg k "$name" --arg f "$field" \
        '.[$k][$f] | type == "string" and length > 0' "$META" >/dev/null; then
        echo "❌ Missing or invalid '$field' for: $name"
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