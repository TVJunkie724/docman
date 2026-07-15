---
title: "Decision - Case Relationships and Workflow Composition"
description: "Verbindliches Mappm-Modell fuer eigenstaendige Vorgaenge, typisierte Beziehungen, Workflow-Schritte, Ablaufzweige, Custom-Vorgaenge und Bottom-up-Komposition"
tags: [decision, product, cases, workflows, relationships, custom-cases, tasks, agenda]
lastUpdated: "2026-07-15"
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
definition, tasks, Claims, appointments, financial entries and completion
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

If no, it remains a step, event, task, claim, submission or conditional branch
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
| claim/submission | structured request to an institution with its own local status and amounts |
| linked Case | independently meaningful goal reached through a typed relation |

A workflow definition may contain mandatory steps, conditional steps,
parallel/sequential branches and explicit escalation points. A branch is not a
Case by default. It can later be promoted to a linked Case without copying
files, facts or history.

## Illustrative Medical Cost-Settlement Claim Semantics (non-normative)

The following example demonstrates generic Claim/branch semantics only. The
medical family, Case boundary and workflow are still open in
`docs/discovery/MEDICAL_CASE_MODEL_DISCOVERY.md`. Its current draft proposes
that each such cost-settlement Case is `part_of` a medical care anchor; that
proposal remains non-normative until R0.6/OQ-012 acceptance.

```text
Case: Arztrechnung vollstaendig abrechnen
  review invoice
  pay invoice where applicable
  identify/rank applicable payer when submission is invoked
  submit to the confirmed payer
  wait for response/payment and reconcile outcome
  activate another applicable payer Claim only when evidence/context supports it
  reconcile total reimbursement and own share
  close with explicit outcome

  Claim: social insurance
  Claim: supplementary insurance
```

The two payer Claims are not Subcases. Documents from different insurers are
linked to the same Case and to the relevant Claim using roles such as
`submission`, `response`, `decision` or `payment_proof`.

Whether hospital, outpatient care, therapy, rehabilitation or benefit work are
stages, separate Cases or another composition is deliberately not decided by
this example.

## Motor Accident Example

```text
Case: Autounfall vom 12.07.2026 regulieren
  secure people and scene
  capture parties and evidence
  assess reporting obligations
  involve police when applicable
  notify insurers
  assess and repair damage
  track claims and payments
  review medical and legal consequences
  close or hand off independent consequences
```

- Police involvement is normally a conditional step, event and document source.
- Repair is normally a branch with estimate, work and invoice.
- Insurer interactions are normally Claims within the accident Case.
- Initial medical examination and legal correspondence may remain in the Case
  or become linked work; the medical discovery must decide the boundary.
- Long-running treatment is only an illustration of work that could satisfy the
  generic independent-goal test; no medical Case type is accepted here.
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

A manual Case may start with only an automatically proposed/confirmed title,
Managed Subject and one document. Tasks, appointments, Claims, workflow and a
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
2. Add documents, Records, tasks, Claims and linked Cases.
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
capture and Backend/Core Assist must propose a title as well as:

- an existing Case;
- a compatible Record;
- a managed person or organization;
- a Claim or workflow branch;
- a new manual or guided Case;
- a relation to an existing Case.

Current-release Case/Record assignments and material consequences require user
confirmation. Selecting **Neuen Vorgang starten** is a strong explicit intent
for a new primary Case but does not disable outlier, duplicate or additional-
relationship matching. Exact rules are in
`DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`.

Assist must not infer a broad life event from one weak signal. An internet
termination confirmation does not prove a move. It belongs first to the
internet contract context. A move relation is added only from explicit user
context, a confirmed prior relationship or sufficiently explained multi-source
evidence requiring review.

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
- Custom Cases lack the capabilities available to guided Cases.
- lightweight Custom Cases are forced to invent tasks, dates, workflow or an
  outcome before the captured document can be reviewed;
- `follow_up_to` is implemented as parent ownership or cascade deletion;
- capture requires users to configure Case relations/roles before analysis;
- Backend/Core Assist omits an editable title proposal for a new Case.
