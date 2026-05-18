#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"

echo "Optimizing SVGs..."

find "$SVG_DIR" -type f -name "*.svg" | while read -r file; do
  echo "→ $file"

  tmp="$(mktemp).svg"

  inkscape \
    "$file" \
    --export-plain-svg \
    --export-filename="$tmp" \
    >/dev/null 2>&1

  mv "$tmp" "$file"
done

echo ""
echo "SVG optimization complete."
