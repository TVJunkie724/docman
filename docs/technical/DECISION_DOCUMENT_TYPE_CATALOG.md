---
title: "Decision - Document Taxonomy and Role Model"
description: "Mappm-Taxonomie mit minimal ausreichender Klassifikation, getrennten Dokumentgrundarten, Varianten, Domaenen, Record-Arten, Quellen und beziehungsbezogenen Rollen"
tags: [decision, document-types, subtypes, roles, metadata, records, workflows, intelligence]
lastUpdated: "2026-07-21"
status: "accepted-direction"
owner: "product-concept"
---

# Decision - Document Taxonomy and Role Model

## Status

The taxonomy axes, relationship-role model and the principle of **minimum
sufficient classification** are accepted. The complete set of document base
types/semantic variants and its full mapping to optional workflow patterns and
domain templates is not yet accepted and requires the R0.6 product review.
`docs/discovery/CASE_DOCUMENT_TAXONOMY_CANDIDATES.md` currently proposes a
reduced set of global base types and retains roughly 300 terms only as
normalization, alias, OCR and fixture vocabulary.

Workflow-Muster, Fachvorlagen-IDs, deutsche Case-Titel, Katalogstatus und
Disposition werden nicht in der Dokumenttaxonomie gepflegt. Deren alleinige
SSOT ist `DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`; dieses Dokument und der
Discovery-Entwurf referenzieren sie nur fuer Mapping und Kompatibilitaet.

The former mixed M2 catalog (`invoice`, `contract`, `health`, `authority`,
`evidence_photo`, `note_other`, etc.) is a historical seed only. It must not be
implemented as the final normalized taxonomy because it mixes semantic type,
domain, medium, Record meaning and fallback values.

## Decision

### Produktziel und minimale ausreichende Klassifikation

Mappm optimiert nicht auf taxonomische Vollstaendigkeit. Das Produkt soll
Dokumente eines Haushalts auffindbar und nutzbar machen, ihren fachlichen
Kontext erschliessen und daraus relevante Vorgaenge, Records, Aufgaben,
Fristen, erwartete Antworten und weitere Aktionen ableiten.

`Document` bleibt technisch ein eigenstaendiges Kernobjekt fuer Original,
Versionen, Suche, Provenienz und Verknuepfungen. Fuer die Nutzerin ist aber
nicht die moeglichst genaue Benennung jedes Dokuments das Ziel. Massgeblich ist
die **am wenigsten granulare stabile Klassifikation, die den benoetigten
Produktnutzen vollstaendig traegt**.

| Bedarf | Bevorzugte Abbildung |
|---|---|
| langlebige, spaeter gezielt benoetigte Unterlage | passender Record-Kind und nur die dafuer notwendige Dokumentgrundart |
| materiell anderes Matching, Workflowverhalten, Aufgabe, Frist, Zustand, Export- oder Handoff-Verhalten | bestehende Grundart, in begruendeten Faellen eine stabile Variante oder eine sparsame beziehungsbezogene Rolle |
| konkrete fachliche Bedeutung ohne eigenes Produktverhalten | generierter editierbarer Titel, extrahierte Facts, Parties, Volltextindex und Aliasvokabular |
| keine belastbare oder keine produktrelevante feinere Unterscheidung | bewusster allgemeiner beziehungsweise breiter Domain-Dokumenttyp oder `unknown`-Fallback |

Ein erkannter Begriff darf daher fuer Titel, Suche, Matching und Erklaerung
genutzt werden, ohne als persistierter Subtyp zu existieren. Beispielsweise
kann `Bewilligung Physiotherapie` ein allgemeines medizinisches Dokument mit
genau diesem Titel, bestaetigten Facts und der Rolle `response` oder `decision`
sein. Das System verliert dadurch keine fuer den Ablauf benoetigte Bedeutung.

Eine allgemeine oder breite Klassifikation ist kein Fehlerzustand und kein
qualitativ minderwertiger Fallback. Sie ist die beabsichtigte Zielabbildung,
wenn weitere Granularitaet weder Wiederauffindbarkeit noch Produktverhalten
verbessert. Die Nutzerin muss eine fachliche Feinheit nicht bestaetigen, wenn
Titel, Kontext und sichtbare Folge bereits eindeutig genug sind.

Mappm classifies a document across separate axes:

| Axis | Question | Example |
|---|---|---|
| document base type | Welche stabile fachliche Grundart hat das Dokument? | Rechnung/Charge, Entscheidung, Vertrag/Polizze, Report |
| optional semantic variant | Welche global stabile, produktrelevante Auspraegung liegt nach bestandenem Produktwerttest vor? | konkrete Kandidaten bleiben bis OQ-011 offen |
| domain | In welchem Fachbereich tritt es auf? | Gesundheit, Wohnen, Arbeit, Steuer |
| relationship role | Welche Funktion hat es in genau diesem Case/Claim/Record? | Ausloeser, Nachweis, Einreichung, Antwort, Entscheidung |
| Record kind | Welches langlebige Objekt/versioniert es? | Reisepass, Polizze, Mietvertrag |
| source/format | Wie kam es herein und welches Medium ist es? | Mobile Scan, PDF, Bildnachweis, E-Mail spaeter |
| jurisdiction/provider context | Welche gepruefte Variante ist anwendbar? | AT, konkrete SV/Versicherung/Behoerde |

These axes are not flattened into one global enum or user form.

Ein technischer Container wie ein ZIP-Medienpaket ist keine fachliche
Dokumentgrundart. Der kontextuelle medizinische Desktop-Archivimport verwendet
eine Quelle/Containerart wie `media_archive`; der bereits geoeffnete Care-Case,
Domain, Titel und Facts beschreiben die fachliche Bedeutung. DICOM, Roentgen,
CT, MRT,
mitgelieferter Viewer oder USB/CD werden dadurch nicht automatisch zu globalen
Dokumenttypen oder semantischen Varianten.

Der case-lokale Archivimport darf einen allgemeinen beziehungsweise breiten medizinischen
Dokumentkontext verwenden. Eine spaetere technische Vorschauunterstuetzung
aendert nicht die fachliche Taxonomie.

Zeitangaben sind strukturierte, provenienzgebundene Facts nach
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`, keine Dokumentgrundart und
normalerweise kein Grund fuer eine semantische Variante. `Laborbefund` oder
`Radiologiebefund` wird beispielsweise nur dann ein eigener globaler
Varianten-Key, wenn die Unterscheidung den unten definierten Produktwerttest
erfuellt; erkennbare Details duerfen sonst im Titel, in Facts und im Suchindex
bleiben.

## Base Type and Semantic Variant

Document base type is the stable semantic class used for search, display,
extraction and broad workflow compatibility. A semantic variant adds precision
only where it passes the following product-value gate across
countries/providers.

A new base type or semantic variant is justified only when all of these are
true:

1. It creates durable value through at least one of:
   - targeted later retrieval or use as a durable Record version;
   - materially different matching, extraction, workflow, task, deadline,
     expected response or state transition;
   - materially different retention, security, export, sharing or handoff.
2. Title, full text, Facts, Party, Domain, Record kind, relationship role or a
   country/provider alias cannot preserve that value sufficiently.
3. The distinction has stable semantics, a testable recognition/fallback path
   and does not require the user to understand specialist taxonomy.
4. Its benefit outweighs schema, migration, localization, AI-training,
   correction and UI complexity.

Display convenience, linguistic precision or explainability alone is not
enough. If the product behaves the same, the more specific term remains title,
Fact, alias or search vocabulary instead of becoming a subtype.

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

The same minimum-sufficient principle applies to slots. If a generic role plus
title/Facts drives the same behavior, no more precise workflow slot is added.

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

The product needs both intentional broad values and safe unknown/fallback
values. Their exact keys remain part of OQ-011, but their meanings must remain
distinct:

- a known general document whose finer classification has no product value;
- a known broad domain document, for example general medical correspondence;
- an actually unknown document base type;
- unknown semantic variant;
- no supported domain;
- generic relationship role/context;
- unknown Record kind.

One combined `note_other` value must not hide whether the unknown concerns type,
domain, medium or product support.

Unknown classification is reviewable and reprocessable. Intentional general
classification may remain final. Neither state justifies invented specificity
or a large mandatory form.

Named forms for Reha, Psychotherapy, authorization, travel costs or comparable
special cases remain `unknown`/generic or broad medical/general documents when
no accepted base type/variant adds durable product value. A concrete generated
title, extracted Facts and a sparse relationship/workflow role may preserve the
meaning without introducing one global type per form. Missing fine
classification never affects Case validity.

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

### Verbindlicher Check bei jedem neuen Vorgang

Bei jeder kuenftigen Case-/Workflow-Konzeption wird das vorkommende
Dokumentvokabular zuerst inventarisiert und jeder Begriff genau einer
bevorzugten Abbildung zugeordnet:

1. bestehende Dokumentgrundart oder bereits akzeptierte Variante;
2. allgemeines beziehungsweise breites Domain-Dokument;
3. Titel-, Alias-, OCR-, Such- oder Fixture-Vokabular;
4. extrahierter Fact oder Party;
5. beziehungsbezogene Rolle beziehungsweise Workflow-Slot;
6. langlebiger Record-Kind;
7. technisches Source-/Formatmerkmal.

`Neuer Dokumenttyp` ist nie die Standardantwort. Er ist nur nach bestandenem
Produktwerttest zulaessig. Ein Case-Konzept darf eine fachliche Dokumentliste
zur Szenarioabdeckung fuehren, aber daraus keine Typenliste ableiten.

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
- fuer jeden vorgeschlagenen Typ und jede Variante einen dokumentierten
  Produktwerttest sowie die bewusst generisch belassenen Gegenbeispiele;
- je Case-/Workflow-Familie die Zuordnung ihrer Begriffe zu Typ, Titel/Alias,
  Fact, Rolle, Record oder Source/Format statt einer Subtyp-Ableitung.

## Stop Rules

Stop if:

- the historical M2 table is treated as the final catalog;
- domain, medium, Record kind and semantic type are mixed in one enum;
- one global role is stored on Document;
- every workflow detail becomes a universal role;
- a document term becomes a type or subtype only because it is fachlich
  recognizable, appears in one Case family or allows a more exact label;
- AI/OCR precision is persisted as taxonomy although title, Facts, role and
  search index would preserve the same product value;
- a Case concept derives document types directly from its scenario document
  list without the minimum-sufficient product-value gate;
- base-type/variant selection becomes a large default capture form;
- AI type/title output becomes final without the active review/automation gate;
- country/provider rules are encoded in global document-type keys;
- implementation starts before the dedicated complete-catalog review is
  accepted.
