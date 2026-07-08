---
status: active-baseline
lastUpdated: "2026-07-08"
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
| DS-04 Component System | F23/F26/F34 plus mock pages | components, buttons, forms, feedback, status, data display | active-draft | component implementation |
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
| DS-05 Product Patterns | F35, pillar docs | patterns page | draft | product-flow implementation |
| DS-05-01..10 Config pages | F13 plus OPS/SEC/DATA | not fully mocked | planned | settings/admin/config phases |
| DS-06 Accessibility/Quality Gates | F25/F35 | accessibility page | draft | every UI handoff |
| DS-07 Platform Adaptation | F17/F22/F33 | shell/mobile-relevant pages | draft | desktop/mobile implementation |

## Findings

- Existing mock pages already cover more UI than the MP-DS concept list shows.
- DS-04 subfamilies need concept-level governance before broad UI buildout.
- Config/admin product patterns are planned but not yet visually complete.
- Every future UI phase must name the DS rows it uses.

## Stop Rules

- Stop if a UI plan references "the design system" without exact MP-DS/F rows.
- Stop if a form phase does not cover dirty, validating, saving, conflict,
  permissioned, sensitive and review states where applicable.
- Stop if a mock shows a visual state that no concept or coverage row owns.
