#!/usr/bin/env bash
set -euo pipefail

SVG_DIR="./src/svg"

echo "Removing width/height from SVGs..."

find "$SVG_DIR" -type f -name "*.svg" | while IFS= read -r file; do
  echo "→ $file"

  # Remove width and height attributes (handles spaces robustly)
  sed -i.bak \
    -E 's/\s(width|height)="[^"]*"//g' \
    "$file"

  # Optional: remove backup files
  rm -f "${file}.bak"
done

echo "Done."