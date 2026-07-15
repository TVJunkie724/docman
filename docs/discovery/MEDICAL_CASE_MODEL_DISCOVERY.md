---
title: "Discovery Brief - Medical Case Model"
description: "Offener Spezifikationsstand zu medizinischen Versorgungsverlaeufen, Krankenhausetappen, Rechnungen, Erstattungen, Versicherungsleistungen und Folge-Vorgaengen"
tags: [discovery, product, medical, healthcare, cases, workflows, claims, reimbursement, follow-up, relationships]
lastUpdated: "2026-07-15"
status: "draft"
owner: "product-concept"
---

# Discovery Brief - Medical Case Model

## Status und Scope

Draft discovery brief. It records the current discussion direction but does
not authorize implementation until R0.6/OQ-012 accepts names, boundaries and an
AT workflow pack. The current direction is deliberately small: one medical
care family, one cost-settlement family per economic obligation, optional
independent benefit/procedure Cases and the existing generic CaseLink graph.

Already accepted generic rules remain authoritative independently of this
draft: capture-first intake, user-confirmed routing at the current maturity,
one generic `Case` entity, typed `CaseLink` relations, Claim/branch semantics,
jurisdictional workflow governance and progressive disclosure. This brief does
not provide medical advice, diagnoses, entitlement decisions or
country-specific submission rules.

## Observed Constraints To Preserve

The discussion established scenarios that any later decision must handle:

- medical documents may arrive without an invoice, police involvement or a
  known initiating event;
- care may be outpatient, inpatient, emergency, short or long-running;
- a hospital stay can produce a discharge letter, later fee, follow-up
  appointment or insurance document at different times;
- medical expense submission may involve no payer, one payer or several
  applicable social/private insurers, without an upfront strategy form;
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
- country/provider rules require dated, reviewed workflow variants.

These are problem constraints, not acceptance of the candidate families below.

## Candidate Core Model (not accepted)

Hospital, clinic, general practitioner, specialist, therapy and rehabilitation
are care settings, actors or stages. They are not separate Case types merely
because the place/provider changes.

Duration is also not a Case boundary. A longer course can remain one Case and a
short hospital stay can be only one event/stage inside it. Split Cases by an
independently understandable user goal, lifecycle and outcome, not by building,
provider, document sender or elapsed time.

Mappm uses three distinct but linkable concerns:

1. medical care and follow-up;
2. expense payment/reimbursement;
3. independent policy/benefit applications or disputes.

The medical course is the stable semantic anchor. A financial obligation with
payment/submission/reconciliation has its own cost-settlement lifecycle and is
proposed as `part_of` that care Case. Payer submissions remain Claims inside
the cost Case. An authorization, policy benefit or dispute becomes another
Case only when it has its own independently understandable outcome.

### Candidate Medical Care Case Family

The current candidate family key is `medical_care`. The
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
mega-Case. They can form a reviewed recurrence/series context or use
`related_to`; `follow_up_to` is reserved for genuine care-course succession.

### First Evidence Establishes the Medical Anchor

An appointment, doctor, hospital, medical letter, finding or invoice does not
by itself define a new medical **type**. A confirmed medical document does,
however, need a medical care context so that later documents have a stable
matching target.

An incoming document is therefore matched to or proposes:

- an existing medical care Case;
- a new neutrally titled medical care Case when no existing course fits;
- for an invoice, a cost-settlement Case linked `part_of` the care Case;
- a policy/benefit Case where a separate application/outcome is evidenced;
- an appropriate durable Record where the document is a version/evidence of one;
- or a lightweight Custom Case only while the medical classification/context
  itself is genuinely unresolved.

The care Case does not need an exclusive finding. The first invoice can be
primary evidence for the cost Case and contextual evidence for the care Case.
If no diagnosis or reason is evidenced, Assist proposes a neutral title such as
`Behandlung bei Dr. Mayer, Juni 2026`; it must not invent a diagnosis or force
the user to complete a medical form.

### One Long Course Versus Follow-up Cases

Keep work in one medical care Case when the stages serve one continuous user
goal and are understandable as one course. A hospital stay and later controls
may therefore remain together.

Create or suggest another Case when the new work would remain understandable if
the earlier Case were hidden and has its own goal, lifecycle and outcome.
Examples include:

- a separately organized rehabilitation after acute treatment;
- a new treatment episode after a completed handoff;
- a formal benefit application with its own submission and decision;
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

Case C: Taggeld beantragen
  caused_by -> Case A

Optional Custom umbrella: Folgen des Unfalls 2026
  Case A part_of -> umbrella
  Case B part_of -> umbrella
  Case C part_of -> umbrella
```

If rehabilitation is only a normal stage of the same treatment goal, it remains
inside Case A and Case B is not created.

An accident/treatment link uses `caused_by` only when the causal relationship is
confirmed by the user or reliable evidence. Assist must not make medical or
legal causality claims from temporal proximity alone.

### Candidate Medical Expense and Reimbursement Family

`medical_cost_settlement` is the current candidate guided family for the
administrative/financial goal of paying, submitting and reconciling one
economic obligation arising from medical care.

Possible internal modules include:

- invoice review and payment where applicable;
- identify applicable payer candidates from confirmed profile/policy context;
- prepare and confirm submission;
- wait for response or payment;
- associate decision and reimbursed amount;
- evaluate another applicable payer only when evidence/context supports it;
- reconcile confirmed reimbursement and own share;
- close with an explicit result.

The user does not configure an upfront reimbursement strategy such as "only
social insurance", "first social insurance then supplementary insurer" or
"parallel". Payer/Claim branches activate from incoming evidence, confirmed
policies and user actions.

When the user invokes a submission and several payers are genuinely plausible,
Mappm ranks only applicable social/private health policies for the Managed
Subject and service date. It may recommend the best candidate and keep other
applicable insurers accessible. It must not show irrelevant policies or force
the user to preconfigure every future path.

Documents from different payers can belong to the same reimbursement Case and
different Claim/submission objects. A payer is not automatically a Subvorgang.

The Case boundary follows the obligation, not the file count:

- original invoice, corrected invoice, credit note, payment proof, submission
  receipt and payer decisions can belong to one cost-settlement Case;
- separate independent invoices normally create separate cost-settlement
  Cases, even if they share one medical care Parent;
- one invoice spanning several appointments remains one cost Case;
- several invoices submitted together remain separate cost Cases but may share
  a submission batch/Claim operation without losing their identities.

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

An insurance daily allowance or other policy benefit is not merely another
invoice fact. If it requires its own application, evidence, waiting period,
decision and payout, it is an independently meaningful policy/benefit Case or a
Claim inside an existing broader insurance Case, according to the standard
Case-boundary test.

### Accident Context

For an accident:

- police involvement is conditional, never universal;
- initial examination may remain an event/branch of the accident Case;
- a longer independent treatment can be a medical care Case with
  `caused_by=accident`;
- rehabilitation may remain in that care Case or become `follow_up_to` it;
- insurer Claims may stay inside the accident settlement Case;
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
- patient, policy, claim, invoice and referral identifiers;
- treatment/service dates;
- prior reports/submissions;
- expected document roles in active workflows;
- extracted appointment/follow-up information;
- existing policies and payer validity;
- prior confirmed corrections.

For camera capture, one scan unit contains one logical document and optionally
several pages. Invoice, payment proof, finding and referral are scanned as
separate documents. A common capture session is only a weak signal; explicit
document boundaries are persisted before matching.

The result automatically proposes:

- a concise Case/document title;
- existing or new primary Case;
- additional care/reimbursement/policy context;
- document role/workflow slot;
- next task, appointment or expected response where evidenced;
- `follow_up_to`, `caused_by` or other Case links where sufficiently supported.

If an invoice is the first evidence, the result is one concise compound
proposal: neutral medical care Case plus cost-settlement child and generated
titles. If a finding/referral arrives later, it is ranked against the medical
care Parent, not the financial child. Matching uses Managed Subject, provider
and mentioned referrer/recipient, service dates, specialty/service context,
patient/referral/invoice identifiers and contradictions. Strong identifiers
outweigh semantic similarity.

If later evidence shows that the initial Parent was duplicate or wrong, Assist
proposes merge/relink/reparent; it never silently rewrites confirmed structure.

Current-release assignments and material consequences remain user-confirmed.
Known implicit facts that do not affect the decision, such as the unchanged
doctor already established by the selected Case, are not repeated in the
default review. Conflicts, a different Managed Subject, new insurer, important
deadline or consequential action must be surfaced.

### Document Roles

Medical document roles belong to a relationship/Claim/workflow slot, not to the
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

Payer order, eligibility, claim documents, deadlines, terminology and available
submission channels are jurisdiction/provider content. Austrian social-
insurance and supplementary-insurance examples are reference scenarios, not
global hardcoded truth.

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
- separate rehabilitation as `follow_up_to`;
- treatment caused by an accident with no police involvement;
- one invoice submitted only to one supplementary insurer;
- multiple independent invoices as separate cost Cases under one care Case;
- corrected invoice, payment proof and payer responses retained in one cost
  Case;
- primary and supplementary payer Claims in sequence or parallel when the
  approved provider rules/evidence permit it;
- multiple applicable policies for one Managed Subject;
- daily-allowance/benefit application with its own lifecycle;
- unrelated medical document in a mixed batch;
- incorrect causal/follow-up suggestion and user correction;
- same document linked to care, reimbursement and benefit contexts without
  duplication or double counting.

## Discovery Guardrails

No implementation may begin from this draft. A later decision must reject any
model that:

- hospital is hardcoded as a mandatory separate Case family;
- outpatient and inpatient courses require unrelated top-level workflows solely
  because care setting differs;
- a long course is split only because it is long;
- one endless medical mega-Case is forced for every future episode;
- police, invoice, reimbursement or supplementary insurance is mandatory;
- the user must configure a payer strategy before evidence/action requires it;
- every insurer interaction becomes a Subvorgang;
- a medical invoice is left without a medical care anchor after confirmed
  review;
- every appointment or control automatically becomes a new medical Case;
- invoice and payment proof are intentionally captured as pages of one mobile
  document;
- a sender/provider change creates a Case automatically;
- `follow_up_to` is implemented as parent ownership or cascade deletion;
- Assist infers medical/legal causality from weak evidence;
- technical workflow/role complexity is exposed as a default mobile form;
- country-specific payer or deadline logic ships without a reviewed versioned
  workflow variant.

## Intentionally Open

- final acceptance and code/localized names for the proposed `medical_care`
  and `medical_cost_settlement` families;
- where one care course ends and a successor Case begins;
- whether recurring controls need a generic recurrence/series concept in
  addition to existing CaseLinks;
- which authorizations/benefits remain Claims/branches and which become linked
  Cases;
- exact first-release medical workflow subset and first country pack;
- final code key and localized terminology for the care family;
- whether specific policy benefits share a generic insurance family or receive
  reviewed specialized variants;
- exact UI representation of a medical course and its follow-up chain.
