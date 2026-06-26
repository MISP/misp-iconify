# misp-iconify

Icons and related visual elements for MISP and MISP standard.

## Table of Contents

- [Catalog](#catalog)
  - [Attribute type icons](#attribute-type-icons)
  - [Object icons](#object-icons)
  - [Galaxy icons](#galaxy-icons)
- [Usage](#usage)
  - [SVG (direct file)](#svg-direct-file)
  - [CSS](#css)
- [Object icons (misp-objects submodule)](#object-icons-misp-objects-submodule)
- [Galaxy icons (misp-galaxy submodule)](#galaxy-icons-misp-galaxy-submodule)
- [Contribution Rules](#contribution-rules)
- [Attribution](#attribution)

## Catalog

<!-- ICONS_START -->


Main icon class:  `misp-icon`
- Hexagone class: `misp-hexagone`
- Simple class: `misp-simple`

| Name | Icon Simple | Icon Hexa | CSS Class |
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


### Attribute type icons

<!-- ATTRIBUTE_ICONS_START -->


Icons for **MISP attribute types** (see `describeTypes.json`). Single style,
variant class `misp-attributes`. Filenames are kebab-case, so attribute types
containing `|` or `/` are sanitized to `-` (shown in the *Attribute type* column).

| Attribute type | Icon | File | CSS Class |
|----------------|------|------|-----------|
| `AS` | <img src="./exports/png/2x/attributes/as.png" width="24" alt="as attribute" /> | `as.svg` | `misp-as` |
| `attachment` | <img src="./exports/png/2x/attributes/attachment.png" width="24" alt="attachment attribute" /> | `attachment.svg` | `misp-attachment` |
| `btc` | <img src="./exports/png/2x/attributes/btc.png" width="24" alt="btc attribute" /> | `btc.svg` | `misp-btc` |
| `campaign-name` | <img src="./exports/png/2x/attributes/campaign-name.png" width="24" alt="campaign-name attribute" /> | `campaign-name.svg` | `misp-campaign-name` |
| `cc-number` | <img src="./exports/png/2x/attributes/cc-number.png" width="24" alt="cc-number attribute" /> | `cc-number.svg` | `misp-cc-number` |
| `comment` | <img src="./exports/png/2x/attributes/comment.png" width="24" alt="comment attribute" /> | `comment.svg` | `misp-comment` |
| `cookie` | <img src="./exports/png/2x/attributes/cookie.png" width="24" alt="cookie attribute" /> | `cookie.svg` | `misp-cookie` |
| `cpe` | <img src="./exports/png/2x/attributes/cpe.png" width="24" alt="cpe attribute" /> | `cpe.svg` | `misp-cpe` |
| `datetime` | <img src="./exports/png/2x/attributes/datetime.png" width="24" alt="datetime attribute" /> | `datetime.svg` | `misp-datetime` |
| `domain\|ip` | <img src="./exports/png/2x/attributes/domain-ip.png" width="24" alt="domain-ip attribute" /> | `domain-ip.svg` | `misp-domain-ip` |
| `domain` | <img src="./exports/png/2x/attributes/domain.png" width="24" alt="domain attribute" /> | `domain.svg` | `misp-domain` |
| `email-dst` | <img src="./exports/png/2x/attributes/email-dst.png" width="24" alt="email-dst attribute" /> | `email-dst.svg` | `misp-email-dst` |
| `email-src` | <img src="./exports/png/2x/attributes/email-src.png" width="24" alt="email-src attribute" /> | `email-src.svg` | `misp-email-src` |
| `email` | <img src="./exports/png/2x/attributes/email.png" width="24" alt="email attribute" /> | `email.svg` | `misp-email` |
| `filename\|md5` | <img src="./exports/png/2x/attributes/filename-md5.png" width="24" alt="filename-md5 attribute" /> | `filename-md5.svg` | `misp-filename-md5` |
| `filename\|sha256` | <img src="./exports/png/2x/attributes/filename-sha256.png" width="24" alt="filename-sha256 attribute" /> | `filename-sha256.svg` | `misp-filename-sha256` |
| `filename` | <img src="./exports/png/2x/attributes/filename.png" width="24" alt="filename attribute" /> | `filename.svg` | `misp-filename` |
| `full-name` | <img src="./exports/png/2x/attributes/full-name.png" width="24" alt="full-name attribute" /> | `full-name.svg` | `misp-full-name` |
| `github-username` | <img src="./exports/png/2x/attributes/github-username.png" width="24" alt="github-username attribute" /> | `github-username.svg` | `misp-github-username` |
| `hostname` | <img src="./exports/png/2x/attributes/hostname.png" width="24" alt="hostname attribute" /> | `hostname.svg` | `misp-hostname` |
| `iban` | <img src="./exports/png/2x/attributes/iban.png" width="24" alt="iban attribute" /> | `iban.svg` | `misp-iban` |
| `ip-dst\|port` | <img src="./exports/png/2x/attributes/ip-dst-port.png" width="24" alt="ip-dst-port attribute" /> | `ip-dst-port.svg` | `misp-ip-dst-port` |
| `ip-dst` | <img src="./exports/png/2x/attributes/ip-dst.png" width="24" alt="ip-dst attribute" /> | `ip-dst.svg` | `misp-ip-dst` |
| `ip-src` | <img src="./exports/png/2x/attributes/ip-src.png" width="24" alt="ip-src attribute" /> | `ip-src.svg` | `misp-ip-src` |
| `link` | <img src="./exports/png/2x/attributes/link.png" width="24" alt="link attribute" /> | `link.svg` | `misp-link` |
| `mac-address` | <img src="./exports/png/2x/attributes/mac-address.png" width="24" alt="mac-address attribute" /> | `mac-address.svg` | `misp-mac-address` |
| `malware-sample` | <img src="./exports/png/2x/attributes/malware-sample.png" width="24" alt="malware-sample attribute" /> | `malware-sample.svg` | `misp-malware-sample` |
| `md5` | <img src="./exports/png/2x/attributes/md5.png" width="24" alt="md5 attribute" /> | `md5.svg` | `misp-md5` |
| `mutex` | <img src="./exports/png/2x/attributes/mutex.png" width="24" alt="mutex attribute" /> | `mutex.svg` | `misp-mutex` |
| `pattern-in-file` | <img src="./exports/png/2x/attributes/pattern-in-file.png" width="24" alt="pattern-in-file attribute" /> | `pattern-in-file.svg` | `misp-pattern-in-file` |
| `pgp-public-key` | <img src="./exports/png/2x/attributes/pgp-public-key.png" width="24" alt="pgp-public-key attribute" /> | `pgp-public-key.svg` | `misp-pgp-public-key` |
| `phone-number` | <img src="./exports/png/2x/attributes/phone-number.png" width="24" alt="phone-number attribute" /> | `phone-number.svg` | `misp-phone-number` |
| `port` | <img src="./exports/png/2x/attributes/port.png" width="24" alt="port attribute" /> | `port.svg` | `misp-port` |
| `regkey` | <img src="./exports/png/2x/attributes/regkey.png" width="24" alt="regkey attribute" /> | `regkey.svg` | `misp-regkey` |
| `sha1` | <img src="./exports/png/2x/attributes/sha1.png" width="24" alt="sha1 attribute" /> | `sha1.svg` | `misp-sha1` |
| `sha256` | <img src="./exports/png/2x/attributes/sha256.png" width="24" alt="sha256 attribute" /> | `sha256.svg` | `misp-sha256` |
| `sigma` | <img src="./exports/png/2x/attributes/sigma.png" width="24" alt="sigma attribute" /> | `sigma.svg` | `misp-sigma` |
| `snort` | <img src="./exports/png/2x/attributes/snort.png" width="24" alt="snort attribute" /> | `snort.svg` | `misp-snort` |
| `ssh-fingerprint` | <img src="./exports/png/2x/attributes/ssh-fingerprint.png" width="24" alt="ssh-fingerprint attribute" /> | `ssh-fingerprint.svg` | `misp-ssh-fingerprint` |
| `text` | <img src="./exports/png/2x/attributes/text.png" width="24" alt="text attribute" /> | `text.svg` | `misp-text` |
| `threat-actor` | <img src="./exports/png/2x/attributes/threat-actor.png" width="24" alt="threat-actor attribute" /> | `threat-actor.svg` | `misp-threat-actor` |
| `twitter-id` | <img src="./exports/png/2x/attributes/twitter-id.png" width="24" alt="twitter-id attribute" /> | `twitter-id.svg` | `misp-twitter-id` |
| `uri` | <img src="./exports/png/2x/attributes/uri.png" width="24" alt="uri attribute" /> | `uri.svg` | `misp-uri` |
| `url` | <img src="./exports/png/2x/attributes/url.png" width="24" alt="url attribute" /> | `url.svg` | `misp-url` |
| `user-agent` | <img src="./exports/png/2x/attributes/user-agent.png" width="24" alt="user-agent attribute" /> | `user-agent.svg` | `misp-user-agent` |
| `vulnerability` | <img src="./exports/png/2x/attributes/vulnerability.png" width="24" alt="vulnerability attribute" /> | `vulnerability.svg` | `misp-vulnerability` |
| `windows-scheduled-task` | <img src="./exports/png/2x/attributes/windows-scheduled-task.png" width="24" alt="windows-scheduled-task attribute" /> | `windows-scheduled-task.svg` | `misp-windows-scheduled-task` |
| `windows-service-name` | <img src="./exports/png/2x/attributes/windows-service-name.png" width="24" alt="windows-service-name attribute" /> | `windows-service-name.svg` | `misp-windows-service-name` |
| `x509-fingerprint-sha1` | <img src="./exports/png/2x/attributes/x509-fingerprint-sha1.png" width="24" alt="x509-fingerprint-sha1 attribute" /> | `x509-fingerprint-sha1.svg` | `misp-x509-fingerprint-sha1` |
| `yara` | <img src="./exports/png/2x/attributes/yara.png" width="24" alt="yara attribute" /> | `yara.svg` | `misp-yara` |

<!-- ATTRIBUTE_ICONS_END -->


### Object icons

<!-- OBJECT_ICONS_START -->


Icons for **MISP objects**, imported from the [`misp-objects`](https://github.com/MISP/misp-objects)
submodule. Each object ships in **two variants** under the same name:

- `misp-objects` — the plain glyph.
- `misp-objects-framed` — the glyph inside a thin rounded **frame**. Because an
  object groups several attributes, the frame is a `currentColor` cue (legible
  even at 16px) that sets an object apart from a single-attribute icon.

Use whichever fits: `<i class="misp-icon misp-icon-<name> misp-objects"></i>` or
`<i class="misp-icon misp-icon-<name> misp-objects-framed"></i>`. The framed
variant is derived from the plain one by `src/scripts/frame-objects.sh`.

Names marked † also exist as a core or attribute icon; they stay separate
thanks to the variant class, so both render independently.

| Object | Plain | Framed | File |
|--------|-------|--------|------|
| `android-app` | <img src="./exports/png/2x/objects/android-app.png" width="24" alt="android-app object" /> | <img src="./exports/png/2x/objects-framed/android-app.png" width="24" alt="android-app object framed" /> | `android-app.svg` |
| `android-permission` | <img src="./exports/png/2x/objects/android-permission.png" width="24" alt="android-permission object" /> | <img src="./exports/png/2x/objects-framed/android-permission.png" width="24" alt="android-permission object framed" /> | `android-permission.svg` |
| `annotation` | <img src="./exports/png/2x/objects/annotation.png" width="24" alt="annotation object" /> | <img src="./exports/png/2x/objects-framed/annotation.png" width="24" alt="annotation object framed" /> | `annotation.svg` |
| `apk` | <img src="./exports/png/2x/objects/apk.png" width="24" alt="apk object" /> | <img src="./exports/png/2x/objects-framed/apk.png" width="24" alt="apk object framed" /> | `apk.svg` |
| `artifact` | <img src="./exports/png/2x/objects/artifact.png" width="24" alt="artifact object" /> | <img src="./exports/png/2x/objects-framed/artifact.png" width="24" alt="artifact object framed" /> | `artifact.svg` |
| `asn` | <img src="./exports/png/2x/objects/asn.png" width="24" alt="asn object" /> | <img src="./exports/png/2x/objects-framed/asn.png" width="24" alt="asn object framed" /> | `asn.svg` |
| `attack-pattern` | <img src="./exports/png/2x/objects/attack-pattern.png" width="24" alt="attack-pattern object" /> | <img src="./exports/png/2x/objects-framed/attack-pattern.png" width="24" alt="attack-pattern object framed" /> | `attack-pattern.svg` |
| `av-signature` | <img src="./exports/png/2x/objects/av-signature.png" width="24" alt="av-signature object" /> | <img src="./exports/png/2x/objects-framed/av-signature.png" width="24" alt="av-signature object framed" /> | `av-signature.svg` |
| `bank-account` | <img src="./exports/png/2x/objects/bank-account.png" width="24" alt="bank-account object" /> | <img src="./exports/png/2x/objects-framed/bank-account.png" width="24" alt="bank-account object framed" /> | `bank-account.svg` |
| `blog` | <img src="./exports/png/2x/objects/blog.png" width="24" alt="blog object" /> | <img src="./exports/png/2x/objects-framed/blog.png" width="24" alt="blog object framed" /> | `blog.svg` |
| `btc-transaction` | <img src="./exports/png/2x/objects/btc-transaction.png" width="24" alt="btc-transaction object" /> | <img src="./exports/png/2x/objects-framed/btc-transaction.png" width="24" alt="btc-transaction object framed" /> | `btc-transaction.svg` |
| `btc-wallet` | <img src="./exports/png/2x/objects/btc-wallet.png" width="24" alt="btc-wallet object" /> | <img src="./exports/png/2x/objects-framed/btc-wallet.png" width="24" alt="btc-wallet object framed" /> | `btc-wallet.svg` |
| `c2-list` | <img src="./exports/png/2x/objects/c2-list.png" width="24" alt="c2-list object" /> | <img src="./exports/png/2x/objects-framed/c2-list.png" width="24" alt="c2-list object framed" /> | `c2-list.svg` |
| `chat-message` | <img src="./exports/png/2x/objects/chat-message.png" width="24" alt="chat-message object" /> | <img src="./exports/png/2x/objects-framed/chat-message.png" width="24" alt="chat-message object framed" /> | `chat-message.svg` |
| `coin-address` | <img src="./exports/png/2x/objects/coin-address.png" width="24" alt="coin-address object" /> | <img src="./exports/png/2x/objects-framed/coin-address.png" width="24" alt="coin-address object framed" /> | `coin-address.svg` |
| `command-line` | <img src="./exports/png/2x/objects/command-line.png" width="24" alt="command-line object" /> | <img src="./exports/png/2x/objects-framed/command-line.png" width="24" alt="command-line object framed" /> | `command-line.svg` |
| `command` | <img src="./exports/png/2x/objects/command.png" width="24" alt="command object" /> | <img src="./exports/png/2x/objects-framed/command.png" width="24" alt="command object framed" /> | `command.svg` |
| `cookie` † | <img src="./exports/png/2x/objects/cookie.png" width="24" alt="cookie object" /> | <img src="./exports/png/2x/objects-framed/cookie.png" width="24" alt="cookie object framed" /> | `cookie.svg` |
| `course-of-action` | <img src="./exports/png/2x/objects/course-of-action.png" width="24" alt="course-of-action object" /> | <img src="./exports/png/2x/objects-framed/course-of-action.png" width="24" alt="course-of-action object framed" /> | `course-of-action.svg` |
| `cpe-asset` | <img src="./exports/png/2x/objects/cpe-asset.png" width="24" alt="cpe-asset object" /> | <img src="./exports/png/2x/objects-framed/cpe-asset.png" width="24" alt="cpe-asset object framed" /> | `cpe-asset.svg` |
| `credential` | <img src="./exports/png/2x/objects/credential.png" width="24" alt="credential object" /> | <img src="./exports/png/2x/objects-framed/credential.png" width="24" alt="credential object framed" /> | `credential.svg` |
| `credit-card` | <img src="./exports/png/2x/objects/credit-card.png" width="24" alt="credit-card object" /> | <img src="./exports/png/2x/objects-framed/credit-card.png" width="24" alt="credit-card object framed" /> | `credit-card.svg` |
| `crypto-material` | <img src="./exports/png/2x/objects/crypto-material.png" width="24" alt="crypto-material object" /> | <img src="./exports/png/2x/objects-framed/crypto-material.png" width="24" alt="crypto-material object framed" /> | `crypto-material.svg` |
| `data-url` | <img src="./exports/png/2x/objects/data-url.png" width="24" alt="data-url object" /> | <img src="./exports/png/2x/objects-framed/data-url.png" width="24" alt="data-url object framed" /> | `data-url.svg` |
| `ddos-config` | <img src="./exports/png/2x/objects/ddos-config.png" width="24" alt="ddos-config object" /> | <img src="./exports/png/2x/objects-framed/ddos-config.png" width="24" alt="ddos-config object framed" /> | `ddos-config.svg` |
| `ddos` | <img src="./exports/png/2x/objects/ddos.png" width="24" alt="ddos object" /> | <img src="./exports/png/2x/objects-framed/ddos.png" width="24" alt="ddos object framed" /> | `ddos.svg` |
| `decoded-barcode` | <img src="./exports/png/2x/objects/decoded-barcode.png" width="24" alt="decoded-barcode object" /> | <img src="./exports/png/2x/objects-framed/decoded-barcode.png" width="24" alt="decoded-barcode object framed" /> | `decoded-barcode.svg` |
| `decoded-qrcode` | <img src="./exports/png/2x/objects/decoded-qrcode.png" width="24" alt="decoded-qrcode object" /> | <img src="./exports/png/2x/objects-framed/decoded-qrcode.png" width="24" alt="decoded-qrcode object framed" /> | `decoded-qrcode.svg` |
| `device` | <img src="./exports/png/2x/objects/device.png" width="24" alt="device object" /> | <img src="./exports/png/2x/objects-framed/device.png" width="24" alt="device object framed" /> | `device.svg` |
| `diamond` | <img src="./exports/png/2x/objects/diamond.png" width="24" alt="diamond object" /> | <img src="./exports/png/2x/objects-framed/diamond.png" width="24" alt="diamond object framed" /> | `diamond.svg` |
| `directory` | <img src="./exports/png/2x/objects/directory.png" width="24" alt="directory object" /> | <img src="./exports/png/2x/objects-framed/directory.png" width="24" alt="directory object framed" /> | `directory.svg` |
| `dkim` | <img src="./exports/png/2x/objects/dkim.png" width="24" alt="dkim object" /> | <img src="./exports/png/2x/objects-framed/dkim.png" width="24" alt="dkim object framed" /> | `dkim.svg` |
| `dns-record` | <img src="./exports/png/2x/objects/dns-record.png" width="24" alt="dns-record object" /> | <img src="./exports/png/2x/objects-framed/dns-record.png" width="24" alt="dns-record object framed" /> | `dns-record.svg` |
| `domain-ip` † | <img src="./exports/png/2x/objects/domain-ip.png" width="24" alt="domain-ip object" /> | <img src="./exports/png/2x/objects-framed/domain-ip.png" width="24" alt="domain-ip object framed" /> | `domain-ip.svg` |
| `elf` | <img src="./exports/png/2x/objects/elf.png" width="24" alt="elf object" /> | <img src="./exports/png/2x/objects-framed/elf.png" width="24" alt="elf object framed" /> | `elf.svg` |
| `email` † | <img src="./exports/png/2x/objects/email.png" width="24" alt="email object" /> | <img src="./exports/png/2x/objects-framed/email.png" width="24" alt="email object framed" /> | `email.svg` |
| `employee` | <img src="./exports/png/2x/objects/employee.png" width="24" alt="employee object" /> | <img src="./exports/png/2x/objects-framed/employee.png" width="24" alt="employee object framed" /> | `employee.svg` |
| `event` † | <img src="./exports/png/2x/objects/event.png" width="24" alt="event object" /> | <img src="./exports/png/2x/objects-framed/event.png" width="24" alt="event object framed" /> | `event.svg` |
| `exploit-poc` | <img src="./exports/png/2x/objects/exploit-poc.png" width="24" alt="exploit-poc object" /> | <img src="./exports/png/2x/objects-framed/exploit-poc.png" width="24" alt="exploit-poc object framed" /> | `exploit-poc.svg` |
| `exploit` | <img src="./exports/png/2x/objects/exploit.png" width="24" alt="exploit object" /> | <img src="./exports/png/2x/objects-framed/exploit.png" width="24" alt="exploit object framed" /> | `exploit.svg` |
| `facebook-account` | <img src="./exports/png/2x/objects/facebook-account.png" width="24" alt="facebook-account object" /> | <img src="./exports/png/2x/objects-framed/facebook-account.png" width="24" alt="facebook-account object framed" /> | `facebook-account.svg` |
| `facebook-group` | <img src="./exports/png/2x/objects/facebook-group.png" width="24" alt="facebook-group object" /> | <img src="./exports/png/2x/objects-framed/facebook-group.png" width="24" alt="facebook-group object framed" /> | `facebook-group.svg` |
| `facebook-page` | <img src="./exports/png/2x/objects/facebook-page.png" width="24" alt="facebook-page object" /> | <img src="./exports/png/2x/objects-framed/facebook-page.png" width="24" alt="facebook-page object framed" /> | `facebook-page.svg` |
| `facebook-post` | <img src="./exports/png/2x/objects/facebook-post.png" width="24" alt="facebook-post object" /> | <img src="./exports/png/2x/objects-framed/facebook-post.png" width="24" alt="facebook-post object framed" /> | `facebook-post.svg` |
| `facebook-reaction` | <img src="./exports/png/2x/objects/facebook-reaction.png" width="24" alt="facebook-reaction object" /> | <img src="./exports/png/2x/objects-framed/facebook-reaction.png" width="24" alt="facebook-reaction object framed" /> | `facebook-reaction.svg` |
| `favicon` | <img src="./exports/png/2x/objects/favicon.png" width="24" alt="favicon object" /> | <img src="./exports/png/2x/objects-framed/favicon.png" width="24" alt="favicon object framed" /> | `favicon.svg` |
| `file-7z` | <img src="./exports/png/2x/objects/file-7z.png" width="24" alt="file-7z object" /> | <img src="./exports/png/2x/objects-framed/file-7z.png" width="24" alt="file-7z object framed" /> | `file-7z.svg` |
| `file-apk` | <img src="./exports/png/2x/objects/file-apk.png" width="24" alt="file-apk object" /> | <img src="./exports/png/2x/objects-framed/file-apk.png" width="24" alt="file-apk object framed" /> | `file-apk.svg` |
| `file-bat` | <img src="./exports/png/2x/objects/file-bat.png" width="24" alt="file-bat object" /> | <img src="./exports/png/2x/objects-framed/file-bat.png" width="24" alt="file-bat object framed" /> | `file-bat.svg` |
| `file-css` | <img src="./exports/png/2x/objects/file-css.png" width="24" alt="file-css object" /> | <img src="./exports/png/2x/objects-framed/file-css.png" width="24" alt="file-css object framed" /> | `file-css.svg` |
| `file-csv` | <img src="./exports/png/2x/objects/file-csv.png" width="24" alt="file-csv object" /> | <img src="./exports/png/2x/objects-framed/file-csv.png" width="24" alt="file-csv object framed" /> | `file-csv.svg` |
| `file-dll` | <img src="./exports/png/2x/objects/file-dll.png" width="24" alt="file-dll object" /> | <img src="./exports/png/2x/objects-framed/file-dll.png" width="24" alt="file-dll object framed" /> | `file-dll.svg` |
| `file-doc` | <img src="./exports/png/2x/objects/file-doc.png" width="24" alt="file-doc object" /> | <img src="./exports/png/2x/objects-framed/file-doc.png" width="24" alt="file-doc object framed" /> | `file-doc.svg` |
| `file-docx` | <img src="./exports/png/2x/objects/file-docx.png" width="24" alt="file-docx object" /> | <img src="./exports/png/2x/objects-framed/file-docx.png" width="24" alt="file-docx object framed" /> | `file-docx.svg` |
| `file-elf` | <img src="./exports/png/2x/objects/file-elf.png" width="24" alt="file-elf object" /> | <img src="./exports/png/2x/objects-framed/file-elf.png" width="24" alt="file-elf object framed" /> | `file-elf.svg` |
| `file-eml` | <img src="./exports/png/2x/objects/file-eml.png" width="24" alt="file-eml object" /> | <img src="./exports/png/2x/objects-framed/file-eml.png" width="24" alt="file-eml object framed" /> | `file-eml.svg` |
| `file-exe` | <img src="./exports/png/2x/objects/file-exe.png" width="24" alt="file-exe object" /> | <img src="./exports/png/2x/objects-framed/file-exe.png" width="24" alt="file-exe object framed" /> | `file-exe.svg` |
| `file-gif` | <img src="./exports/png/2x/objects/file-gif.png" width="24" alt="file-gif object" /> | <img src="./exports/png/2x/objects-framed/file-gif.png" width="24" alt="file-gif object framed" /> | `file-gif.svg` |
| `file-gz` | <img src="./exports/png/2x/objects/file-gz.png" width="24" alt="file-gz object" /> | <img src="./exports/png/2x/objects-framed/file-gz.png" width="24" alt="file-gz object framed" /> | `file-gz.svg` |
| `file-html` | <img src="./exports/png/2x/objects/file-html.png" width="24" alt="file-html object" /> | <img src="./exports/png/2x/objects-framed/file-html.png" width="24" alt="file-html object framed" /> | `file-html.svg` |
| `file-iso` | <img src="./exports/png/2x/objects/file-iso.png" width="24" alt="file-iso object" /> | <img src="./exports/png/2x/objects-framed/file-iso.png" width="24" alt="file-iso object framed" /> | `file-iso.svg` |
| `file-jar` | <img src="./exports/png/2x/objects/file-jar.png" width="24" alt="file-jar object" /> | <img src="./exports/png/2x/objects-framed/file-jar.png" width="24" alt="file-jar object framed" /> | `file-jar.svg` |
| `file-jpg` | <img src="./exports/png/2x/objects/file-jpg.png" width="24" alt="file-jpg object" /> | <img src="./exports/png/2x/objects-framed/file-jpg.png" width="24" alt="file-jpg object framed" /> | `file-jpg.svg` |
| `file-json` | <img src="./exports/png/2x/objects/file-json.png" width="24" alt="file-json object" /> | <img src="./exports/png/2x/objects-framed/file-json.png" width="24" alt="file-json object framed" /> | `file-json.svg` |
| `file-js` | <img src="./exports/png/2x/objects/file-js.png" width="24" alt="file-js object" /> | <img src="./exports/png/2x/objects-framed/file-js.png" width="24" alt="file-js object framed" /> | `file-js.svg` |
| `file-lnk` | <img src="./exports/png/2x/objects/file-lnk.png" width="24" alt="file-lnk object" /> | <img src="./exports/png/2x/objects-framed/file-lnk.png" width="24" alt="file-lnk object framed" /> | `file-lnk.svg` |
| `file-mp3` | <img src="./exports/png/2x/objects/file-mp3.png" width="24" alt="file-mp3 object" /> | <img src="./exports/png/2x/objects-framed/file-mp3.png" width="24" alt="file-mp3 object framed" /> | `file-mp3.svg` |
| `file-mp4` | <img src="./exports/png/2x/objects/file-mp4.png" width="24" alt="file-mp4 object" /> | <img src="./exports/png/2x/objects-framed/file-mp4.png" width="24" alt="file-mp4 object framed" /> | `file-mp4.svg` |
| `file-msg` | <img src="./exports/png/2x/objects/file-msg.png" width="24" alt="file-msg object" /> | <img src="./exports/png/2x/objects-framed/file-msg.png" width="24" alt="file-msg object framed" /> | `file-msg.svg` |
| `file-pcap` | <img src="./exports/png/2x/objects/file-pcap.png" width="24" alt="file-pcap object" /> | <img src="./exports/png/2x/objects-framed/file-pcap.png" width="24" alt="file-pcap object framed" /> | `file-pcap.svg` |
| `file-pdf` | <img src="./exports/png/2x/objects/file-pdf.png" width="24" alt="file-pdf object" /> | <img src="./exports/png/2x/objects-framed/file-pdf.png" width="24" alt="file-pdf object framed" /> | `file-pdf.svg` |
| `file-png` | <img src="./exports/png/2x/objects/file-png.png" width="24" alt="file-png object" /> | <img src="./exports/png/2x/objects-framed/file-png.png" width="24" alt="file-png object framed" /> | `file-png.svg` |
| `file-ppt` | <img src="./exports/png/2x/objects/file-ppt.png" width="24" alt="file-ppt object" /> | <img src="./exports/png/2x/objects-framed/file-ppt.png" width="24" alt="file-ppt object framed" /> | `file-ppt.svg` |
| `file-pptx` | <img src="./exports/png/2x/objects/file-pptx.png" width="24" alt="file-pptx object" /> | <img src="./exports/png/2x/objects-framed/file-pptx.png" width="24" alt="file-pptx object framed" /> | `file-pptx.svg` |
| `file-ps1` | <img src="./exports/png/2x/objects/file-ps1.png" width="24" alt="file-ps1 object" /> | <img src="./exports/png/2x/objects-framed/file-ps1.png" width="24" alt="file-ps1 object framed" /> | `file-ps1.svg` |
| `file-py` | <img src="./exports/png/2x/objects/file-py.png" width="24" alt="file-py object" /> | <img src="./exports/png/2x/objects-framed/file-py.png" width="24" alt="file-py object framed" /> | `file-py.svg` |
| `file-rar` | <img src="./exports/png/2x/objects/file-rar.png" width="24" alt="file-rar object" /> | <img src="./exports/png/2x/objects-framed/file-rar.png" width="24" alt="file-rar object framed" /> | `file-rar.svg` |
| `file-rtf` | <img src="./exports/png/2x/objects/file-rtf.png" width="24" alt="file-rtf object" /> | <img src="./exports/png/2x/objects-framed/file-rtf.png" width="24" alt="file-rtf object framed" /> | `file-rtf.svg` |
| `file-sh` | <img src="./exports/png/2x/objects/file-sh.png" width="24" alt="file-sh object" /> | <img src="./exports/png/2x/objects-framed/file-sh.png" width="24" alt="file-sh object framed" /> | `file-sh.svg` |
| `file` | <img src="./exports/png/2x/objects/file.png" width="24" alt="file object" /> | <img src="./exports/png/2x/objects-framed/file.png" width="24" alt="file object framed" /> | `file.svg` |
| `file-svg` | <img src="./exports/png/2x/objects/file-svg.png" width="24" alt="file-svg object" /> | <img src="./exports/png/2x/objects-framed/file-svg.png" width="24" alt="file-svg object framed" /> | `file-svg.svg` |
| `file-txt` | <img src="./exports/png/2x/objects/file-txt.png" width="24" alt="file-txt object" /> | <img src="./exports/png/2x/objects-framed/file-txt.png" width="24" alt="file-txt object framed" /> | `file-txt.svg` |
| `file-vbs` | <img src="./exports/png/2x/objects/file-vbs.png" width="24" alt="file-vbs object" /> | <img src="./exports/png/2x/objects-framed/file-vbs.png" width="24" alt="file-vbs object framed" /> | `file-vbs.svg` |
| `file-xls` | <img src="./exports/png/2x/objects/file-xls.png" width="24" alt="file-xls object" /> | <img src="./exports/png/2x/objects-framed/file-xls.png" width="24" alt="file-xls object framed" /> | `file-xls.svg` |
| `file-xlsx` | <img src="./exports/png/2x/objects/file-xlsx.png" width="24" alt="file-xlsx object" /> | <img src="./exports/png/2x/objects-framed/file-xlsx.png" width="24" alt="file-xlsx object framed" /> | `file-xlsx.svg` |
| `file-xml` | <img src="./exports/png/2x/objects/file-xml.png" width="24" alt="file-xml object" /> | <img src="./exports/png/2x/objects-framed/file-xml.png" width="24" alt="file-xml object framed" /> | `file-xml.svg` |
| `file-zip` | <img src="./exports/png/2x/objects/file-zip.png" width="24" alt="file-zip object" /> | <img src="./exports/png/2x/objects-framed/file-zip.png" width="24" alt="file-zip object framed" /> | `file-zip.svg` |
| `forensic-case` | <img src="./exports/png/2x/objects/forensic-case.png" width="24" alt="forensic-case object" /> | <img src="./exports/png/2x/objects-framed/forensic-case.png" width="24" alt="forensic-case object framed" /> | `forensic-case.svg` |
| `forensic-evidence` | <img src="./exports/png/2x/objects/forensic-evidence.png" width="24" alt="forensic-evidence object" /> | <img src="./exports/png/2x/objects-framed/forensic-evidence.png" width="24" alt="forensic-evidence object framed" /> | `forensic-evidence.svg` |
| `forged-document` | <img src="./exports/png/2x/objects/forged-document.png" width="24" alt="forged-document object" /> | <img src="./exports/png/2x/objects-framed/forged-document.png" width="24" alt="forged-document object framed" /> | `forged-document.svg` |
| `geojson` | <img src="./exports/png/2x/objects/geojson.png" width="24" alt="geojson object" /> | <img src="./exports/png/2x/objects-framed/geojson.png" width="24" alt="geojson object framed" /> | `geojson.svg` |
| `geolocation` | <img src="./exports/png/2x/objects/geolocation.png" width="24" alt="geolocation object" /> | <img src="./exports/png/2x/objects-framed/geolocation.png" width="24" alt="geolocation object framed" /> | `geolocation.svg` |
| `ghidra-function` | <img src="./exports/png/2x/objects/ghidra-function.png" width="24" alt="ghidra-function object" /> | <img src="./exports/png/2x/objects-framed/ghidra-function.png" width="24" alt="ghidra-function object framed" /> | `ghidra-function.svg` |
| `github-action` | <img src="./exports/png/2x/objects/github-action.png" width="24" alt="github-action object" /> | <img src="./exports/png/2x/objects-framed/github-action.png" width="24" alt="github-action object framed" /> | `github-action.svg` |
| `github-repo` | <img src="./exports/png/2x/objects/github-repo.png" width="24" alt="github-repo object" /> | <img src="./exports/png/2x/objects-framed/github-repo.png" width="24" alt="github-repo object framed" /> | `github-repo.svg` |
| `github-user` | <img src="./exports/png/2x/objects/github-user.png" width="24" alt="github-user object" /> | <img src="./exports/png/2x/objects-framed/github-user.png" width="24" alt="github-user object framed" /> | `github-user.svg` |
| `gitlab-user` | <img src="./exports/png/2x/objects/gitlab-user.png" width="24" alt="gitlab-user object" /> | <img src="./exports/png/2x/objects-framed/gitlab-user.png" width="24" alt="gitlab-user object framed" /> | `gitlab-user.svg` |
| `google-account` | <img src="./exports/png/2x/objects/google-account.png" width="24" alt="google-account object" /> | <img src="./exports/png/2x/objects-framed/google-account.png" width="24" alt="google-account object framed" /> | `google-account.svg` |
| `google-threat-intelligence-report` | <img src="./exports/png/2x/objects/google-threat-intelligence-report.png" width="24" alt="google-threat-intelligence-report object" /> | <img src="./exports/png/2x/objects-framed/google-threat-intelligence-report.png" width="24" alt="google-threat-intelligence-report object framed" /> | `google-threat-intelligence-report.svg` |
| `gpx` | <img src="./exports/png/2x/objects/gpx.png" width="24" alt="gpx object" /> | <img src="./exports/png/2x/objects-framed/gpx.png" width="24" alt="gpx object framed" /> | `gpx.svg` |
| `http-request` | <img src="./exports/png/2x/objects/http-request.png" width="24" alt="http-request object" /> | <img src="./exports/png/2x/objects-framed/http-request.png" width="24" alt="http-request object framed" /> | `http-request.svg` |
| `identity` | <img src="./exports/png/2x/objects/identity.png" width="24" alt="identity object" /> | <img src="./exports/png/2x/objects-framed/identity.png" width="24" alt="identity object framed" /> | `identity.svg` |
| `image` | <img src="./exports/png/2x/objects/image.png" width="24" alt="image object" /> | <img src="./exports/png/2x/objects-framed/image.png" width="24" alt="image object framed" /> | `image.svg` |
| `impersonation` | <img src="./exports/png/2x/objects/impersonation.png" width="24" alt="impersonation object" /> | <img src="./exports/png/2x/objects-framed/impersonation.png" width="24" alt="impersonation object framed" /> | `impersonation.svg` |
| `incident` | <img src="./exports/png/2x/objects/incident.png" width="24" alt="incident object" /> | <img src="./exports/png/2x/objects-framed/incident.png" width="24" alt="incident object framed" /> | `incident.svg` |
| `infrastructure` | <img src="./exports/png/2x/objects/infrastructure.png" width="24" alt="infrastructure object" /> | <img src="./exports/png/2x/objects-framed/infrastructure.png" width="24" alt="infrastructure object framed" /> | `infrastructure.svg` |
| `instagram-account` | <img src="./exports/png/2x/objects/instagram-account.png" width="24" alt="instagram-account object" /> | <img src="./exports/png/2x/objects-framed/instagram-account.png" width="24" alt="instagram-account object framed" /> | `instagram-account.svg` |
| `instant-message` | <img src="./exports/png/2x/objects/instant-message.png" width="24" alt="instant-message object" /> | <img src="./exports/png/2x/objects-framed/instant-message.png" width="24" alt="instant-message object framed" /> | `instant-message.svg` |
| `intelligence-report` | <img src="./exports/png/2x/objects/intelligence-report.png" width="24" alt="intelligence-report object" /> | <img src="./exports/png/2x/objects-framed/intelligence-report.png" width="24" alt="intelligence-report object framed" /> | `intelligence-report.svg` |
| `intrusion-set` | <img src="./exports/png/2x/objects/intrusion-set.png" width="24" alt="intrusion-set object" /> | <img src="./exports/png/2x/objects-framed/intrusion-set.png" width="24" alt="intrusion-set object framed" /> | `intrusion-set.svg` |
| `iot-device` | <img src="./exports/png/2x/objects/iot-device.png" width="24" alt="iot-device object" /> | <img src="./exports/png/2x/objects-framed/iot-device.png" width="24" alt="iot-device object framed" /> | `iot-device.svg` |
| `iot-firmware` | <img src="./exports/png/2x/objects/iot-firmware.png" width="24" alt="iot-firmware object" /> | <img src="./exports/png/2x/objects-framed/iot-firmware.png" width="24" alt="iot-firmware object framed" /> | `iot-firmware.svg` |
| `ip-port` | <img src="./exports/png/2x/objects/ip-port.png" width="24" alt="ip-port object" /> | <img src="./exports/png/2x/objects-framed/ip-port.png" width="24" alt="ip-port object framed" /> | `ip-port.svg` |
| `irc` | <img src="./exports/png/2x/objects/irc.png" width="24" alt="irc object" /> | <img src="./exports/png/2x/objects-framed/irc.png" width="24" alt="irc object framed" /> | `irc.svg` |
| `ja3` | <img src="./exports/png/2x/objects/ja3.png" width="24" alt="ja3 object" /> | <img src="./exports/png/2x/objects-framed/ja3.png" width="24" alt="ja3 object framed" /> | `ja3.svg` |
| `keybase-account` | <img src="./exports/png/2x/objects/keybase-account.png" width="24" alt="keybase-account object" /> | <img src="./exports/png/2x/objects-framed/keybase-account.png" width="24" alt="keybase-account object framed" /> | `keybase-account.svg` |
| `leaked-document` | <img src="./exports/png/2x/objects/leaked-document.png" width="24" alt="leaked-document object" /> | <img src="./exports/png/2x/objects-framed/leaked-document.png" width="24" alt="leaked-document object framed" /> | `leaked-document.svg` |
| `legal-entity` | <img src="./exports/png/2x/objects/legal-entity.png" width="24" alt="legal-entity object" /> | <img src="./exports/png/2x/objects-framed/legal-entity.png" width="24" alt="legal-entity object framed" /> | `legal-entity.svg` |
| `lnk` | <img src="./exports/png/2x/objects/lnk.png" width="24" alt="lnk object" /> | <img src="./exports/png/2x/objects-framed/lnk.png" width="24" alt="lnk object framed" /> | `lnk.svg` |
| `macho` | <img src="./exports/png/2x/objects/macho.png" width="24" alt="macho object" /> | <img src="./exports/png/2x/objects-framed/macho.png" width="24" alt="macho object framed" /> | `macho.svg` |
| `malicious-website` | <img src="./exports/png/2x/objects/malicious-website.png" width="24" alt="malicious-website object" /> | <img src="./exports/png/2x/objects-framed/malicious-website.png" width="24" alt="malicious-website object framed" /> | `malicious-website.svg` |
| `malware-analysis` | <img src="./exports/png/2x/objects/malware-analysis.png" width="24" alt="malware-analysis object" /> | <img src="./exports/png/2x/objects-framed/malware-analysis.png" width="24" alt="malware-analysis object framed" /> | `malware-analysis.svg` |
| `malware-config` | <img src="./exports/png/2x/objects/malware-config.png" width="24" alt="malware-config object" /> | <img src="./exports/png/2x/objects-framed/malware-config.png" width="24" alt="malware-config object framed" /> | `malware-config.svg` |
| `malware` | <img src="./exports/png/2x/objects/malware.png" width="24" alt="malware object" /> | <img src="./exports/png/2x/objects-framed/malware.png" width="24" alt="malware object framed" /> | `malware.svg` |
| `microblog` | <img src="./exports/png/2x/objects/microblog.png" width="24" alt="microblog object" /> | <img src="./exports/png/2x/objects-framed/microblog.png" width="24" alt="microblog object framed" /> | `microblog.svg` |
| `mutex` † | <img src="./exports/png/2x/objects/mutex.png" width="24" alt="mutex object" /> | <img src="./exports/png/2x/objects-framed/mutex.png" width="24" alt="mutex object framed" /> | `mutex.svg` |
| `netflow` | <img src="./exports/png/2x/objects/netflow.png" width="24" alt="netflow object" /> | <img src="./exports/png/2x/objects-framed/netflow.png" width="24" alt="netflow object framed" /> | `netflow.svg` |
| `network-connection` | <img src="./exports/png/2x/objects/network-connection.png" width="24" alt="network-connection object" /> | <img src="./exports/png/2x/objects-framed/network-connection.png" width="24" alt="network-connection object framed" /> | `network-connection.svg` |
| `network-data` | <img src="./exports/png/2x/objects/network-data.png" width="24" alt="network-data object" /> | <img src="./exports/png/2x/objects-framed/network-data.png" width="24" alt="network-data object framed" /> | `network-data.svg` |
| `network-profile` | <img src="./exports/png/2x/objects/network-profile.png" width="24" alt="network-profile object" /> | <img src="./exports/png/2x/objects-framed/network-profile.png" width="24" alt="network-profile object framed" /> | `network-profile.svg` |
| `network-socket` | <img src="./exports/png/2x/objects/network-socket.png" width="24" alt="network-socket object" /> | <img src="./exports/png/2x/objects-framed/network-socket.png" width="24" alt="network-socket object framed" /> | `network-socket.svg` |
| `network-traffic` | <img src="./exports/png/2x/objects/network-traffic.png" width="24" alt="network-traffic object" /> | <img src="./exports/png/2x/objects-framed/network-traffic.png" width="24" alt="network-traffic object framed" /> | `network-traffic.svg` |
| `news-agency` | <img src="./exports/png/2x/objects/news-agency.png" width="24" alt="news-agency object" /> | <img src="./exports/png/2x/objects-framed/news-agency.png" width="24" alt="news-agency object framed" /> | `news-agency.svg` |
| `news-media` | <img src="./exports/png/2x/objects/news-media.png" width="24" alt="news-media object" /> | <img src="./exports/png/2x/objects-framed/news-media.png" width="24" alt="news-media object framed" /> | `news-media.svg` |
| `nse-script` | <img src="./exports/png/2x/objects/nse-script.png" width="24" alt="nse-script object" /> | <img src="./exports/png/2x/objects-framed/nse-script.png" width="24" alt="nse-script object framed" /> | `nse-script.svg` |
| `organization` | <img src="./exports/png/2x/objects/organization.png" width="24" alt="organization object" /> | <img src="./exports/png/2x/objects-framed/organization.png" width="24" alt="organization object framed" /> | `organization.svg` |
| `passive-dns-dnsdbflex` | <img src="./exports/png/2x/objects/passive-dns-dnsdbflex.png" width="24" alt="passive-dns-dnsdbflex object" /> | <img src="./exports/png/2x/objects-framed/passive-dns-dnsdbflex.png" width="24" alt="passive-dns-dnsdbflex object framed" /> | `passive-dns-dnsdbflex.svg` |
| `passive-dns` | <img src="./exports/png/2x/objects/passive-dns.png" width="24" alt="passive-dns object" /> | <img src="./exports/png/2x/objects-framed/passive-dns.png" width="24" alt="passive-dns object framed" /> | `passive-dns.svg` |
| `passive-ssh` | <img src="./exports/png/2x/objects/passive-ssh.png" width="24" alt="passive-ssh object" /> | <img src="./exports/png/2x/objects-framed/passive-ssh.png" width="24" alt="passive-ssh object framed" /> | `passive-ssh.svg` |
| `paste` | <img src="./exports/png/2x/objects/paste.png" width="24" alt="paste object" /> | <img src="./exports/png/2x/objects-framed/paste.png" width="24" alt="paste object framed" /> | `paste.svg` |
| `personification` | <img src="./exports/png/2x/objects/personification.png" width="24" alt="personification object" /> | <img src="./exports/png/2x/objects-framed/personification.png" width="24" alt="personification object framed" /> | `personification.svg` |
| `person` | <img src="./exports/png/2x/objects/person.png" width="24" alt="person object" /> | <img src="./exports/png/2x/objects-framed/person.png" width="24" alt="person object framed" /> | `person.svg` |
| `pe-section` | <img src="./exports/png/2x/objects/pe-section.png" width="24" alt="pe-section object" /> | <img src="./exports/png/2x/objects-framed/pe-section.png" width="24" alt="pe-section object framed" /> | `pe-section.svg` |
| `pe` | <img src="./exports/png/2x/objects/pe.png" width="24" alt="pe object" /> | <img src="./exports/png/2x/objects-framed/pe.png" width="24" alt="pe object framed" /> | `pe.svg` |
| `phishing-kit` | <img src="./exports/png/2x/objects/phishing-kit.png" width="24" alt="phishing-kit object" /> | <img src="./exports/png/2x/objects-framed/phishing-kit.png" width="24" alt="phishing-kit object framed" /> | `phishing-kit.svg` |
| `phishing` | <img src="./exports/png/2x/objects/phishing.png" width="24" alt="phishing object" /> | <img src="./exports/png/2x/objects-framed/phishing.png" width="24" alt="phishing object framed" /> | `phishing.svg` |
| `phone-number` † | <img src="./exports/png/2x/objects/phone-number.png" width="24" alt="phone-number object" /> | <img src="./exports/png/2x/objects-framed/phone-number.png" width="24" alt="phone-number object framed" /> | `phone-number.svg` |
| `phone` | <img src="./exports/png/2x/objects/phone.png" width="24" alt="phone object" /> | <img src="./exports/png/2x/objects-framed/phone.png" width="24" alt="phone object framed" /> | `phone.svg` |
| `physical-impact` | <img src="./exports/png/2x/objects/physical-impact.png" width="24" alt="physical-impact object" /> | <img src="./exports/png/2x/objects-framed/physical-impact.png" width="24" alt="physical-impact object framed" /> | `physical-impact.svg` |
| `postal-address` | <img src="./exports/png/2x/objects/postal-address.png" width="24" alt="postal-address object" /> | <img src="./exports/png/2x/objects-framed/postal-address.png" width="24" alt="postal-address object framed" /> | `postal-address.svg` |
| `process` | <img src="./exports/png/2x/objects/process.png" width="24" alt="process object" /> | <img src="./exports/png/2x/objects-framed/process.png" width="24" alt="process object framed" /> | `process.svg` |
| `query` | <img src="./exports/png/2x/objects/query.png" width="24" alt="query object" /> | <img src="./exports/png/2x/objects-framed/query.png" width="24" alt="query object framed" /> | `query.svg` |
| `reddit-account` | <img src="./exports/png/2x/objects/reddit-account.png" width="24" alt="reddit-account object" /> | <img src="./exports/png/2x/objects-framed/reddit-account.png" width="24" alt="reddit-account object framed" /> | `reddit-account.svg` |
| `reddit-comment` | <img src="./exports/png/2x/objects/reddit-comment.png" width="24" alt="reddit-comment object" /> | <img src="./exports/png/2x/objects-framed/reddit-comment.png" width="24" alt="reddit-comment object framed" /> | `reddit-comment.svg` |
| `reddit-post` | <img src="./exports/png/2x/objects/reddit-post.png" width="24" alt="reddit-post object" /> | <img src="./exports/png/2x/objects-framed/reddit-post.png" width="24" alt="reddit-post object framed" /> | `reddit-post.svg` |
| `reddit-subreddit` | <img src="./exports/png/2x/objects/reddit-subreddit.png" width="24" alt="reddit-subreddit object" /> | <img src="./exports/png/2x/objects-framed/reddit-subreddit.png" width="24" alt="reddit-subreddit object framed" /> | `reddit-subreddit.svg` |
| `regexp` | <img src="./exports/png/2x/objects/regexp.png" width="24" alt="regexp object" /> | <img src="./exports/png/2x/objects-framed/regexp.png" width="24" alt="regexp object framed" /> | `regexp.svg` |
| `registry-key` | <img src="./exports/png/2x/objects/registry-key.png" width="24" alt="registry-key object" /> | <img src="./exports/png/2x/objects-framed/registry-key.png" width="24" alt="registry-key object framed" /> | `registry-key.svg` |
| `registry-key-value` | <img src="./exports/png/2x/objects/registry-key-value.png" width="24" alt="registry-key-value object" /> | <img src="./exports/png/2x/objects-framed/registry-key-value.png" width="24" alt="registry-key-value object framed" /> | `registry-key-value.svg` |
| `report` † | <img src="./exports/png/2x/objects/report.png" width="24" alt="report object" /> | <img src="./exports/png/2x/objects-framed/report.png" width="24" alt="report object framed" /> | `report.svg` |
| `risk-assessment-report` | <img src="./exports/png/2x/objects/risk-assessment-report.png" width="24" alt="risk-assessment-report object" /> | <img src="./exports/png/2x/objects-framed/risk-assessment-report.png" width="24" alt="risk-assessment-report object framed" /> | `risk-assessment-report.svg` |
| `sandbox-report` | <img src="./exports/png/2x/objects/sandbox-report.png" width="24" alt="sandbox-report object" /> | <img src="./exports/png/2x/objects-framed/sandbox-report.png" width="24" alt="sandbox-report object framed" /> | `sandbox-report.svg` |
| `scan-result` | <img src="./exports/png/2x/objects/scan-result.png" width="24" alt="scan-result object" /> | <img src="./exports/png/2x/objects-framed/scan-result.png" width="24" alt="scan-result object framed" /> | `scan-result.svg` |
| `scheduled-event` | <img src="./exports/png/2x/objects/scheduled-event.png" width="24" alt="scheduled-event object" /> | <img src="./exports/png/2x/objects-framed/scheduled-event.png" width="24" alt="scheduled-event object framed" /> | `scheduled-event.svg` |
| `scheduled-task` | <img src="./exports/png/2x/objects/scheduled-task.png" width="24" alt="scheduled-task object" /> | <img src="./exports/png/2x/objects-framed/scheduled-task.png" width="24" alt="scheduled-task object framed" /> | `scheduled-task.svg` |
| `script` | <img src="./exports/png/2x/objects/script.png" width="24" alt="script object" /> | <img src="./exports/png/2x/objects-framed/script.png" width="24" alt="script object framed" /> | `script.svg` |
| `service` | <img src="./exports/png/2x/objects/service.png" width="24" alt="service object" /> | <img src="./exports/png/2x/objects-framed/service.png" width="24" alt="service object framed" /> | `service.svg` |
| `shell-commands` | <img src="./exports/png/2x/objects/shell-commands.png" width="24" alt="shell-commands object" /> | <img src="./exports/png/2x/objects-framed/shell-commands.png" width="24" alt="shell-commands object framed" /> | `shell-commands.svg` |
| `shortened-link` | <img src="./exports/png/2x/objects/shortened-link.png" width="24" alt="shortened-link object" /> | <img src="./exports/png/2x/objects-framed/shortened-link.png" width="24" alt="shortened-link object framed" /> | `shortened-link.svg` |
| `software-package` | <img src="./exports/png/2x/objects/software-package.png" width="24" alt="software-package object" /> | <img src="./exports/png/2x/objects-framed/software-package.png" width="24" alt="software-package object framed" /> | `software-package.svg` |
| `software` | <img src="./exports/png/2x/objects/software.png" width="24" alt="software object" /> | <img src="./exports/png/2x/objects-framed/software.png" width="24" alt="software object framed" /> | `software.svg` |
| `spearphishing-attachment` | <img src="./exports/png/2x/objects/spearphishing-attachment.png" width="24" alt="spearphishing-attachment object" /> | <img src="./exports/png/2x/objects-framed/spearphishing-attachment.png" width="24" alt="spearphishing-attachment object framed" /> | `spearphishing-attachment.svg` |
| `spearphishing-campaign` | <img src="./exports/png/2x/objects/spearphishing-campaign.png" width="24" alt="spearphishing-campaign object" /> | <img src="./exports/png/2x/objects-framed/spearphishing-campaign.png" width="24" alt="spearphishing-campaign object framed" /> | `spearphishing-campaign.svg` |
| `spearphishing-link` | <img src="./exports/png/2x/objects/spearphishing-link.png" width="24" alt="spearphishing-link object" /> | <img src="./exports/png/2x/objects-framed/spearphishing-link.png" width="24" alt="spearphishing-link object framed" /> | `spearphishing-link.svg` |
| `splunk` | <img src="./exports/png/2x/objects/splunk.png" width="24" alt="splunk object" /> | <img src="./exports/png/2x/objects-framed/splunk.png" width="24" alt="splunk object framed" /> | `splunk.svg` |
| `ssh-authorized-keys` | <img src="./exports/png/2x/objects/ssh-authorized-keys.png" width="24" alt="ssh-authorized-keys object" /> | <img src="./exports/png/2x/objects-framed/ssh-authorized-keys.png" width="24" alt="ssh-authorized-keys object framed" /> | `ssh-authorized-keys.svg` |
| `stix2-pattern` | <img src="./exports/png/2x/objects/stix2-pattern.png" width="24" alt="stix2-pattern object" /> | <img src="./exports/png/2x/objects-framed/stix2-pattern.png" width="24" alt="stix2-pattern object framed" /> | `stix2-pattern.svg` |
| `suricata` | <img src="./exports/png/2x/objects/suricata.png" width="24" alt="suricata object" /> | <img src="./exports/png/2x/objects-framed/suricata.png" width="24" alt="suricata object framed" /> | `suricata.svg` |
| `task` | <img src="./exports/png/2x/objects/task.png" width="24" alt="task object" /> | <img src="./exports/png/2x/objects-framed/task.png" width="24" alt="task object framed" /> | `task.svg` |
| `telegram-account` | <img src="./exports/png/2x/objects/telegram-account.png" width="24" alt="telegram-account object" /> | <img src="./exports/png/2x/objects-framed/telegram-account.png" width="24" alt="telegram-account object framed" /> | `telegram-account.svg` |
| `telegram-bot` | <img src="./exports/png/2x/objects/telegram-bot.png" width="24" alt="telegram-bot object" /> | <img src="./exports/png/2x/objects-framed/telegram-bot.png" width="24" alt="telegram-bot object framed" /> | `telegram-bot.svg` |
| `temporal-event` | <img src="./exports/png/2x/objects/temporal-event.png" width="24" alt="temporal-event object" /> | <img src="./exports/png/2x/objects-framed/temporal-event.png" width="24" alt="temporal-event object framed" /> | `temporal-event.svg` |
| `terminal-output` | <img src="./exports/png/2x/objects/terminal-output.png" width="24" alt="terminal-output object" /> | <img src="./exports/png/2x/objects-framed/terminal-output.png" width="24" alt="terminal-output object framed" /> | `terminal-output.svg` |
| `timestamp` | <img src="./exports/png/2x/objects/timestamp.png" width="24" alt="timestamp object" /> | <img src="./exports/png/2x/objects-framed/timestamp.png" width="24" alt="timestamp object framed" /> | `timestamp.svg` |
| `tor-hiddenservice` | <img src="./exports/png/2x/objects/tor-hiddenservice.png" width="24" alt="tor-hiddenservice object" /> | <img src="./exports/png/2x/objects-framed/tor-hiddenservice.png" width="24" alt="tor-hiddenservice object framed" /> | `tor-hiddenservice.svg` |
| `tor-node` | <img src="./exports/png/2x/objects/tor-node.png" width="24" alt="tor-node object" /> | <img src="./exports/png/2x/objects-framed/tor-node.png" width="24" alt="tor-node object framed" /> | `tor-node.svg` |
| `transaction` | <img src="./exports/png/2x/objects/transaction.png" width="24" alt="transaction object" /> | <img src="./exports/png/2x/objects-framed/transaction.png" width="24" alt="transaction object framed" /> | `transaction.svg` |
| `translation` | <img src="./exports/png/2x/objects/translation.png" width="24" alt="translation object" /> | <img src="./exports/png/2x/objects-framed/translation.png" width="24" alt="translation object framed" /> | `translation.svg` |
| `transport-ticket` | <img src="./exports/png/2x/objects/transport-ticket.png" width="24" alt="transport-ticket object" /> | <img src="./exports/png/2x/objects-framed/transport-ticket.png" width="24" alt="transport-ticket object framed" /> | `transport-ticket.svg` |
| `twitter-account` | <img src="./exports/png/2x/objects/twitter-account.png" width="24" alt="twitter-account object" /> | <img src="./exports/png/2x/objects-framed/twitter-account.png" width="24" alt="twitter-account object framed" /> | `twitter-account.svg` |
| `twitter-list` | <img src="./exports/png/2x/objects/twitter-list.png" width="24" alt="twitter-list object" /> | <img src="./exports/png/2x/objects-framed/twitter-list.png" width="24" alt="twitter-list object framed" /> | `twitter-list.svg` |
| `twitter-post` | <img src="./exports/png/2x/objects/twitter-post.png" width="24" alt="twitter-post object" /> | <img src="./exports/png/2x/objects-framed/twitter-post.png" width="24" alt="twitter-post object framed" /> | `twitter-post.svg` |
| `uav` | <img src="./exports/png/2x/objects/uav.png" width="24" alt="uav object" /> | <img src="./exports/png/2x/objects-framed/uav.png" width="24" alt="uav object framed" /> | `uav.svg` |
| `url` † | <img src="./exports/png/2x/objects/url.png" width="24" alt="url object" /> | <img src="./exports/png/2x/objects-framed/url.png" width="24" alt="url object framed" /> | `url.svg` |
| `user-account` | <img src="./exports/png/2x/objects/user-account.png" width="24" alt="user-account object" /> | <img src="./exports/png/2x/objects-framed/user-account.png" width="24" alt="user-account object framed" /> | `user-account.svg` |
| `user-action` | <img src="./exports/png/2x/objects/user-action.png" width="24" alt="user-action object" /> | <img src="./exports/png/2x/objects-framed/user-action.png" width="24" alt="user-action object framed" /> | `user-action.svg` |
| `vehicle` | <img src="./exports/png/2x/objects/vehicle.png" width="24" alt="vehicle object" /> | <img src="./exports/png/2x/objects-framed/vehicle.png" width="24" alt="vehicle object framed" /> | `vehicle.svg` |
| `victim` | <img src="./exports/png/2x/objects/victim.png" width="24" alt="victim object" /> | <img src="./exports/png/2x/objects-framed/victim.png" width="24" alt="victim object framed" /> | `victim.svg` |
| `virustotal-graph` | <img src="./exports/png/2x/objects/virustotal-graph.png" width="24" alt="virustotal-graph object" /> | <img src="./exports/png/2x/objects-framed/virustotal-graph.png" width="24" alt="virustotal-graph object framed" /> | `virustotal-graph.svg` |
| `virustotal-report` | <img src="./exports/png/2x/objects/virustotal-report.png" width="24" alt="virustotal-report object" /> | <img src="./exports/png/2x/objects-framed/virustotal-report.png" width="24" alt="virustotal-report object framed" /> | `virustotal-report.svg` |
| `virustotal-submission` | <img src="./exports/png/2x/objects/virustotal-submission.png" width="24" alt="virustotal-submission object" /> | <img src="./exports/png/2x/objects-framed/virustotal-submission.png" width="24" alt="virustotal-submission object framed" /> | `virustotal-submission.svg` |
| `vulnerability` † | <img src="./exports/png/2x/objects/vulnerability.png" width="24" alt="vulnerability object" /> | <img src="./exports/png/2x/objects-framed/vulnerability.png" width="24" alt="vulnerability object framed" /> | `vulnerability.svg` |
| `weakness` | <img src="./exports/png/2x/objects/weakness.png" width="24" alt="weakness object" /> | <img src="./exports/png/2x/objects-framed/weakness.png" width="24" alt="weakness object framed" /> | `weakness.svg` |
| `whois` | <img src="./exports/png/2x/objects/whois.png" width="24" alt="whois object" /> | <img src="./exports/png/2x/objects-framed/whois.png" width="24" alt="whois object framed" /> | `whois.svg` |
| `wifi-connection` | <img src="./exports/png/2x/objects/wifi-connection.png" width="24" alt="wifi-connection object" /> | <img src="./exports/png/2x/objects-framed/wifi-connection.png" width="24" alt="wifi-connection object framed" /> | `wifi-connection.svg` |
| `windows-service` | <img src="./exports/png/2x/objects/windows-service.png" width="24" alt="windows-service object" /> | <img src="./exports/png/2x/objects-framed/windows-service.png" width="24" alt="windows-service object framed" /> | `windows-service.svg` |
| `x509` | <img src="./exports/png/2x/objects/x509.png" width="24" alt="x509 object" /> | <img src="./exports/png/2x/objects-framed/x509.png" width="24" alt="x509 object framed" /> | `x509.svg` |
| `x-header` | <img src="./exports/png/2x/objects/x-header.png" width="24" alt="x-header object" /> | <img src="./exports/png/2x/objects-framed/x-header.png" width="24" alt="x-header object framed" /> | `x-header.svg` |
| `yara` † | <img src="./exports/png/2x/objects/yara.png" width="24" alt="yara object" /> | <img src="./exports/png/2x/objects-framed/yara.png" width="24" alt="yara object framed" /> | `yara.svg` |
| `youtube-channel` | <img src="./exports/png/2x/objects/youtube-channel.png" width="24" alt="youtube-channel object" /> | <img src="./exports/png/2x/objects-framed/youtube-channel.png" width="24" alt="youtube-channel object framed" /> | `youtube-channel.svg` |
| `youtube-comment` | <img src="./exports/png/2x/objects/youtube-comment.png" width="24" alt="youtube-comment object" /> | <img src="./exports/png/2x/objects-framed/youtube-comment.png" width="24" alt="youtube-comment object framed" /> | `youtube-comment.svg` |
| `youtube-playlist` | <img src="./exports/png/2x/objects/youtube-playlist.png" width="24" alt="youtube-playlist object" /> | <img src="./exports/png/2x/objects-framed/youtube-playlist.png" width="24" alt="youtube-playlist object framed" /> | `youtube-playlist.svg` |
| `youtube-video` | <img src="./exports/png/2x/objects/youtube-video.png" width="24" alt="youtube-video object" /> | <img src="./exports/png/2x/objects-framed/youtube-video.png" width="24" alt="youtube-video object framed" /> | `youtube-video.svg` |

<!-- OBJECT_ICONS_END -->

### Galaxy icons

<!-- GALAXY_ICONS_START -->


Icons for **MISP galaxies**, derived from the [`misp-galaxy`](https://github.com/MISP/misp-galaxy)
submodule. A galaxy definition only references a [Font Awesome](https://fontawesome.com)
glyph by name (its `icon` key), so the glyph is downloaded from that set and
stored as `src/svg/galaxies/<galaxy>.svg` by `src/scripts/fetch-galaxy-icons.sh`.
Several galaxies share the same glyph.

Address a galaxy icon with the `misp-galaxies` variant class:
`<i class="misp-icon misp-icon-<galaxy> misp-galaxies"></i>`.

| Galaxy | Icon | Font Awesome glyph | File |
|--------|------|--------------------|------|
| `360net` | <img src="./exports/png/2x/galaxies/360net.png" width="24" alt="360net galaxy" /> | `fa-solid:user-secret` | `360net.svg` |
| `agent-threat-rules` | <img src="./exports/png/2x/galaxies/agent-threat-rules.png" width="24" alt="agent-threat-rules galaxy" /> | `fa-solid:shield-virus` | `agent-threat-rules.svg` |
| `ammunitions` | <img src="./exports/png/2x/galaxies/ammunitions.png" width="24" alt="ammunitions galaxy" /> | `fa-solid:battery-full` | `ammunitions.svg` |
| `android` | <img src="./exports/png/2x/galaxies/android.png" width="24" alt="android galaxy" /> | `fa-brands:android` | `android.svg` |
| `atrm` | <img src="./exports/png/2x/galaxies/atrm.png" width="24" alt="atrm galaxy" /> | `fa-solid:map` | `atrm.svg` |
| `attck4fraud` | <img src="./exports/png/2x/galaxies/attck4fraud.png" width="24" alt="attck4fraud galaxy" /> | `fa-solid:map` | `attck4fraud.svg` |
| `backdoor` | <img src="./exports/png/2x/galaxies/backdoor.png" width="24" alt="backdoor galaxy" /> | `fa-solid:door-open` | `backdoor.svg` |
| `banker` | <img src="./exports/png/2x/galaxies/banker.png" width="24" alt="banker galaxy" /> | `fa-solid:dollar-sign` | `banker.svg` |
| `bhadra-framework` | <img src="./exports/png/2x/galaxies/bhadra-framework.png" width="24" alt="bhadra-framework galaxy" /> | `fa-solid:mobile` | `bhadra-framework.svg` |
| `bitns` | <img src="./exports/png/2x/galaxies/bitns.png" width="24" alt="bitns galaxy" /> | `fa-solid:user-tie` | `bitns.svg` |
| `botnet` | <img src="./exports/png/2x/galaxies/botnet.png" width="24" alt="botnet galaxy" /> | `fa-solid:sitemap` | `botnet.svg` |
| `branded-vulnerability` | <img src="./exports/png/2x/galaxies/branded-vulnerability.png" width="24" alt="branded-vulnerability galaxy" /> | `fa-solid:bug` | `branded-vulnerability.svg` |
| `cancer` | <img src="./exports/png/2x/galaxies/cancer.png" width="24" alt="cancer galaxy" /> | `fa-brands:android` | `cancer.svg` |
| `cert-eu-govsector` | <img src="./exports/png/2x/galaxies/cert-eu-govsector.png" width="24" alt="cert-eu-govsector galaxy" /> | `fa-solid:globe` | `cert-eu-govsector.svg` |
| `china-defence-universities` | <img src="./exports/png/2x/galaxies/china-defence-universities.png" width="24" alt="china-defence-universities galaxy" /> | `fa-solid:globe` | `china-defence-universities.svg` |
| `cloak` | <img src="./exports/png/2x/galaxies/cloak.png" width="24" alt="cloak galaxy" /> | `fa-solid:user-secret` | `cloak.svg` |
| `cmtmf-attack-pattern` | <img src="./exports/png/2x/galaxies/cmtmf-attack-pattern.png" width="24" alt="cmtmf-attack-pattern galaxy" /> | `fa-solid:mobile` | `cmtmf-attack-pattern.svg` |
| `country` | <img src="./exports/png/2x/galaxies/country.png" width="24" alt="country galaxy" /> | `fa-solid:globe` | `country.svg` |
| `cryptominers` | <img src="./exports/png/2x/galaxies/cryptominers.png" width="24" alt="cryptominers galaxy" /> | `fa-brands:optin-monster` | `cryptominers.svg` |
| `cti-cmm-1-3` | <img src="./exports/png/2x/galaxies/cti-cmm-1-3.png" width="24" alt="cti-cmm-1-3 galaxy" /> | `fa-solid:map` | `cti-cmm-1-3.svg` |
| `cyfun-assurance-requirements-2023` | <img src="./exports/png/2x/galaxies/cyfun-assurance-requirements-2023.png" width="24" alt="cyfun-assurance-requirements-2023 galaxy" /> | `fa-solid:map` | `cyfun-assurance-requirements-2023.svg` |
| `cyfun-control-catalogue-2023` | <img src="./exports/png/2x/galaxies/cyfun-control-catalogue-2023.png" width="24" alt="cyfun-control-catalogue-2023 galaxy" /> | `fa-solid:list` | `cyfun-control-catalogue-2023.svg` |
| `dima-techniques` | <img src="./exports/png/2x/galaxies/dima-techniques.png" width="24" alt="dima-techniques galaxy" /> | `fa-solid:project-diagram` | `dima-techniques.svg` |
| `disarm-actortypes` | <img src="./exports/png/2x/galaxies/disarm-actortypes.png" width="24" alt="disarm-actortypes galaxy" /> | `fa-solid:user-secret` | `disarm-actortypes.svg` |
| `disarm-countermeasures` | <img src="./exports/png/2x/galaxies/disarm-countermeasures.png" width="24" alt="disarm-countermeasures galaxy" /> | `fa-solid:shield-alt` | `disarm-countermeasures.svg` |
| `disarm-detections` | <img src="./exports/png/2x/galaxies/disarm-detections.png" width="24" alt="disarm-detections galaxy" /> | `fa-solid:bell` | `disarm-detections.svg` |
| `disarm-techniques` | <img src="./exports/png/2x/galaxies/disarm-techniques.png" width="24" alt="disarm-techniques galaxy" /> | `fa-solid:map` | `disarm-techniques.svg` |
| `election-guidelines` | <img src="./exports/png/2x/galaxies/election-guidelines.png" width="24" alt="election-guidelines galaxy" /> | `fa-solid:map` | `election-guidelines.svg` |
| `entity` | <img src="./exports/png/2x/galaxies/entity.png" width="24" alt="entity galaxy" /> | `fa-solid:user` | `entity.svg` |
| `exercise-world` | <img src="./exports/png/2x/galaxies/exercise-world.png" width="24" alt="exercise-world galaxy" /> | `fa-solid:globe` | `exercise-world.svg` |
| `exploit-kit` | <img src="./exports/png/2x/galaxies/exploit-kit.png" width="24" alt="exploit-kit galaxy" /> | `fa-brands:internet-explorer` | `exploit-kit.svg` |
| `firearms` | <img src="./exports/png/2x/galaxies/firearms.png" width="24" alt="firearms galaxy" /> | `fa-solid:fire` | `firearms.svg` |
| `first-csirt-services-framework` | <img src="./exports/png/2x/galaxies/first-csirt-services-framework.png" width="24" alt="first-csirt-services-framework galaxy" /> | `fa-solid:user` | `first-csirt-services-framework.svg` |
| `first-dns` | <img src="./exports/png/2x/galaxies/first-dns.png" width="24" alt="first-dns galaxy" /> | `fa-solid:database` | `first-dns.svg` |
| `gsma-motif` | <img src="./exports/png/2x/galaxies/gsma-motif.png" width="24" alt="gsma-motif galaxy" /> | `fa-solid:user-shield` | `gsma-motif.svg` |
| `handicap` | <img src="./exports/png/2x/galaxies/handicap.png" width="24" alt="handicap galaxy" /> | `fa-solid:wheelchair` | `handicap.svg` |
| `human-kill-chain` | <img src="./exports/png/2x/galaxies/human-kill-chain.png" width="24" alt="human-kill-chain galaxy" /> | `fa-solid:people-arrows` | `human-kill-chain.svg` |
| `intelligence-agencies` | <img src="./exports/png/2x/galaxies/intelligence-agencies.png" width="24" alt="intelligence-agencies galaxy" /> | `fa-solid:user-ninja` | `intelligence-agencies.svg` |
| `interpol-dwva` | <img src="./exports/png/2x/galaxies/interpol-dwva.png" width="24" alt="interpol-dwva galaxy" /> | `fa-solid:user-secret` | `interpol-dwva.svg` |
| `it-infrastructure-equipment` | <img src="./exports/png/2x/galaxies/it-infrastructure-equipment.png" width="24" alt="it-infrastructure-equipment galaxy" /> | `fa-solid:server` | `it-infrastructure-equipment.svg` |
| `malpedia` | <img src="./exports/png/2x/galaxies/malpedia.png" width="24" alt="malpedia galaxy" /> | `fa-solid:shield-virus` | `malpedia.svg` |
| `microsoft-activity-group` | <img src="./exports/png/2x/galaxies/microsoft-activity-group.png" width="24" alt="microsoft-activity-group galaxy" /> | `fa-solid:user-secret` | `microsoft-activity-group.svg` |
| `misinfosec-amitt-misinformation-pattern` | <img src="./exports/png/2x/galaxies/misinfosec-amitt-misinformation-pattern.png" width="24" alt="misinfosec-amitt-misinformation-pattern galaxy" /> | `fa-solid:map` | `misinfosec-amitt-misinformation-pattern.svg` |
| `mitre-analytic` | <img src="./exports/png/2x/galaxies/mitre-analytic.png" width="24" alt="mitre-analytic galaxy" /> | `fa-solid:shield-alt` | `mitre-analytic.svg` |
| `mitre-atlas-attack-pattern` | <img src="./exports/png/2x/galaxies/mitre-atlas-attack-pattern.png" width="24" alt="mitre-atlas-attack-pattern galaxy" /> | `fa-solid:map` | `mitre-atlas-attack-pattern.svg` |
| `mitre-atlas-course-of-action` | <img src="./exports/png/2x/galaxies/mitre-atlas-course-of-action.png" width="24" alt="mitre-atlas-course-of-action galaxy" /> | `fa-solid:link` | `mitre-atlas-course-of-action.svg` |
| `mitre-attack-pattern` | <img src="./exports/png/2x/galaxies/mitre-attack-pattern.png" width="24" alt="mitre-attack-pattern galaxy" /> | `fa-solid:map` | `mitre-attack-pattern.svg` |
| `mitre-course-of-action` | <img src="./exports/png/2x/galaxies/mitre-course-of-action.png" width="24" alt="mitre-course-of-action galaxy" /> | `fa-solid:link` | `mitre-course-of-action.svg` |
| `mitre-d3fend` | <img src="./exports/png/2x/galaxies/mitre-d3fend.png" width="24" alt="mitre-d3fend galaxy" /> | `fa-solid:user-shield` | `mitre-d3fend.svg` |
| `mitre-data-component` | <img src="./exports/png/2x/galaxies/mitre-data-component.png" width="24" alt="mitre-data-component galaxy" /> | `fa-solid:sitemap` | `mitre-data-component.svg` |
| `mitre-data-source` | <img src="./exports/png/2x/galaxies/mitre-data-source.png" width="24" alt="mitre-data-source galaxy" /> | `fa-solid:sitemap` | `mitre-data-source.svg` |
| `mitre-detection-strategy` | <img src="./exports/png/2x/galaxies/mitre-detection-strategy.png" width="24" alt="mitre-detection-strategy galaxy" /> | `fa-solid:shield-alt` | `mitre-detection-strategy.svg` |
| `mitre-engage-framework` | <img src="./exports/png/2x/galaxies/mitre-engage-framework.png" width="24" alt="mitre-engage-framework galaxy" /> | `fa-solid:user-secret` | `mitre-engage-framework.svg` |
| `mitre-enterprise-attack-attack-pattern` | <img src="./exports/png/2x/galaxies/mitre-enterprise-attack-attack-pattern.png" width="24" alt="mitre-enterprise-attack-attack-pattern galaxy" /> | `fa-solid:map` | `mitre-enterprise-attack-attack-pattern.svg` |
| `mitre-enterprise-attack-course-of-action` | <img src="./exports/png/2x/galaxies/mitre-enterprise-attack-course-of-action.png" width="24" alt="mitre-enterprise-attack-course-of-action galaxy" /> | `fa-solid:link` | `mitre-enterprise-attack-course-of-action.svg` |
| `mitre-enterprise-attack-intrusion-set` | <img src="./exports/png/2x/galaxies/mitre-enterprise-attack-intrusion-set.png" width="24" alt="mitre-enterprise-attack-intrusion-set galaxy" /> | `fa-solid:user-secret` | `mitre-enterprise-attack-intrusion-set.svg` |
| `mitre-enterprise-attack-malware` | <img src="./exports/png/2x/galaxies/mitre-enterprise-attack-malware.png" width="24" alt="mitre-enterprise-attack-malware galaxy" /> | `fa-brands:optin-monster` | `mitre-enterprise-attack-malware.svg` |
| `mitre-enterprise-attack-tool` | <img src="./exports/png/2x/galaxies/mitre-enterprise-attack-tool.png" width="24" alt="mitre-enterprise-attack-tool galaxy" /> | `fa-solid:gavel` | `mitre-enterprise-attack-tool.svg` |
| `mitre-fraud-framework` | <img src="./exports/png/2x/galaxies/mitre-fraud-framework.png" width="24" alt="mitre-fraud-framework galaxy" /> | `fa-solid:map` | `mitre-fraud-framework.svg` |
| `mitre-ics-assets` | <img src="./exports/png/2x/galaxies/mitre-ics-assets.png" width="24" alt="mitre-ics-assets galaxy" /> | `fa-solid:certificate` | `mitre-ics-assets.svg` |
| `mitre-ics-groups` | <img src="./exports/png/2x/galaxies/mitre-ics-groups.png" width="24" alt="mitre-ics-groups galaxy" /> | `fa-solid:skull-crossbones` | `mitre-ics-groups.svg` |
| `mitre-ics-levels` | <img src="./exports/png/2x/galaxies/mitre-ics-levels.png" width="24" alt="mitre-ics-levels galaxy" /> | `fa-solid:layer-group` | `mitre-ics-levels.svg` |
| `mitre-ics-software` | <img src="./exports/png/2x/galaxies/mitre-ics-software.png" width="24" alt="mitre-ics-software galaxy" /> | `fa-solid:file-code` | `mitre-ics-software.svg` |
| `mitre-ics-tactics` | <img src="./exports/png/2x/galaxies/mitre-ics-tactics.png" width="24" alt="mitre-ics-tactics galaxy" /> | `fa-solid:chess-pawn` | `mitre-ics-tactics.svg` |
| `mitre-ics-techniques` | <img src="./exports/png/2x/galaxies/mitre-ics-techniques.png" width="24" alt="mitre-ics-techniques galaxy" /> | `fa-solid:user-ninja` | `mitre-ics-techniques.svg` |
| `mitre-intrusion-set` | <img src="./exports/png/2x/galaxies/mitre-intrusion-set.png" width="24" alt="mitre-intrusion-set galaxy" /> | `fa-solid:user-secret` | `mitre-intrusion-set.svg` |
| `mitre-malware` | <img src="./exports/png/2x/galaxies/mitre-malware.png" width="24" alt="mitre-malware galaxy" /> | `fa-brands:optin-monster` | `mitre-malware.svg` |
| `mitre-mobile-attack-attack-pattern` | <img src="./exports/png/2x/galaxies/mitre-mobile-attack-attack-pattern.png" width="24" alt="mitre-mobile-attack-attack-pattern galaxy" /> | `fa-solid:map` | `mitre-mobile-attack-attack-pattern.svg` |
| `mitre-mobile-attack-course-of-action` | <img src="./exports/png/2x/galaxies/mitre-mobile-attack-course-of-action.png" width="24" alt="mitre-mobile-attack-course-of-action galaxy" /> | `fa-solid:link` | `mitre-mobile-attack-course-of-action.svg` |
| `mitre-mobile-attack-intrusion-set` | <img src="./exports/png/2x/galaxies/mitre-mobile-attack-intrusion-set.png" width="24" alt="mitre-mobile-attack-intrusion-set galaxy" /> | `fa-solid:user-secret` | `mitre-mobile-attack-intrusion-set.svg` |
| `mitre-mobile-attack-malware` | <img src="./exports/png/2x/galaxies/mitre-mobile-attack-malware.png" width="24" alt="mitre-mobile-attack-malware galaxy" /> | `fa-brands:optin-monster` | `mitre-mobile-attack-malware.svg` |
| `mitre-mobile-attack-tool` | <img src="./exports/png/2x/galaxies/mitre-mobile-attack-tool.png" width="24" alt="mitre-mobile-attack-tool galaxy" /> | `fa-solid:gavel` | `mitre-mobile-attack-tool.svg` |
| `mitre-pre-attack-attack-pattern` | <img src="./exports/png/2x/galaxies/mitre-pre-attack-attack-pattern.png" width="24" alt="mitre-pre-attack-attack-pattern galaxy" /> | `fa-solid:map` | `mitre-pre-attack-attack-pattern.svg` |
| `mitre-pre-attack-intrusion-set` | <img src="./exports/png/2x/galaxies/mitre-pre-attack-intrusion-set.png" width="24" alt="mitre-pre-attack-intrusion-set galaxy" /> | `fa-solid:user-secret` | `mitre-pre-attack-intrusion-set.svg` |
| `mitre-tool` | <img src="./exports/png/2x/galaxies/mitre-tool.png" width="24" alt="mitre-tool galaxy" /> | `fa-solid:gavel` | `mitre-tool.svg` |
| `nace` | <img src="./exports/png/2x/galaxies/nace.png" width="24" alt="nace galaxy" /> | `fa-solid:industry` | `nace.svg` |
| `naics` | <img src="./exports/png/2x/galaxies/naics.png" width="24" alt="naics galaxy" /> | `fa-solid:industry` | `naics.svg` |
| `nato` | <img src="./exports/png/2x/galaxies/nato.png" width="24" alt="nato galaxy" /> | `fa-solid:industry` | `nato.svg` |
| `nice-framework-competency-areas` | <img src="./exports/png/2x/galaxies/nice-framework-competency-areas.png" width="24" alt="nice-framework-competency-areas galaxy" /> | `fa-solid:user` | `nice-framework-competency-areas.svg` |
| `nice-framework-knowledges` | <img src="./exports/png/2x/galaxies/nice-framework-knowledges.png" width="24" alt="nice-framework-knowledges galaxy" /> | `fa-solid:user` | `nice-framework-knowledges.svg` |
| `nice-framework-opm-codes` | <img src="./exports/png/2x/galaxies/nice-framework-opm-codes.png" width="24" alt="nice-framework-opm-codes galaxy" /> | `fa-solid:user` | `nice-framework-opm-codes.svg` |
| `nice-framework-skills` | <img src="./exports/png/2x/galaxies/nice-framework-skills.png" width="24" alt="nice-framework-skills galaxy" /> | `fa-solid:user` | `nice-framework-skills.svg` |
| `nice-framework-tasks` | <img src="./exports/png/2x/galaxies/nice-framework-tasks.png" width="24" alt="nice-framework-tasks galaxy" /> | `fa-solid:user` | `nice-framework-tasks.svg` |
| `nice-framework-work-roles` | <img src="./exports/png/2x/galaxies/nice-framework-work-roles.png" width="24" alt="nice-framework-work-roles galaxy" /> | `fa-solid:user` | `nice-framework-work-roles.svg` |
| `o365-exchange-techniques` | <img src="./exports/png/2x/galaxies/o365-exchange-techniques.png" width="24" alt="o365-exchange-techniques galaxy" /> | `fa-solid:map` | `o365-exchange-techniques.svg` |
| `online-service` | <img src="./exports/png/2x/galaxies/online-service.png" width="24" alt="online-service galaxy" /> | `fa-solid:cloud` | `online-service.svg` |
| `operating-system` | <img src="./exports/png/2x/galaxies/operating-system.png" width="24" alt="operating-system galaxy" /> | `fa-solid:laptop` | `operating-system.svg` |
| `plot4ai` | <img src="./exports/png/2x/galaxies/plot4ai.png" width="24" alt="plot4ai galaxy" /> | `fa-solid:brain` | `plot4ai.svg` |
| `preventive-measure` | <img src="./exports/png/2x/galaxies/preventive-measure.png" width="24" alt="preventive-measure galaxy" /> | `fa-solid:shield-alt` | `preventive-measure.svg` |
| `producer` | <img src="./exports/png/2x/galaxies/producer.png" width="24" alt="producer galaxy" /> | `fa-solid:book` | `producer.svg` |
| `ransomware` | <img src="./exports/png/2x/galaxies/ransomware.png" width="24" alt="ransomware galaxy" /> | `fa-brands:btc` | `ransomware.svg` |
| `rat` | <img src="./exports/png/2x/galaxies/rat.png" width="24" alt="rat galaxy" /> | `fa-solid:eye` | `rat.svg` |
| `region` | <img src="./exports/png/2x/galaxies/region.png" width="24" alt="region galaxy" /> | `fa-solid:globe-europe` | `region.svg` |
| `rmm-tool` | <img src="./exports/png/2x/galaxies/rmm-tool.png" width="24" alt="rmm-tool galaxy" /> | `fa-solid:user-secret` | `rmm-tool.svg` |
| `rsit` | <img src="./exports/png/2x/galaxies/rsit.png" width="24" alt="rsit galaxy" /> | `fa-solid:map` | `rsit.svg` |
| `scor-about` | <img src="./exports/png/2x/galaxies/scor-about.png" width="24" alt="scor-about galaxy" /> | `fa-solid:info` | `scor-about.svg` |
| `scor-attack-paths` | <img src="./exports/png/2x/galaxies/scor-attack-paths.png" width="24" alt="scor-attack-paths galaxy" /> | `fa-solid:project-diagram` | `scor-attack-paths.svg` |
| `scor-detection-signatures` | <img src="./exports/png/2x/galaxies/scor-detection-signatures.png" width="24" alt="scor-detection-signatures galaxy" /> | `fa-solid:search` | `scor-detection-signatures.svg` |
| `scor-exposure-domain` | <img src="./exports/png/2x/galaxies/scor-exposure-domain.png" width="24" alt="scor-exposure-domain galaxy" /> | `fa-solid:shield-alt` | `scor-exposure-domain.svg` |
| `scor-incidents` | <img src="./exports/png/2x/galaxies/scor-incidents.png" width="24" alt="scor-incidents galaxy" /> | `fa-solid:exclamation-triangle` | `scor-incidents.svg` |
| `scor-resilience-measures` | <img src="./exports/png/2x/galaxies/scor-resilience-measures.png" width="24" alt="scor-resilience-measures galaxy" /> | `fa-solid:shield-virus` | `scor-resilience-measures.svg` |
| `scor-tens` | <img src="./exports/png/2x/galaxies/scor-tens.png" width="24" alt="scor-tens galaxy" /> | `fa-solid:atom` | `scor-tens.svg` |
| `sector` | <img src="./exports/png/2x/galaxies/sector.png" width="24" alt="sector galaxy" /> | `fa-solid:industry` | `sector.svg` |
| `sigma-rules` | <img src="./exports/png/2x/galaxies/sigma-rules.png" width="24" alt="sigma-rules galaxy" /> | `fa-solid:link` | `sigma-rules.svg` |
| `social-dark-patterns` | <img src="./exports/png/2x/galaxies/social-dark-patterns.png" width="24" alt="social-dark-patterns galaxy" /> | `fa-solid:link` | `social-dark-patterns.svg` |
| `sod-matrix` | <img src="./exports/png/2x/galaxies/sod-matrix.png" width="24" alt="sod-matrix galaxy" /> | `fa-solid:map` | `sod-matrix.svg` |
| `software-vendor` | <img src="./exports/png/2x/galaxies/software-vendor.png" width="24" alt="software-vendor galaxy" /> | `fa-solid:building` | `software-vendor.svg` |
| `sparta-mitigations` | <img src="./exports/png/2x/galaxies/sparta-mitigations.png" width="24" alt="sparta-mitigations galaxy" /> | `fa-solid:shield-alt` | `sparta-mitigations.svg` |
| `sparta-tactics` | <img src="./exports/png/2x/galaxies/sparta-tactics.png" width="24" alt="sparta-tactics galaxy" /> | `fa-solid:map` | `sparta-tactics.svg` |
| `sparta-techniques` | <img src="./exports/png/2x/galaxies/sparta-techniques.png" width="24" alt="sparta-techniques galaxy" /> | `fa-solid:map` | `sparta-techniques.svg` |
| `stalkerware` | <img src="./exports/png/2x/galaxies/stalkerware.png" width="24" alt="stalkerware galaxy" /> | `fa-solid:eye` | `stalkerware.svg` |
| `stealer` | <img src="./exports/png/2x/galaxies/stealer.png" width="24" alt="stealer galaxy" /> | `fa-solid:key` | `stealer.svg` |
| `surveillance-vendor` | <img src="./exports/png/2x/galaxies/surveillance-vendor.png" width="24" alt="surveillance-vendor galaxy" /> | `fa-solid:user-shield` | `surveillance-vendor.svg` |
| `target-information` | <img src="./exports/png/2x/galaxies/target-information.png" width="24" alt="target-information galaxy" /> | `fa-solid:bullseye` | `target-information.svg` |
| `taxonomy-of-fraud` | <img src="./exports/png/2x/galaxies/taxonomy-of-fraud.png" width="24" alt="taxonomy-of-fraud galaxy" /> | `fa-solid:money-bill-wave` | `taxonomy-of-fraud.svg` |
| `tds` | <img src="./exports/png/2x/galaxies/tds.png" width="24" alt="tds galaxy" /> | `fa-solid:cart-arrow-down` | `tds.svg` |
| `tea-matrix` | <img src="./exports/png/2x/galaxies/tea-matrix.png" width="24" alt="tea-matrix galaxy" /> | `fa-solid:map` | `tea-matrix.svg` |
| `terrorist-groups` | <img src="./exports/png/2x/galaxies/terrorist-groups.png" width="24" alt="terrorist-groups galaxy" /> | `fa-solid:user-secret` | `terrorist-groups.svg` |
| `threat-actor` | <img src="./exports/png/2x/galaxies/threat-actor.png" width="24" alt="threat-actor galaxy" /> | `fa-solid:user-secret` | `threat-actor.svg` |
| `tidal-campaigns` | <img src="./exports/png/2x/galaxies/tidal-campaigns.png" width="24" alt="tidal-campaigns galaxy" /> | `fa-solid:bullhorn` | `tidal-campaigns.svg` |
| `tidal-groups` | <img src="./exports/png/2x/galaxies/tidal-groups.png" width="24" alt="tidal-groups galaxy" /> | `fa-solid:user-secret` | `tidal-groups.svg` |
| `tidal-references` | <img src="./exports/png/2x/galaxies/tidal-references.png" width="24" alt="tidal-references galaxy" /> | `fa-solid:list` | `tidal-references.svg` |
| `tidal-software` | <img src="./exports/png/2x/galaxies/tidal-software.png" width="24" alt="tidal-software galaxy" /> | `fa-solid:file-code` | `tidal-software.svg` |
| `tidal-tactic` | <img src="./exports/png/2x/galaxies/tidal-tactic.png" width="24" alt="tidal-tactic galaxy" /> | `fa-solid:map` | `tidal-tactic.svg` |
| `tidal-technique` | <img src="./exports/png/2x/galaxies/tidal-technique.png" width="24" alt="tidal-technique galaxy" /> | `fa-solid:user-ninja` | `tidal-technique.svg` |
| `tmss` | <img src="./exports/png/2x/galaxies/tmss.png" width="24" alt="tmss galaxy" /> | `fa-solid:map` | `tmss.svg` |
| `tool` | <img src="./exports/png/2x/galaxies/tool.png" width="24" alt="tool galaxy" /> | `fa-brands:optin-monster` | `tool.svg` |
| `uavs` | <img src="./exports/png/2x/galaxies/uavs.png" width="24" alt="uavs galaxy" /> | `fa-solid:plane` | `uavs.svg` |
| `ukhsa-culture-collections` | <img src="./exports/png/2x/galaxies/ukhsa-culture-collections.png" width="24" alt="ukhsa-culture-collections galaxy" /> | `fa-solid:virus` | `ukhsa-culture-collections.svg` |
| `veris-framework` | <img src="./exports/png/2x/galaxies/veris-framework.png" width="24" alt="veris-framework galaxy" /> | `fa-solid:sitemap` | `veris-framework.svg` |
| `wiper` | <img src="./exports/png/2x/galaxies/wiper.png" width="24" alt="wiper galaxy" /> | `fa-solid:trash` | `wiper.svg` |

<!-- GALAXY_ICONS_END -->


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

<!-- An attribute-type icon (single style) -->
<i class="misp-icon misp-icon-vulnerability misp-attributes"></i>

<!-- The object icon of the same name — namespaced by the misp-objects class -->
<i class="misp-icon misp-icon-vulnerability misp-objects"></i>
```

Each icon is a compound selector `.misp-icon-<name>.misp-<variant>`, so the
same name in different variants (e.g. the `vulnerability` attribute icon and the
`vulnerability` object icon) never collides — pick one with its variant class.


## Object icons (misp-objects submodule)

Object icons are **not** authored here: they are imported from the
[`misp-objects`](https://github.com/MISP/misp-objects) repository, vendored as a
git submodule at `vendor/misp-objects` (tracking the `main` branch).

```bash
git submodule update --init vendor/misp-objects   # first checkout
make fetch-objects                                 # import into src/svg/objects
make all                                            # rebuild PNG/WebP/CSS/catalog
```

`fetch-objects` copies every conforming `objects/<name>/icon/icon.svg` (plus the
`file/icon/file-*.svg` type variants) into `src/svg/objects/`, strips the root
`<svg>` dimensions, and records provenance under `objects/<name>` keys in
`metadata/icons.json`. Full-colour / non-`currentColor` upstream logos are
skipped automatically and listed in the command output.


## Galaxy icons (misp-galaxy submodule)

Galaxy icons are also **not** authored here. Each galaxy in the
[`misp-galaxy`](https://github.com/MISP/misp-galaxy) repository (vendored as a
git submodule at `vendor/misp-galaxy`, tracking `main`) only references a
[Font Awesome](https://fontawesome.com) glyph *by name* in its `icon` key — the
glyph itself is not shipped as a file. The import therefore downloads the glyph
from the Font Awesome Free set (via the [Iconify](https://iconify.design) API).

```bash
git submodule update --init vendor/misp-galaxy   # first checkout
make fetch-galaxies                               # download into src/svg/galaxies
make all                                           # rebuild PNG/WebP/CSS/catalog
```

`fetch-galaxies` reads each `galaxies/<galaxy>.json`, resolves its `icon` name
against the Font Awesome collections (`fa-solid`, then `fa-brands`, falling back
to FA6), downloads the glyph as `src/svg/galaxies/<galaxy>.svg` (root `<svg>`
dimensions stripped), and records provenance under `galaxies/<galaxy>` keys in
`metadata/icons.json` — crediting Font Awesome Free (CC-BY-4.0). Glyphs shared by
several galaxies are downloaded once and reused.


## Contribution Rules

- `src/svg` is the source of truth
- Never edit generated PNGs manually
- SVG filenames must use kebab-case
<!-- - Icons should use a 24x24 viewBox -->
- Icons should use the fill=`currentColor`
- Icons provenance is tracked in `metadata/icons.json`
- Object icons (`src/svg/objects`) are imported via `make fetch-objects`; edit them upstream in `misp-objects`, not here


## Attribution

<!-- ATTRIBUTION_START -->

This project includes icons from third-party sources that require attribution.

- **as** → tabler:affiliate (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **attachment** → tabler:paperclip (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **btc** → tabler:currency-bitcoin (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **campaign-name** → tabler:flag (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **cc-number** → tabler:credit-card (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **comment** → tabler:message (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **cookie** → tabler:cookie (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **cpe** → tabler:package (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **datetime** → tabler:clock (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **domain** → tabler:world (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **domain-ip** → tabler:route (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **email** → tabler:mail (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **email-dst** → tabler:mail-down (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **email-src** → tabler:mail-forward (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **filename** → tabler:file (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **filename-md5** → tabler:file-digit (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **filename-sha256** → tabler:file-digit (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **full-name** → tabler:user (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **galaxies/360net** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/agent-threat-rules** → fa-solid:shield-virus (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/ammunitions** → fa-solid:battery-full (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/android** → fa-brands:android (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/atrm** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/attck4fraud** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/backdoor** → fa-solid:door-open (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/banker** → fa-solid:dollar-sign (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/bhadra-framework** → fa-solid:mobile (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/bitns** → fa-solid:user-tie (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/botnet** → fa-solid:sitemap (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/branded-vulnerability** → fa-solid:bug (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/cancer** → fa-brands:android (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/cert-eu-govsector** → fa-solid:globe (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/china-defence-universities** → fa-solid:globe (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/cloak** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/cmtmf-attack-pattern** → fa-solid:mobile (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/country** → fa-solid:globe (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/cryptominers** → fa-brands:optin-monster (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/cti-cmm-1-3** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/cyfun-assurance-requirements-2023** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/cyfun-control-catalogue-2023** → fa-solid:list (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/dima-techniques** → fa-solid:project-diagram (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/disarm-actortypes** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/disarm-countermeasures** → fa-solid:shield-alt (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/disarm-detections** → fa-solid:bell (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/disarm-techniques** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/election-guidelines** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/entity** → fa-solid:user (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/exercise-world** → fa-solid:globe (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/exploit-kit** → fa-brands:internet-explorer (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/firearms** → fa-solid:fire (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/first-csirt-services-framework** → fa-solid:user (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/first-dns** → fa-solid:database (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/gsma-motif** → fa-solid:user-shield (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/handicap** → fa-solid:wheelchair (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/human-kill-chain** → fa-solid:people-arrows (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/intelligence-agencies** → fa-solid:user-ninja (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/interpol-dwva** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/it-infrastructure-equipment** → fa-solid:server (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/malpedia** → fa-solid:shield-virus (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/microsoft-activity-group** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/misinfosec-amitt-misinformation-pattern** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-analytic** → fa-solid:shield-alt (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-atlas-attack-pattern** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-atlas-course-of-action** → fa-solid:link (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-attack-pattern** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-course-of-action** → fa-solid:link (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-d3fend** → fa-solid:user-shield (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-data-component** → fa-solid:sitemap (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-data-source** → fa-solid:sitemap (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-detection-strategy** → fa-solid:shield-alt (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-engage-framework** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-enterprise-attack-attack-pattern** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-enterprise-attack-course-of-action** → fa-solid:link (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-enterprise-attack-intrusion-set** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-enterprise-attack-malware** → fa-brands:optin-monster (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-enterprise-attack-tool** → fa-solid:gavel (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-fraud-framework** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-ics-assets** → fa-solid:certificate (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-ics-groups** → fa-solid:skull-crossbones (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-ics-levels** → fa-solid:layer-group (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-ics-software** → fa-solid:file-code (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-ics-tactics** → fa-solid:chess-pawn (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-ics-techniques** → fa-solid:user-ninja (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-intrusion-set** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-malware** → fa-brands:optin-monster (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-mobile-attack-attack-pattern** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-mobile-attack-course-of-action** → fa-solid:link (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-mobile-attack-intrusion-set** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-mobile-attack-malware** → fa-brands:optin-monster (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-mobile-attack-tool** → fa-solid:gavel (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-pre-attack-attack-pattern** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-pre-attack-intrusion-set** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/mitre-tool** → fa-solid:gavel (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/nace** → fa-solid:industry (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/naics** → fa-solid:industry (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/nato** → fa-solid:industry (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/nice-framework-competency-areas** → fa-solid:user (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/nice-framework-knowledges** → fa-solid:user (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/nice-framework-opm-codes** → fa-solid:user (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/nice-framework-skills** → fa-solid:user (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/nice-framework-tasks** → fa-solid:user (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/nice-framework-work-roles** → fa-solid:user (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/o365-exchange-techniques** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/online-service** → fa-solid:cloud (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/operating-system** → fa-solid:laptop (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/plot4ai** → fa-solid:brain (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/preventive-measure** → fa-solid:shield-alt (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/producer** → fa-solid:book (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/ransomware** → fa-brands:btc (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/rat** → fa-solid:eye (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/region** → fa-solid:globe-europe (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/rmm-tool** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/rsit** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/scor-about** → fa-solid:info (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/scor-attack-paths** → fa-solid:project-diagram (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/scor-detection-signatures** → fa-solid:search (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/scor-exposure-domain** → fa-solid:shield-alt (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/scor-incidents** → fa-solid:exclamation-triangle (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/scor-resilience-measures** → fa-solid:shield-virus (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/scor-tens** → fa-solid:atom (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/sector** → fa-solid:industry (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/sigma-rules** → fa-solid:link (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/social-dark-patterns** → fa-solid:link (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/sod-matrix** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/software-vendor** → fa-solid:building (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/sparta-mitigations** → fa-solid:shield-alt (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/sparta-tactics** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/sparta-techniques** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/stalkerware** → fa-solid:eye (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/stealer** → fa-solid:key (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/surveillance-vendor** → fa-solid:user-shield (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/target-information** → fa-solid:bullseye (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/taxonomy-of-fraud** → fa-solid:money-bill-wave (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/tds** → fa-solid:cart-arrow-down (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/tea-matrix** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/terrorist-groups** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/threat-actor** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/tidal-campaigns** → fa-solid:bullhorn (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/tidal-groups** → fa-solid:user-secret (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/tidal-references** → fa-solid:list (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/tidal-software** → fa-solid:file-code (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/tidal-tactic** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/tidal-technique** → fa-solid:user-ninja (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/tmss** → fa-solid:map (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/tool** → fa-brands:optin-monster (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/uavs** → fa-solid:plane (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/ukhsa-culture-collections** → fa-solid:virus (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/veris-framework** → fa-solid:sitemap (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **galaxies/wiper** → fa-solid:trash (source: Font Awesome Free, license: CC-BY-4.0, url: https://fontawesome.com)
- **github-username** → tabler:brand-github (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **hostname** → tabler:server (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **iban** → tabler:building-bank (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **ip-dst** → tabler:world-download (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **ip-dst-port** → tabler:plug-connected (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **ip-src** → tabler:world-upload (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **link** → tabler:external-link (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **mac-address** → tabler:id (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **malware-sample** → tabler:bug (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **md5** → tabler:hash (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **mutex** → tabler:lock (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **pattern-in-file** → tabler:file-search (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **pgp-public-key** → tabler:shield-lock (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **phone-number** → tabler:phone (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **port** → tabler:plug (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **regkey** → tabler:key (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **sha1** → tabler:hash (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **sha256** → tabler:hash (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **sigma** → tabler:sum (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **snort** → tabler:radar (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **ssh-fingerprint** → tabler:fingerprint (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **text** → tabler:file-text (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **threat-actor** → tabler:spy (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **twitter-id** → tabler:brand-x (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **uri** → tabler:link (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **url** → tabler:link (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **user-agent** → tabler:browser (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **vulnerability** → tabler:shield-exclamation (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **windows-scheduled-task** → tabler:calendar-time (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **windows-service-name** → tabler:settings (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **x509-fingerprint-sha1** → tabler:certificate (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)
- **yara** → tabler:file-code (source: Tabler Icons, license: MIT, url: https://tabler.io/icons)

<!-- ATTRIBUTION_END -->
