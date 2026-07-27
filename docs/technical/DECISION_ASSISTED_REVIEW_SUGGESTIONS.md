---
title: "Decision - Assisted Review Suggestions"
description: "Entscheidung zu Backend-/Core-Assist-Vorschlaegen fuer Titel, Dokumentfakten, Case-/Record-Routing, Workflows und sichtbare Human-in-the-loop-Bestaetigung"
tags: [decision, assisted-review, ocr, ai, title, routing, suggestions, privacy]
lastUpdated: "2026-07-25"
status: "accepted-rebaseline"
owner: "product-concept"
---

# Decision - Assisted Review Suggestions

## Status

Accepted and rebaselined on 2026-07-15. Assisted Review and automatic title/
routing proposals are Commercial Core capabilities, not a later R5-only add-on.

## Decision

Backend/Core Assist automatically prepares the best supported review result.
Current-release domain assignments and material consequences remain human-
confirmed. The user reviews a concise result, not a raw extraction form.

Suggestions are:

- versioned and attributable to rule/model/OCR/linked evidence;
- distinguishable from confirmed facts;
- correctable and rejectable;
- safe to reprocess without overwriting confirmed values;
- filtered by permissions and sensitivity;
- presented through progressive disclosure.

Known values supplied during capture, such as base type/useful subtype,
`paid`, tax-review intent, Managed Subject, coarse routing or a new/existing
Case, are user-provenance inputs rather than model suggestions. Assist may
complete missing coarse values, but never semantically police, silently demote
or replace them.

## Mandatory Title Suggestion

Every captured logical Document and every proposed new Case/Record receives an
editable localized title proposal from Backend/Core Assist. This is mandatory
even when the user intentionally selected **Neuen Vorgang starten**.

The title proposal includes provenance/confidence internally. Accepting it
creates a confirmed title; later reprocessing may suggest an alternative but
cannot silently replace the confirmed title.

## Supported Proposal Families

| Family | Examples | Current confirmation rule |
|---|---|---|
| Identity/title | document title, new Case title, Record title | visible acceptance/correction in result bundle |
| Taxonomy | document base type, semantic variant, domain | required base meaning is visible/confirmed in the compact result, without a separate field when title/template already communicates it; variant/domain only when material |
| Actors | sender/issuer and optional recipient candidates | Managed Subject remains the user-selected management context; extracted recipient may stay empty and never reroutes |
| Facts | typabhaengig vorausgefuellte Datums-/Zeitfelder, Referenzen, Rechnungs-Gesamtbetrag | Top-Vorschlag und sichtbare Bedeutung werden kompakt bestaetigt; Alternativen/manuelle Eingabe bleiben am Feld, ungenutzte Kandidaten in optionalen Details |
| Primary routing | Case or durable Record | always user-confirmed in current maturity |
| Additional routing | best-effort other Cases and Records | only after concrete feasibility support; always user-confirmed with manual search/link fallback |
| Workflow | user-selected or rule-derived state/action from confirmed facts | no free-text model output finalizes a branch, role, slot or next step |
| Work | task, reminder, appointment, expected document | visible if created/activated; external actions never implicit |
| Relationships | optional best-effort `part_of`, `caused_by`, `follow_up_to`, `related_to` | no guaranteed Core output; every relation is user-confirmed |
| Lifecycle | late evidence without reopen, confirmed reopen, new linked Case | material lifecycle consequence is visible and user-confirmed |
| Domain state | payment, submission, waiting, information request, settlement/rejection | provenance-bearing material change is visible and user-confirmed; missing documents never invalidate a Case |

Datums-/Zeitvorschlaege folgen
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`. Ein Dokument kann mehrere
unterschiedlich typisierte Zeit-Facts besitzen. Ein extrahiertes Datum wird
nicht allein durch seine Erkennung zu einem Ereignis, Termin, einer Frist,
Aufgabe, Notification oder Kalenderaktion.

## Typabhaengiges Vorschlagsformular

Jede unterstuetzte Dokumentgrundart beziehungsweise produktrelevante Variante
definiert, welche wenigen Felder fuer den normalen Review relevant sind. Diese
Feldmenge ist ein Produkt-/Document-Concept-Vertrag und keine freie
LLM-Entscheidung. Assist fuellt nur diese Felder mit dem jeweils besten
Kandidaten voraus. Das versionierte Feldprofil-Register und sein initialer
Stand liegen in `DECISION_DOCUMENT_TYPE_CATALOG.md`; diese Decision definiert
das gemeinsame Interaktions- und Bestaetigungsverhalten.

Fuer ein Datumsfeld gilt:

- Feldlabel benennt die fachliche Bedeutung, zum Beispiel `Rechnungsdatum`
  oder `Faellig am`;
- der Top-Kandidat ist vorausgefuellt;
- die kompakte Auswahl bietet andere erkannte Datumswerte, `Kein Datum` und
  `Manuell eingeben`;
- weitere nicht verwendete Zeitkandidaten bleiben optional unter Details;
- die Nutzerin kann uebernehmen, austauschen, entfernen oder manuell
  ergaenzen;
- ein leerer oder korrigierter Vorschlag ist normal und kein Fehlerzustand.

Dasselbe Prinzip gilt fuer andere mehrdeutige Metadaten, sofern mehrere
Alternativen fachlich sinnvoll sind. Bei der Haushaltsrechnung bleibt dagegen
nur ein vorgeschlagener Gesamtbetrag sichtbar; Netto, USt und Positionen
werden nicht als Auswahl angeboten.

## Suggestion and Bundle Model

Conceptually:

```text
ReviewProposalBundle
  processingJob/version
  logicalDocumentIds
  proposedPrimaryContexts
  proposedTitles
  visibleConsequences
  alternativeCandidates
  technicalWarnings
  suggestions[]

ReviewSuggestion
  targetObject/field/relation
  proposedValue
  source: ocr | deterministicRule | model | userInput | confirmedContext | linkedEvidence
  evidence/provenance optional
  confidence/calibration optional
  sensitivity
  status: proposed | accepted | rejected | edited | superseded
```

Exact contracts belong to `contract-api`; the semantic separation is required.

## Visible Confirmation Rule

A user action only confirms what the result makes visible as a consequence.
Hidden extracted values, role keys or model assumptions are not silently
accepted with the primary routing.

Already confirmed/entailed context need not be repeated. For example, if the
confirmed Case already establishes one Managed Subject and provider, review may
omit the unchanged provider. Assist does not create a subject/profile conflict
from document names or recipients. A fact intentionally used to create a task,
deadline, payer action or external action must be surfaced.

## Confidence and Alternatives

- Confidence is used to rank, abstain and select review behavior.
- User-facing raw percentages are optional and not a substitute for plain
  uncertainty language.
- High confidence supports a one-action confirmation path.
- Medium confidence exposes a small ranked alternative set.
- Low confidence still returns best candidates; new Case is first for Case
  routing and full existing-Case selection remains accessible.
- Poor technical scan quality may offer a non-blocking rescan or targeted
  manual fallback; the user may deliberately continue.

## Managed Subject Safety

Managed Subject is highly consequential and comes from the visible user- or
Case-/Record-context, not from free document interpretation.

- Cross-profile candidates are access-filtered.
- Existing unambiguous subject inherited from a confirmed Case need not become a
  redundant form field.
- Sender, recipient or named persons may remain empty or be optional metadata;
  they do not overwrite or challenge the Managed Subject.
- No model output may silently move content across permission boundaries.

## Current and Future Automation

Current maturity:

- model-generated primary/secondary context assignments are proposals;
- a user-selected Managed Subject or Case context remains authoritative until
  the user changes it;
- user confirmation completes review;
- generated tasks/deadlines with material consequences are visible;
- harmless, internal and reversible tasks or expected responses derived
  deterministically from already confirmed facts require no second
  confirmation;
- external actions always require explicit action.

Future maturity may auto-finalize only eligible reversible internal assignments
after the class-specific quality gates in
`DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`. Suggestion acceptance history and
undo remain available.

## Not Allowed

Backend/Core Assist must not:

- omit title generation and require blank manual naming;
- silently overwrite confirmed titles/facts/links;
- silently overwrite or misrepresent capture-time user input as model output;
- execute a submission, cancellation, payment, sharing or deletion;
- infer/publish a workflow, deadline, entitlement or diagnosis outside an
  approved definition;
- expose sensitive content in logs, telemetry or notifications;
- treat user corrections as training consent;
- expose an analysis-improvement donation, human content review or
  production-data learning flow in M1;
- use capture-session proximity as proof that documents belong together;
- hide additional accepted assignments inside a bulk confirmation.
- mark a Case invalid because evidence is missing or use a non-final payer
  response to silently activate a later payer-submission step.

## Verification

Tests/fixtures cover title proposal, edit, rejection, reprocessing, capture-time
user input, high/medium/low confidence, abweichende Empfaenger ohne
Profilkonflikt, mixed batch ohne semantische Invalidierung, optional multiple
Case links, visible-only confirmation, typabhaengig vorausgefuellte
Datumsfelder mit Alternativen/`Kein Datum`/manueller Eingabe, late evidence
without silent reopen, confirmed reopen, sensitive notification redaction and
provider failure. Fixtures remain synthetic.

## Intentionally Open

- concrete OCR/model providers;
- exact UI presentation and gestures;
- calibrated confidence thresholds;
- production automation eligibility per document/workflow class.
