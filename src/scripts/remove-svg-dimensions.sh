#!/usr/bin/env bash
set -euo pipefail

SVG_DIR="./src/svg"

echo "Removing width/height from SVGs..."

find "$SVG_DIR" -type f -name "*.svg" | while IFS= read -r file; do
  echo "→ $file"

  # Remove width/height from the *root* <svg> only. A global strip would also
  # delete width/height on inner elements (e.g. the <rect> pixels that draw the
  # file-type glyphs inside a <mask>), blanking those icons.
  perl -0777 -i -pe \
    's{<svg\b[^>]*?>}{ (my $t=$&) =~ s/\s+(?:width|height)="[^"]*"//g; $t }se' \
    "$file"
done

echo "Done."