#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"

echo "Optimizing SVGs..."

while IFS= read -r file; do
  relative="${file#$SVG_DIR/}"
  echo "→ $relative"

  tmp="$(mktemp).svg"

  inkscape \
    "$file" \
    --export-plain-svg \
    --export-filename="$tmp" \
    >/dev/null 2>&1

  mv "$tmp" "$file"
done < <(find "$SVG_DIR" -type f -name "*.svg")

echo ""
echo "SVG optimization complete."
