---
title: "ADR-0002 - Brand Identity And Palette"
description: "Entscheidung zur Mappm Brand-Identitaet, Palettenrichtung und Produktfarbregel"
tags: [design-system, adr, brand, color]
lastUpdated: "2026-07-15"
status: "accepted-draft"
owner: "ui-concept/product"
---

# ADR-0002 - Brand Identity And Palette

## Status

Accepted draft.

## Decision

Mappm uses the existing app icon as the current brand source:

```text
assets/images/logo.png
```

The icon is treated as an app-icon / symbol candidate, not as a complete logo
system. It defines a warm household-document direction with coral, rose,
apricot, paper, and ink roles.

Mappm adds a deep petrol family as the complementary enterprise accent. Petrol
is not derived from the icon; it balances the warm household brand with trust,
structure, sync, and calm operational states.

## Palette Direction

| Role | Hex | Source |
|---|---:|---|
| Mappm Coral | `#EF6D5D` | Dominant coral from current icon. |
| Archive Rose | `#CF3766` | Rose depth from current icon. |
| Folder Apricot | `#FCBC9D` | Folder/document highlight from current icon. |
| Paper Warmth | `#FFF7F1` | Derived brand-adjacent surface. |
| Deep Petrol | `#075D63` | Complementary enterprise accent for structure and trust. |
| Petrol | `#0E7478` | Info, sync, active structure, neutral current workflow. |
| Document Ink | `#28303A` | Professional neutral for dense UI. |

## Product Rule

The product UI must not become a coral/pink monoculture.

Coral and rose are brand accents. Dense document-management surfaces use neutral
paper, white, ink, slate, petrol structure accents, and careful status colors.

## Consequences

- Current Flutter `#FF6B6B` coral is treated as legacy-near and may be replaced
  by the more icon-derived `#EF6D5D`.
- Generic blue status colors are replaced by petrol where the meaning is info,
  sync, active structure, or calm enterprise state.
- The design system needs explicit neutral, status, and privacy roles before UI
  implementation.
- A future wordmark/logo-system decision remains open.
