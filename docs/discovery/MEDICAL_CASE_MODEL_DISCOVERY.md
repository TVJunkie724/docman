---
title: "Discovery Record - Medical Case Decision Rationale"
description: "Nicht normative Szenario- und Entscheidungsrationale fuer die dokumentierte medizinische Care-/Cost-/Einreichungs-Baseline"
tags: [discovery, resolved, product, medical, healthcare, cases, workflows, submissions, reimbursement, relationships]
lastUpdated: "2026-07-25"
status: "resolved-reference"
owner: "product-concept"
---

# Discovery Record - Medical Case Decision Rationale

## Status und Scope

Das vollstaendige medizinische Produktmodell wurde am 20. Juli 2026 in
`docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md` akzeptiert und
OQ-012 geschlossen: neutraler Care-Anker, ein `part_of`-Kostenabrechnungs-Case
je eigenstaendig ausgestellter Rechnung/Honorarnote. Korrektur, Gutschrift,
Zahlungsnachweis und wiederholbare Payer-Einreichungs-/Antwort-Events bleiben
im selben Kosten-Case. Behandlungsbewilligungen bleiben in Care; die schlanke
M1-Medical-Klassifikation und das Desktop-M1-ZIP-Medienarchiv sind dort
ebenfalls akzeptiert. Das gilt auch fuer dokumentweises Matching mit
Ankerdokument, Wiederkehr, Payer-Praeferenzen, unabhaengige Payer-Fristen,
evidenzbasierte Zustaende und stets gueltige dokumentunabhaengige Cases. Der
zentrale Katalog fuehrt `medical_care` und `medical_cost_settlement` als
normalisierte Kerneintraege.

Dieses Dokument bewahrt ausschliesslich Szenarien und Begruendungen. Es ist
keine zweite Medical-SSOT, kein offener Extension-Draft und autorisiert weder
Implementierung noch ein AT-Workflow-Pack. Bei jedem Unterschied gilt
ausnahmslos die technische Decision.

Am 22. Juli 2026 wurde die Claim-Entitaet global verworfen. Historische
Claim-Begriffe in der damaligen Diskussion sind ausschliesslich externe
Terminologie und muessen als normale Cases, Events, Facts, Parties und
Dokumentlinks gelesen werden. Der Medical-Anteil von OQ-014 ist durch die
akzeptierte Family Decision geschlossen; der erneute Unfall-/Schaden-Review
bleibt getrennt offen.

Accepted generic rules remain authoritative independently of this reference:
capture-first intake, user-confirmed routing at the current maturity,
one generic `Case` entity, typed `CaseLink` relations, submission/branch semantics,
jurisdictional workflow governance and progressive disclosure. This brief does
not provide medical advice, diagnoses, entitlement decisions or
country-specific submission rules.

`docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` remains the sole catalog
SSOT for the medical candidate IDs, German titles and status. This brief only
explores boundaries, scenarios, modules and relationships for the IDs already
registered there. It may not create, rename or promote a catalog entry. Any
accepted change must update the central register first or in the same change.

## Observed Constraints To Preserve

The discussion established scenarios that any later decision must handle:

- medical documents may arrive without an invoice, police involvement or a
  known initiating event;
- care may be outpatient, inpatient, emergency, short or long-running;
- a hospital stay can produce a discharge letter, later fee, follow-up
  appointment or insurance document at different times;
- medical expense submission may involve no payer, one payer or several
  user-confirmed social/private insurers, without an upfront strategy form;
- every confirmed document that evidences a concrete medical care course
  belongs to an existing or newly proposed medical care Case, even when the
  only known reason is a routine control; a durable health credential or
  Record without a care course may instead use that Record as primary context;
- not every doctor visit creates a new Case: several visits, findings and
  treatments can belong to one coherent care course;
- the first medical invoice is enough evidence for a neutral care Case and a
  separate cost-settlement Case; a diagnosis or separate finding is not
  required;
- mobile camera capture closes exactly one logical document before the next
  document scan begins, while a document may contain multiple pages;
- global capture and Assist matching remain the normal intake path;
- provider-specific product guidance, if later activated, requires dated,
  reviewed sources.

These constraints and the continuation, recurrence, validity and state rules
are accepted in the owning technical Decision.

## Accepted Decision Summary

Hospital, clinic, general practitioner, specialist, therapy and rehabilitation
are care settings, actors or stages. They are not separate Case types merely
because the place/provider changes.

Duration is also not a Case boundary. A longer course can remain one Case and a
short hospital stay can be only one event/stage inside it. Split Cases by an
independently understandable user goal, lifecycle and outcome, not by building,
provider, document sender or elapsed time.

Mappm uses two medical-core concerns and generic Insurance composition:

1. medical care and follow-up;
2. expense payment/reimbursement;
3. contract-specific insurance benefits or disputes only as generic Insurance
   contexts until a later product decision justifies specialization.

All three boundaries are accepted: the medical course is the stable semantic
anchor; each independent financial obligation with payment/submission/
reconciliation has its own `part_of` cost-settlement lifecycle; payer
submissions remain repeatable events/branches. A treatment authorization request, response,
approval or rejection remains in the medical Care Case and does not form a
Case merely because an external decision was requested. Special contractual
benefits remain generic Insurance content in M1; the Medical Core does not
introduce dedicated types or flows for them. Formal disputes continue to use
the generic independent-goal/lifecycle/outcome test.

### Accepted Medical Care Case Family

The central catalog registers `medical_care` as normalized core. The
authoritative boundary is
`docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`. The
user-facing title is generated from evidence and context, not shown as a
technical family label.

Its user goal is:

> Eine konkrete medizinische Abklaerung, Behandlung und notwendige Nachsorge
> nachvollziehbar bis zu einem verstaendlichen Ergebnis begleiten.

A Case may activate only the stages evidenced or required for that concrete
course:

- initial complaint/event context where explicitly known;
- outpatient consultation or examination;
- diagnostics, referrals and findings;
- emergency treatment;
- inpatient admission and stay;
- procedure or operation;
- discharge and discharge documentation;
- medication or therapy plan;
- control/follow-up appointments;
- outpatient therapy;
- rehabilitation;
- expected documents or responses;
- completion, handoff or creation of an independent follow-up Case.

These are optional workflow modules/stages, not a giant form and not a universal
checklist shown to the user. Dormant branches remain invisible.

The same Case may therefore represent:

- a completely outpatient longer treatment;
- an emergency followed by hospital admission and controls;
- a hospital stay with no invoice but a discharge letter and later follow-up;
- a diagnostic path that later gains treatment and rehabilitation;
- a short treatment with one report and one follow-up task.

A routine control also uses this family. A single isolated control can be one
small finite Case; controls that are part of an existing treatment remain in
that course. Separate recurring annual controls should not create one endless
mega-Case or a separate Case type. A finite Care Case may carry optional
recurrence/series planning. A later actual occurrence becomes another finite
Case only through user intent or new evidence and may share the confirmed
series context or use `related_to`; `follow_up_to` is reserved for genuine
care-course succession.

### First Evidence Establishes the Medical Anchor

An appointment, doctor, hospital, medical letter, finding or invoice does not
by itself define a new medical **type**. A confirmed medical document does,
however, need a medical care context so that later documents have a stable
matching target.

An incoming document is therefore matched to or proposes:

- an existing medical care Case;
- a new neutrally titled medical care Case when no existing course fits;
- for an invoice, a cost-settlement Case linked `part_of` the care Case;
- an appropriate durable Record where the document is a version/evidence of one;
- or a lightweight Custom Case only while the medical classification/context
  itself is genuinely unresolved.

The care Case does not need an exclusive finding. The first invoice can be
primary evidence for the cost Case and contextual evidence for the care Case.
If no diagnosis or reason is evidenced, Assist proposes a neutral title such as
`Behandlung bei Dr. Mayer`; it must not add a date, invent a diagnosis or force
the user to complete a medical form.

### One Long Course Versus User-confirmed Follow-up Cases

Keep work in one medical care Case when the stages serve one continuous user
goal and are understandable as one course. A hospital stay and later controls
may therefore remain together.

New evidence is ranked per document against existing and possible new linked
Care Cases. Continuity prefers the existing Case; evidence for an independently
understandable course may rank a new linked Case first. The user may create that
Case during Capture/Review or later from one anchor document. M1 does not
require a free multi-document split. Examples include:

- a deliberately separated rehabilitation after acute treatment;
- a new treatment episode after a completed handoff;
- a dispute/appeal after a payer decision;
- a long-running consequence of an accident that can continue independently.

Chronic conditions must not automatically become one endless mega-Case. A
specific course may remain long-running, while independently managed treatment
episodes can be chained or grouped. The user may create a quiet Custom umbrella
context when a broader overview is useful; Mappm must not infer a medical
diagnosis or causal structure from weak evidence.

### Case Relationship Semantics

The existing four `CaseLink` types are sufficient:

| Relation | Medical meaning |
|---|---|
| `part_of` | optional constituent of a consciously created broader context; enables eligible roll-up |
| `caused_by` | independently continuing consequence of another Case; overlap is allowed |
| `follow_up_to` | fachlicher Nachfolger after handoff/completion; forms a visible course chain without parent ownership |
| `related_to` | relevant context where hierarchy or causality is not confirmed |

`follow_up_to` is the explicit Folge-Vorgang relationship. It may form a chain
or branch; it is not a single-parent linked list and does not imply roll-up or
cascade deletion.

Example:

```text
Case A: Akutbehandlung Knie

Case B: Rehabilitation Knie
  follow_up_to -> Case A

Optional Custom umbrella: Folgen des Unfalls 2026
  Case A part_of -> umbrella
  Case B part_of -> umbrella
```

Rehabilitation remains inside Case A when the evidence shows one continuous
course. Case B is created only after explicit user confirmation from an anchor
document or explicit intent.

An accident/treatment link uses `caused_by` only when the causal relationship is
confirmed by the user or reliable evidence. Assist must not make medical or
legal causality claims from temporal proximity alone.

### Accepted Medical Expense and Reimbursement Family

The central catalog registers `medical_cost_settlement` as normalized core for
the administrative/financial goal of paying, submitting and reconciling one
independent economic obligation arising from medical care. Its authoritative
boundary is
`docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`.

Possible internal modules include:

- invoice review and payment where applicable;
- show the user's confirmed payer default first when submission is invoked;
- prepare and confirm submission;
- wait for response or payment;
- associate decision and reimbursed amount;
- allow another user-confirmed payer submission when requested or evidenced;
- reconcile confirmed reimbursement and own share;
- close with an explicit result.

The user does not configure an upfront reimbursement strategy such as "only
social insurance", "first social insurance then supplementary insurer" or
"parallel". Payer/submission branches activate from incoming evidence, confirmed
policies and user actions.

One Managed Subject may have several social-insurance, healthcare-fund and
private-insurance relationships. The user may set at most one preferred payer
for social insurance/healthcare, outpatient supplementary insurance and
inpatient supplementary insurance. When submission is invoked, Mappm may show
that explicit preference first and keep the other confirmed relationships
available. It does not evaluate whether a policy covers the service, recommend
the "best" insurer or force an upfront reimbursement strategy.

Documents from different payers can belong to the same reimbursement Case and
different payer/submission event paths. A payer is not automatically a Subvorgang.

The Case boundary follows the obligation, not the file count:

- original invoice, corrected invoice, credit note, payment proof, submission
  receipt and payer decisions can belong to one cost-settlement Case;
- separate independent invoices normally create separate cost-settlement
  Cases, even if they share one medical care Parent;
- one invoice spanning several appointments remains one cost Case;
- several invoices submitted together remain separate cost Cases but may share
  one or more submission events without losing their identities.

### Relationship Between Care and Reimbursement

A medical invoice first finds or proposes the medical care Case and then finds
or proposes its cost-settlement Case. The cost Case uses `part_of` because its
outcome is a constituent financial outcome of that concrete care course.

```text
Medical Care Case
  finding/referral/discharge evidence
  Cost Settlement Case A  part_of -> Medical Care Case
  Cost Settlement Case B  part_of -> Medical Care Case
```

Care and cost settlement can reach their own statuses at different times;
`part_of` does not require one shared lifecycle status or cascade close/delete.
The parent can show a deduplicated financial/status roll-up while the default UI
collapses the technical two-level structure into one calm care summary.

Financial facts and documents may be visible in both contexts without double
counting or file duplication.

### Hospital Stay and Later Documents

A hospital stay is an event/stage inside the applicable care Case. Possible
documents include:

- admission/referral;
- consent or treatment information;
- findings and reports;
- operation/procedure report;
- discharge letter;
- medication/therapy plan;
- control appointment or referral;
- hospital fee invoice;
- insurer correspondence.

There may be no police involvement and no immediate invoice. Neither absence
blocks a valid care Case. A later daily hospital charge/invoice may join the
care Case and trigger/propose its own cost-settlement Case for that obligation.

Special contractual insurance benefits remain generic Insurance content in
M1. The Medical Core does not create dedicated document types or Cases
for each benefit name. Mappm never interprets policy formulas or calculates
coverage, eligibility, expected reimbursement or own share. It stores and
summarizes only confirmed values from documents.

A treatment authorization, cost-coverage request, approval or rejection is
different: it stays as documents, Facts and optional workflow steps inside the
medical Care Case. It does not become a Case solely because request and answer
arrive as separate documents.

### Accident Context

For an accident:

- police involvement is conditional, never universal;
- initial examination may remain an event/branch of the accident Case;
- a longer independent treatment can be a medical care Case with
  `caused_by=accident`;
- rehabilitation remains in that care Case by default and becomes
  `follow_up_to` only after explicit user confirmation;
- insurer handling may become a normal linked `insurance_settlement` Case;
- formal proceedings and independent benefit applications become linked Cases
  only when they pass the independent goal/lifecycle/outcome test.

Provider changes, medical specialties and document senders do not alone split
the course.

### Capture-First Matching for Medical Documents

The user normally scans globally when a document arrives. Mappm must not assume
that the user first finds the correct medical Case.

After capture, Backend/Core Assist uses signals such as:

- Managed Subject;
- provider/issuer and known external-party profile;
- patient, policy, external damage/reference, invoice and referral identifiers;
- treatment/service dates;
- prior reports/submissions;
- expected document roles in active workflows;
- extracted appointment/follow-up information;
- existing policies and payer validity;
- previously confirmed Facts, links and Records in the authorized context;
  M1 does not learn a ranking pattern from correction history.

For camera capture, one scan unit contains one logical document and optionally
several pages. Invoice, payment proof, finding and referral are scanned as
separate documents. A common capture session is only a weak signal; explicit
document boundaries are persisted before matching.

The result automatically proposes:

- a concise Case/document title;
- existing or new primary Case;
- a coarse medical or cost context.

Additional care/reimbursement/policy contexts and Case relations are optional,
confirmation-bound best-effort candidates after a concrete Backend feasibility
gate. Document role/workflow slot, next task, appointment or expected response
come from user action, confirmed facts or a reviewed workflow rule rather than
free model interpretation.

If an invoice is the first evidence, the result is one concise compound
proposal: neutral medical care Case plus cost-settlement child and generated
titles. If a finding/referral arrives later, it is ranked against the medical
care Parent, not the financial child. Matching uses the user-selected Managed
Subject as an access/filter context plus whichever stable references, provider
candidate values, coarse document/domain signals and type-relevant reviewed
date-field proposals the target
stack can actually provide. Recipient/referrer names, specialty/service
context and contradictions are not reliable Core signals. Strong confirmed
identifiers outweigh semantic similarity.

A payment proof, payer response or explicit user intent may also be the first
cost-settlement anchor. No document type or combination is required for Case
validity. After a Case is confirmed, every later document is matched and linked
individually. Existing related documents may be proposed one by one; M1 does
not expose a free multi-document conversion into a medical Subcase.

The user may later correct, merge, relink or reparent confirmed structure.
Assist may offer such an action only as an optional feasibility-gated
suggestion; it does not semantically declare a Parent wrong and never silently
rewrites confirmed structure.

Current-release assignments and material consequences remain user-confirmed.
Known implicit facts that do not affect the decision, such as the unchanged
doctor already established by the selected Case, are not repeated in the
default review. The user-selected Managed Subject is not challenged by model
text. A new insurer, user-assigned deadline or consequential action must be
surfaced before it is confirmed.

### Document Roles

Medical document roles belong to a relationship/event/workflow slot, not to the
file globally. The same discharge letter may be:

- `decision` or `response` in a care workflow;
- `evidence` for a benefit application;
- `context` in an accident Case.

Use the sparse universal roles from the document taxonomy and add workflow-
specific slots only when they change completeness, expected response, next
action, export or explainability. Users do not normally edit technical role
keys.

### Tasks, Appointments and Agenda

Mappm may extract and propose:

- control appointments;
- therapy/rehabilitation appointments;
- medication or evidence tasks where in product scope;
- submission deadlines;
- expected responses;
- reminders.

This remains a focused Case agenda, not a general medical calendar. A medical
document can produce a proposed task/appointment without requiring a separate
Case for the appointment itself. Sensitive titles in external notifications or
calendar integrations are redacted unless the user explicitly opts in.

### Jurisdiction and Safety

The normal Austrian invoice path is generic: submit the paid invoice and
available evidence, wait for the social-insurance result and only then suggest
the supplementary-insurance step. Special forms remain generic documents with
specific titles/roles unless later evidence proves a dedicated product type is
valuable. Provider-specific links or guidance are optional future pack content,
not a prerequisite for M1. Mappm does not determine coverage, eligibility or
expected benefit; an explicit user default only affects ordering.

Published medical workflow variants require dated sources, professional review,
versioning, applicability rules, synthetic branch fixtures and explicit known
limitations. Intelligence may select among approved definitions but may not
invent entitlement, diagnosis, medical causality or legal deadlines.

### Verification Scenarios

Country-pack and implementation plans cover at least:

- outpatient care with no hospital;
- routine control with only one invoice and a neutral medical Parent;
- invoice-first capture followed later by a matching finding;
- referral-first capture followed by a specialist finding from another sender;
- multi-page one-document scan followed by an explicitly separate next
  document scan;
- emergency/hospital stay with discharge letter and no invoice;
- later hospital fee invoice;
- hospital stay followed by controls in the same Case;
- outpatient long course without hospital;
- rehabilitation retained in the Care Case by default and a user-confirmed
  new linked Case from one anchor document using `follow_up_to`;
- treatment caused by an accident with no police involvement;
- one invoice submitted only to one supplementary insurer;
- multiple independent invoices as separate cost Cases under one care Case;
- corrected invoice, payment proof and payer responses retained in one cost
  Case;
- primary and supplementary payer submission paths with the normal supplementary step
  proposed only after confirmed social-insurance settlement/rejection, while
  explicit direct user intent remains possible;
- multiple confirmed policies and category defaults for one Managed Subject;
- special contractual benefit document handled generically without a new
  Medical type or benefit calculation;
- payment proof as first cost anchor and a valid Case without an invoice;
- zero, one and multiple documents without an invalid Case state;
- unrelated medical document in a mixed batch;
- incorrect causal/follow-up suggestion and user correction;
- same document linked to care, reimbursement and benefit contexts without
  duplication or double counting.

## Discovery Guardrails

This resolved reference does not authorize implementation. The accepted model
may be planned only through its technical Decision and an approved
Implementation Contract. Any later change must reject a model that:

- hospital is hardcoded as a mandatory separate Case family;
- outpatient and inpatient courses require unrelated top-level workflows solely
  because care setting differs;
- a long course is split only because it is long;
- one endless medical mega-Case is forced for every future episode;
- police, invoice, reimbursement or supplementary insurance is mandatory;
- the user must configure a payer strategy before evidence/action requires it;
- every insurer interaction becomes a Subvorgang;
- a payer default is treated as coverage, creates a submission state or sends a
  submission;
- Mappm calculates insurance coverage, expected reimbursement or other policy
  benefits;
- a medical invoice is left without a medical care anchor after confirmed
  review;
- every appointment or control automatically becomes a new medical Case;
- invoice and payment proof are intentionally captured as pages of one mobile
  document;
- a sender/provider change creates a Case automatically;
- `follow_up_to` is implemented as parent ownership or cascade deletion;
- Assist infers medical/legal causality from weak evidence;
- technical workflow/role complexity is exposed as a default mobile form;
- a document type/set is mandatory for Case validity or a Case can be persisted
  as invalid;
- M1 requires free multi-document conversion into a Medical Subcase;
- receipt, information request or elapsed waiting time silently activates the
  supplementary-insurance step;
- country-specific payer or deadline logic ships without a reviewed versioned
  workflow variant.

## Deferred Implementation and Release Detail

- exact first-release Austrian medical workflow subset and reviewed provider
  content remain WF-01/WF-02;
- the final document base-type/variant catalog remains OQ-011;
- recurrence, payer preference, payment/submission states and lifecycle
  persistence/API types belong to Data-/Contract-Implementation-Contracts;
- exact UI representation, controls and gestures belong to a later UI phase.
