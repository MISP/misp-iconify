#!/usr/bin/env bash
set -euo pipefail

SVG_DIR="./src/svg"

SOURCE_SIZE=32
TARGET_SIZE=24
SCALE=$(echo "scale=6; $TARGET_SIZE / $SOURCE_SIZE" | bc)

echo "Normalizing SVGs: 32 → 24 (scale $SCALE)"

while IFS= read -r file; do
  echo "→ $file"

  tmp_file="$(mktemp --suffix=.svg)"

  inkscape "$file" \
  --export-type=svg \
  --export-filename="$tmp_file" \
  --export-area-drawing \
  --actions="file-open:$file;select-all;transform-scale:$SCALE,$SCALE;fit-canvas-to-selection"

  if [[ ! -f "$tmp_file" ]]; then
    echo "ERROR: export failed for $file" >&2
    exit 1
  fi

  sed -i.bak 's/viewBox="[^"]*"/viewBox="0 0 24 24"/' "$tmp_file"

  mv "$tmp_file" "$file"

done < <(find "$SVG_DIR" -type f -name "*.svg")

echo "Done."