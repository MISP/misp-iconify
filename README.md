# misp-iconify

## Catalog

<!-- ICONS_START -->


Main icon class:  `misp-icon`
- Hexagone class: `misp-hexagone`
- Simple class: `misp-simple`

| Name | Icon Simple | Icon Hexa | Class |
|------|-------------|------------| ---- |
| `analyst-note` | <img src="./exports/png/2x/simple/analyst-note.png" width="24" alt="analyst-note simple" /> | <img src="./exports/png/2x/hexagone/analyst-note.png" width="24" alt="analyst-note hexagone" /> | `misp-analyst-note` |
| `analyst-opinion` | <img src="./exports/png/2x/simple/analyst-opinion.png" width="24" alt="analyst-opinion simple" /> | <img src="./exports/png/2x/hexagone/analyst-opinion.png" width="24" alt="analyst-opinion hexagone" /> | `misp-analyst-opinion` |
| `attribute` | <img src="./exports/png/2x/simple/attribute.png" width="24" alt="attribute simple" /> | <img src="./exports/png/2x/hexagone/attribute.png" width="24" alt="attribute hexagone" /> | `misp-attribute` |
| `event` | <img src="./exports/png/2x/simple/event.png" width="24" alt="event simple" /> | <img src="./exports/png/2x/hexagone/event.png" width="24" alt="event hexagone" /> | `misp-event` |
| `galaxy` | <img src="./exports/png/2x/simple/galaxy.png" width="24" alt="galaxy simple" /> | <img src="./exports/png/2x/hexagone/galaxy.png" width="24" alt="galaxy hexagone" /> | `misp-galaxy` |
| `misp` | <img src="./exports/png/2x/simple/misp.png" width="24" alt="misp simple" /> | <img src="./exports/png/2x/hexagone/misp.png" width="24" alt="misp hexagone" /> | `misp-misp` |
| `object` | <img src="./exports/png/2x/simple/object.png" width="24" alt="object simple" /> | <img src="./exports/png/2x/hexagone/object.png" width="24" alt="object hexagone" /> | `misp-object` |
| `organisation` | <img src="./exports/png/2x/simple/organisation.png" width="24" alt="organisation simple" /> | <img src="./exports/png/2x/hexagone/organisation.png" width="24" alt="organisation hexagone" /> | `misp-organisation` |
| `report` | <img src="./exports/png/2x/simple/report.png" width="24" alt="report simple" /> | <img src="./exports/png/2x/hexagone/report.png" width="24" alt="report hexagone" /> | `misp-report` |
| `sharing-group` | <img src="./exports/png/2x/simple/sharing-group.png" width="24" alt="sharing-group simple" /> | <img src="./exports/png/2x/hexagone/sharing-group.png" width="24" alt="sharing-group hexagone" /> | `misp-sharing-group` |
| `sighting` | <img src="./exports/png/2x/simple/sighting.png" width="24" alt="sighting simple" /> | <img src="./exports/png/2x/hexagone/sighting.png" width="24" alt="sighting hexagone" /> | `misp-sighting` |
| `tag` | <img src="./exports/png/2x/simple/tag.png" width="24" alt="tag simple" /> | <img src="./exports/png/2x/hexagone/tag.png" width="24" alt="tag hexagone" /> | `misp-tag` |
| `taxonomy` | <img src="./exports/png/2x/simple/taxonomy.png" width="24" alt="taxonomy simple" /> | <img src="./exports/png/2x/hexagone/taxonomy.png" width="24" alt="taxonomy hexagone" /> | `misp-taxonomy` |
| `user1` | <img src="./exports/png/2x/simple/user1.png" width="24" alt="user1 simple" /> | <img src="./exports/png/2x/hexagone/user1.png" width="24" alt="user1 hexagone" /> | `misp-user1` |
| `user2` | <img src="./exports/png/2x/simple/user2.png" width="24" alt="user2 simple" /> | <img src="./exports/png/2x/hexagone/user2.png" width="24" alt="user2 hexagone" /> | `misp-user2` |
| `user3` | <img src="./exports/png/2x/simple/user3.png" width="24" alt="user3 simple" /> | <img src="./exports/png/2x/hexagone/user3.png" width="24" alt="user3 hexagone" /> | `misp-user3` |

<!-- ICONS_END -->


## Usage

Icons inherit color and size from CSS (currentColor, font-size).

### SVG (direct file)
```html
<!-- For the event with the hexagone shape  -->
<img src="./hexagone/event.svg" />
```

### CSS
```html
<link rel="stylesheet" href="./exports/css/icons.css" />
...
<!-- For the event with the hexagone shape  -->
<i class="misp-icon misp-hexagone misp-event"></i>
```


## Contribution Rules

- `src/svg` is the source of truth
- Never edit generated PNGs manually
- SVG filenames must use kebab-case
<!-- - Icons should use a 24x24 viewBox -->
- Icons should use the fill=`currentColor`
- Icons provenance is tracked in `metadata/icons.json`


## Attribution

<!-- ATTRIBUTION_START -->

This project includes icons from third-party sources that require attribution.


<!-- ATTRIBUTION_END -->
