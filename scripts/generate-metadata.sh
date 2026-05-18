#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"
OUTPUT="./metadata/icons.json"

mkdir -p metadata

echo "{" > "$OUTPUT"

FIRST=1

find "$SVG_DIR" -type f -name "*.svg" | sort | while read -r file; do
  name="$(basename "$file" .svg)"

  if [ "$FIRST" -eq 0 ]; then
    echo "," >> "$OUTPUT"
  fi

  FIRST=0

  cat >> "$OUTPUT" <<EOF
  "$name": {
    "name": "$name"
  }
EOF
done

echo "" >> "$OUTPUT"
echo "}" >> "$OUTPUT"

echo "Metadata generated."
