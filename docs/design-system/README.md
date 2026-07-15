---
title: "Mappm Design System"
description: "Einstieg, Struktur und Source-of-Truth-Hierarchie des Mappm Design Systems"
tags: [design-system, documentation, governance]
lastUpdated: "2026-07-15"
status: "active"
owner: "ui-concept"
---

# Mappm Design System

## Purpose

This area contains the current Mappm design-system source of truth for brand
direction, corporate design, design decisions, static HTML review work, and
design-system concepts.

The design system must support a private household document-management
workbench:

- klar erkennbare Local-/Cloud-Vault-Autoritaet, Vertrauen und Privatsphaere.
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

`concepts/` contains design-system source-of-truth documents. `MP-DS-01
Foundations And Tokens` owns the draft palette until a later production Flutter
token artifact exists.

## Frontend Concept Handoff

The build-oriented frontend concepts derived from the mock live in
`docs/concepts/`:

| Concept | Scope |
|---|---|
| `CONCEPT_F19_DESIGN_SYSTEM_GOVERNANCE.md` | Mock-to-concept SSOT, page ownership, agent gates. |
| `CONCEPT_F20_CORPORATE_DESIGN.md` | Corporate design, logo, colors, voice, standards. |
| `CONCEPT_F21_FOUNDATIONS_AND_TOKENS.md` | Palette, icons, typography, spacing, radius, token promotion. |
| `CONCEPT_F22_SHELL_AND_NAVIGATION.md` | Product shell, primary navigation, navigation controls. |
| `CONCEPT_F23_COMPONENT_SYSTEM.md` | Buttons, status, tags, feedback, callouts, data display. |
| `CONCEPT_F24_FORM_FAMILY.md` | Draft form-family expansion plan. Not implementation-ready yet. |
| `CONCEPT_F25_ACCESSIBILITY_PATTERNS_AND_VISUAL_QA.md` | Product patterns, accessibility, privacy and visual QA gates. |

Agents should use the `MP-DS-*` documents for design-system organization and
the `CONCEPT_F19`-`CONCEPT_F25` documents for implementation-facing frontend
rules.

## Current Brand Direction

The current Mappm identity direction is documented in:

```text
docs/design-system/Brand/BRAND_DIRECTION.md
docs/design-system/concepts/MP-DS-01_FOUNDATIONS_AND_TOKENS.md
docs/design-system/Decisions/ADR-0002-brand-identity-and-palette.md
```

The current source logo is:

```text
assets/images/logo.png
```

The current core palette derived from the existing icon is:

| Color | Hex | Role |
|---|---:|---|
| Mappm Coral | `#EF6D5D` | Brand accent, primary creation/capture affordance. |
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
