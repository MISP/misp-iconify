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
# Generate one class per icon/variant
#
while IFS= read -r file; do

  relative="${file#$SVG_DIR/}"

  variant="$(dirname "$relative")"
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

done < <(find "$SVG_DIR" -type f -name "*.svg" | sort)

echo "✔ Generated $OUTPUT_FILE"