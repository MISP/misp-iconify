#!/usr/bin/env bash

set -euo pipefail

META="./metadata/icons.json"
OUTPUT="./ATTRIBUTION.md"
README="./README.md"

START="<!-- ATTRIBUTION_START -->"
END="<!-- ATTRIBUTION_END -->"

# Strict allowlist
ATTRIBUTION_LICENSES='[
  "CC-BY-4.0",
  "CC-BY-3.0",
  "Apache-2.0",
  "MIT"
]'

echo "Generating attribution file..."

if ! jq empty "$META" 2>/dev/null; then
  echo "❌ Invalid JSON in metadata"
  exit 1
fi

#
# 1. Generate ATTRIBUTION.md
#
{
  echo ""
  echo "This project includes icons from third-party sources that require attribution."
  echo ""

  jq -r --argjson allow "$ATTRIBUTION_LICENSES" '
      def norm: ascii_downcase | gsub(" "; "-");
    
      ($allow | map(norm)) as $allowed
    
      | to_entries[]
      | .value as $v
      | select($allowed | index($v.license | norm))
      | "- **\(.key)** → \(.value.original) (source: \(.value.source), license: \(.value.license)\(if .value.url then ", url: " + .value.url else "" end))"
    ' "$META"

} > "$OUTPUT"

echo "Generated $OUTPUT"

#
# 2. Inject into README
#
TMP="$(mktemp)"

{
  awk -v start="$START" -v end="$END" '
  BEGIN { inside=0 }

  $0 == start {
    inside=1
    print start
    system("cat '"$OUTPUT"'")
    print ""
    next
  }

  $0 == end {
    inside=0
    print end
    next
  }

  !inside { print }
  ' "$README"
} > "$TMP"

mv "$TMP" "$README"

echo "Updated README attribution section"
