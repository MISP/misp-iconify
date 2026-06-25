#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"
RATIO="1.25"  # 20:16, matching Font Awesome default ratio

echo "Fitting SVGs to content bbox with ${RATIO}:1 ratio..."

while IFS= read -r file; do
  relative="${file#$SVG_DIR/}"
  echo "→ $relative"

  tmp="$(mktemp --suffix=.svg)"

  # Crop viewBox to the tight drawing bounding box, preserving coordinate system
  inkscape "$file" \
    --export-area-drawing \
    --export-type=svg \
    --export-filename="$tmp" \
    >/dev/null 2>&1

  if [[ ! -f "$tmp" ]]; then
    echo "  ❌ Inkscape export failed for $relative"
    exit 1
  fi

  # Extract the tight viewBox produced by inkscape
  viewbox=$(grep -o 'viewBox="[^"]*"' "$tmp" | head -1 | sed 's/viewBox="//;s/"//')

  if [[ -z "$viewbox" ]]; then
    echo "  ❌ Could not read viewBox from exported file"
    rm -f "$tmp"
    exit 1
  fi

  # Compute final viewBox:
  #   - Height = content height (no vertical padding)
  #   - Width  = max(content_width, content_height * ratio)
  #   - Content is centered horizontally if padding was added
  new_viewbox=$(awk -v vb="$viewbox" -v ratio="$RATIO" '
    BEGIN {
      split(vb, a, " ")
      vx = a[1]+0; vy = a[2]+0; vw = a[3]+0; vh = a[4]+0

      target_w = vh * ratio
      new_w    = (vw > target_w) ? vw : target_w
      dx       = (new_w - vw) / 2
      new_vx   = vx - dx

      printf "%.4f %.4f %.4f %.4f", new_vx, vy, new_w, vh
    }
  ')

  # Apply new viewBox
  sed -i "s/viewBox=\"[^\"]*\"/viewBox=\"$new_viewbox\"/" "$tmp"

  # Remove width/height attributes inkscape may have added
  sed -i -E 's/\s(width|height)="[^"]*"//g' "$tmp"

  mv "$tmp" "$file"

done < <(find "$SVG_DIR${ONLY:+/$ONLY}" -type f -name "*.svg")

echo ""
echo "Done."
