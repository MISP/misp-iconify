#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"

echo "Validating SVG icons..."

FAILED=0

for file in "$SVG_DIR"/*.svg; do
  name="$(basename "$file")"

  echo "→ $name"

  #
  # Kebab-case filename validation
  #
  if [[ ! "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*\.svg$ ]]; then
    echo "❌ $name: filename must be kebab-case"
    FAILED=1
  fi

  #
  # No width/height
  #
  if grep -qE '(<[^>]*\swidth=|<[^>]*\sheight=)' "$file"; then
    echo "❌ $name: must not contain width/height attributes"
    FAILED=1
  fi

  #
  # Must contain viewBox
  #
  if ! grep -q 'viewBox=' "$file"; then
    echo "❌ $name: missing viewBox"
    FAILED=1
  fi

  #
  # Ensure viewBox is not empty
  #
  viewbox=$(grep -o 'viewBox="[^"]*"' "$file" | head -n 1 | cut -d'"' -f2)

  if [[ -z "$viewbox" ]]; then
    echo "❌ $name: empty viewBox"
    FAILED=1
  fi

done

if [ "$FAILED" -eq 1 ]; then
  echo ""
  echo "SVG validation failed."
  exit 1
fi

echo ""
echo "All SVG icons valid."
