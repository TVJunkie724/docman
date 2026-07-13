---
title: "MP-DS-04 Component System"
description: "Normative component and form-family governance for Mappm"
tags: [design-system, components, forms, actions, feedback, data-display]
lastUpdated: "2026-07-12"
status: "active-draft"
owner: "ui-concept"
---

# MP-DS-04 Component System

## Status

Active draft. It is the normative umbrella for component families. A component
slice is implementation-ready only when its mapped accepted F-concept, mock
evidence and phase contract are all named and reviewed.

## Scope

Buttons, fields, selection, pickers, files/scans, status, navigation controls,
overlays, feedback, data display and form lifecycle/review patterns.

Non-goals: Flutter widget APIs, provider wiring, backend contracts and product-
specific screen composition. Those belong to `ui-architect`, contract owners
and MP-DS-05.

## Family Ownership

| DS family | Mappm normative source | Mock evidence |
|---|---|---|
| DS-04-01 Form family overview | F24 | forms, form interactions, form governance |
| DS-04-02 Form fundamentals | F27 | forms, form governance |
| DS-04-03 Text input family | F27 | forms |
| DS-04-04 Selection/toggle family | F28 | forms, form interactions |
| DS-04-05 Pickers/viewers | F28/F29 | form interactions, product shell |
| DS-04-06 Numeric/range controls | F30 | forms |
| DS-04-07 File/upload visuals | F29 | forms, form governance |
| DS-04-08 Tags/readonly/status | F34 | tags, status, forms |
| DS-04-09 Compound field atoms | F27/F30 | forms |
| DS-04-10 Layout primitives | F24/F30 | forms, patterns |
| DS-04-11 Form/list entry | F30/F34 | forms, data display |
| DS-04-12 Dependent field groups | F27/F30 | forms, form governance |
| DS-04-13 Button/action visuals | F26 | buttons |
| DS-04-14 Navigation controls | F22/F33 | navigation, product shell |
| DS-04-15 Overlays/dialogs | F28/F33/F35 | form interactions, patterns |
| DS-04-16 Icons | F32 | icon set |
| DS-04-17 Feedback/progress | F18/F34 | feedback, status |
| DS-04-18 Data display | F34 | data display |
| DS-04-19 Inline edit/dirty states | F27/F30 | form governance |
| DS-04-20 Form lifecycle | F27/F30 | form governance |
| DS-04-21 Form layout patterns | F24/F30 | forms, form governance |
| DS-04-22 Date/time/locale | F29 | forms, form interactions, form governance |
| DS-04-23 Money/units/locale | F30 | forms, form governance |
| DS-04-24 Contact/identity/address | F27/F28/F30 | forms, form governance |
| DS-04-25 Sensitive/secret fields | F12/F27 | forms, form interactions, form governance |
| DS-04-26 Async remote validation | F11/F18/F27 | form governance |
| DS-04-27 Permissioned fields | F12/F27/F30 | form governance |
| DS-04-28 Review summary/diff | F30/F34 | form governance |
| DS-04-29 Bulk edit/import validation | F24/F29/F30 | form governance |

## Required States

Every applicable control must define default, hover, focus, disabled, readonly,
loading/validating, error, warning, success and permission-denied behavior.
Editable flows additionally define pristine, touched, dirty, submitting, saved,
stale and conflict states. Destructive actions require confirmation and a
recoverability statement. Remote validation must ignore stale responses.

## Security, Accessibility And Localization

- Sensitive values are masked by default and never appear in global feedback,
  logs or synthetic screenshots as realistic identifiers.
- Permissioned fields distinguish readonly, hidden, denied and request-access;
  UI state never substitutes backend/domain authorization.
- Controls have programmatic labels, keyboard operation, visible focus and
  text-scale behavior. Color is never the sole status carrier.
- User-facing copy is German and must survive long labels and error text.

## Verification

Each implementation plan names exact widget, semantics, golden/responsive and
interaction tests. Async/permission/sensitive controls require negative paths.
Mock evidence is reviewed at desktop and mobile widths before architecture.

## Stop Rules And Handoff

Stop if a family lacks an exact row above, required state, accepted source or
mock evidence. Handoff to `ui-architect` only through an approved phase; then
review the implementation plan with `ui-plan-review`.
