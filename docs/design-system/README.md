# Ordna Design System

## Purpose

This area contains the current Ordna design-system source of truth for brand
direction, corporate design, design decisions, static HTML review work, and
design-system concepts.

The design system must support a private household document-management
workbench:

- local-first trust and privacy.
- fast document capture, review, search, and correction.
- calm repeated use on desktop and mobile.
- multi-person household context without visual clutter.
- sensitive documents without alarmist UI.
- clear status, reminders, export, backup, sync, and conflict states.

## Structure

```text
docs/design-system/
  Brand/
    BRAND_DIRECTION.md
  Decisions/
  Mock/
    index.html
    README.md
    assets/
    pages/
  concepts/
```

`Brand/` contains stakeholder-readable brand direction. It explains the visual
identity in product and business language, but it is not a production token or
asset specification by itself.

`Decisions/` contains short design decision records once a visual or interaction
choice becomes stable enough to guide implementation.

`Mock/` contains the static HTML design-system mock. It is the current design
review surface for corporate design, foundations, and early shell direction.

`concepts/` contains design-system source-of-truth documents. `OD-DS-01
Foundations And Tokens` owns the draft palette until a later production Flutter
token artifact exists.

## Current Brand Direction

The current Ordna identity direction is documented in:

```text
docs/design-system/Brand/BRAND_DIRECTION.md
docs/design-system/concepts/OD-DS-01_FOUNDATIONS_AND_TOKENS.md
docs/design-system/Decisions/ADR-0002-brand-identity-and-palette.md
```

The current source logo is:

```text
assets/images/logo.png
```

The current core palette derived from the existing icon is:

| Color | Hex | Role |
|---|---:|---|
| Ordna Coral | `#EF6D5D` | Brand accent, primary creation/capture affordance. |
| Archive Rose | `#CF3766` | Logo depth, selected state accent, rare emphasis. |
| Folder Apricot | `#FCBC9D` | Warm asset highlight and gentle illustration support. |
| Paper Warmth | `#FFF7F1` | Brand-adjacent paper surface. |
| Document Ink | `#28303A` | Primary text and professional structure. |

## Current Workflow

1. Iterate in `docs/design-system/Mock/`.
2. Promote stable choices into `docs/design-system/Decisions/` and the relevant
   `docs/design-system/concepts/` document.
3. Carry approved patterns into Flutter UI planning only after component
   states, accessibility expectations, and production boundaries are explicit.

Do not put real household, medical, school, insurance, identity, financial, or
private document data into design-system mock artifacts.
