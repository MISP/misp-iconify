#!/usr/bin/env bash

set -euo pipefail

#
# Build the webfont export: exports/font/misp-iconify.{woff2,woff} + icons-font.css.
#
# Consumers that render icons as *text* (e.g. an SVG <text> node in a graph) can
# not use the mask CSS (a mask needs a filled box to cut into; text has none).
# A webfont solves this: each icon is a glyph at a Private-Use codepoint, so it
# renders anywhere text renders. This target produces that font alongside a CSS
# file that keeps the *exact same class names* as the mask export (exports/css/
# icons.css), so consumer markup is identical whichever stylesheet they load.
#
# Pipeline (nothing here touches src/svg/** — all work happens on copies):
#
#   1. Select the in-scope (variant, name) icons — see FONT_VARIANTS below. Icons
#      of other variants are logged as explicitly skipped, never silently dropped.
#      Variants cropped to a non-square box (SQUARE_VARIANTS) are first scaled +
#      centred onto a square em so they render like the mask's contain/centre.
#   2. Outline each icon's strokes into filled contours (a glyph is filled
#      contours; a `fill="none"` stroke contributes nothing to a glyph). Masked
#      "file-type" icons (the Tabler mask idiom) are resolved to show − hide so
#      their knockout labels survive. See outline_icon().
#   3. Allocate a stable codepoint to every in-scope icon in metadata/
#      codepoints.json — append-only, never reassigned (consumers may cache them).
#   4. Assemble the outlined glyphs into misp-iconify.woff2/.woff with fantasticon,
#      pinning each glyph to its codepoint.
#   5. Emit exports/font/icons-font.css from the codepoint map.
#
# Runs as part of `make all` (after the framing steps, so it outlines the already
# framed glyphs) and standalone:
#   bash src/scripts/generate-font.sh
#
# Requires: inkscape, jq, and fantasticon (installed via `npm install`).
#

# ------------------------------------------------------------------ config ---

SVG_DIR="./src/svg"
OUT_DIR="./exports/font"
META="./metadata/codepoints.json"

FONT_BASENAME="misp-iconify"   # output file basename + font's internal family id
FONT_FAMILY="MISP Icons"       # family name declared in @font-face / used in CSS
FONT_HEIGHT=1000               # em square (units per em)

CLASS_PREFIX="misp-icon"       # mirrors generate-css.sh — markup stays portable
VARIANT_PREFIX="misp"

# First assignable codepoint is PUA_BASE + 1 (U+E001); U+E000..U+F8FF = 6400 slots.
PUA_BASE=$((16#E000))

# Variants baked into the font, in a fixed order (codepoints are assigned in this
# order on first build, so keep it append-stable — new variants go at the end).
# Phase 1 (PRD §8): hexagone/simple/attributes/objects-framed. Phase 2 appends
# objects and galaxies. The Phase 1 sets are authored on a square canvas; the
# Phase 2 sets are cropped to a non-square content box, so they are squared onto
# the em first (see SQUARE_VARIANTS / square_pad).
FONT_VARIANTS=(hexagone simple attributes objects-framed objects galaxies)

# Every variant that exists, so we can report what was deliberately left out.
# Not (yet) in the font — the mask export still covers it:
#   galaxies-orbit         -> Phase 3 (dashed ring outlines to many tiny contours)
ALL_VARIANTS=(hexagone simple attributes objects objects-framed galaxies galaxies-orbit)

# Variants whose source glyphs are cropped to a non-square content box. A font
# glyph must sit on a consistent em square — the mask paints into a 1em box with
# mask-size:contain — so these are scaled + centred onto a SQUARE_CANVAS viewBox
# before outlining, reproducing the mask's contain/centre and giving every glyph
# the same visual weight. The Phase 1 variants are already square (attributes/
# objects-framed 24, hexagone 32, simple a padded ~30 box) so they are outlined
# as-is and stay byte-for-byte unchanged.
SQUARE_VARIANTS=(objects galaxies)
SQUARE_CANVAS=24               # square em canvas the non-square variants map onto
                               # (must match the combine.svg viewBox in outline_icon)

# Frame/marker sentinel ids (appended outside the glyph by frame-*.sh). The
# masked-icon "hide" pass drops them: a frame is always shown, never a knockout.
FRAME_IDS='misp-object-frame|misp-galaxy-orbit'

# Inkscape action chain that turns a drawing into a single filled path:
# outline every stroke, convert leftover shapes (rect/circle) to paths, union.
OUTLINE_ACTIONS="select-all;object-stroke-to-path;object-to-path;path-union;export-plain-svg;export-filename:__OUT__;export-do"

# --------------------------------------------------------------- preflight ---

command -v inkscape >/dev/null || { echo "❌ inkscape is required"; exit 1; }
command -v jq       >/dev/null || { echo "❌ jq is required";       exit 1; }
if ! npx --no-install fantasticon --version >/dev/null 2>&1; then
  echo "❌ fantasticon is required — run 'npm install' first"; exit 1
fi

BUILD="$(mktemp -d)"
GLYPHS="$BUILD/glyphs"      # outlined, flat-named SVGs fed to fantasticon
mkdir -p "$GLYPHS" "$OUT_DIR"
trap 'rm -rf "$BUILD"' EXIT

echo "Building webfont ($FONT_BASENAME) ..."

# --------------------------------------------------------- outlining a glyph ---

# Run the outline action chain: $1 = input svg, $2 = output svg.
_inkscape_outline() {
  inkscape "$1" --actions="${OUTLINE_ACTIONS/__OUT__/$2}" >/dev/null 2>&1
}

# Scale + centre a non-square glyph onto a square SQUARE_CANVAS viewBox, so it
# maps onto the em exactly like the mask's 1em box + mask-size:contain (the glyph
# fills the larger side and is centred on the other). Mirrors the fit-to-larger-
# side maths of frame-objects.sh but appends no frame. <defs> are kept verbatim
# so a masked glyph's <mask> survives for outline_icon's show − hide pass.
#   $1 = source svg   $2 = destination (square) svg
square_pad() {
  local src="$1" dst="$2" viewbox
  viewbox="$(grep -o 'viewBox="[^"]*"' "$src" | head -1 | sed 's/viewBox="//;s/"//')"
  [[ -n "$viewbox" ]] || { echo "❌ $src: no viewBox to square"; exit 1; }

  local TX TY S
  read -r TX TY S < <(awk -v vb="$viewbox" -v n="$SQUARE_CANVAS" 'BEGIN {
    split(vb, a, " ")
    vx=a[1]+0; vy=a[2]+0; vw=a[3]+0; vh=a[4]+0
    m = (vw > vh) ? vw : vh          # contain: fit the larger side to the canvas
    s = n / m
    tx = (n - vw*s)/2 - vx*s
    ty = (n - vh*s)/2 - vy*s
    printf "%.4f %.4f %.6f\n", tx, ty, s
  }')

  TX="$TX" TY="$TY" S="$S" N="$SQUARE_CANVAS" perl -0777 -pe '
    s{<\?xml.*?\?>}{}s;
    s{<sodipodi:namedview\b.*?(/>|</sodipodi:namedview>)}{}gs;
    s{<metadata\b.*?</metadata>}{}gs;
    if (m{<svg\b[^>]*>(.*)</svg>}s) {
      my $inner = $1;
      $_ = qq{<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 $ENV{N} $ENV{N}">}
         . qq{<g transform="translate($ENV{TX} $ENV{TY}) scale($ENV{S})">$inner</g></svg>\n};
    }
  ' "$src" > "$dst"
}

# Outline one source icon into a single filled-contour glyph SVG.
#   $1 = source svg   $2 = destination glyph svg
#
# Plain icons: outline + union directly.
# Masked icons (Tabler idiom — a currentColor box painted through a <mask> whose
# white shapes show and black shapes hide): the visible glyph is show − hide.
# We reconstruct two mask-free SVGs (show keeps the frame; hide is the black
# shapes only), outline+union each, then subtract hide from show.
outline_icon() {
  local src="$1" dst="$2"

  # Drop invisible padding boxes first. A few icons carry a <path fill="none">
  # with no stroke — a rectangle that only pads the viewBox for the mask/PNG
  # export (it renders nothing there). But a glyph outline is pure geometry:
  # path-union merges contours regardless of paint, so the rectangle would union
  # over the artwork and the glyph would come out as a solid filled box. Removing
  # these no-stroke fill="none" paths is safe — real stroked artwork always
  # carries a stroke (kept), and filled artwork is fill="currentColor" (kept).
  local clean="$BUILD/clean.svg"
  perl -0777 -pe 's{(<path\b[^>]*/>)}{ my $p=$1; ($p =~ /\bfill="none"/ && $p !~ /\bstroke/) ? "" : $p }ge' \
    "$src" > "$clean"
  src="$clean"

  if ! grep -q 'mask="url(' "$src"; then
    _inkscape_outline "$src" "$dst"
    return
  fi

  # Transform carried by the masked <path> — the mask content lives in that same
  # user space, so we re-apply it when lifting the content out of the mask.
  local ptx
  ptx="$(perl -0777 -ne 'print $1 if m{<path\b[^>]*mask="url\(#[^"]*\)"[^>]*\btransform="([^"]*)"}s' "$src")"

  # show.svg: original, with the <mask> removed and the masked <path> replaced by
  # the mask content that *shows* (everything except the black knockout shapes).
  # The frame (outside the mask) is left in place. Note the <mask> is stripped
  # explicitly — some icons keep it outside <defs>, so removing <defs> is not
  # enough, and a surviving mask would leak its raw paths into the outline.
  ptx="$ptx" perl -0777 -pe '
    my $inner = ($_ =~ m{<mask\b[^>]*>(.*?)</mask>}s) ? $1 : "";
    $inner =~ s{<g\b[^>]*fill="#000000"[^>]*>.*?</g>}{}gs;      # drop black groups
    $inner =~ s{<(?:path|rect|circle|polygon)\b[^>]*fill="#000000"[^>]*/>}{}gs; # drop black shapes
    s{<mask\b.*?</mask>}{}gs;
    s{<defs\b.*?</defs>}{}gs;
    s{<path\b[^>]*mask="url\(#[^"]*\)"[^>]*/>}{<g transform="$ENV{ptx}">$inner</g>}s;
  ' "$src" > "$BUILD/show.svg"

  # hide.svg: same, but keep *only* the black shapes and drop the frame marker.
  ptx="$ptx" perl -0777 -pe '
    my $inner = ($_ =~ m{<mask\b[^>]*>(.*?)</mask>}s) ? $1 : "";
    my @b;
    push @b, $1 while $inner =~ m{(<g\b[^>]*fill="#000000"[^>]*>.*?</g>)}gs;
    push @b, $1 while $inner =~ m{(<(?:path|rect|circle|polygon)\b[^>]*fill="#000000"[^>]*/>)}gs;
    my $black = join "", @b;
    s{<mask\b.*?</mask>}{}gs;
    s{<defs\b.*?</defs>}{}gs;
    s{<path\b[^>]*mask="url\(#[^"]*\)"[^>]*/>}{<g transform="$ENV{ptx}">$black</g>}s;
    s{<(?:rect|path)\b[^>]*id="(?:'"$FRAME_IDS"')"[^>]*/>}{}gs;   # frame is never a knockout
  ' "$src" > "$BUILD/hide.svg"

  _inkscape_outline "$BUILD/show.svg" "$BUILD/show-u.svg"

  # No black knockout (e.g. x509): the show outline is the whole glyph.
  if ! grep -q 'fill="#000000"' "$src"; then
    cp "$BUILD/show-u.svg" "$dst"
    return
  fi

  _inkscape_outline "$BUILD/hide.svg" "$BUILD/hide-u.svg"

  # Combine show (bottom) + hide (top) and subtract: Inkscape difference removes
  # the top object from the bottom one, punching the knockout shapes back out.
  # Keep each outline's full subtree (its <g transform> wrappers), not the bare
  # <path> — the outline coordinates live under those transforms, and dropping
  # them would misplace/rescale the glyph. Inkscape resolves the transforms when
  # computing the difference, and fantasticon honours whatever transform remains.
  local showinner hideinner
  showinner="$(perl -0777 -ne 'print $1 if m{<svg\b[^>]*>(.*)</svg>}s' "$BUILD/show-u.svg")"
  hideinner="$(perl -0777 -ne 'print $1 if m{<svg\b[^>]*>(.*)</svg>}s' "$BUILD/hide-u.svg")"
  printf '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">%s%s</svg>' \
    "$showinner" "$hideinner" > "$BUILD/combine.svg"
  inkscape "$BUILD/combine.svg" \
    --actions="select-all;path-difference;export-plain-svg;export-filename:$dst;export-do" \
    >/dev/null 2>&1
}

# ---------------------------------------------- select + outline in-scope icons ---

# In-scope keys, in deterministic (variant, then sorted name) order.
KEYS=()          # "variant/name"
FLATS=()         # "variant__name" (fantasticon glyph id / staged filename)

for variant in "${FONT_VARIANTS[@]}"; do
  [[ -d "$SVG_DIR/$variant" ]] || { echo "  ⚠ no $SVG_DIR/$variant — skipping variant"; continue; }

  # Non-square variants are squared onto the em before outlining (see square_pad).
  square=0
  for v in "${SQUARE_VARIANTS[@]}"; do [[ "$v" == "$variant" ]] && square=1; done

  count=0
  while IFS= read -r file; do
    name="$(basename "$file" .svg)"
    flat="${variant}__${name}"
    if [[ "$square" -eq 1 ]]; then
      square_pad "$file" "$BUILD/square.svg"
      outline_icon "$BUILD/square.svg" "$GLYPHS/$flat.svg"
    else
      outline_icon "$file" "$GLYPHS/$flat.svg"
    fi
    KEYS+=("$variant/$name")
    FLATS+=("$flat")
    count=$((count + 1))
  done < <(find "$SVG_DIR/$variant" -type f -name "*.svg" | sort)

  if [[ "$square" -eq 1 ]]; then
    echo "  ✔ $variant: outlined $count icon(s) (squared onto ${SQUARE_CANVAS}u em)"
  else
    echo "  ✔ $variant: outlined $count icon(s)"
  fi
done

echo "  → ${#KEYS[@]} glyph(s) outlined into the font"

# Report the variants deliberately excluded (never a silent omission).
for variant in "${ALL_VARIANTS[@]}"; do
  in_scope=0
  for v in "${FONT_VARIANTS[@]}"; do [[ "$v" == "$variant" ]] && in_scope=1; done
  if [[ "$in_scope" -eq 0 && -d "$SVG_DIR/$variant" ]]; then
    n="$(find "$SVG_DIR/$variant" -type f -name '*.svg' | wc -l | tr -d ' ')"
    echo "  ⏭ skipped '$variant' ($n icon(s)) — not in the current font phase; use the mask CSS for it"
  fi
done

# ------------------------------------------------- codepoints (append-only) ---

# Load the existing map into an associative array (empty on first run).
declare -A CP=()
if [[ -f "$META" ]]; then
  jq -e . "$META" >/dev/null 2>&1 || { echo "❌ $META is not valid JSON"; exit 1; }
  while IFS=$'\t' read -r k v; do CP["$k"]="$v"; done \
    < <(jq -r 'to_entries[] | "\(.key)\t\(.value)"' "$META")
fi

# Validate the existing map: 4-digit lowercase PUA hex, no duplicate codepoints.
declare -A SEEN=()
maxcp="$PUA_BASE"
for k in "${!CP[@]}"; do
  v="${CP[$k]}"
  [[ "$v" =~ ^[0-9a-f]{4}$ ]] || { echo "❌ $META: '$k' has malformed codepoint '$v'"; exit 1; }
  d=$((16#$v))
  (( d >= 16#E000 && d <= 16#F8FF )) || { echo "❌ $META: '$k' codepoint $v outside PUA"; exit 1; }
  [[ -n "${SEEN[$v]:-}" ]] && { echo "❌ $META: codepoint $v used by both '$k' and '${SEEN[$v]}'"; exit 1; }
  SEEN["$v"]="$k"
  (( d > maxcp )) && maxcp=$d
done

# Assign the next free codepoint to any in-scope key not already mapped. Existing
# assignments are never touched, so a rebuild can only grow the map (AC-4).
assigned=0
for key in "${KEYS[@]}"; do
  if [[ -z "${CP[$key]:-}" ]]; then
    maxcp=$((maxcp + 1))
    (( maxcp <= 16#F8FF )) || { echo "❌ Private Use Area exhausted (>6400 glyphs)"; exit 1; }
    CP["$key"]="$(printf '%04x' "$maxcp")"
    assigned=$((assigned + 1))
  fi
done

# Write the map back, ordered by codepoint (fixed-width hex sorts numerically),
# so the file only ever gains lines at the end — clean, append-only diffs.
{
  for key in "${!CP[@]}"; do printf '%s\t%s\n' "$key" "${CP[$key]}"; done
} | sort -t$'\t' -k2 \
  | jq -R -s 'split("\n") | map(select(length>0) | split("\t")) | map({(.[0]): .[1]}) | add' \
  > "$META"

echo "  ✔ codepoints: $assigned newly assigned, ${#CP[@]} total in $META"

# ------------------------------------------------------ assemble the font ---

# fantasticon codepoints map: glyph id (flat filename) -> decimal codepoint.
CODEPOINTS_JSON="$(
  for i in "${!KEYS[@]}"; do
    printf '%s\t%s\n' "${FLATS[$i]}" "$((16#${CP[${KEYS[$i]}]}))"
  done | jq -R -s 'split("\n") | map(select(length>0) | split("\t")) | map({(.[0]): (.[1]|tonumber)}) | add'
)"

CONFIG="$BUILD/fantasticon.json"
jq -n \
  --arg in "$GLYPHS" --arg out "$BUILD/dist" --arg name "$FONT_BASENAME" \
  --argjson h "$FONT_HEIGHT" --argjson cp "$CODEPOINTS_JSON" \
  '{
    inputDir: $in, outputDir: $out, name: $name,
    fontTypes: ["woff2","woff"], assetTypes: ["json"],
    fontHeight: $h, normalize: true, codepoints: $cp
  }' > "$CONFIG"

mkdir -p "$BUILD/dist"
npx --no-install fantasticon -c "$CONFIG" >/dev/null
cp "$BUILD/dist/$FONT_BASENAME.woff2" "$OUT_DIR/"
cp "$BUILD/dist/$FONT_BASENAME.woff"  "$OUT_DIR/"

echo "  ✔ $OUT_DIR/$FONT_BASENAME.woff2 ($(du -h "$OUT_DIR/$FONT_BASENAME.woff2" | cut -f1))"

# --------------------------------------------------------- emit the CSS ---

# Same class names as the mask CSS so markup is portable; the icon is tinted with
# `color` and sized with `font-size` (FontAwesome-style). Each icon exposes its
# codepoint via ::before (HTML usage) and a --misp-icon custom property (for JS
# consumers that build an SVG <text> node).
CSS="$OUT_DIR/icons-font.css"

cat > "$CSS" <<EOF
@font-face {
  font-family: "$FONT_FAMILY";
  src: url("$FONT_BASENAME.woff2") format("woff2"),
       url("$FONT_BASENAME.woff")  format("woff");
  font-display: block;
}

.$CLASS_PREFIX {
  font-family: "$FONT_FAMILY";
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  line-height: 1;

  display: inline-block;
  vertical-align: middle;

  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.$VARIANT_PREFIX-fw {
  width: 1.25em;
  text-align: center;
}

EOF

for variant in "${FONT_VARIANTS[@]}"; do
  case "$variant" in
    hexagone)       printf '\n/* --- hexagone icons --- */\n\n'                >> "$CSS" ;;
    simple)         printf '\n/* --- simple icons --- */\n\n'                  >> "$CSS" ;;
    attributes)     printf '\n/* --- attribute type icons --- */\n\n'          >> "$CSS" ;;
    objects-framed) printf '\n/* --- object icons (framed variant) --- */\n\n' >> "$CSS" ;;
    objects)        printf '\n/* --- object icons --- */\n\n'                  >> "$CSS" ;;
    galaxies)       printf '\n/* --- galaxy icons --- */\n\n'                  >> "$CSS" ;;
  esac

  for i in "${!KEYS[@]}"; do
    key="${KEYS[$i]}"
    [[ "$key" == "$variant/"* ]] || continue
    name="${key#*/}"
    cp="${CP[$key]}"
    sel=".$CLASS_PREFIX-$name.$VARIANT_PREFIX-$variant"
    {
      echo "$sel::before { content: \"\\$cp\"; }"
      echo "$sel { --misp-icon: \"\\$cp\"; }"
    } >> "$CSS"
  done
done

echo "  ✔ $CSS"
echo "✔ Webfont build complete."
