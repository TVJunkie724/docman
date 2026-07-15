---
title: "Decision - Mobile Capture Context Intent"
description: "Entscheidung zur minimalen mobilen Capture-Absicht: automatisches Matching ist immer aktiv, ein neuer Vorgang bleibt der einzige primaere Vorab-Shortcut"
tags: [decision, mobile-capture, context, cases, intelligence, review, progressive-disclosure]
lastUpdated: "2026-07-15"
status: "accepted-rebaseline"
owner: "product-concept"
---

# Decision - Mobile Capture Context Intent

## Status

Accepted and rebaselined on 2026-07-15. The earlier optional pre-scan sequence
for Managed Subject, existing Case and note is superseded for global capture.

## Decision

Automatic document analysis and Case/Record matching run for every supported
capture. They are not a user-selectable mode.

Global mobile capture must remain immediately usable without profile selection,
Case search, role selection, note or metadata form. The only primary optional
pre-capture context intent is:

```text
Neuen Vorgang starten
```

Selecting it explicitly requests a new primary Case but does not require title,
workflow or metadata input. Backend/Core Assist proposes those values from the
captured material and still checks:

- whether documents in the session are unrelated;
- whether a document also belongs to existing Cases/Records/Claims;
- whether an existing context is a likely duplicate or better relation;
- whether a durable Record is more appropriate for an item.

## Normal Flow

```text
open global capture
  -> scan
  -> durable queue/processing
  -> automatic proposal
  -> confirm or correct
```

No context form is inserted before the scan.

## New-Case Intent

```text
choose Neuen Vorgang starten
  -> scan one or more documents
  -> create/retain draft Case intent
  -> Backend/Core Assist proposes title, Managed Subject, workflow and facts
  -> flag unrelated batch items and additional matches
  -> confirm/correct final visible result
```

A generated title is mandatory. A placeholder may exist internally while
processing, but the user must not be required to invent a title before the
document has been understood.

## Existing-Case Shortcut

Selecting an existing Case before global capture is not required and is not a
primary capture control. It may later be exposed as a secondary shortcut if
usability evidence justifies it. Existing Cases are always available through
the result/correction path.

Capture launched from inside an existing Case is a separate deliberate path and
may carry that explicit Case context without showing another selector.

## Managed Subject and Notes

Backend/Core Assist proposes the Managed Subject. The user confirms it when it
is new, ambiguous or consequential. If the selected/confirmed Case already has
one unambiguous Managed Subject, the review need not repeat redundant profile
information unless there is a conflict.

A free note may remain available after capture or in details, but is not part of
the default pre-scan sequence.

## Offline Behavior

Global capture and new-Case intent work offline. The original and intent are
stored durably. Assist processing and result review wait until the approved
processing path is available. Missing cached Cases or profiles never blocks
capture.

## UI Boundary

This decision does not choose exact control placement, wording, tap/swipe
confirmation or result layout. It limits the visible pre-capture choice surface
to protect the capture-first product principle.

## Stop Rules

Stop if:

- `Automatisch vorschlagen` appears as a mode that can be turned off;
- global capture requires Managed Subject, existing Case or note before scan;
- more capture modes/options are added without a new product decision;
- `Neuen Vorgang starten` opens a mandatory blank title form;
- existing-Case selection crowds the primary capture action;
- selected new-Case intent suppresses analysis, title generation or additional
  matching.
