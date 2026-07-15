---
title: "Decision - Capture-First Assisted Document Routing"
description: "Verbindliches Mappm-Zielmodell fuer globales Capture, asynchrone Backend-/Assist-Verarbeitung, automatische Titelvorschlaege, Batch-Trennung, Case-/Record-Matching, menschliche Bestaetigung und spaetere selektive Automatisierung"
tags: [decision, product, capture, intelligence, ocr, routing, review, cases, records, batch, titles]
lastUpdated: "2026-07-15"
status: "accepted-direction"
owner: "product-concept"
---

# Decision - Capture-First Assisted Document Routing

## Status und Wirkung

Accepted as the product direction on 2026-07-15. This decision rebaselines the
older manual M2 capture/review assumptions. Where older decisions describe
OCR/AI, batch processing, title suggestions or mobile review as optional later
additions, this decision is authoritative for the Commercial Core.

Concrete UI composition, gestures, screen layouts and wording remain a later
UI-concept and usability decision. The product behavior, trust boundaries and
processing states in this decision are normative.

## Product Principle

Mappm is capture-first:

> Der Nutzer erfasst ein Dokument. Mappm erschliesst die fachliche Struktur aus
> dem kontinuierlichen Dokumenteingang und laesst nur das relevante Ergebnis
> bestaetigen oder korrigieren.

The user must not be required to understand or manually configure document
roles, workflow branches, Claims, Case relations, extraction fields or routing
rules before capture. A product that replaces paper sorting with large forms
has missed its purpose.

The normal current-release flow is:

```text
open global capture
  -> scan/import document material
  -> local quality and durability check
  -> asynchronous backend/Core Assist processing
  -> best result prepared
  -> user reviews the relevant visible result
  -> user confirms or corrects
  -> document becomes accepted in its primary context
```

Capture from inside a Case or Record remains supported as a secondary path for
deliberate additions. It is not the assumed everyday ingestion route.

## Capture Entry Intent

Automatic analysis and matching are always active. They are not a selectable
capture mode.

Global capture may expose one quiet optional intent: **Neuen Vorgang starten**.
That intent means the user deliberately wants a new primary Case to emerge from
the capture. It does not open a title/metadata form and does not disable:

- document classification and fact extraction;
- automatic title generation;
- workflow and next-step suggestions;
- duplicate and existing-context checks;
- proposals for additional links to existing Cases or Records;
- outlier detection when a batch contains unrelated material.

Selecting an existing Case before global capture is not required for the core
flow. Existing-Case selection may remain accessible as a secondary shortcut or
through correction/review, but must not crowd the capture surface. Case-scoped
capture already supplies explicit context when the user intentionally enters
through a Case.

## Asynchronous Processing Contract

Reliable Case matching requires enough document content to be available. The
pipeline therefore runs after durable capture and may take seconds or minutes,
depending on page count, scan quality, language, document complexity, provider
latency, retries and selected processing capabilities.

One to two minutes is a valid UX scenario, not a timeout assumption. Exact
service-level targets must be established from production-like benchmarks and
must include median and tail latency. The app must never require the user to
keep a blocking spinner open while processing.

Conceptual pipeline:

```text
durably capture original material
  -> validate file/page integrity and scan quality
  -> upload or queue according to Vault mode
  -> normalize pages and validate declared logical document boundaries
  -> generate preview
  -> extract text / OCR
  -> classify document base type and optional semantic variant
  -> extract actors, references, dates, amounts, deadlines and other facts
  -> update searchable index artifacts
  -> retrieve candidate Records, Cases, Claims and workflow definitions
  -> rank primary and additional-context matches
  -> propose title, metadata, relations, workflow slots and next actions
  -> prepare a reviewable result
```

Stages may run concurrently where their dependencies allow. Indexing and full
semantic search may continue after an early proposal, but the UI must not
present an unstable partial result as final.

Conceptual states include:

```text
captured locally
queued for transfer or processing
uploading / transferred
quality review required
processing
proposal ready
user review required
confirmed
retryable failure
non-retryable/manual fallback
```

Exact enum and API names belong to architecture and contract work. Product
states must survive app restart, network changes and provider retries.

## Scan Quality and Partial Failure

Recognition quality will vary strongly with capture quality and document
complexity. Mappm promises a safe, fast correction path, not infallible AI.

Fast local checks should detect conditions such as:

- missing or cut-off page regions;
- unreadable blur;
- severe glare or shadow;
- duplicate pages;
- a newly added page that likely belongs to another document;
- unexpected orientation;
- page order uncertainty;
- unsupported or corrupt files.

Where possible, a likely defective scan is surfaced before expensive remote
processing. The user may rescan, deliberately continue, remove a page or cancel.
One defective item in a batch must not discard successfully captured items.

Processing failures retain the original material and the last trustworthy
state. Retry never creates silent duplicate documents or Cases.

## Capture Sessions, Pages and Documents

A capture/upload session is a technical transport envelope, not a semantic
Case and not evidence that all included material belongs together.

For mobile camera capture, one explicitly completed scan unit is exactly one
logical document:

```text
capture session
  document capture 1
    page 1
    page 2
  document capture 2
    page 1
  document capture 3
    page 1
    page 2
```

The user adds **another page** only while the current document is open. After
**Dokument abschliessen**, **Naechstes Dokument scannen** starts a new durable
document-capture unit. A receipt, payment proof, response or other separate
artifact is never intentionally appended as another page of the invoice merely
because it is related.

Mobile multi-page/multi-document sessions and desktop multi-file/drag-and-drop
batches remain required product scenarios. Their boundaries differ:

- mobile scan boundaries are explicit and authoritative by default;
- each selected desktop file is one initial logical document by default;
- an imported compound PDF/file may require a reviewed split;
- an accidental page mismatch inside one scan is a quality warning, not the
  normal document-segmentation workflow.

The processing pipeline must:

- retain original source artifacts and page order;
- persist each explicit document boundary before the next document begins;
- validate page coherence and offer **Als neues Dokument beginnen** when a new
  page likely belongs elsewhere;
- propose split/merge only for imports or correction of a likely user mistake;
- process and match each logical document independently;
- use the common capture session only as a weak contextual signal;
- cluster compatible results for efficient review;
- identify likely outliers instead of forcing the whole batch into one Case;
- permit split, merge, reorder and reassignment without destructive rewriting;
- preserve traceability from each logical document to its original pages/files.

The system must not depend on AI to separate an intentionally mixed paper stack
after capture. Efficient repeated scanning comes from closing one document and
immediately starting the next while keeping the shared session/queue.

If **Neuen Vorgang starten** was selected, the shared-new-Case intent is a
strong user signal, not an absolute rule. Mappm still flags an unrelated invoice,
letter or identity document rather than silently placing it in that new Case.

The current review model may allow one deliberate confirmation for a visible
batch grouping. Such confirmation only accepts the assignments and consequences
actually represented in the review summary; it does not confirm hidden facts.

## Primary Context After Review

`Document` remains an independent technical/domain object because file bytes,
versions, OCR artifacts, metadata, facts, search indexes and multiple links
cannot be owned by a UI container.

During capture and processing a document may have no Case or Record link. After
successful review, every accepted document must have at least one confirmed
primary fachlicher Kontext:

- an existing or new Case; or
- an existing or new durable Record.

There is no separate user-facing final state called "standalone document".

When no existing/guided Case and no durable Record is appropriate, Mappm
proposes a lightweight Custom Case. A lightweight Custom Case may initially
contain only:

- a generated, editable title;
- a Managed Subject;
- one document;
- optional minimal provenance.

It does not require tasks, appointments, Claims, a workflow definition or an
already elaborated completion outcome. It has the same capability ceiling as
every other Case and may later receive more documents, adopt a compatible
guided workflow, gain tasks or relationships, or remain a quiet single-document
context.

Single-document Custom Cases without open attention do not have to dominate
active-work surfaces. Search and complete Case views must still find them.

## Mandatory Backend/Assist Title Proposal

Automatic title proposal is a required Core Assist capability, not optional
polish.

For every newly captured logical document, new Case and new Record candidate,
the backend/Core Assist processing result must propose a concise, editable,
localized title. This also applies when the user selected **Neuen Vorgang
starten** before capture. The user must not be sent to a blank title form merely
because a new Case was requested.

Title generation may combine deterministic rules and model output using:

- confirmed or extracted document base type/semantic variant;
- issuer/provider or relevant external party;
- Managed Subject where needed for disambiguation;
- service, issue or event date;
- stable reference/contract/claim identifiers where safe and useful;
- matched Record or Case context;
- the selected domain template and applicable optional workflow version;
- coherent facts from multiple documents in the same proposed Case.

Titles must be useful for scanning and enterprise search, avoid fabricated
facts and remain editable. Sensitive details must not leak into push
notifications, logs, analytics or lock-screen text. Generic fallback titles are
allowed only when evidence is insufficient and must remain easy to correct.

The result contract must distinguish the suggested title and its provenance
from a user-confirmed title. Later reprocessing may propose an improved title
but may not silently overwrite a confirmed one.

## Automatic Proposals Beyond Titles

Backend/Core Assist processing automatically prepares proposals for all
supported relevant outcomes, including:

- document base type and optional semantic variant;
- Managed Subject;
- sender, issuer, recipient and other external parties;
- dates, references, amounts, deadlines and expected responses;
- primary Case or Record;
- additional Cases, Records or Claims;
- document role and workflow slot per relationship;
- suitable domain template and optional workflow definition/version;
- Case links such as `part_of`, `caused_by`, `follow_up_to` or `related_to`;
- next task, appointment, reminder or expected document;
- a new lightweight Custom or guided Case when no existing context fits.

"Automatically prepared" does not mean "automatically finalized" in the first
release maturity. External submissions, cancellations, payments, sharing and
other consequential actions remain explicit user actions in every maturity.

## Matching and Ranking

Case/Record matching is document-first and uses available strong signals before
broader semantic similarity. Candidate evidence may include:

1. claim, policy, contract, authority or other stable reference identifiers;
2. Managed Subject;
3. expected document base types/variants or roles in an active workflow;
4. sender, issuer, recipient or institution;
5. document, service, treatment or event dates;
6. amount and payment/reference data;
7. prior submissions and expected responses;
8. known contracts, policies, assets and Records;
9. temporal proximity to confirmed appointments/events;
10. semantic content and prior confirmed corrections.

Session proximity alone is never a strong enough reason to merge documents.
The matcher may propose multiple Case/Record links because one document can be
evidence in several contexts without file duplication.

Ranked results are always useful input, even when confidence is low:

- high confidence: show the strongest result with a fast correction path;
- medium confidence: show the best small set of alternatives;
- low confidence: present new Case first for Case routing, still show the best
  candidates and keep full existing-Case selection accessible;
- no supported process: permit a new lightweight Custom Case or an appropriate
  durable Record rather than inventing a guided workflow.

The product must not claim that a weak candidate is reliable. Raw confidence
percentages are not required user-facing copy and must not substitute for clear
uncertainty language.

## Current Review Maturity

Commercial Core starts directly with assisted one-action confirmation, not a
primitive field-by-field review phase.

In the first maturity:

- the best supported result is prepared as the default proposal;
- every primary Case/Record assignment is confirmed by the user;
- additional Case/Claim/Record relations are confirmed when proposed;
- important generated tasks, deadlines and workflow consequences are confirmed;
- the user can correct through the smallest relevant choice surface;
- a full title/metadata form is never the default path;
- already confirmed context and irrelevant implicit facts are not repeated;
- optional details remain available on demand;
- a confirmation accepts only visible consequences, never hidden assumptions.

An interaction may later be a tap, swipe, keyboard action or another accessible
pattern. This decision does not select the gesture. A gesture must never be the
only inaccessible way to confirm or correct.

## Progressive Disclosure

The default review exposes only information needed to answer:

1. Wo wird dieses Dokument eingeordnet?
2. Was folgt daraus als naechstes?
3. Gibt es eine Unsicherheit, Abweichung oder folgenreiche Entscheidung?

Known sender details, unchanged provider data, internal workflow keys, document
roles and technical metadata remain hidden unless they alter the decision or
the user opens details. For example, a known doctor already implied by the
confirmed Case need not be restated.

If a new or conflicting Managed Subject, insurer, deadline or external action
changes consequences, that fact must become visible. Progressive disclosure
must never hide a fact whose confirmation is being requested.

## Future Selective Automation

Later releases may automatically finalize selected reversible internal
assignments, but only after an explicit quality gate. The gate is evaluated per
document class, scan-quality range, workflow version, country/provider variant
and risk class, not by one global accuracy number.

Required evidence includes:

- very high precision for the automatically covered subset;
- an explicit abstention path for uncertainty;
- near-zero cross-Managed-Subject and permission-boundary errors;
- measured correction and undo rates;
- production-like synthetic and approved representative fixtures;
- privacy-safe monitoring without document contents in telemetry;
- staged rollout, rollback and feature control;
- visible automatic-assignment history and easy undo.

A system may automate only a limited share of documents if that share is
reliably safe. Five percent wrong assignments is not an acceptable automatic
routing target for sensitive documents. Suggestion quality and automation
eligibility are separate release claims.

External actions remain confirmation-bound even when internal routing becomes
automatic.

## Local, Cloud and Offline Behavior

- Local Vault capture remains locally authoritative.
- Cloud Vault capture becomes authoritative only after Mappm Cloud confirms the
  accepted write; local state remains cache/pending work.
- Core Assist processing is separate from Vault authority and does not silently
  turn Local Vault content into Cloud storage or backup.
- Offline capture stores original material and intent durably, then queues
  transfer/processing until the approved Assist path is available.
- A user may leave the app while processing; status and result survive restart.
- If Assist is unavailable, Mappm preserves the document and offers retry or a
  bounded manual fallback without losing the original.

## Backend, Contract and Client Boundary

The managed backend owns orchestration of upload confirmation, processing jobs,
approved OCR/model providers, indexing services and result provenance. It must
return versioned, reviewable proposals, including the mandatory title proposal.

Flutter owns capture interaction, durable client queue/cache, progress/error
presentation, proposal review, correction and confirmed user intent. Flutter
must not duplicate provider-specific OCR/LLM orchestration or infer backend DTOs
as Domain entities.

Exact DTOs, endpoints, job events, retry semantics and client generation belong
to `contract-api`. The product decision requires contracts for:

- idempotent batch/session and artifact submission;
- logical document/page manifests;
- asynchronous processing status;
- proposal retrieval/versioning;
- title and field provenance;
- user confirmation/correction;
- split/merge/reassignment corrections;
- cancellation, retry and safe failure.

## Privacy, Security and Trust

Original files, pages, OCR text, extracted facts, embeddings, candidate matches,
titles and model inputs/outputs are sensitive data.

- Logs and diagnostics contain IDs/reference codes, not document contents.
- Notifications use privacy-safe wording by default.
- Provider, purpose, retention, training prohibition, region and deletion rules
  follow the accepted Assist/trust decisions.
- Corrections are not model-training consent.
- Cross-profile/cross-organization routing must respect access before candidate
  generation and presentation.
- Raw model output is untrusted input and cannot execute actions directly.
- Original artifacts and confirmed history remain recoverable after reprocessing.

## Accessibility and Localization

- Processing and review states are announced semantically and do not rely only
  on animation or color.
- The user can leave and return without losing focus/context or captured data.
- Every gesture has a keyboard, screen-reader and visible-action equivalent.
- Long localized titles and text scaling must not hide confirmation/correction.
- Uncertainty and errors use understandable localized language, not model jargon.

## Verification Requirements

Before implementation approval, phase/test plans cover at least:

- good, poor, partial and corrupt scans;
- single-page, multi-page and reordered-page documents;
- explicit document completion followed by **Naechstes Dokument scannen**;
- a likely unrelated page warning and conversion into a new document;
- related and unrelated mixed batches;
- reviewed splitting of an imported compound file and correction of a wrong
  manual boundary;
- high/medium/low-confidence routing;
- existing Case, new guided Case, lightweight Custom Case and Record outcomes;
- mandatory backend/AI title proposal, correction and no overwrite of confirmed title;
- multiple Managed Subjects and forbidden candidate leakage;
- app close/restart during every async stage;
- offline capture, retry, idempotency and duplicate confirm;
- partial batch failure;
- user correction of primary and additional links;
- visible-only confirmation semantics;
- future auto-routing abstention, undo and rollback gates.

Fixtures use synthetic documents and synthetic OCR/model responses. Real private
documents are not test fixtures.

## Stop Rules

Stop implementation if:

- global capture requires profile, Case, role or metadata forms before scanning;
- automatic matching can be disabled as a normal mode;
- selecting **Neuen Vorgang starten** leads to a blank mandatory title form;
- backend/Core Assist does not return an editable title proposal;
- a batch is treated as one Case merely because files arrived together;
- mobile capture allows a separate artifact to be intentionally appended as
  another page without an explicit warning/correction path;
- unrelated outliers are silently forced into the selected/new Case;
- processing blocks the app or loses state on restart;
- current-release Case/Record assignments become final without confirmation;
- a confirmation accepts hidden consequences;
- accepted documents end in an unexplained loose-document UX state;
- lightweight Custom Cases require fake tasks, dates or outcomes;
- confirmed titles or relationships are silently overwritten by reprocessing;
- sensitive titles/content appear in notifications, logs or telemetry;
- later automatic routing is enabled without class-specific quality evidence,
  abstention, undo and rollback.

## Intentionally Open

- exact capture-screen composition;
- tap, swipe or combined confirmation mechanics;
- exact batch-review visual layout;
- exact latency objectives until benchmark evidence exists;
- concrete OCR/LLM providers and model versions;
- release-specific automation thresholds and eligible document classes;
- whether existing-Case selection is exposed as a secondary pre-capture shortcut.

These open UI/provider details do not weaken the behavior and trust contract
above.
