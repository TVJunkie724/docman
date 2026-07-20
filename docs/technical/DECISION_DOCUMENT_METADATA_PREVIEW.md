---
title: "Decision - Document Metadata, Generated Titles and Preview"
description: "Entscheidung zu Backend-/Assist-vorgeschlagenen Dokumentmetadaten, bestaetigten Werten, primaerem Kontext und asynchroner Vorschau"
tags: [decision, documents, metadata, title, preview, intelligence, review]
lastUpdated: "2026-07-20"
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
the semantic result; the user reviews only relevant visible consequences.

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
- no unresolved hard quality/duplicate/security/context conflict.

Semantic variant, domain, additional links and workflow role/slot follow the
taxonomy and may remain proposed when they do not block a selected
workflow/action.

## Backend/Core Assist Proposals

Processing proposes where supported:

- localized Document, new-Case and new-Record titles;
- document base type/semantic variant/domain;
- sender/issuer/recipient/provider;
- dates, references, amounts, deadlines and expected responses;
- primary/additional Case, Record and Claim links;
- workflow/document-role/next-action candidates.

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
- split/merge: preview preserves mapping to original source pages/files.

Preview is derived data. It may be deleted/rebuilt without altering the
original, confirmed metadata or document history.

## Optional and Contextual Metadata

Facts such as sender, date, amount, due date, tags, notes and secondary links do
not become universal mandatory fields. A selected workflow may require one for
a visible next action; otherwise missing values do not block review.

The default review does not show every extracted field. Known implicit facts
remain in details unless they conflict or change subject, routing, deadline,
permission, payer or next action.

## Taxonomy Boundary

Base type, semantic variant, domain, Record kind, source/format and relationship
role remain separate axes under `DECISION_DOCUMENT_TYPE_CATALOG.md`.
Preview/metadata must not flatten them into a single legacy type or
unstructured map.

## Verification

Cover generated title accept/edit/reprocess protection, preview pending/failure/
rebuild, poor scan, multi-page/source traceability, visible-only confirmation,
optional facts, Medienpaket mit manuellem Titel/optionalem Datum ohne
Preview/Ausfuehrung und primary Case/Record completion using synthetic
fixtures.

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
