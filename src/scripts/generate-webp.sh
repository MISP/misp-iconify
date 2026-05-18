#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"
OUTPUT_DIR="./exports/webp"

if command -v magick >/dev/null 2>&1; then
  IMAGEMAGICK="magick"
elif command -v convert >/dev/null 2>&1; then
  IMAGEMAGICK="convert"
else
  echo "ImageMagick not found."
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

find "$SVG_DIR" -type f -name "*.svg" | while read -r file; do
  name="$(basename "$file" .svg)"

  output="$OUTPUT_DIR/$name.webp"

  echo "Generating $output"

  "$IMAGEMAGICK" \
    -background none \
    "$file" \
    -resize 128x128 \
    "$output"
done

echo ""
echo "WebP generation complete."
