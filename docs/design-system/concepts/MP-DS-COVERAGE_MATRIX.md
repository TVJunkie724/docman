---
title: "MP-DS Coverage Matrix"
description: "Traceability zwischen Playbook-Design-System-Familien, Mappm-Konzepten und Mock-Evidenz"
tags: [design-system, coverage, traceability, governance]
status: "active-baseline"
lastUpdated: "2026-07-24"
owner: "ui-concept"
---

# MP-DS Coverage Matrix

## Zweck

Diese Matrix gleicht das Mappm Design System mit der allgemeinen Playbook-
Familie ab. Mappm behaelt den Prefix `MP-DS-*`; Coverage bleibt auf
DS-00..DS-07 sowie DS-04-/DS-05-Unterfamilien nachvollziehbar.

## Coverage

| Playbook-Familie | Mappm-Quelle | Mock-Evidenz | Status | Erforderlich vor |
|---|---|---|---|---|
| DS-00 Umbrella | `MP-DS-00_DESIGN_SYSTEM_UMBRELLA.md` | `index.html` | draft | jedem UI-Handoff |
| DS-01 Foundations/Tokens | `MP-DS-01_FOUNDATIONS_AND_TOKENS.md` | foundations, palette, fonts, spacing, icons | draft | erstem UI-Slice |
| DS-02 Layout/Shell | `MP-DS-02_LAYOUT_AND_SHELL.md` | product shell, navigation | draft | Shell-/Navigation-Implementierung |
| DS-03 Corporate Design | `MP-DS-03_CORPORATE_DESIGN.md` | corporate pages | draft | Branding-/Release-Arbeit |
| DS-04 Component System | `MP-DS-04_COMPONENT_SYSTEM.md` plus F23/F26/F34 | components, buttons, forms, feedback, status, data display | active-draft | Komponentenimplementierung |
| DS-04-01..18 Core Component/Form Families | F24/F27/F28/F29/F30/F34 | forms, form interactions, buttons, feedback, tags, data display | active-draft | C2/C3 UI-Handoff |
| DS-04-19 Inline Edit Dirty States | F27/F30 | `component-form-governance.html` | active-draft | editierbaren Details/Formularen |
| DS-04-20 Form Lifecycle State Model | F27/F30 | `component-form-governance.html` | active-draft | Formularimplementierung |
| DS-04-21 Form Layout Patterns | F24/F30 | forms, form governance | active-draft | Review-/Settings-Flows |
| DS-04-22 Date/Time Locale Inputs | F29 | forms, form interactions | active-draft | Fristen/Gueltigkeit |
| DS-04-23 Money/Units Locale Inputs | F29/F30 | forms | active-draft | Rechnungen/Facts |
| DS-04-24 Contact/Identity/Address Inputs | F27/F29 | forms | partial | Profil-/Identity-Arbeit |
| DS-04-25 Sensitive/Secret Fields | F12/F27 | forms, form governance | active-draft | Identity/Device Trust, Recovery, Secrets, Profile |
| DS-04-26 Async Remote Validation | F11/F18/F27 | form governance | active-draft | backendgestuetzten Formularen |
| DS-04-27 Permissioned Fields | F12/F27/SEC | form governance | active-draft | Profile/Sharing |
| DS-04-28 Review Summary Diff | F30/F34 | form governance | active-draft | Assisted-/Change-Review |
| DS-04-29 Bulk Edit/Import Validation | F24/F29/F30 | form governance | active-draft | Import/Batch/Review |
| DS-05 Product Patterns | `MP-DS-05_PRODUCT_PATTERNS.md`, F35/F37/F38, Pillars | patterns; phaseneigene Case-/Record-/Abo-/Processing-Evidenz offen | active-direction | Produktflow-Implementierung |
| DS-05 Case/Record/Contextual Experience | F37 und zugehoerige Decisions | Patterns-Seite ist nur strukturell; exakter Phase-Mock erforderlich | accepted-direction | Vorgang, Unterlage, Abo, Agenda, Review oder Insight UI |
| DS-05 Async Processing/Wait Experience | F38, F18 und Capture-/Assist-Decisions | kein freigegebener State-/Motion-Mock; BF-001/BF-013 und exakter Phase-Mock erforderlich | accepted-direction | Processing-, Background-, Review-Queue- oder Wait UI |
| DS-05 Account/Vault/Assist Lifecycle | F36 und Account/Vault/Assist/Commercial Decisions | `vault-cloud-lifecycle.html` | accepted-baseline | Account, Vault, Assist, Migration, Recovery, Subscription, Deletion UI |
| DS-05-01..10 Config Pages | `MP-DS-05_PRODUCT_PATTERNS.md`, F13 plus OPS/SEC/DATA | patterns/forms; Detailmocks phaseneigen | planned | Settings-/Admin-/Config-Phasen |
| DS-06 Accessibility/Quality Gates | `MP-DS-06_ACCESSIBILITY_AND_QUALITY_GATES.md`, F25/F35 | accessibility | active-baseline | jedem UI-Handoff |
| DS-07 Platform Adaptation | `MP-DS-07_PLATFORM_ADAPTATION.md`, F17/F22/F33 | Shell-/Mobile-Seiten | active-draft | Desktop-/Mobile-Implementierung |

## Erkenntnisse

- Mock-Seiten decken mehr UI ab als die reine MP-DS-Konzeptliste.
- MP-DS-04 und exakte F-Owner mappen die DS-04-Unterfamilien; jede Phase
  reviewt nur ihre anwendbaren Zeilen.
- Config-/Admin-Patterns ausserhalb des akzeptierten Vault-Lifecycle bleiben
  geplant und benoetigen phaseneigene visuelle Evidenz.
- Jede UI-Phase nennt ihre verwendeten DS-Zeilen.

## Stop Rules

- Stop, wenn ein UI-Plan nur `das Design System` statt exakter MP-DS-/F-Zeilen
  referenziert.
- Stop, wenn ein Formular-Slice anwendbare Dirty-, Validating-, Saving-,
  Conflict-, Permission-, Sensitive- oder Review-Zustaende auslaesst.
- Stop, wenn ein Mock einen sichtbaren Zustand ohne normativen Konzept-/
  Coverage-Owner zeigt.
