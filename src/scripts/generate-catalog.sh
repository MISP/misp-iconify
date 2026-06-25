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

#
# ---------------------------------------------------------------------------
# Attribute-type icons (separate set, separate catalog section)
# ---------------------------------------------------------------------------
#
ATTR_START="<!-- ATTRIBUTE_ICONS_START -->"
ATTR_END="<!-- ATTRIBUTE_ICONS_END -->"

ATTR_DIR="./src/svg/attributes"

# Filenames are kebab-case, but the underlying MISP attribute type may contain
# "|" or "/". Map a filename back to its original attribute type for display.
# Pipes are escaped (\|) so they render literally inside a GitHub markdown table.
attr_type_for() {
  case "$1" in
    as)              echo "AS" ;;
    filename-md5)    echo "filename\\|md5" ;;
    filename-sha256) echo "filename\\|sha256" ;;
    domain-ip)       echo "domain\\|ip" ;;
    ip-dst-port)     echo "ip-dst\\|port" ;;
    *)               echo "$1" ;;
  esac
}

if [[ -d "$ATTR_DIR" ]]; then
  TMP_ATTR="$(mktemp)"

  {
    echo "$ATTR_START"
    echo ""
    echo ""
    echo "Icons for **MISP attribute types** (see \`describeTypes.json\`). Single style,"
    echo "variant class \`misp-attributes\`. Filenames are kebab-case, so attribute types"
    echo "containing \`|\` or \`/\` are sanitized to \`-\` (shown in the *Attribute type* column)."
    echo ""

    echo "| Attribute type | Icon | File | CSS Class |"
    echo "|----------------|------|------|-----------|"

    while IFS= read -r file; do
      relative="${file#$ATTR_DIR/}"
      name="${relative%.svg}"

      attr_type="$(attr_type_for "$name")"
      png="./exports/png/2x/attributes/${name}.png"
      class="misp-${name}"

      echo "| \`$attr_type\` | <img src=\"$png\" width=\"24\" alt=\"$name attribute\" /> | \`$name.svg\` | \`$class\` |"

    done < <(find "$ATTR_DIR" -type f -name "*.svg" | sort)

    echo ""
    echo "$ATTR_END"

  } > "$TMP_ATTR"

  awk -v start="$ATTR_START" -v end="$ATTR_END" '
  BEGIN { inside = 0 }

  $0 == start {
    inside = 1

    while ((getline line < "'"$TMP_ATTR"'") > 0)
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
  rm "$TMP_ATTR"

  echo "README attribute catalog updated."
fi

#
# ---------------------------------------------------------------------------
# Object icons (imported from the misp-objects submodule, "objects" variant)
# ---------------------------------------------------------------------------
#
OBJ_START="<!-- OBJECT_ICONS_START -->"
OBJ_END="<!-- OBJECT_ICONS_END -->"

OBJ_DIR="./src/svg/objects"

# A name "collides" when it also exists as a core (simple) or attribute icon.
# Object icons stay addressable through the misp-objects variant class, so there
# is no real conflict — the marker is purely informational.
collides() {
  [[ -f "./src/svg/simple/$1.svg" || -f "./src/svg/attributes/$1.svg" ]]
}

if [[ -d "$OBJ_DIR" ]]; then
  TMP_OBJ="$(mktemp)"

  {
    echo "$OBJ_START"
    echo ""
    echo ""
    echo "Icons for **MISP objects**, imported from the [\`misp-objects\`](https://github.com/MISP/misp-objects)"
    echo "submodule. Single style, variant class \`misp-objects\`. Use them like any other"
    echo "icon: \`<i class=\"misp-icon misp-icon-<name> misp-objects\"></i>\`."
    echo ""
    echo "Names marked † also exist as a core or attribute icon; they stay separate"
    echo "thanks to the \`misp-objects\` variant class, so both render independently."
    echo ""

    echo "| Object | Icon | File | CSS classes |"
    echo "|--------|------|------|-------------|"

    while IFS= read -r file; do
      relative="${file#$OBJ_DIR/}"
      name="${relative%.svg}"

      marker=""
      if collides "$name"; then marker=" †"; fi

      png="./exports/png/2x/objects/${name}.png"

      echo "| \`$name\`$marker | <img src=\"$png\" width=\"24\" alt=\"$name object\" /> | \`$name.svg\` | \`misp-icon misp-icon-$name misp-objects\` |"

    done < <(find "$OBJ_DIR" -type f -name "*.svg" | sort)

    echo ""
    echo "$OBJ_END"

  } > "$TMP_OBJ"

  awk -v start="$OBJ_START" -v end="$OBJ_END" '
  BEGIN { inside = 0 }

  $0 == start {
    inside = 1

    while ((getline line < "'"$TMP_OBJ"'") > 0)
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
  rm "$TMP_OBJ"

  echo "README object catalog updated."
fi