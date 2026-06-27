---
title: "Konzept F27 - Form Field Anatomy and Validation"
description: "Detaillierte Ordna Design-System-Spezifikation fuer Feldaufbau, Pflichtfelder, Helper/Error/Success/Review-Texte, Validation States, Review Gates und Privacy-safe Form Feedback"
tags: [concept, frontend, design-system, forms, validation, review, accessibility, flutter, production-readiness]
lastUpdated: "2026-06-21"
version: "1.0"
status: "accepted"
---

# Konzept F27 - Form Field Anatomy and Validation

## Status

Accepted.

Dieses Konzept ist die build-relevante Source of Truth fuer den Aufbau
einzelner Formularfelder, harte Review-Gates und Validierungszustaende in
Ordna. Es deckt nicht alle Picker-, Date/Time- oder File/Scan-Interaktionen ab;
diese werden in separaten Detailkonzepten aus F24 geschnitten.

## Roadmap Anchor

| Ebene | Anchor |
|---|---|
| Roadmap | R4 Capture and Review Core |
| Phase/Subphase | R4.2 Desktop Import + Draft Inbox, R4.9 Document/Record Metadata Core, R4.15 UX/A11y M2 Gate |
| Pillars | Design System/UX, Capture & Inbox, Cases/Documents/Records, Household Profiles/Access, Security/Privacy, QA |
| Parent Concepts | F14 Form Field Catalog, F19 Design System Governance, F23 Component System, F24 Form Family, F25 Accessibility Patterns and Visual QA |
| Mock Evidence | `docs/design-system/Mock/pages/component-forms.html` |

## Purpose

Ordna-Formulare pruefen private Dokumente, Profile, Aufgaben, Settings und
spaeter Assisted-Review-Vorschlaege. Ein Feld muss deshalb mehr leisten als
einen Wert anzuzeigen:

- Es zeigt, was der Wert bedeutet.
- Es zeigt, ob der Wert fuer Abschluss/Review erforderlich ist.
- Es erklaert Fehler, Warnungen und Review-Hinweise nahe am Feld.
- Es trennt optionale Facts von echten Gates.
- Es schuetzt sensible Werte vor globalen Meldungen, Logs und Shell-Chrome.
- Es bleibt mit langen deutschen Labels auf Desktop und Mobile stabil.

## Scope

In scope:

- Field anatomy.
- Required marker.
- Helper, error, success and review text.
- Field-level states.
- Review Gate Policy.
- Readonly, disabled and sensitive field states.
- Field layout and responsive behavior.
- Accessibility and test requirements.

Out of scope:

- Dropdown, Combobox, Multi Select and Relation Picker behavior.
- Date, Date Range, Time and Recurrence pickers.
- File Picker, Dropzone, Scan Mode and Upload Queue.
- Assisted Review suggestion cards.
- Full form layouts for profiles, settings, tasks and export.

Those areas remain under F24 and will get separate detailed concepts.

## Field Anatomy

Every editable or reviewable field has a stable anatomy:

```text
Label row
  Label [+ required marker]
  optional field meta
Control
  displayed value / selection / readonly value / masked value
Support text
  helper OR error OR success OR review hint
```

Required minimum:

| Part | Required | Rule |
|---|---|---|
| Label | yes | short semantic name, not placeholder-only |
| Required marker | when gate | visible text marker, not color-only |
| Control | yes | neutral base surface with state styling |
| Helper text | optional | explains expected value or privacy boundary |
| Error text | when invalid | placed near field, actionable |
| Success text | when needed | local confirmation without private details |
| Review text | when warning/review | hint, not hard error |
| Field meta | optional | compact info such as "sichtbar in Listen" or "optional" |

Rules:

- Placeholder text is not a label.
- Label remains visible after a value is entered.
- Required marker must be textual; color alone is not enough.
- Only one support text type should dominate at a time.
- Error text has priority over helper/review text.

## Required Policy

Required fields are hard gates. Ordna must keep them rare.

M2 Review Completion gates:

| Field / Condition | Required | Reason |
|---|---|---|
| File exists and is readable | yes | Review cannot finish without document payload |
| Affected person/profile | yes | Document ownership/context is mandatory |
| Title | yes | Search/list usability requires a concise title |
| Document type | yes | Loose catalog, later refinable |
| Hard review conflict | blocks | Integrity conflict must be resolved before finish |
| Optional Facts | no | Assisted Review should suggest later |
| Tags | no | Search/order help, not status or hard gate |
| Case/Vorgang | usually no in capture | Draft Inbox can hold unassigned work safely |
| Notes | no | User convenience only |

Affected person/profile rule:

- There is no default person.
- The user must actively set the affected person/profile for review completion.
- This can be a household profile, adult profile, managed child profile or later
  another accepted profile type.
- Lists do not need a "Betroffene Person" prefix if the visual pattern makes
  profile chips clear.

Required marker rule:

- Visual text is `Pflicht`.
- Required marker belongs to the label, not to the control value.
- Required marker is not shown for optional facts just because they are useful.

## Field State Catalogue

| State | Meaning | Visual Rule | Behavior Rule |
|---|---|---|---|
| default | editable neutral field | white surface, line border | accepts input |
| focused | active keyboard/pointer focus | petrol border and focus ring | no layout shift |
| required missing / error | hard gate missing or invalid | danger border, soft danger background | blocks relevant action |
| warning / review | attention needed, not necessarily invalid | warm warning/review treatment | does not block unless promoted to hard conflict |
| success | local positive confirmation | success border/background, short text | no sensitive detail in confirmation |
| readonly | value shown but not directly editable | muted surface, slate text | explain source or edit path when needed |
| disabled | control unavailable | muted text/surface | nearby reason required |
| sensitive | value is masked or privacy protected | privacy border/background or mask | reveal/export must be explicit |

## Support Text Rules

### Helper Text

Use helper text for:

- expected format.
- privacy boundary.
- local-only note.
- why a field matters.

Do not use helper text for:

- errors.
- long instructions.
- implementation details.

Example:

```text
Kurzer, korrigierbarer Dokumenttitel. Keine OCR-Rohdaten in globalen Listen.
```

### Error Text

Use error text when:

- a required value is missing.
- a value is invalid.
- a permission blocks the field.
- a hard conflict blocks completion.

Rules:

- Error text is actionable.
- Error text stays near the field.
- Error text explains next action.
- Error text must not expose private document text globally.

Example:

```text
Ohne Person kann Review nicht abgeschlossen werden.
```

### Success Text

Use success text sparingly:

- file is readable.
- local save succeeded.
- pairing confirmed.
- upload queued/saved.

Rules:

- No document titles, OCR snippets or private data in global success messages.
- Field-level success may include neutral technical fact such as "Datei vorhanden
  und lesbar".

### Review Text

Use review text when:

- a value may need attention.
- a deadline is near.
- a stale reference needs repair.
- a suggestion has low confidence.

Rules:

- Review text is not automatically an error.
- It can become blocking only if a hard review conflict exists.

## Readonly, Disabled and Sensitive

### Readonly

Use readonly for:

- original file name.
- checksum or technical ID in diagnostic context.
- calculated values.
- source values that must be changed elsewhere.

Rules:

- Readonly is still readable and selectable where useful.
- If user can edit via another route, show that route in context.
- Do not make readonly look broken.

### Disabled

Use disabled for:

- unavailable action due to missing prerequisite.
- option not available in current mode.
- permission or feature not configured.

Rules:

- Disabled field must have nearby explanation.
- Disabled must not hide required information.
- Disabled does not replace validation.

### Sensitive

Use sensitive for:

- insurance numbers.
- passport or identity numbers.
- tokens, pairing secrets and private identifiers.
- health details where shown in structured field.

Rules:

- Mask by default when the field is not actively edited.
- Reveal is deliberate and local.
- Sensitive values must not appear in Shell, Snackbar, global logs or generic
  support messages.
- Export/Share context must make consequences explicit.

## Review Gate Pattern

Draft Review gate:

```text
File              required, success if readable
Affected Person   required, error if missing
Document Type     required, picker-like control
Title             required, editable text
Hard Conflict     blocks until resolved
Optional Facts    allowed to stay empty
```

Completion behavior:

- The "Pruefung abschliessen" action is disabled or blocked if a hard gate is
  missing.
- The field with the missing gate shows inline error.
- A summary badge may show "1 Pflichtfeld fehlt", but the field error remains
  the actionable source.
- No hidden default profile may silently satisfy the person gate.

## Layout Rules

Desktop:

- Fields can be grouped into sections.
- Two-column anatomy is allowed when labels and support text stay readable.
- Dense layouts must keep error text near the field.

Narrow desktop/tablet:

- Field grids reduce columns before text overlaps.
- Sidebar can stay beside content; form content wraps inside its area.

Mobile:

- Single column.
- Large labels wrap.
- Required marker remains visible.
- Support text stays below the control.
- No horizontal overflow.

Section rules:

- Form sections may contain fields, choice cards and local command rows.
- Do not nest UI cards inside cards for ordinary forms.
- Use sections to separate meaning, not decoration.

## Copy Rules

Labels:

- noun or short noun phrase.
- German UI language.
- no punctuation.
- no implementation details.

Examples:

- Datei
- Betroffene Person
- Dokumenttyp
- Titel
- Faelligkeit
- Versicherungsnummer

Helper/error text:

- one short sentence when possible.
- action-oriented for errors.
- privacy-safe.

Avoid:

- "Invalid input".
- "Error".
- "Backend failed".
- long process explanations inside field support text.
- private document details in generic messages.

## Implementation Handoff Guidance

The implementation plan should define a shared field anatomy that can represent:

- label.
- required marker.
- optional field meta.
- control slot.
- support text type.
- state.
- sensitive/read-only/disabled semantics.
- accessibility label/description/error relation.

The design-system field wrapper may be reused by text controls, pickers,
date/time controls, file controls and future suggestion fields, but picker and
file behavior stays in separate concepts.

Clean Architecture boundary:

- Field components belong to Presentation / Design System.
- Field components receive values, labels, state and callbacks.
- Field components do not import Data, repositories, Drift, HTTP, file storage
  or Secure Storage.
- Domain validation rules are exposed to Presentation as state; the field only
  renders them.

## Accessibility Requirements

Every field must provide:

- programmatic label.
- visible label.
- error association.
- focus order.
- keyboard interaction if editable.
- disabled semantics if disabled.
- readonly semantics if readonly.
- sensitive/reveal semantics when values are masked.

Required marker:

- must be textual and screenreader-readable.
- must not rely on red color alone.

Errors:

- must be announced or associated with the field in the implementation plan.
- must remain near the field visually.

## Test and Verification Requirements

Any implementation plan or Flutter build must include:

- required marker rendering test.
- missing affected person blocks Review completion.
- file-readable success state.
- title and document type required state.
- helper/error/success/review text rendering.
- readonly, disabled and sensitive state rendering.
- focus state visual evidence.
- mobile overflow check.
- long German label check.
- no sensitive values in global snackbars/log-like messages.

## Acceptance Criteria

F27 is satisfied when:

- every form field uses the common anatomy.
- required gates are textually visible.
- review completion cannot finish without affected person/profile.
- optional facts and tags do not become hard gates.
- all field states are representable.
- support text hierarchy is clear.
- sensitive fields are masked/protected by default.
- disabled fields explain why they are unavailable.
- mobile layout is single-column and overflow-free.

## Non-Goals

- This concept does not define picker popovers or bottom sheets.
- This concept does not define date/time picker interaction.
- This concept does not define file/scan controls.
- This concept does not define suggestion card workflow.
- This concept does not define persistence or repository validation internals.

## Related Concepts

- F14 Form Field Catalog.
- F19 Design System Governance and SSOT.
- F24 Form Family.
- F25 Accessibility Patterns and Visual QA.
- F26 Button Family.
