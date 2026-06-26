#!/usr/bin/env bash

set -euo pipefail

#
# Build the orbit galaxy variant: src/svg/galaxies-orbit/.
#
# A galaxy clusters related entities (much like MISP's own galaxy glyph is an
# orbital swirl, and the visual identity treats sub-projects as orbiting
# satellites). The orbit variant wraps each galaxy glyph in a dashed orbital
# ring carrying a single bold star — a `currentColor` cue (legible even at 16px)
# that marks an icon as a galaxy without competing with the glyph. The orbit
# deliberately breaks around the star so the ring never touches it.
#
# Both variants ship: the plain glyph stays `misp-galaxies` (src/svg/galaxies/),
# the orbit one is `misp-galaxies-orbit` (this output), so consumers pick per
# use-case.
#
# This is a pure derivation: it reads the plain galaxy glyphs and writes
# galaxies-orbit/ — it never touches the source galaxies/. The whole directory
# is regenerated each run (so glyphs removed upstream disappear), which keeps the
# build idempotent.
#
# Each glyph is scaled and centred into a normalised 0 0 24 24 viewBox, then the
# orbit + star marker (carrying id="$SENTINEL") is appended. The sentinel lets
# fit-to-ratio recognise an already-marked file and skip re-cropping it.
#
# Runs as part of `make all` (right after frame-objects) and standalone:
#   bash src/scripts/frame-galaxies.sh
#

SRC="./src/svg/galaxies"
DEST="./src/svg/galaxies-orbit"
SENTINEL="misp-galaxy-orbit"

# Glyph fits a 14-unit box centred in the 24-unit canvas — full size (kept large
# so it stays readable); the orbit (r=10.9) clears the glyph, and the star sits
# on the orbit at the NE (48°) node. The orbit is drawn as a single arc that
# skips a ±24° wedge around the star, leaving a clean break so the ring never
# touches it. Marker geometry is glyph-independent, so it is a fixed string.
INNER="14"
MARKER='<path id="'"$SENTINEL"'" d="M 22.367 8.632 A 10.9 10.9 0 1 1 16.433 2.042" fill="none" stroke="currentColor" stroke-width="1.1" stroke-linecap="round" stroke-dasharray="1.7 1.9"/><path d="M20.10,1.96 L21.04,3.77 L22.85,4.71 L21.04,5.64 L20.10,7.46 L19.17,5.64 L17.35,4.71 L19.17,3.77 Z" fill="currentColor"/>'

[[ -d "$SRC" ]] || { echo "No $SRC — nothing to mark."; exit 0; }

echo "Building orbit galaxy variant in $DEST ..."

rm -rf "$DEST"
mkdir -p "$DEST"

marked=0

while IFS= read -r file; do
  name="$(basename "$file")"

  viewbox="$(grep -o 'viewBox="[^"]*"' "$file" | head -1 | sed 's/viewBox="//;s/"//')"
  if [[ -z "$viewbox" ]]; then
    echo "  ❌ $name: no viewBox to mark"
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
  # append the marker. Only xml-decl/inkscape cruft is dropped — <defs> are kept
  # verbatim (a glyph may reference a <mask> defined there). Reads SRC, writes
  # DEST (never edits the source in place).
  TX="$TX" TY="$TY" S="$S" MARKER="$MARKER" perl -0777 -pe '
    s{<\?xml.*?\?>}{}s;
    s{<sodipodi:namedview\b.*?(/>|</sodipodi:namedview>)}{}gs;
    s{<metadata\b.*?</metadata>}{}gs;
    if (m{<svg\b[^>]*>(.*)</svg>}s) {
      my $inner = $1;
      $_ = qq{<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">}
         . qq{<g transform="translate($ENV{TX} $ENV{TY}) scale($ENV{S})">$inner</g>}
         . qq{$ENV{MARKER}</svg>\n};
    }
  ' "$file" > "$DEST/$name"

  echo "→ galaxies-orbit/$name"
  marked=$((marked + 1))
done < <(find "$SRC" -type f -name "*.svg" | sort)

echo ""
echo "Built $marked orbit galaxy icon(s) in $DEST."
