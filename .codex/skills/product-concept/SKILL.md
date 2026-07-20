---
name: product-concept
description: Use when creating or revising Mappm whole-product strategy, roadmap, milestone, phase, decision, or handoff documentation that is broader than UI, including Commercial Core scope, Local/Cloud Vault modes, privacy, backend role, capture, sync, subscriptions, AI/OCR direction, or phase sequencing.
---

# Mappm Product Concept

Use this skill for strategic Mappm planning that is broader than UI.

Read `.codex/skills/ui-onboarding/SKILL.md` first for current project context. Use `github-issue` when the result creates actionable follow-up work.

## Boundaries

- Documentation and planning only.
- Do not write application code.
- Do not create low-level implementation plans; hand off to the relevant architect/builder skill.
- Do not use GitHub Issues to replace accepted decisions. Decisions belong in `docs/technical/DECISION_*.md`.

## Normative Product Baseline

- Read `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md`.
- Read `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`.
- Read `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`.
- Read `docs/concepts/CONCEPT_F36_VAULT_MODES_CLOUD_LIFECYCLE.md`.
- Read `docs/technical/DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`.
- Read `docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md` for
  accepted medical Care/Cost/Claim composition.
- Read `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`.
- Read `docs/technical/DECISION_DESKTOP_IMPORT_SCOPE.md` when desktop import,
  removable media, folder archives, ZIP handling or platform scope is affected.
- Read `docs/technical/DECISION_CROSS_DEVICE_CAPTURE_HANDOFF.md` when
  smartphone-to-desktop capture, Local-to-Local transfer or Continuity Camera
  is affected; it is a Draft and never authorizes implementation.
- Read `docs/discovery/MEDICAL_CASE_MODEL_DISCOVERY.md` only when medical Case
  rationale is in scope. It is a resolved non-normative reference, not
  authority for the accepted core.
- Read `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`.
- Read `docs/technical/DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md`.
- Read `docs/technical/DECISION_MANAGED_SUBJECTS_BUSINESS_CONTEXTS.md`.
- Read `docs/technical/DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md`.
- Read `docs/technical/DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md`.
- Read `docs/technical/DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md` whenever
  dates, events, deadlines, tasks, Agenda, extraction or calendar capability
  are affected.
- Read `docs/concepts/CONCEPT_F37_CASE_RECORD_CONTEXTUAL_EXPERIENCE.md`.
- Read `docs/discovery/OPEN_QUESTIONS_REGISTER.md`; OQ-011 blocks final
  taxonomy, OQ-012 is resolved and OQ-013 blocks only Cross-Device-Capture
  convenience paths.
- Treat Local and Cloud as explicit Vault modes, not environment flags.
- Every normal Free/Paid Local and Cloud mode requires a Mappm Account; Local
  remains local-authoritative and Detached Recovery is the account-independent
  exit guarantee.
- Cloud Vault is managed-cloud-authoritative; local data is cache and pending work.
- Core Assist is required in Commercial Core and is separate from Vault
  authority; Assist processing never silently creates Cloud storage/backup.
- Provider migration is explicit, verified and reversible through export/migration.
- Cancellation never causes immediate loss: grace/read-only, export, reactivation,
  Cloud-to-Local migration and deletion are distinct product states/actions.
- Home Hub is not a customer product. Local Development Cloud is synthetic
  developer infrastructure using the production contract family.
- The first target is a production-ready, sellable Commercial Core. Deferred
  features are absent rather than incomplete.
- Commercial 1.0 is Austria-first. The next planned expansion direction is the
  German-speaking market area, but every jurisdiction keeps separate legal,
  provider, source and release evidence; German language never selects
  jurisdiction. WF-01 still decides the exact Austrian Golden Workflows, WF-02
  their professional ownership and WF-03 the post-Austria jurisdiction order.
- Mappm has one `Case` entity. A Subvorgang is only the UI role of a normal
  Case connected with `CaseLink(relationType=part_of)`; there is no separate
  Subcase type or strict `parentCaseId` target tree.
- A `Case` is deliberately generic and may remain a lightweight named document
  collection/context. Custom/guided behavior, domain template and workflow are
  optional enrichments, not visible Case subtypes; never invent a large Case
  type picker.
- Every persisted Case is valid. Zero, one or many documents are allowed; no
  document type/set, workflow, task, Claim or outcome is a general validity
  requirement. Assist proposals are not Cases until confirmed creation, and
  there is no `invalid` Case lifecycle state.
- Split workflow stages, tasks, events, branches and Claims from Cases by
  independent goal/lifecycle/outcome, not by sender, institution, document or
  local status. Composition is reversible and supports top-down and bottom-up
  creation without copying content.
- Guided, Assist-suggested and manual/Custom Cases have equal capabilities.
- Global capture always runs asynchronous Backend/Core Assist analysis and
  matching. The service must propose editable titles for every logical Document
  and proposed Case/Record, including explicit new-Case intent. The accepted
  M1 exception is the contextual medical desktop media package: the user enters
  its required title manually and may add an optional examination date; the
  package is not unpacked for OCR/Assist.
- Current release routing is user-confirmed through relevant visible results;
  later reversible automation is class-specific, measured, abstaining and
  undoable. Mobile scan uses one explicit logical document per completed scan
  unit, with multiple pages before **Naechstes Dokument scannen**. Batch/session
  proximity never proves a shared Case.
- Completed review requires a primary Case or Record. A lightweight Custom Case
  may begin with generated title, Managed Subject and optionally one document.
- `follow_up_to` forms Case chains/branches without parent ownership. Medical
  core composition is accepted: one neutral `medical_care` anchor, one
  `part_of` `medical_cost_settlement` per independent economic obligation and
  payer submissions as Claims. Treatment authorization documents stay inside
  Care and do not become Cases or M1 types. Reha, follow-up and later evidence
  are matched per document against existing and possible new linked Care Cases.
  A new Medical related/Subcase starts in M1 from one confirmed anchor document
  or explicit intent; no free multi-document split is required. Recurrence is
  optional planning on finite Care Cases, not a Case type. Special contractual
  benefits are not specialized by Medical M1. Multiple payer
  relationships and explicit category defaults are allowed, but defaults only
  order choices and never prove coverage. Mappm performs no policy, coverage
  or expected-benefit calculation. Payment, social-insurance Claim,
  supplementary-insurance Claim and Case lifecycle are separate provenance-
  bearing states. Only confirmed social-insurance settlement/rejection suggests
  the normal supplementary-insurance step. Special forms remain generic
  documents unless later product evidence justifies specialization. A rare
  desktop-only action inside
  an existing confirmed and open `medical_care` Case may archive a selected
  media/folder tree as one inert ZIP with byte-identical original re-export.
  It uses a manual required title and at most an optional examination date in
  M1, with no OCR/Assist requirement. It is absent from global capture,
  nonmedical Cases and Mobile. OQ-012 is resolved.
- Mobile capture includes native scan, photo evidence, gallery and system
  file/share import. Desktop includes picker, multi-file and drag-and-drop;
  external scanner output is imported as a file. Desktop-webcam document
  scanning is prohibited. Cross-device/mobile-to-desktop and Continuity Camera
  remain Draft-only under OQ-013.
- Case `done` and `archived` states are reversible. Later evidence is matched
  to completed/archived Cases, may be linked without reopening and requires
  user-confirmed reopening or a new linked Case when it creates new work.
- Vorgänge and Unterlagen/Records are equal product areas with distinct
  semantics. Durable identity records, contracts and policies are Records;
  files/documents remain evidence or versions.
- Recurring contracts/subscriptions are first-class Record contexts. Ordinary
  activation, change, price review, cancellation and final billing remain in
  one context; only independently meaningful disputes become linked Cases.
- Managed persons and managed organizations share one management principle;
  external doctors, providers, insurers and authorities remain ExternalParty.
- Tax capability means dated, jurisdictional document collection and review,
  never implicit deductibility, bookkeeping, tax calculation, advice or filing.
- Documents have typed temporal facts rather than one universal date. Keep
  system timestamps, issue/receipt/service/validity/due dates, events,
  appointments, deadlines, tasks, expected responses and reminders
  semantically distinct and provenance-bearing. Calendar integration is later,
  selective and consented.
- Contextual actions use progressive disclosure. Financial sections appear
  only for confirmed data, stay context-specific and deduplicate `part_of`
  roll-ups; Mappm is not an accounting product.
- `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` is the sole SSOT
  for workflow-pattern IDs/titles and every discussed domain-template ID,
  German title, catalog status and disposition. Discovery, medical,
  country/provider and pillar documents may only reference and elaborate its
  registered IDs. Namespaced country/provider variant keys are allowed only
  with an explicit mapping to one registered canonical ID and never become a
  second global catalog. Never create or maintain a parallel Case/workflow
  list; add or change a canonical entry in the SSOT first or in the same
  change.

## Core Product Assumptions

- UI language: German user-facing terms, with `Case` in code and `Vorgang` in UI.
- Product name is `Mappm`; `DocMan` remains the technical repo/workspace name until renamed.
- Provider-based Vault authority is the product direction; do not describe the
  complete product as universally local-first or cloud-first.
- Managed Mappm Cloud is the server product direction. Self-hosting and
  customer-entered server URLs are not active product scope.
- Documents are sensitive data. Privacy, secure storage, logs, and future sync/cloud design must treat both metadata and files as sensitive.
- Core Assist/OCR/classification is part of C2/C3 Commercial Core; Advanced
  Assist remains later. No real-document processing starts before accepted
  trust/provider/retention/AI gates.
- Document taxonomy keeps base type, semantic variant, domain, Record kind,
  source/format and relationship role separate. The full taxonomy/workflow mapping remains an
  explicit product review and must not be invented from the historical M2 list.

## Documentation Targets

Use current docs:

- `docs/PROJECT_OVERVIEW_GUIDE.md`
- `docs/ROADMAP_REBUILD.md`
- `docs/concepts/CONCEPT_F*.md`
- `docs/technical/DECISION_*.md`
- `docs/roadmap/PHASE_INDEX.md`
- approved phase documents under `docs/roadmap/phases/`; the old R2 foundation
  implementation plan is superseded and may be read only as migration history

## Workflow

1. Identify whether the work is product strategy, concept, phase, decision, or handoff.
2. Read the affected roadmap/decision/concept docs.
3. Update only the authoritative document for the decision level.
4. Mark open decisions explicitly.
5. Create or update GitHub Issues only for actionable follow-up work.
6. Summarize what changed and what remains undecided.

## Handoff Targets

- UI implementation plan: `ui-architect`.
- Foundation implementation: `foundation-builder`.
- Data/storage design: `data-architect`.
- Quality/testing/readiness: `quality-readiness`.
- API contracts/Mappm Cloud/Capture/Sync: `contract-api`.
