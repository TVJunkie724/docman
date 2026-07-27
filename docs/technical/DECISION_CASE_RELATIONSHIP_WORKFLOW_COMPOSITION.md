---
title: "Decision - Case Relationships and Workflow Composition"
description: "Verbindliches Mappm-Modell fuer eigenstaendige Vorgaenge, typisierte Beziehungen, Workflow-Schritte, Ablaufzweige, Custom-Vorgaenge und Bottom-up-Komposition"
tags: [decision, product, cases, workflows, relationships, custom-cases, tasks, agenda]
lastUpdated: "2026-07-24"
status: "accepted"
owner: "product-concept"
---

# Decision - Case Relationships and Workflow Composition

## Status

Accepted on 2026-07-14. This decision supersedes descriptions of `Subcase` as
a separate domain entity and supersedes a strict `parentCaseId` target model.
Historical M2 references remain traceability only.

## Decision

Mappm has exactly one domain entity for a process or named context: `Case`,
shown as **Vorgang**. Every Case has its own identity, title, lifecycle and
optional goal, timeline, tasks and workflow instance.

The Case is deliberately generic. At its lightest it is a named, searchable
collection/context for one or more linked documents. Domain template, workflow
definition, tasks, appointments, financial entries and completion
outcome are optional enrichments, not Case subtypes or construction
requirements. Users are not asked to choose from an exhaustive Case-type list.
Backend/Core Assist proposes a plain-language title and the most relevant
template/workflow; the review surface shows only material choices.

There is no separate `Subcase` entity or table. **Subvorgang** is a UI role for
a normal Case connected to another Case through a typed `CaseLink` with
`relationType=part_of`.

```text
Case
  id
  title
  purpose/context
  goal / completionOutcome optional for lightweight Custom Case
  lifecycleStatus
  workflowDefinition/version optional
  origin: manual | assist_suggested | guided_workflow

CaseLink
  sourceCaseId
  targetCaseId
  relationType
  primaryDisplayContext optional
  createdBy / createdAt
```

The target model is a typed graph, not a folder tree. A primary display context
may make navigation calm, but it never means exclusive ownership.

Direction is explicit: for `part_of`, `sourceCaseId` is the constituent Case
and `targetCaseId` is the containing/umbrella Case; for `caused_by`, the source
Case was caused by the target Case; for `follow_up_to`, the source Case follows
the target Case. `related_to` is semantically symmetric even if persistence
stores one canonical ordered edge. UI wording must show both endpoint roles and
must not make users infer direction from layout alone.

## Case Boundary

A guided Case represents one understandable user goal and one overall
completion outcome. A lightweight Custom Case may begin as a named context with
one document and no workflow, task or elaborated outcome. It may stay quiet,
grow through later matching or adopt a compatible guided workflow after review.

Adopting, changing or removing optional guidance does not replace the Case or
move/copy its documents. `Custom` and `guided` describe current product
behavior, not different domain types.

Different organizations, document senders, files or local statuses do not by
themselves create another guided Case or prove that Cases belong together.

Use this test before splitting work:

> Would this work remain an independently understandable goal with its own
> lifecycle and outcome if the surrounding Case were hidden?

If no, it remains a step, event, task, submission or conditional branch
inside the current Case. If yes, it may become another linked Case. This test
governs splitting meaningful work; it does not prohibit a lightweight Custom
Case used as the first primary context for an otherwise unmatched document.

## Relationship Types

| Relation | Meaning | Default roll-up |
|---|---|---|
| `part_of` | the child outcome is a constituent part of the parent outcome | show status/tasks and eligible facts in parent |
| `caused_by` | the source Case was triggered by another Case but can continue independently | show link, no automatic financial roll-up |
| `follow_up_to` | the source Case continues after a handoff/completion of a prior Case | show timeline/course continuity, no automatic roll-up |
| `related_to` | relevant non-hierarchical context | link only |

`part_of` links must be acyclic. Deleting, archiving or closing one Case never
cascades into another Case. A Case may have multiple typed links and one
preferred display context. Re-linking changes navigation, not content ownership.

`follow_up_to` may form chains and branches. It is not a strict linked list, does
not create ownership and does not require a containing parent. `caused_by`
expresses confirmed causality and may overlap in time; `follow_up_to` expresses
course continuity after a handoff and need not claim causality.

## Workflow Composition

A Case workflow distinguishes these concepts:

| Concept | Purpose |
|---|---|
| `lifecycleStatus` | generic whole-Case state: `draft`, `active`, `waiting`, `review`, `done`, `archived` |
| workflow stage | domain-specific current phase inside the same outcome |
| step | expected unit of progress, completed or skipped with reason |
| task | user action with status, due date and optional reminder |
| event | something that happened and belongs to the timeline |
| branch/track | conditional, parallel or sequential work inside the same Case |
| submission | repeatable confirmed action/event that sends material to an external party; it is not a Case or separate domain entity |
| linked Case | independently meaningful goal reached through a typed relation |

A workflow definition may contain mandatory steps, conditional steps,
parallel/sequential branches and explicit escalation points. A branch is not a
Case by default. It can later be promoted to a linked Case without copying
files, facts or history.

## Keine Claim-Entitaet

Mappm besitzt keine eigene `Claim`-Entitaet. Ein fachlich erkennbarer Anspruch
oder eine externe `Claim Number` bleibt Terminologie beziehungsweise ein Fact;
er wird nicht zum Repository, Matchingziel oder parallelen Arbeitsobjekt.

Eine eigenstaendig verfolgte Versicherungsabwicklung ist ein normaler Case
nach `DECISION_INSURANCE_SETTLEMENT_MODEL.md`. Einreichungen und
Nachreichungen sind wiederholbare Ereignisse beziehungsweise Workflow-Schritte
im passenden Case. Dokumente werden nur Cases und Records zugeordnet.

## Medical Cost-Settlement Submission Semantics

The medical-specific authority is
`DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`. Its accepted core uses one
neutral medical care anchor and one `part_of` cost-settlement Case per
independent economic obligation. Bestaetigte Payer-Einreichungen bleiben
wiederholbare Events/Workflow-Schritte inside that cost Case.

```text
Case: Arztrechnung vollstaendig abrechnen
  review invoice
  pay invoice where applicable
  show an explicit user default first when submission is invoked
  submit to the confirmed payer
  wait for response/payment and reconcile outcome
  activate another user-confirmed payer submission only when requested/evidenced
  reconcile total reimbursement and own share
  close with explicit outcome

  Submission events: social insurance
  Submission events: supplementary insurance
```

The payer paths are not Subcases and not Claims. Documents from different
insurers are linked to the same Cost Case with the relevant payer/party,
reference Facts and roles such as `submission`, `response`, `decision` or
`payment_proof`.

Medical Cost Settlement is not the universal cost model. Its optional social-
and supplementary-insurance submission paths are domain-specific and remain
separate from Damage Cost Settlement.

Hospital, outpatient care and provider changes do not split the Care Case by
themselves. Reha, Nachsorge and later evidence are matched per document against
existing and possible new linked Care Cases. Continuity prefers the existing
Case; an independently understandable course may rank a new linked Case first.
The user confirms either outcome. In M1, a new related Medical Case or
`part_of` child Case starts from one anchor document or explicit intent; the
product does not require a manual multi-document split. Later documents are
matched and linked individually. Recurrence is optional planning on a finite
Care Case, not a Case type. Special contractual insurance benefits are not
specialized by the medical core. Mappm performs no coverage or benefit
calculation.

## Accident/Damage Cost-Settlement Semantics

The accident-specific authority is
`DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md`. Its accepted core uses one
`accident_or_damage_settlement` Case per event/discovery and regulation context.
Only the coarse optional routing variants accident, vehicle accident, property
damage and theft/loss are part of the current fachlicher model.

Eine konkrete Abwicklung mit einem Versicherer darf als normaler
`insurance_settlement`-Case `part_of` des Unfall-/Schaden-Case werden. Mehrere
Rechnungen sowie mehrere Einreichungen/Nachreichungen bleiben in dieser
Versicherungsabwicklung. Jede unabhaengig verfolgte wirtschaftliche
Verpflichtung **kann** zusaetzlich ein normaler `damage_cost_settlement`-Case
werden; sie wird nicht pro Rechnung erzwungen. Policies remain Records;
suggested policy relations never prove coverage, responsibility or expected
payment.

`Medizinischer Unfall` is a user-facing entry/routing variant directly to
`medical_care`, not another Case entity and not an empty accident wrapper. Only
when nonmedical accident regulation becomes an independent concern is an
accident/damage Case added and linked so that the Medical Care Case is
`caused_by` it. Medical and damage cost-settlement Cases may share technical
primitives, but not one fachlicher catalog ID or payer workflow.

## Motor Accident Example

```text
Case: Autounfall vom 12.07.2026 regulieren
  secure people and scene
  capture parties and evidence
  assess reporting obligations
  involve police when applicable
  notify insurers
  assess and repair damage
  track insurance handling and payments
  review medical and legal consequences
  close or hand off independent consequences

  Case: Abschleppkosten abrechnen
    part_of -> Autounfall vom 12.07.2026 regulieren

  Case: Werkstattrechnung abrechnen
    part_of -> Autounfall vom 12.07.2026 regulieren

  Case: Versicherungsabwicklung mit Kaskoversicherung
    part_of -> Autounfall vom 12.07.2026 regulieren
    references both confirmed damage-cost Cases where useful

Case: Knieverletzung behandeln
  caused_by -> Autounfall vom 12.07.2026 regulieren

  Case: Arztrechnung abrechnen
    part_of -> Knieverletzung behandeln
```

- Police involvement is normally a conditional step, event and document source.
- Repair is normally a branch with estimate and work; each independently tracked
  invoice/payment/reimbursement obligation may be a `part_of` Damage Cost
  Settlement.
- Eine eigenstaendig verfolgte Versicherungsabwicklung ist ein normaler
  `part_of`-Case und darf mehrere Kosten sowie wiederholte Einreichungen
  enthalten. Einreichungen selbst erzeugen keine weiteren Cases.
- A confirmed independent medical treatment course may become a
  `medical_care` Case linked through `caused_by`; temporal proximity alone is
  insufficient.
- Rehabilitation and later evidence remain in that Medical Care Case by
  default; a separate successor is explicit and user-confirmed.
- A formal proceeding with its own case number, deadlines and outcome may become
  a linked Case.

The universal workflow never assumes that police, treatment or litigation is
always applicable. Jurisdiction packs define reviewed applicability rules.

## Manual and Guided Cases

Manual/Custom and guided Cases use the same entity and capabilities.

| Origin | Meaning |
|---|---|
| `manual` | user creates an own Case without a published template |
| `assist_suggested` | Assist proposes a Case and evidence; user confirms |
| `guided_workflow` | Case pins an approved workflow definition/version |

A manual Case may start with only a conservatively proposed and confirmed
title, the user-selected Managed Subject and one document. Tasks, appointments, workflow and a
detailed completion outcome are optional. It may later adopt a compatible
published workflow after an explicit preview and confirmation. Existing
documents, tasks and history remain intact.

Examples for manual Cases include a move, garden project, renovation, wedding,
private purchase project or other user-defined context. A manual Case is not a
second-class fallback and may contain documents, Records, tasks, dates,
reminders, costs, links and a timeline.

## Top-down and Bottom-up Composition

Mappm supports both directions.

### Top-down

1. Create a Case manually or from a workflow.
2. Add documents, Records, tasks and linked Cases.
3. Let Assist propose additional matching content.

### Bottom-up

1. Select documents, Records, tasks or existing Cases.
2. Choose `Create related Case` or `Create parent Case`.
3. Confirm title, managed profile/subject and suggested relation.
4. Link selected objects without copying or destructive moves.

Examples:

```text
selected documents
  -> Custom Case: Folgen nach Ereignis
  -> caused_by: Ausgangsereignis

selected termination Cases and move documents
  -> Case: Umzug 2027
  -> selected Cases use part_of where the user confirms it
```

The operation is reversible. Removing a CaseLink never deletes its Cases,
documents, tasks or history. A parent Case may be created after work already
exists because users often recognize the larger context late.

## Capture and Matching

Global capture is document-first. Automatic matching always runs after durable
capture. Backend/Core Assist must propose a conservative title without a
default date and rank:

- an existing Case;
- a compatible Record;
- a new lightweight manual or, where confirmed context supports it, guided
  Case.

The Managed Subject comes from the visible user-selected management context.
A workflow branch, insurance-settlement Case, additional Case or relation is
an optional best-effort candidate after its Backend feasibility gate and
always requires user confirmation.

The user may optionally provide known type/useful subtype, confirmed facts,
Managed Subject, coarse routing, new-Case intent or an existing Case during
capture. These hints retain user provenance and never replace analysis or
matching.

Current-release Case/Record assignments and material consequences require user
confirmation. Selecting **Neuen Vorgang starten** is a strong explicit intent
for a new primary Case but does not disable duplicate or optional additional-
relationship ranking. It is never semantically marked as Wrong-Case. Exact
rules are in
`DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`.

Assist must not infer a broad life event from one weak signal. An internet
termination confirmation does not prove a move. It belongs first to the
internet contract context. A move relation is added only from explicit user
context or a separately presented and confirmed relationship proposition.

## Agenda, Appointments and Evidence

Mappm is not a general calendar. Cases may exist before a document is received,
and manual facts or events may exist without documents. Documents remain the
preferred evidence source for automatic suggestions, not a mandatory Case
precondition.

Mappm provides a focused agenda over:

- tasks and deadlines;
- appointments linked to Cases or managed profiles;
- expected responses;
- expiry and renewal dates;
- reminders.

External calendar integration is optional and later. It requires explicit
consent and privacy-safe titles because health, legal and insurance context is
sensitive.

## Stop Rules

Stop implementation if:

- `Subcase` is introduced as a separate entity;
- the target architecture depends on a strict single-parent tree;
- a sender, file group or differing status automatically creates a Case;
- documents are copied or destructively moved when Cases are linked;
- closing/deleting a parent cascades into linked Cases;
- weak evidence silently creates a life-event Case;
- a workflow branch cannot be promoted or linked without losing history;
- Custom Cases lack the capabilities available to guided Cases;
- lightweight Custom Cases are forced to invent tasks, dates, workflow or an
  outcome before the captured document can be reviewed;
- `follow_up_to` is implemented as parent ownership or cascade deletion;
- capture requires users to configure Case relations/roles before analysis;
- a medical accident creates an empty accident wrapper or Medical and Damage
  Cost Settlement are merged into one domain workflow;
- pro Rechnung oder Einreichung ein Versicherungs-Case entsteht;
- `Claim` als eigene Mappm-Entitaet oder Matchingziel eingefuehrt wird;
- Backend/Core Assist omits an editable title proposal for a new Case.
