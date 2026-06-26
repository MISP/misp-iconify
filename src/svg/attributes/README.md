# Attribute icons

Icons for MISP **attribute types** (see `describeTypes.json` in the MISP core).
One `<type>.svg` per attribute type, monochrome (`currentColor`), `0 0 24 24` viewBox,
no `width`/`height` on the root `<svg>` — same contract as the `simple/` and `hexagone/` sets.
This is a standalone set, not a style variant, so it is intentionally **not** listed in
`VARIANTS` in `src/scripts/validate-icons.sh`.

## Source & license

Sourced from [Tabler Icons](https://tabler.io/icons) (MIT) via the Iconify API and
normalized (stripped `width`/`height`). Tabler is a stroke-based set, so the icons carry
`stroke="currentColor"` with `fill="none"`.

## Filename convention

Filenames must be kebab-case (validator forbids `|` and `/`), so composite/path types are
sanitized — `|` and `/` become `-`:

| Attribute type | File |
|----------------|------|
| `filename\|md5` | `filename-md5.svg` |
| `filename\|sha256` | `filename-sha256.svg` |
| `domain\|ip` | `domain-ip.svg` |
| `ip-dst\|port` | `ip-dst-port.svg` |
| `AS` | `as.svg` |

All other filenames match their attribute type verbatim.

## Selection

The top 50 attribute types ranked by *(frequency on a threat-intel platform) × (how cleanly
an icon can convey the concept)*. Hash types intentionally share the generic `hash` glyph
(`md5`, `sha1`, `sha256`) since they are visually indistinguishable concepts.
