---
title: "MP-DS Coverage Matrix"
description: "Traceability across playbook design-system families, Mappm concepts and mock evidence"
tags: [design-system, coverage, traceability, governance]
status: active-baseline
lastUpdated: "2026-07-14"
owner: "ui-concept"
---

# MP-DS Coverage Matrix

## Purpose

This matrix reconciles the existing Mappm design system with the general
playbook DS family. Mappm keeps the `MP-DS-*` prefix, but coverage must remain
traceable to the generic DS-00..DS-07 and DS-04/DS-05 subfamilies.

## Coverage

| Playbook family | Mappm source | Mock evidence | Status | Required before |
|---|---|---|---|---|
| DS-00 Umbrella | `MP-DS-00_DESIGN_SYSTEM_UMBRELLA.md` | `index.html` | draft | any UI handoff |
| DS-01 Foundations/Tokens | `MP-DS-01_FOUNDATIONS_AND_TOKENS.md` | foundations, palette, fonts, spacing, icons | draft | first UI slice |
| DS-02 Layout/Shell | `MP-DS-02_LAYOUT_AND_SHELL.md` | product shell, navigation | draft | shell/navigation implementation |
| DS-03 Corporate Design | `MP-DS-03_CORPORATE_DESIGN.md` | corporate pages | draft | branding/release work |
| DS-04 Component System | `MP-DS-04_COMPONENT_SYSTEM.md` plus F23/F26/F34 | components, buttons, forms, feedback, status, data display | active-draft | component implementation |
| DS-04-01..18 Core component/form families | F24/F27/F28/F29/F30/F34 | forms, form interactions, buttons, feedback, tags, data display | active-draft | R4 UI handoff |
| DS-04-19 Inline edit dirty states | F27/F30 | `component-form-governance.html` | active-draft | editable detail/forms |
| DS-04-20 Form lifecycle state model | F27/F30 | `component-form-governance.html` | active-draft | form implementation |
| DS-04-21 Form layout patterns | F24/F30 | forms, form governance | active-draft | review/settings flows |
| DS-04-22 Date/time locale inputs | F29 | forms, form interactions | active-draft | deadlines/validity |
| DS-04-23 Money/units locale inputs | F29/F30 | forms | active-draft | invoice/facts |
| DS-04-24 Contact/identity/address inputs | F27/F29 | forms | partial | profile/identity work |
| DS-04-25 Sensitive/secret fields | F12/F27 | forms, form governance | active-draft | pairing/secrets/profile data |
| DS-04-26 Async remote validation | F11/F18/F27 | form governance | active-draft | backend-backed forms |
| DS-04-27 Permissioned fields | F12/F27/SEC | form governance | active-draft | profiles/sharing |
| DS-04-28 Review summary diff | F30/F34 | form governance | active-draft | assisted review/change review |
| DS-04-29 Bulk edit/import validation | F24/F29/F30 | form governance | active-draft | import/batch/review |
| DS-05 Product Patterns | `MP-DS-05_PRODUCT_PATTERNS.md`, F35/F37, pillar docs | patterns page; phase-owned Case/Record/Abo evidence pending | active-direction | product-flow implementation |
| DS-05 Case/Record/Contextual experience | F37 plus Case/Subscription/Managed-Subject/Tax/Roll-up decisions | current patterns page is structural only; exact phase mock required | accepted-direction | Case, Unterlagen, Abo, agenda, contextual review or insight UI |
| DS-05 Account/Vault/Assist lifecycle | F36, Account/Vault/Assist and Commercial-Core decisions, AI/DATA/SEC/COM | `vault-cloud-lifecycle.html` | accepted-baseline | account/device, Vault, Assist, migration, recovery, subscription or deletion UI |
| DS-05-01..10 Config pages | `MP-DS-05_PRODUCT_PATTERNS.md`, F13 plus OPS/SEC/DATA | patterns/forms; detailed config mocks phase-owned | planned | settings/admin/config phases |
| DS-06 Accessibility/Quality Gates | `MP-DS-06_ACCESSIBILITY_AND_QUALITY_GATES.md`, F25/F35 | accessibility page | active-baseline | every UI handoff |
| DS-07 Platform Adaptation | `MP-DS-07_PLATFORM_ADAPTATION.md`, F17/F22/F33 | shell/mobile-relevant pages | active-draft | desktop/mobile implementation |

## Findings

- Existing mock pages already cover more UI than the MP-DS concept list shows.
- DS-04 subfamilies are normatively mapped by MP-DS-04 and their exact F
  owners; each affected phase still reviews only the rows it uses.
- Config/admin product patterns outside the accepted Vault lifecycle remain
  planned and require phase-owned visual completion.
- Every future UI phase must name the DS rows it uses.

## Stop Rules

- Stop if a UI plan references "the design system" without exact MP-DS/F rows.
- Stop if a form phase does not cover dirty, validating, saving, conflict,
  permissioned, sensitive and review states where applicable.
- Stop if a mock shows a visual state that no concept or coverage row owns.
