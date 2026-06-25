#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"
OUTPUT_DIR="./exports/png"

BASE_SIZE=24

# scale:name
SCALES=(
  "1:1x"
  "2:2x"
  "3:3x"
  "5:5x"
)

if command -v magick >/dev/null 2>&1; then
  IMAGEMAGICK="magick"
elif command -v convert >/dev/null 2>&1; then
  IMAGEMAGICK="convert"
else
  echo "ImageMagick not found."
  exit 1
fi

# Requirements:
#   ImageMagick >= 6
#
# macOS:
#   brew install imagemagick
#
# Ubuntu:
#   sudo apt install imagemagick
#
# Run:
#   chmod +x scripts/generate-pngs.sh
#   ./scripts/generate-pngs.sh

while IFS= read -r file; do
  relative_path="${file#$SVG_DIR/}"

  relative_dir="$(dirname "$relative_path")"
  filename="$(basename "$relative_path" .svg)"

  for scale_info in "${SCALES[@]}"; do
    scale="${scale_info%%:*}"
    scale_name="${scale_info##*:}"

    size=$((BASE_SIZE * scale))

    output_dir="$OUTPUT_DIR/$scale_name/$relative_dir"
    output_file="$output_dir/$filename.png"

    mkdir -p "$output_dir"

    echo "Generating $output_file (${size}x${size})"

    # Render preserving the SVG's aspect ratio (only the width is pinned, so
    # inkscape keeps the viewBox proportions), then centre the result on a
    # transparent square canvas. Forcing both --export-width and --export-height
    # stretched any non-square viewBox (e.g. the 1.25-ratio object icons). This
    # mirrors how the icons actually render via CSS (`mask-size: contain` in a
    # square box), so the catalog preview matches real usage.
    tmp_png="$(mktemp --suffix=.png)"

    inkscape \
      "$file" \
      --export-type=png \
      --export-width="$((size * 4))" \
      --export-filename="$tmp_png" \
      >/dev/null 2>&1

    "$IMAGEMAGICK" \
      "$tmp_png" \
      -background none \
      -resize "${size}x${size}" \
      -gravity center \
      -extent "${size}x${size}" \
      "$output_file"

    rm -f "$tmp_png"
  done
done < <(find "$SVG_DIR${ONLY:+/$ONLY}" -type f -name "*.svg")

echo ""
echo "PNG generation complete."
