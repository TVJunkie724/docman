---
title: "Decision - Assisted Review Suggestions"
description: "Entscheidung zu Backend-/Core-Assist-Vorschlaegen fuer Titel, Dokumentfakten, Case-/Record-Routing, Workflows und sichtbare Human-in-the-loop-Bestaetigung"
tags: [decision, assisted-review, ocr, ai, title, routing, suggestions, privacy]
lastUpdated: "2026-07-15"
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
| Actors/subject | Managed Subject, sender, issuer, recipient, provider | conflicts/new sensitive subject visible; no hidden cross-profile acceptance |
| Facts | dates, references, amounts, deadlines, expected response | material consequences visible; other extracted facts remain proposed until reviewed/used |
| Primary routing | Case or durable Record | always user-confirmed in current maturity |
| Additional routing | other Cases, Records, Claims | confirmed when proposed as a relationship |
| Workflow | domain template/definition version, pattern/modules, branch, document role/slot, next step | material consequences confirmed; internal keys hidden by default |
| Work | task, reminder, appointment, expected document | visible if created/activated; external actions never implicit |
| Relationships | `part_of`, `caused_by`, `follow_up_to`, `related_to` | user-confirmed; causality requires strong evidence |

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
  warnings/outliers
  suggestions[]

ReviewSuggestion
  targetObject/field/relation
  proposedValue
  source: ocr | deterministicRule | model | userPattern | linkedEvidence
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
omit the unchanged provider. A conflicting subject/provider or a fact that
changes task, deadline, payer, permission or external action must be surfaced.

## Confidence and Alternatives

- Confidence is used to rank, abstain and select review behavior.
- User-facing raw percentages are optional and not a substitute for plain
  uncertainty language.
- High confidence supports a one-action confirmation path.
- Medium confidence exposes a small ranked alternative set.
- Low confidence still returns best candidates; new Case is first for Case
  routing and full existing-Case selection remains accessible.
- Poor scan/evidence may require rescan or targeted manual fallback.

## Managed Subject Safety

Managed Subject is highly consequential. Backend/Core Assist may infer it from
the selected/confirmed Case or propose it from document evidence.

- Cross-profile candidates are access-filtered.
- A new, changed or ambiguous subject is visible before confirmation.
- Existing unambiguous subject inherited from a confirmed Case need not become a
  redundant form field.
- No model output may silently move content across permission boundaries.

## Current and Future Automation

Current maturity:

- primary/secondary context assignments are proposals;
- user confirmation completes review;
- generated tasks/deadlines with material consequences are visible;
- external actions always require explicit action.

Future maturity may auto-finalize only eligible reversible internal assignments
after the class-specific quality gates in
`DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`. Suggestion acceptance history and
undo remain available.

## Not Allowed

Backend/Core Assist must not:

- omit title generation and require blank manual naming;
- silently overwrite confirmed titles/facts/links;
- execute a submission, cancellation, payment, sharing or deletion;
- infer/publish a workflow, deadline, entitlement or diagnosis outside an
  approved definition;
- expose sensitive content in logs, telemetry or notifications;
- treat user corrections as training consent;
- use capture-session proximity as proof that documents belong together;
- hide additional accepted assignments inside a bulk confirmation.

## Verification

Tests/fixtures cover title proposal, edit, rejection, reprocessing, high/medium/
low confidence, subject conflict, mixed batch, multiple Case links, visible-only
confirmation, sensitive notification redaction and provider failure. Fixtures
remain synthetic.

## Intentionally Open

- concrete OCR/model providers;
- exact UI presentation and gestures;
- calibrated confidence thresholds;
- production automation eligibility per document/workflow class.
