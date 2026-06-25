#!/usr/bin/env bash

set -euo pipefail

SVG_DIR="./src/svg"

echo "Validating SVG icons..."

FAILED=0
declare -A IDS

#
# Allowed variants
#
VARIANTS=(
  "simple"
  "hexagone"
)

#
# Validate variant folders
#
for variant in "${VARIANTS[@]}"; do
  if [[ ! -d "$SVG_DIR/$variant" ]]; then
      echo "❌ Missing variant directory: $variant"
      FAILED=1
  fi
done

#
# Ensure all variants contain same icons
#
REFERENCE_VARIANT="${VARIANTS[0]}"
while IFS= read -r file; do
  relative="${file#$SVG_DIR/$REFERENCE_VARIANT/}"
  for variant in "${VARIANTS[@]}"; do
    if [[ ! -f "$SVG_DIR/$variant/$relative" ]]; then
      echo "❌ Missing icon variant: $variant/$relative"
      FAILED=1
    fi
  done
done < <(find "$SVG_DIR/$REFERENCE_VARIANT" -type f -name "*.svg")

#
# Validate every SVG
#
while IFS= read -r file; do
  relative="${file#$SVG_DIR/}"
  name="$(basename "$file")"
  echo "→ $relative"

  #
  # Kebab-case filename validation
  #
  if [[ ! "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*\.svg$ ]]; then
    echo "❌ $name: filename must be kebab-case"
    FAILED=1
  fi

  #
  # Root SVG must not contain width/height
  #
  if xmllint --xpath '/*[local-name()="svg"]/@width | /*[local-name()="svg"]/@height' "$file" 2>/dev/null | grep -q .; then
    echo "❌ $name: root <svg> must not contain width/height attributes"
    FAILED=1
  fi

  # #
  # # Must contain a valid 24x24 viewBox
  # #
  # viewbox="$(
  #   xmllint --xpath 'string(/*[local-name()="svg"]/@viewBox)' "$file" 2>/dev/null
  # )"

  # if [[ -z "$viewbox" ]]; then
  #   echo "❌ $name: missing viewBox"
  #   FAILED=1
  # elif [[ "$viewbox" != "0 0 24 24" ]]; then
  #   echo "❌ $name: invalid viewBox '$viewbox' (must be '0 0 24 24')"
  #   FAILED=1
  # fi

  #
  # Ensure fills are explicitly defined and use currentColor.
  #
  # Only the *rendered* fills are checked: fills inside <defs>/<mask> are the
  # legitimate monochrome masking technique (e.g. fill="white"/"black" knocking
  # a shape out of a currentColor body) and must be ignored, so we select fills
  # via XPath excluding any element with a defs/mask ancestor.
  #
  fill_found=0
  while IFS= read -r fill; do
    fill_found=1

    if [[ "$fill" != "none" && "$fill" != "currentColor" ]]; then
      echo "❌ $relative: invalid fill '$fill' (must use currentColor or none)"
      FAILED=1
    fi
  done < <(
    xmllint --xpath '//*[not(ancestor-or-self::*[local-name()="defs"]) and not(ancestor-or-self::*[local-name()="mask"])]/@fill' "$file" 2>/dev/null \
      | grep -oE 'fill="[^"]+"' \
      | sed 's/fill="//' \
      | sed 's/"//'
  )

  #
  # Require at least one explicit fill
  #
  if [[ "$fill_found" -eq 0 ]]; then
    echo "❌ $relative: missing explicit fill attribute"
    FAILED=1
  fi

done < <(find "$SVG_DIR" -type f -name "*.svg")

if [ "$FAILED" -eq 1 ]; then
  echo ""
  echo "SVG validation failed."
  exit 1
fi

echo ""
echo "All SVG icons valid."
