#!/usr/bin/env bash

set -euo pipefail

#
# Build the framed object variant: src/svg/objects-framed/.
#
# An object groups several attributes, so the framed variant wraps each object
# glyph in a thin rounded frame — a visual cue (visible even at 16px, pure
# currentColor) that tells it apart from a single-attribute icon. Both variants
# ship: the plain glyph stays `misp-objects` (src/svg/objects/), the framed one
# is `misp-objects-framed` (this output), so consumers pick per use-case.
#
# This is a pure derivation: it reads the plain icons (already cropped to their
# content box by fit-to-ratio) and writes objects-framed/ — it never touches the
# source objects/. The whole directory is regenerated each run (so icons removed
# upstream disappear), which keeps the build idempotent.
#
# Each glyph is scaled and centred into a normalised 0 0 24 24 viewBox, then the
# frame <rect> (carrying id="$SENTINEL") is appended. The sentinel lets
# fit-to-ratio recognise an already-framed file and skip re-cropping it.
#
# Runs as part of `make all` (right after fit-ratio) and standalone:
#   bash src/scripts/frame-objects.sh
#

SRC="./src/svg/objects"
DEST="./src/svg/objects-framed"
SENTINEL="misp-object-frame"

# Glyph fits a 16.5-unit box centred in the 24-unit canvas; the frame sits at a
# ~0.8u inset with a 1.6u stroke (so it never touches the icon edge).
INNER="16.5"
FRAME_RECT='<rect x="1.6" y="1.6" width="20.8" height="20.8" rx="4.2" fill="none" stroke="currentColor" stroke-width="1.6" id="'"$SENTINEL"'"/>'

[[ -d "$SRC" ]] || { echo "No $SRC — nothing to frame."; exit 0; }

echo "Building framed object variant in $DEST ..."

rm -rf "$DEST"
mkdir -p "$DEST"

framed=0

while IFS= read -r file; do
  name="$(basename "$file")"

  viewbox="$(grep -o 'viewBox="[^"]*"' "$file" | head -1 | sed 's/viewBox="//;s/"//')"
  if [[ -z "$viewbox" ]]; then
    echo "  ❌ $name: no viewBox to frame"
    exit 1
  fi

  # Scale the glyph to fit INNER on its larger side, then centre it in 0..24.
  read -r TX TY S < <(awk -v vb="$viewbox" -v inner="$INNER" 'BEGIN {
    split(vb, a, " ")
    vx=a[1]+0; vy=a[2]+0; vw=a[3]+0; vh=a[4]+0
    m = (vw > vh) ? vw : vh
    s = inner / m
    tx = (24 - vw*s)/2 - vx*s
    ty = (24 - vh*s)/2 - vy*s
    printf "%.4f %.4f %.5f\n", tx, ty, s
  }')

  # Wrap the glyph in a centring <g>, normalise the root <svg> to 0 0 24 24, and
  # append the frame. Only inkscape/sodipodi cruft is dropped — <defs> are kept
  # verbatim: several glyphs (e.g. x509) define a <mask> there that the visible
  # path references, so stripping them would blank the icon. Reads SRC, writes
  # DEST (never edits the source in place).
  TX="$TX" TY="$TY" S="$S" FRAME_RECT="$FRAME_RECT" perl -0777 -pe '
    s{<\?xml.*?\?>}{}s;
    s{<sodipodi:namedview\b.*?(/>|</sodipodi:namedview>)}{}gs;
    s{<metadata\b.*?</metadata>}{}gs;
    if (m{<svg\b[^>]*>(.*)</svg>}s) {
      my $inner = $1;
      $_ = qq{<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">}
         . qq{<g transform="translate($ENV{TX} $ENV{TY}) scale($ENV{S})">$inner</g>}
         . qq{$ENV{FRAME_RECT}</svg>\n};
    }
  ' "$file" > "$DEST/$name"

  echo "→ objects-framed/$name"
  framed=$((framed + 1))
done < <(find "$SRC" -type f -name "*.svg" | sort)

echo ""
echo "Built $framed framed object icon(s) in $DEST."
