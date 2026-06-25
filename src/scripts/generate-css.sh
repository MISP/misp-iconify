#!/usr/bin/env bash

set -euo pipefail

CLASS_PREFIX="misp-icon"
VARIANT_PREFIX="misp"

SVG_DIR="./src/svg"
OUTPUT_DIR="./exports/css"

OUTPUT_FILE="$OUTPUT_DIR/icons.css"

mkdir -p "$OUTPUT_DIR"

echo "Generating CSS icons..."

#
# Base icon class
#
cat > "$OUTPUT_FILE" <<'EOF'
.misp-icon {
  width: 1em;
  height: 1em;

  display: inline-block;
  vertical-align: middle;

  background-color: currentColor;

  mask-repeat: no-repeat;
  mask-position: center;
  mask-size: contain;

  -webkit-mask-repeat: no-repeat;
  -webkit-mask-position: center;
  -webkit-mask-size: contain;
}

.misp-fw {
  width: 1.25em;
  text-align: center;
}

EOF

echo "" >> "$OUTPUT_FILE"

#
# Generate one class per icon/variant.
#
# Variants are emitted in an explicit order (objects appended last) so the file
# stays stable and append-only as new sets are added; icons within a variant are
# sorted by name.
#
for variant in hexagone simple attributes objects objects-framed; do
  [[ -d "$SVG_DIR/$variant" ]] || continue

  case "$variant" in
    attributes)     printf '\n/* --- attribute type icons --- */\n\n' >> "$OUTPUT_FILE" ;;
    objects)        printf '\n/* --- object icons --- */\n\n' >> "$OUTPUT_FILE" ;;
    objects-framed) printf '\n/* --- object icons (framed variant) --- */\n\n' >> "$OUTPUT_FILE" ;;
  esac

  while IFS= read -r file; do

  relative="${file#$SVG_DIR/}"

  name="$(basename "$relative" .svg)"

  class_name=".$CLASS_PREFIX-$name.$VARIANT_PREFIX-$variant"

  #
  # Inline SVG as compact base64
  #
  encoded="$(
    base64 < "$file" \
      | tr -d '\n'
  )"

  echo "$class_name {" >> "$OUTPUT_FILE"

  echo "  mask-image: url(\"data:image/svg+xml;base64,$encoded\");" >> "$OUTPUT_FILE"
  echo "  -webkit-mask-image: url(\"data:image/svg+xml;base64,$encoded\");" >> "$OUTPUT_FILE"

  echo "}" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  done < <(find "$SVG_DIR/$variant" -type f -name "*.svg" | sort)
done

echo "✔ Generated $OUTPUT_FILE"