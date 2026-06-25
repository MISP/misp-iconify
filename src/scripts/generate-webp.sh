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

while IFS= read -r file; do
  # Preserve the variant sub-path (simple/hexagone/attributes/objects) so icons
  # that share a name across variants don't overwrite each other.
  relative_path="${file#$SVG_DIR/}"
  relative_dir="$(dirname "$relative_path")"
  name="$(basename "$file" .svg)"

  out_dir="$OUTPUT_DIR/$relative_dir"
  mkdir -p "$out_dir"

  output="$out_dir/$name.webp"

  echo "Generating $output"

  "$IMAGEMAGICK" \
    -background none \
    "$file" \
    -resize 128x128 \
    "$output"
done < <(find "$SVG_DIR${ONLY:+/$ONLY}" -type f -name "*.svg")

echo ""
echo "WebP generation complete."
