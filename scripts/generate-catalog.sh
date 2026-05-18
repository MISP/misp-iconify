#!/usr/bin/env bash

set -euo pipefail

README="./README.md"

START="<!-- ICONS_START -->"
END="<!-- ICONS_END -->"

TMP="$(mktemp)"

#
# Build markdown table
#

{
  echo "$START"
  echo ""
  echo "| Icon | Name |"
  echo "|------|------|"

  find ./src/svg -type f -name "*.svg" | sort | while read -r file; do
    name="$(basename "$file" .svg)"

    echo "| <img src=\"./exports/png/2x/$name.png\" width=\"24\" alt=\"$name\" /> | \`$name\` |"
  done

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
