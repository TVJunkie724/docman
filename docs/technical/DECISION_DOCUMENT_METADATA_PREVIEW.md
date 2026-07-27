---
title: "Decision - Document Metadata, Generated Titles and Preview"
description: "Entscheidung zu Backend-/Assist-vorgeschlagenen Dokumentmetadaten, bestaetigten Werten, primaerem Kontext und asynchroner Vorschau"
tags: [decision, documents, metadata, title, preview, intelligence, review]
lastUpdated: "2026-07-25"
status: "accepted-rebaseline"
owner: "product-concept"
---

# Decision - Document Metadata, Generated Titles and Preview

## Status

Accepted and rebaselined for Commercial Core on 2026-07-15. Blank manual
metadata forms and OCR-later assumptions are superseded.

## Decision

Each captured logical Document carries technical metadata, proposed semantic
metadata and confirmed semantic values separately. Backend/Core Assist prepares
bounded candidates; user action, confirmed facts and versioned rules establish
semantic meaning. The user reviews only relevant visible consequences.

## Required Accepted-Document Meaning

Before review completes, an accepted Document has:

- stable Document/File identity and readable original or accepted fallback;
- source/capture provenance and timestamps;
- preview status;
- automatically proposed and confirmed editable title;
- confirmed document base type at the supported taxonomy level;
- confirmed Managed Subject;
- confirmed primary Case or Record context;
- review/processing provenance;
- no unresolved technical quality/duplicate/security conflict.

Semantic variant and domain follow the taxonomy and may remain proposed.
Additional links and workflow role/slot are optional candidates only after
their feasibility gate; a selected contextual action may establish its
explicit role directly.

## Backend/Core Assist Proposals

Processing proposes where supported:

- conservative localized Document, new-Case and new-Record titles without a
  default date;
- coarse document base type/domain and only product-approved semantic variants;
- sender/issuer where sufficiently supported; recipient may remain empty and
  never replaces Managed Subject;
- type-dependent date/time fields with a semantic top candidate, detected
  alternatives and manual fallback; references and for invoices one likely
  total amount;
- primary Case/Record ranking;
- optional additional Case/Record links or relations only after a named
  feasibility gate and with user confirmation.

Free model output does not reliably propose Managed Subject, legally or
contractually binding deadlines, expected responses, workflow/document roles,
next actions, causality or semantic document validity. It may prefill
product-defined typed date fields as reviewable proposals. Active meanings and
material consequences come from visible user review, confirmed facts or
versioned rules.

Confirmed values are not overwritten by later reprocessing. Every proposal
retains source/provenance and sensitivity appropriate to its use.

## Preview Rules

Preview is required review evidence where the format is supported. Unsupported
content uses safe package metadata and original-access/export affordance
instead. Preview generation remains asynchronous and recoverable:

- PDF: representative page/thumbnail and later multi-page navigation according
  to phase scope;
- images: safe image preview;
- mobile scan: page/document preview;
- case-lokales medizinisches ZIP-Medienpaket: M1 zeigt den manuell vergebenen
  Titel, ein optional manuell erfasstes Datum und automatisch erzeugte
  technische Paketmetadaten sowie `Unsupported` statt automatischer
  Extraktion, DICOM-Darstellung oder Programmausfuehrung;
- pending/failed: stable placeholder and access to safe original fallback where
  supported;
- any later explicitly approved segmentation/recomposition preserves mapping
  to original source pages/files; the current release does not automatically
  split an imported file across logical Documents or Cases.

Preview is derived data. It may be deleted/rebuilt without altering the
original, confirmed metadata or document history.

## Optional and Contextual Metadata

Facts such as sender, date, amount, due date, tags, notes and secondary links do
not become universal mandatory fields. A selected workflow may require one for
a visible next action; otherwise missing values do not block review.

The default review does not show every extracted field. Each supported
base type/variant defines its few relevant review fields. A date field shows
its semantic top candidate and offers other detected dates, no-date and
manual-entry choices; remaining candidates and known implicit facts stay in
details unless the user opens them or intentionally uses them for a visible
consequence. Document names/recipients do not create a Managed-Subject
conflict.

## Taxonomy Boundary

Base type, semantic variant, domain, Record kind, source/format and relationship
role remain separate axes under `DECISION_DOCUMENT_TYPE_CATALOG.md`.
Preview/metadata must not flatten them into a single legacy type or
unstructured map.

## Verification

Cover generated title accept/edit/reprocess protection, preview pending/failure/
rebuild, poor scan, multi-page/source traceability, visible-only confirmation,
type-dependent date prefill with alternatives/no-date/manual entry, mixed
semantic content without invalidation/rejection/split, Medienpaket mit manuellem
Titel/optionalem Datum ohne Preview/Ausfuehrung und primary Case/Record
completion using synthetic fixtures.

## Stop Rules

Stop if:

- title is a blank mandatory field instead of Backend/Core Assist proposal,
  except for the explicitly manual title of the case-local medical M1 media
  package;
- preview failure deletes/invalidates the original;
- confirmed values are silently replaced by reprocessing;
- every extracted fact becomes a blocking form field;
- accepted review has no primary Case/Record;
- taxonomy axes are flattened into one metadata enum/map.
