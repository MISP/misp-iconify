#!/usr/bin/env bash

set -euo pipefail

README="./README.md"

START="<!-- ICONS_START -->"
END="<!-- ICONS_END -->"

TMP="$(mktemp)"

#
# Variants
#
SIMPLE_DIR="./src/svg/simple"

{
  echo "$START"
  echo ""

  echo ""
  echo "Main icon class:  \`misp-icon\`"
  echo "- Hexagone class: \`misp-hexagone\`"
  echo "- Simple class: \`misp-simple\`"
  echo ""

  echo "| Name | Icon Simple | Icon Hexa | CSS Class |"
  echo "|------|-------------|------------| ---- |"

  #
  # Use simple/ as source of truth
  #
  while IFS= read -r file; do
    relative="${file#$SIMPLE_DIR/}"
    name="${relative%.svg}"

    simple_png="./exports/png/2x/simple/${name}.png"
    hexa_png="./exports/png/2x/hexagone/${name}.png"

    class="misp-${name}"

    echo "| \`$name\` | <img src=\"$simple_png\" width=\"24\" alt=\"$name simple\" /> | <img src=\"$hexa_png\" width=\"24\" alt=\"$name hexagone\" /> | \`$class\` |"

  done < <(find "$SIMPLE_DIR" -type f -name "*.svg" | sort)

  echo ""
  echo "$END"

} > "$TMP"

#
# Replace section in README
#
awk -v start="$START" -v end="$END" '
BEGIN { inside = 0 }

$0 == start {
  inside = 1

  while ((getline line < "'"$TMP"'") > 0)
    print line

  next
}

$0 == end {
  inside = 0
  next
}

!inside { print }
' "$README" > "$README.tmp"

mv "$README.tmp" "$README"
rm "$TMP"

echo "README catalog updated."