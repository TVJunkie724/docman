---
title: "Decision - Review Completion Validation"
description: "Entscheidung fuer den Abschluss assistierter Dokumentpruefung: intakte Datei, bestaetigter Titel/Grundart/Managed Subject, primaerer Case-/Record-Kontext und keine harten Konflikte"
tags: [decision, capture, review, validation, metadata, profiles, cases, records, intelligence]
lastUpdated: "2026-07-20"
status: "accepted-rebaseline"
owner: "product-concept"
---

# Decision - Review Completion Validation

## Status

Accepted and rebaselined on 2026-07-15 for capture-first Assisted Review.

## Decision

A captured logical document becomes accepted only when the minimum fachliche
meaning is confirmed. Backend/Core Assist prepares these values; the user is not
expected to fill a blank form.

This completion gate belongs to the document review, not to Case validity. A
persisted Case is always valid and may contain zero, one or many documents. A
missing document, workflow slot, task, Claim or outcome may leave a review,
state transition or external action pending, but never turns the Case into an
invalid object.

## Blocking Completion Conditions

Review cannot complete while any of these conditions applies:

- original/FileRecord is missing, corrupt or unreadable without deliberate
  fallback;
- logical page/document boundary has an unresolved hard conflict;
- Managed Subject is missing, ambiguous or not permitted;
- localized title is missing or unconfirmed;
- document base type is missing or unconfirmed at the required taxonomy level;
- no confirmed primary Case or Record context exists;
- duplicate/import/upload/security conflict remains unresolved;
- processing result is stale/superseded or a required provider result failed
  without accepted manual fallback;
- a visible material consequence in the confirmation bundle is unresolved.

`unknown`/generic fallback may remain a valid reviewed base type when a more
precise classification is not supported. It must not fabricate specificity or
force the user through the complete taxonomy.

Base-type confirmation does not require a separate visible field when the
compact title/template/routing result already communicates the same meaning.
Ambiguity or a material consequence exposes only the relevant alternatives;
the full taxonomy remains behind deliberate correction.

If no existing/guided Case or durable Record fits, the completion path proposes
a lightweight Custom Case with an automatically generated editable title.

## Non-Blocking Facts

These may remain absent or proposed unless a selected workflow/context requires
them for a visible next action:

- sender/issuer details;
- optional semantic variant/domain;
- non-material dates, references, amounts and tags;
- note;
- secondary Case/Record/Claim links;
- optional document roles/workflow slots;
- preview failure when the original is safely readable through a fallback;
- optional task/reminder/appointment.

Missing optional data does not justify a large manual form.

A workflow may describe expected evidence for a later action. That expectation
does not make the Case invalid and does not make a particular document type a
general Case requirement. Where a provider actually requires evidence for an
external submission, only that prepared action remains unavailable until the
requirement is met or an explicit manual fallback is chosen.

## Confirmation Semantics

- The best result is prepared as a review bundle.
- A single user action may confirm a visible single-document or batch result.
- Only visible assignments and consequences become confirmed.
- Hidden facts remain proposed.
- Already confirmed context inherited from the selected Case/Record need not be
  repeated unless it conflicts or changes consequences.
- Correction records edited/rejected provenance without changing the original.

## New-Case Intent

When the user selected **Neuen Vorgang starten**, creation intent is explicit
and first creates a proposal or reservation rather than an invalid partial
Case. The Case may be persisted before document processing completes only after
its minimum Case invariants are confirmed; it is then a valid, possibly empty
or lightweight Case while the document review remains pending. Review still
requires:

- Backend/Core Assist title proposal;
- confirmed Managed Subject;
- coherent document grouping/outlier resolution;
- confirmed final title and primary relation;
- any visible workflow/task consequence.

The path never falls back to a blank mandatory Case form.

## Batch Completion

A batch can complete partially. Each logical document must independently meet
the completion gate. A visible group confirmation may accept several coherent
items; failed, uncertain or unrelated outliers remain pending without rolling
back accepted items.

## Later Automation

Future quality-gated automatic routing may satisfy confirmation for explicitly
eligible reversible assignments. It must record automation provenance, remain
undoable and never bypass Managed-Subject/permission or external-action safety.
Until that gate is activated, primary Case/Record assignment remains user-
confirmed.

## Stop Rules

Stop if:

- title, base type, subject and primary context are blank forms rather than
  prepared suggestions;
- review can complete without a primary Case/Record;
- one confirmation accepts hidden facts/relations;
- a batch succeeds/fails only as one indivisible unit;
- missing optional metadata blocks completion without workflow justification;
- a failed or pending document review marks an already persisted Case invalid;
- a workflow expectation is treated as a general Case document requirement;
- a confirmed result can be overwritten by reprocessing;
- future automation bypasses the accepted quality gate.
