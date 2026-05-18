#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"

FAILED=0

find "$SVG_DIR" -type f -name "*.svg" | while read -r file; do
  filename="$(basename "$file")"

  echo "Checking $filename"

  #
  # kebab-case
  #
  if ! [[ "$filename" =~ ^[a-z0-9-]+\.svg$ ]]; then
    echo "❌ Invalid filename: $filename"
    FAILED=1
  fi

  #
  # 24x24 viewBox
  #
  if ! grep -q 'viewBox="0 0 24 24"' "$file"; then
    echo "❌ Invalid viewBox in $filename"
    FAILED=1
  fi

  #
  # width/height forbidden
  #
  if grep -qE 'width=|height=' "$file"; then
    echo "❌ Remove width/height attributes from $filename"
    FAILED=1
  fi
done

if [ "$FAILED" -eq 1 ]; then
  echo ""
  echo "Validation failed."
  exit 1
fi

echo ""
echo "All icons valid."
