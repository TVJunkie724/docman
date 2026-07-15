---
title: "Decision - Document Taxonomy and Role Model"
description: "Mappm-Taxonomie fuer getrennte Dokumentgrundarten, semantische Varianten, Domaenen, Record-Arten, Quellen und beziehungsbezogene Rollen; der vollstaendige Produktkatalog bleibt offen"
tags: [decision, document-types, subtypes, roles, metadata, records, workflows, intelligence]
lastUpdated: "2026-07-15"
status: "accepted-direction"
owner: "product-concept"
---

# Decision - Document Taxonomy and Role Model

## Status

The taxonomy axes and relationship-role model are accepted. The complete set of
document base types/semantic variants and its full mapping to optional workflow
patterns and domain templates is not yet accepted and requires the R0.6 product
review.
`docs/discovery/CASE_DOCUMENT_TAXONOMY_CANDIDATES.md` currently proposes a
reduced set of global base types and retains roughly 300 terms only as
normalization, alias, OCR and fixture vocabulary.

The former mixed M2 catalog (`invoice`, `contract`, `health`, `authority`,
`evidence_photo`, `note_other`, etc.) is a historical seed only. It must not be
implemented as the final normalized taxonomy because it mixes semantic type,
domain, medium, Record meaning and fallback values.

## Decision

Mappm classifies a document across separate axes:

| Axis | Question | Example |
|---|---|---|
| document base type | Welche stabile fachliche Grundart hat das Dokument? | Rechnung/Charge, Entscheidung, Vertrag/Polizze, Report |
| optional semantic variant | Welche global stabile, produktrelevante Auspraegung liegt vor? | Gutschrift, Entlassungsbrief, Laborbefund, Einspruch |
| domain | In welchem Fachbereich tritt es auf? | Gesundheit, Wohnen, Arbeit, Steuer |
| relationship role | Welche Funktion hat es in genau diesem Case/Claim/Record? | Ausloeser, Nachweis, Einreichung, Antwort, Entscheidung |
| Record kind | Welches langlebige Objekt/versioniert es? | Reisepass, Polizze, Mietvertrag |
| source/format | Wie kam es herein und welches Medium ist es? | Mobile Scan, PDF, Bildnachweis, E-Mail spaeter |
| jurisdiction/provider context | Welche gepruefte Variante ist anwendbar? | AT, konkrete SV/Versicherung/Behoerde |

These axes are not flattened into one global enum or user form.

## Base Type and Semantic Variant

Document base type is the stable semantic class used for search, display,
extraction and broad workflow compatibility. A semantic variant adds precision
only where it produces real product value across countries/providers.

A semantic variant is justified only when it is globally understandable, is
not already represented by another axis and changes one or more of:

- expected facts/evidence;
- compatible workflow pattern/domain template;
- matching and document-boundary recognition;
- next action or expected response;
- retention/export/presentation;
- explainability to the user.

Semantic variant must not encode temporary workflow state, provider, country,
sender, format or Case role. A phrase such as `OeGK-Wahlarztrechnung 2026`
therefore resolves to a financial base type plus Medical Domain, local aliases,
Payer/Party, Facts, link roles and pack context, not one subtype.

Backend/Core Assist proposes base type and semantic variant. The user corrects
through a small relevant choice surface; the default flow does not expose a
full taxonomy form.

## Domain

Domain is orthogonal. `invoice` can occur in health, housing, purchase, work or
tax contexts. `health` therefore must not remain a top-level type equivalent to
`invoice`.

A document may have one primary domain and additional contextual domains where
needed, but domain alone does not select a jurisdictional workflow or prove a
Case relation.

## Relationship Roles

A role describes what a document does in a specific relationship, not what the
document is globally.

The same document may be:

- `decision` in one Case;
- `evidence` in a linked benefit Case;
- `context` in an accident Case;
- a version/source of one durable Record.

Roles therefore belong on link/slot objects such as `DocumentCaseLink`,
Claim/evidence links or Record-version relations. They do not belong as one
global mutable field on `Document`.

Sparse universal role vocabulary may include:

- `trigger`;
- `evidence`;
- `submission`;
- `response`;
- `decision`;
- `confirmation`;
- `payment_proof`;
- `context`.

Workflow-specific slots may be more precise, for example
`primary_payer_decision` or `repair_estimate`, only when the precision changes:

- workflow completeness;
- expected response;
- next action;
- grouping/display;
- export/handoff;
- explainability.

Users do not normally configure technical role/slot keys. Backend/Core Assist
proposes them from document content and the selected workflow; current material
consequences remain reviewable.

## Record Kind

Record kind classifies the durable object, not the incoming file. A passport
scan may have a document base type/semantic variant and simultaneously become
the current version of `Record(kind=passport)`. Contracts, policies, identity
records and warranties follow the same distinction.

Record kind controls versioning/validity behavior only where explicitly
defined. It must not be used as a substitute for document base type or
workflow.

## Fallback and Unknown Values

The product needs safe unknown/fallback values, but they must be axis-specific:

- unknown document base type;
- unknown semantic variant;
- no supported domain;
- generic relationship role/context;
- unknown Record kind.

One combined `note_other` value must not hide whether the unknown concerns type,
domain, medium or product support.

Unknown classification is reviewable and reprocessable. It does not justify
invented specificity or a large mandatory form.

## Relationship to Cases and Workflows

- Document base type/variant narrows compatible templates but does not hardcode
  one.
- The `Case` entity remains generic. Optional workflow pattern, domain template
  and pack describe guided behavior, the visible user goal and local rules.
- Relationship role/slot explains the document's function in that Case/Claim.
- A lightweight Custom Case may accept documents before a guided workflow is
  known.
- If a Custom Case later adopts a compatible guided workflow, Backend/Core
  Assist proposes more precise slots without losing prior links/history.
- Country/provider rules live in versioned workflow packs, not in global type
  keys.

## Capture and Title Behavior

Backend/Core Assist proposes base type, semantic variant, roles and a localized
editable title as part of every capture result. Title is not derived by merely
exposing the taxonomy label; it uses actual document/context evidence according
to `DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`.

## Required Next Review

Before implementation locks a catalog, product discovery must review:

- the proposed global base-type/semantic-variant set against the complete raw
  terminology inventory;
- the proposed minimal workflow patterns and all visible domain templates;
- durable Record kinds;
- universal versus jurisdiction/provider-specific values;
- role/slot coverage per workflow;
- unknown/fallback and migration behavior;
- synthetic fixtures and ambiguity cases;
- localization, accessibility and search terminology;
- stable keys/versioning/deprecation policy.

## Stop Rules

Stop if:

- the historical M2 table is treated as the final catalog;
- domain, medium, Record kind and semantic type are mixed in one enum;
- one global role is stored on Document;
- every workflow detail becomes a universal role;
- base-type/variant selection becomes a large default capture form;
- AI type/title output becomes final without the active review/automation gate;
- country/provider rules are encoded in global document-type keys;
- implementation starts before the dedicated complete-catalog review is
  accepted.
