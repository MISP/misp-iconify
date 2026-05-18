#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"
META="./metadata/icons.json"

echo "Validating metadata..."

#
# 0. Validate JSON first
#
if ! jq empty "$META" 2>/dev/null; then
  echo "❌ metadata/icons.json is not valid JSON"
  exit 1
fi

#
# 0.5 Normalize JSON order (IMPORTANT NEW STEP)
#
TMP="$(mktemp)"

jq 'to_entries | sort_by(.key) | from_entries' "$META" > "$TMP"
mv "$TMP" "$META"

echo "✔ metadata sorted by key"

FAILED=0

#
# 1. Validate SVG ↔ metadata consistency
#
for file in "$SVG_DIR"/*.svg; do
  name="$(basename "$file" .svg)"

  echo "→ $name"

  #
  # Check entry exists
  #
  if ! jq -e --arg k "$name" '.[$k]' "$META" >/dev/null; then
    echo "❌ Missing metadata entry for: $name"
    FAILED=1
    continue
  fi

  #
  # Strict validation: field must be a non-empty string
  #
  for field in source original license; do
    if ! jq -e --arg k "$name" --arg f "$field" \
      '.[$k][$f] | type == "string" and length > 0' "$META" >/dev/null; then
      echo "❌ Missing or invalid '$field' for: $name"
      FAILED=1
    fi
  done
done

#
# 2. Orphan metadata detection
#
echo ""
echo "Checking for orphan metadata entries..."

jq -r 'keys[]' "$META" | while read -r key; do
  if [ ! -f "$SVG_DIR/$key.svg" ]; then
    echo "⚠️  Orphan metadata entry (no SVG): $key"
  fi
done

#
# 3. Final result
#
if [ "$FAILED" -eq 1 ]; then
  echo ""
  echo "Metadata validation failed."
  exit 1
fi

echo ""
echo "Metadata valid."
