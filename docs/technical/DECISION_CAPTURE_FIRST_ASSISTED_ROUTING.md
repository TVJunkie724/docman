---
title: "Decision - Capture-First Assisted Document Routing"
description: "Verbindliches Mappm-Zielmodell fuer globales Capture, asynchrone typabhaengige Assist-Vorbelegung, konservative Titel, best-effort Case-/Record-Ranking und menschliche Bestaetigung"
tags: [decision, product, capture, intelligence, ocr, routing, review, cases, records, batch, titles]
lastUpdated: "2026-07-25"
status: "accepted-rebaseline"
owner: "product-concept"
---

# Decision - Capture-First Assisted Document Routing

## Status und Wirkung

Accepted as the product direction on 2026-07-15 and clarified on
2026-07-25 against the Intelligence contract in
`DECISION_INTELLIGENCE_SCOPE.md`. Where older decisions describe OCR/AI,
batch processing, title suggestions or mobile review as optional later
additions, this decision is authoritative for the Commercial Core. It does not
promise deep semantic interpretation, subject-conflict detection or
relationship inference.

Concrete UI composition, gestures, screen layouts and wording remain a later
UI-concept and usability decision. The product behavior, trust boundaries and
processing states in this decision are normative.

## Product Principle

Mappm is capture-first:

> Der Nutzer erfasst ein Dokument. Mappm liest und klassifiziert es grob,
> bereitet einen konservativen Titel und passende Ablagekandidaten vor und
> laesst die fachliche Einordnung einfach bestaetigen oder korrigieren.

The user must not be required to understand or manually configure document
roles, workflow branches, Case relations, extraction fields or routing
rules before capture. A product that replaces paper sorting with large forms
has missed its purpose.

The normal current-release flow is:

```text
open global capture in visible Managed-Subject context
  -> scan/import document material
  -> local quality and durability check
  -> asynchronous backend/Core Assist processing
  -> best result prepared
  -> user reviews the relevant visible result
  -> user confirms or corrects
  -> document becomes accepted in its primary context
```

Capture from inside a Case or Record remains supported as a secondary path for
deliberate additions. It may expose context-specific capture capabilities, for
example a named accident photo collection or the accepted desktop-only
medical media-package import. It is not the assumed everyday ingestion route.

## Managed Subject beim Capture

Jede Capture-Einheit beginnt in einem sichtbaren Managed-Subject-Kontext:

- Bei nur einem relevanten Profil darf dieses sichtbar vorausgewaehlt sein.
- Bei mehreren verwalteten Personen/Organisationen waehlt oder bestaetigt die
  Nutzerin den betroffenen Kontext zu Beginn beziehungsweise startet Capture
  bereits aus dessen Profil.
- Case-/Record-scoped Capture erbt den bestaetigten Managed Subject des
  Kontextes und verlangt keine erneute Auswahl, bis die Nutzerin ihn bewusst
  aendert.
- Ein Subject-Wechsel waehrend einer Multi-Dokument-Session gilt nur fuer
  ausdruecklich danach erfasste Dokumente.

Die Nutzerangabe ist bestaetigte Provenienz und beschreibt den gewuenschten
Verwaltungs-/Relevanzkontext. Sie muss nicht mit gedrucktem Empfaenger,
genannter, versicherter, behandelter oder zahlender Person uebereinstimmen.
Ein an Person A adressiertes Haushaltsdokument darf bewusst unter Person B oder
im gemeinsamen Haushaltskontext verwaltet werden.

Assist erzeugt daraus keinen Profilkonflikt, keine Wrong-Profile-Warnung und
keine automatische Umordnung. Namen und Empfaenger duerfen als optionale
Metadatenkandidaten erkannt werden, bestimmen aber weder Managed Subject noch
Berechtigung oder Routing.

Das ist ein kompakter Kontextschritt beziehungsweise ein sichtbarer
vorbelegter Subject-Indikator, kein allgemeines Metadatenformular.

## Optionale bekannte Informationen bei der Erfassung

Automatic analysis and matching are always active. They are not a selectable
capture mode.

Global capture remains immediately usable without a Case-, role-, taxonomy- or
metadata form. Der sichtbare Managed-Subject-Kontext ist die einzige globale
Pflichtachse und darf sinnvoll vorbelegt sein. While capturing and before
leaving the flow, the user may optionally provide only information they
already know, including:

- document base type and a useful semantic subtype/variant;
- confirmed facts such as `paid` or a request to review the document for a tax
  collection context;
- a correction of the current Managed Subject or managed organization;
- a coarse fachlicher context or routing variant;
- explicit intent to start a new Case;
- a deliberate assignment to an existing Case.

These are independent product-data axes, not a required sequence and not a
decision about exact labels, controls or screen composition. Progressive
disclosure may expose only contextually useful axes. A large taxonomy picker,
blank title form or mandatory pre-classification is prohibited.

User-provided values retain user provenance. Assist may fill missing coarse
data, but does not semantically police or silently overwrite the supplied
context. All supported automatic processing remains active regardless of
supplied information:

- OCR, coarse document/domain classification and simple metadata candidates;
- automatic title generation;
- duplicate and existing-context checks;
- coarse Case-/Record ranking.

Explicit new-Case intent is a strong request for a new primary Case, but it
does not suppress duplicate or coarse existing-context ranking. Existing-Case
selection is equally optional and remains authoritative until the user changes
it. Case-scoped capture already supplies that context when the user
intentionally enters through a Case; Assist does not later flag this as a
semantic wrong-Case error. Exact default visibility remains a later
UI/usability decision.

## Progressive Asynchronous Processing Contract

Reliable Case matching requires enough document content to be available. The
pipeline therefore runs after durable capture and may take seconds or minutes,
depending on page count, scan quality, language, document complexity, provider
latency, retries and selected processing capabilities.

One to two minutes is a valid UX scenario, not a timeout assumption. Exact
service-level targets must be established from production-like benchmarks and
must include median and tail latency. The app must never require the user to
keep a blocking spinner open while processing. Die sichtbare Warte- und
Background-Erfahrung folgt
`../concepts/CONCEPT_F38_ASYNC_PROCESSING_WAIT_EXPERIENCE.md`.

Conceptual pipeline:

```text
durably capture original material
  -> persist optional user-provided context/facts with provenance
  -> validate technical file/page integrity and scan quality
  -> upload or queue according to Vault mode
  -> normalize the user-declared logical document
  -> generate preview
  -> parse layout/text and run OCR where required
  -> classify broad document base type and coarse domain
  -> extract simple text/value candidates with source locations
  -> update searchable index artifacts
  -> retrieve and rank coarse Case/Record candidates
  -> propose one conservative title and only relevant simple values
  -> prepare a reviewable result
```

Stages may run concurrently where their dependencies allow. Productseitig
wird zwischen zwei Ergebnisreifestufen unterschieden:

1. **Fruehe Extraktion** darf fuer geeignete, vom Backend belegte
   Dokumentklassen breite Dokumentart, grobe Domain, einen wahrscheinlichen
   Gesamtbetrag, einfache Datums-/Referenzkandidaten und einen ersten Titel
   vorschlagen.
2. **Spaeteres Ranking** ergaenzt vollstaendigen durchsuchbaren Text und grobe
   Case-/Record-Kandidaten. Es verspricht keine Beziehung, Kausalitaet,
   betroffene Person, Workflowrolle, erwartete Antwort oder semantische
   Fehlererkennung.

Hat die Nutzerin Typ, Subject, Case oder andere Facts bereits angegeben,
werden diese nicht erneut als konkurrierende Defaults behandelt. Die Analyse
fuellt nur fehlende Vorschlagswerte; sie meldet keine semantischen
Widersprueche zwischen Text und Userabsicht.

Indexing and full semantic search may continue after an early proposal. Jede
Proposal-Stufe ist versioniert und provenienztragend; eine spaetere Stufe darf
fruehere bestaetigte Werte nicht ueberschreiben. Welche Stufen und Latenzen im
aktuellen Zielrelease verlaesslich sind, bleibt BF-001/BF-002/BF-012 im
`../execution/handoffs/DOMAIN_BACKEND_FEASIBILITY_REGISTER.md`.

Conceptual states include:

```text
captured locally
queued for transfer or processing
uploading / transferred
scan quality hint available
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
complexity. Mappm promises a safe, fast correction path, not infallible AI or
semantic error detection.

Fast local checks should detect conditions such as:

- missing or cut-off page regions;
- unreadable blur;
- severe glare or shadow;
- exact/near-exact duplicate pages where a technical detector supports it;
- unexpected orientation;
- unsupported or corrupt files.

Where possible, a likely defective scan is surfaced before expensive remote
processing as non-blocking guidance. The user may rescan, deliberately
continue, remove a page or cancel. Only a technical corruption, unsupported
format or failed durable import may block acceptance. One defective item in a
batch must not discard successfully captured items.

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
- ein importiertes PDF, das Rechnung und Zahlungsnachweis desselben
  Sachverhalts enthaelt, darf im aktuellen Zielrelease nur dann als ein
  Dokument mit mehreren Rollen/Facts angenommen werden, wenn Backend und Data
  diese Analyse fuer den Zielrelease ausdruecklich freigeben;
- enthaelt eine Datei mehrere unabhaengige Dokumente oder Sachverhalte, bleibt
  sie im aktuellen Zielrelease ein logisches, gegebenenfalls generisch
  behandeltes Dokument; sie wird weder automatisch aufgeteilt noch deswegen
  abgelehnt oder `invalid`;
- ein mutmasslicher inhaltlicher Seitenwechsel ist in M1 keine
  Scanqualitaetswarnung und kein verpflichtender Segmentierungsworkflow.

The processing pipeline must:

- retain original source artifacts and page order;
- persist each explicit document boundary before the next document begins;
- process and match each logical document independently;
- use the common capture session only as a weak contextual signal;
- cluster compatible results for efficient review;
- permit page reorder and document reassignment without destructive rewriting;
- preserve traceability from each logical document to its original pages/files.

The system must not depend on AI to separate an intentionally mixed paper stack
after capture. Efficient repeated scanning comes from closing one document and
immediately starting the next while keeping the shared session/queue.

Ein spaeteres Release darf eine reversible Import-Segmentierung nur nach
eigenem Backend-/Data-/UX-Contract einfuehren. Sie ist kein stiller Bestandteil
des aktuellen Capture-Vertrags.

If a shared new-Case intent or existing-Case assignment was supplied, it is a
strong user signal. Mappm does not semantically police this choice. Weitere
Case-/Record-Kandidaten duerfen best-effort vorgeschlagen werden, aber eine
bewusste Zuordnung wird weder als Wrong-Case noch als Outlier markiert.
Document-level user values apply only to the logical document for which they
were supplied unless the user explicitly applies them more broadly.

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

It does not require tasks, appointments, a workflow definition or an
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
- stable reference, contract, damage or external case identifiers where safe
  and useful;
- matched Record or Case context;
- the selected coarse domain or bestaetigten Case-/Record-Kontext.

Titles must be useful for scanning and enterprise search, avoid fabricated
facts, enthalten standardmaessig kein Datum and remain editable. Sensitive
details must not leak into push
notifications, logs, analytics or lock-screen text. Generic fallback titles are
allowed only when evidence is insufficient and must remain easy to correct.

The result contract must distinguish the suggested title and its provenance
from a user-confirmed title. Later reprocessing may propose an improved title
but may not silently overwrite a confirmed one.

## Automatic Proposals Beyond Titles

Backend/Core Assist processing prepares the best currently supported
proposals. Core scope includes:

- document base type and optional semantic variant;
- coarse domain;
- sender or issuer where sufficiently supported;
- typabhaengig relevante Datums-/Zeitfelder mit semantischem Top-Kandidaten,
  erkannten Alternativen und manuellem Fallback;
- relevante Referenzen und fuer Rechnungen einen wahrscheinlichen
  Gesamtbetrag;
- primary Case or Record;
- a new lightweight Custom or guided Case when no existing context fits.

Nicht als verlaesslicher Pflichtoutput vorausgesetzt werden Managed Subject,
Empfaenger, fehlerfreie Datumsabdeckung, rechtliche oder vertragliche
Fristberechnung, erwartete Antwort, Workflowrolle/-slot, Lebenssachverhalt,
Kausalitaet oder Beziehung. Wahrscheinliche Datumsbedeutungen duerfen als
sichtbar korrigierbare Feldvorbelegung vorgeschlagen werden.
Zusaetzliche Cases/Records und Case-Beziehungen duerfen best-effort
vorgeschlagen werden, wenn der konkrete Feasibility-Nachweis dies traegt.
Jede solche Zuordnung bleibt bestaetigungspflichtig und besitzt Suche sowie
manuelle Verknuepfung als Fallback.

Routing and matching have only Cases and Records as fachliche target objects.
Mappm has no Claim target. A concrete insurance handling context is proposed
as a normal `insurance_settlement`-Case; an individual submission or
resubmission remains an event in that Case and is never another matching
container.

"Automatically prepared" does not mean "automatically finalized" in the first
release maturity. External submissions, cancellations, payments, sharing and
other consequential actions remain explicit user actions in every maturity.

## Matching and Ranking

Case/Record matching is document-first and uses available confirmed or simple
signals before broader semantic similarity. Candidate evidence may include:

1. ausdruecklich gewaehlter Case/Record oder neue-Case-Absicht;
2. sichtbarer User-/Managed-Subject-Kontext;
3. bestaetigte stabile Referenzen;
4. grobe Dokumentart beziehungsweise Variante und Domain;
5. einfach erkannter Aussteller, Gesamtbetrag und bestaetigte beziehungsweise
   vorgeschlagene typrelevante Zeitwerte;
6. Volltext-/semantische Aehnlichkeit als schwaches Signal;
7. previously confirmed Facts, links and Records in the same authorized
   context; M1 does not learn a model or user pattern from correction history.

Session proximity alone is never a strong enough reason to merge documents.
The matcher may propose multiple Case/Record links because one document can be
evidence in several contexts without file duplication.

Abgeschlossene und archivierte Cases bleiben zulaessige Kandidaten. Ein
spaeteres Dokument darf als weitere Evidenz verknuepft werden, ohne den Case
automatisch wieder zu oeffnen. Wenn das Dokument neue Arbeit ausloest oder ein
bestaetigtes Ergebnis materiell aendert, bereitet Mappm eine bestaetigbare
Wiedereroeffnung oder einen neuen verknuepften Case vor. Die Lifecycle-Regeln
aus `DECISION_CASE_DOCUMENT_RECORD_MODEL.md` bleiben massgeblich.

Fuer Medical M1 gilt die engere Kompositionsregel aus
`DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`: Ein neuer verknuepfter
Care-/Cost-Case entsteht aus genau einem bestaetigten Ankerdokument oder einer
ausdruecklichen Nutzerabsicht. Jedes weitere Dokument wird eigenstaendig gegen
bestehende und neue Kontexte gerankt und bestaetigt. Eine sichtbare gemeinsame
Review-Aktion darf mehrere vorbereitete Einzelzuordnungen bestaetigen, ersetzt
aber keine freie Mehrfachdokument-Auswahl zur nachtraeglichen Bildung eines
medizinischen Subvorgangs.

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
- additional Case/Record relations are confirmed when proposed;
- verwendete Facts, ihre Bedeutung und materielle Folgen werden sichtbar
  bestaetigt;
- harmlose, interne und reversible Aufgaben oder erwartete Antworten, die
  deterministisch aus bereits bestaetigten Facts entstehen, benoetigen keine
  zweite Bestaetigung;
- Wiedereroeffnung, bewusstes Geschlossenlassen oder ein neuer verknuepfter
  Case werden als unterschiedliche bestaetigbare Folgen behandelt;
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
3. Gibt es eine folgenreiche Entscheidung?

Known sender details, unchanged provider data, internal workflow keys,
technical metadata and ungenutzte Extraktionskandidaten remain hidden unless
the user opens details. For example, a known doctor already implied by the
confirmed Case need not be restated. Datumsdetails duerfen alle erkannten
Kandidaten fuer eine bewusste semantische Zuordnung anbieten.

Eine Frist, ein externer Schritt oder eine andere materielle Folge muss sichtbar
sein, bevor die Nutzeraktion sie bestaetigt. Progressive disclosure must never
hide a fact whose confirmation is being requested.

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
- reassignment and boundary-error corrections;
- cancellation, retry and safe failure.

## Privacy, Security and Trust

Original files, pages, OCR text, extracted facts, embeddings, candidate matches,
titles and model inputs/outputs are sensitive data.

- Logs and diagnostics contain IDs/reference codes, not document contents.
- Notifications use privacy-safe wording by default.
- Provider, purpose, retention, training prohibition, region and deletion rules
  follow the accepted Assist/trust decisions.
- Corrections are not model-training consent. M1 contains no document donation,
  human analysis-improvement review, online learning or production-data
  fine-tuning flow.
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
- related and unrelated mixed batches;
- target-release-approved same-context invoice/payment-proof import sowie
  gemischte Ein-Datei-Inhalte ohne Ablehnung, Invalidierung oder Auto-Split;
- correction of a wrong manual boundary without destructive rewriting;
- high/medium/low-confidence routing;
- existing Case, new guided Case, lightweight Custom Case and Record outcomes;
- sichtbarer, vorausgewaehlter, geerbter und korrigierter Managed-Subject-
  Kontext sowie optionale Userangaben fuer Typ/sinnvollen Subtyp, bestaetigte
  Facts, grobes Routing, neuen und bestehenden Case;
- mandatory backend/AI title proposal, correction and no overwrite of confirmed title;
- multiple Managed Subjects and forbidden candidate leakage;
- app close/restart during every async stage;
- offline capture, retry, idempotency and duplicate confirm;
- partial batch failure;
- user correction of primary and additional links;
- Medical: ein Ankerdokument oder ausdrueckliche Absicht fuer einen neuen
  verknuepften Case, danach dokumentweise Zuordnung und kein freier M1-Bulk-Split;
- spaete Evidenz fuer einen abgeschlossenen/archivierten Case ohne automatische
  Wiedereroeffnung sowie bestaetigte Wiedereroeffnung bei neuer Arbeit;
- visible-only confirmation semantics;
- bestaetigter unbezahlter Zahlstatus mit direkt abgeleiteter, editierbarer
  Zahlungsaufgabe ohne zweite Bestaetigung;
- future auto-routing abstention, undo and rollback gates.

Fixtures use synthetic documents and synthetic OCR/model responses. Real private
documents are not test fixtures.

## Stop Rules

Stop implementation if:

- global capture requires a blocking profile metadata form, Case, role or
  general metadata form before scanning instead of the compact visible
  Managed-Subject context;
- optional known information is turned into a mandatory sequence, large
  taxonomy picker or substitute for automatic analysis;
- automatic matching can be disabled as a normal mode;
- selecting **Neuen Vorgang starten** leads to a blank mandatory title form;
- backend/Core Assist does not return an editable title proposal;
- a batch is treated as one Case merely because files arrived together;
- mobile capture allows a separate artifact to be intentionally appended as
  another page without an explicit warning/correction path;
- der aktuelle Zielrelease zerlegt ein importiertes Mischdokument automatisch
  auf mehrere Dokumente oder Cases;
- semantisch gemischter Inhalt eine M1-Ablehnung, Invalidierung oder
  verpflichtende Trennung erzeugt;
- processing blocks the app or loses state on restart;
- current-release Case/Record assignments become final without confirmation;
- mehrere vorhandene Medical-Dokumente als frei zusammengestelltes Paket einen
  neuen Subvorgang erzeugen, statt einzeln bestaetigter Dokumentlinks;
- ein spaeteres Dokument einen abgeschlossenen oder archivierten Case still
  wiedereroeffnet;
- a confirmation accepts hidden consequences;
- accepted documents end in an unexplained loose-document UX state;
- lightweight Custom Cases require fake tasks, dates or outcomes;
- confirmed titles or relationships are silently overwritten by reprocessing;
- any user-provided type, subtype, fact or context is silently overwritten by
  Assist instead of retained or reconciled through review;
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
- exact default visibility, ordering and controls for the accepted optional
  known-information axes.

These open UI/provider details do not weaken the behavior and trust contract
above.
