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
- Read `docs/technical/DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md` whenever a
  Case family, matching boundary, typical content or lifecycle is in scope.
- Read `docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md` for
  the accepted medical Care/Cost/submission baseline.
- Read `docs/technical/DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md` whenever
  accident, damage, theft/loss, repair costs, insurance settlement, policy matching or
  medical consequences of an accident are in scope.
- Read `docs/technical/DECISION_INSURANCE_SETTLEMENT_MODEL.md` whenever an
  insurer, policy, submission/resubmission, external damage reference or
  insurance handling context is in scope.
- Read `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`.
- Read `docs/technical/DECISION_INTELLIGENCE_SCOPE.md` whenever OCR, LLM,
  extraction, matching, title, workflow suggestion, relation suggestion,
  document quality or automation is in scope.
- Read `docs/concepts/CONCEPT_F38_ASYNC_PROCESSING_WAIT_EXPERIENCE.md` whenever
  progressive extraction, background processing, wait animation or Review
  Queue behavior is in scope.
- Read `docs/technical/DECISION_DESKTOP_IMPORT_SCOPE.md` when desktop import,
  removable media, folder archives, ZIP handling or platform scope is affected.
- Read `docs/technical/DECISION_CROSS_DEVICE_CAPTURE_HANDOFF.md` when
  smartphone-to-desktop capture, Local-to-Local transfer or Continuity Camera
  is affected; it is a Draft and never authorizes implementation.
- Read `docs/discovery/MEDICAL_CASE_MODEL_DISCOVERY.md` only when medical Case
  rationale is in scope. It is a resolved non-normative reference, not
  authority for the accepted core.
- Read `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`.
- Read `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md` whenever a Case,
  workflow, document family, taxonomy or matching vocabulary is discussed.
- Read `docs/technical/DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md`.
- Read `docs/technical/DECISION_MANAGED_SUBJECTS_BUSINESS_CONTEXTS.md`.
- Read `docs/technical/DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md`.
- Read `docs/technical/DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md`.
- Read `docs/technical/DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md` whenever
  dates, events, deadlines, tasks, Agenda, extraction or calendar capability
  are affected.
- Read `docs/technical/DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md` whenever
  a Country-/Provider-/Policy rule can derive a deadline or reminder.
- Read `docs/technical/DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md` whenever
  Austrian medical payers, KFA, supplementary insurance, reimbursement
  deadlines or provider-specific submission behavior are in scope.
- Read `docs/ops/OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md` whenever a
  Country-/Provider rule is proposed for activation, release or update.
- Read `docs/execution/handoffs/DOMAIN_BACKEND_FEASIBILITY_REGISTER.md`
  whenever product semantics depend on extraction, matching, latency,
  confidence, cost, privacy or target-release backend capability.
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
- Every plan assumes only small to medium general-purpose model capability:
  coarse type/domain classification, OCR, type-dependent semantic field
  proposals, conservative title and best-effort ranking. Product/Document
  decisions define the few relevant review fields; Assist may prefill them
  with a top candidate and alternatives, but does not invent the field set or
  finalize semantic wrong-profile/case/document detection, page coherence,
  affected-person inference, workflow/legal-deadline meaning, causality or
  relationship truth. Stronger behavior needs a named class/release
  feasibility gate; user context and confirmation remain authoritative.
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
  document type/set, workflow, task, submission or outcome is a general validity
  requirement. Assist proposals are not Cases until confirmed creation, and
  there is no `invalid` Case lifecycle state.
- Split workflow stages, tasks, events and branches from Cases by
  independent goal/lifecycle/outcome, not by sender, institution, document or
  local status. Composition is reversible and supports top-down and bottom-up
  creation without copying content.
- Guided, Assist-suggested and manual/Custom Cases have equal capabilities.
- Global capture always runs asynchronous Backend/Core Assist analysis and
  matching. Capture begins in a visible Managed-Subject context that may be
  preselected or inherited. Before leaving capture, the user may optionally supply only known
  information such as base type/useful subtype, confirmed facts, Managed
  Subject, coarse routing, new-Case intent or an existing Case. These are
  provenance-bearing hints, never mandatory fields, a replacement for matching
  or permission for Assist to overwrite user values. The service must propose
  editable titles for every logical Document and proposed Case/Record, including
  explicit new-Case intent. Automatic titles are conservative and contain no
  date by default. The accepted
  M1 exception is the contextual medical desktop media package: the user enters
  its required title manually and may add an optional examination date; the
  package is not unpacked for OCR/Assist.
- Current release routing is user-confirmed through relevant visible results;
  later reversible automation is class-specific, measured, abstaining and
  undoable. Mobile scan uses one explicit logical document per completed scan
  and each Desktop file is one initial logical document. Mixed content does not
  make the document invalid and is neither rejected nor auto-split in M1.
  unit, with multiple pages before **Naechstes Dokument scannen**. Batch/session
  proximity never proves a shared Case.
- Completed review requires a primary Case or Record. A lightweight Custom Case
  may begin with generated title, Managed Subject and optionally one document.
- Mappm has no `Claim` entity, repository or matching target. An independently
  tracked insurance handling context is a normal `insurance_settlement` Case;
  individual submissions/resubmissions are repeatable events or workflow
  steps. External claim/damage numbers are Facts and policies are Records.
- `follow_up_to` forms Case chains/branches without parent ownership. Medical
  baseline composition currently uses one neutral `medical_care` anchor, one
  `part_of` `medical_cost_settlement` per independently issued medical
  invoice/honorarnote and payer submissions as repeatable events/branches with
  zero, one or many document links. Corrections, credits, proof, submissions
  and payer responses for the same invoice stay in that Cost Case; a new
  independently issued invoice creates a new Cost Case. No document is
  required for Case validity. Treatment authorization documents stay inside
  Care and do not become Cases or M1 types. Reha, follow-up and later evidence
  are matched per document against existing and possible new linked Care Cases.
  A new related Medical Case or `part_of` child Case starts in M1 from one
  confirmed anchor document or explicit intent; no free multi-document split
  is required. Recurrence is
  optional planning on finite Care Cases, not a Case type. Special contractual
  benefits are not specialized by Medical M1. Multiple payer
  relationships and explicit category defaults are allowed, but defaults only
  order choices and never prove coverage. A private relationship is a stable
  Policy Record plus calm contract context; a policy document is optional and
  an imported existing policy never fabricates a historical conclusion Case.
  Mappm performs no policy, coverage or expected-benefit calculation. Payment,
  social-insurance submission, each supplementary-insurance submission, each
  payer deadline and Case lifecycle are separate provenance-bearing states.
  Household finance separates obligation/open amount, actual outflow,
  confirmed reimbursement/inflow and confirmed net burden; unpaid outflow is
  zero and status never mutates amounts. Only confirmed social-insurance settlement/rejection suggests
  the normal supplementary-insurance step. Special forms remain generic
  documents unless later product evidence justifies specialization. A rare
  desktop-only action inside
  an existing confirmed and open `medical_care` Case may archive a selected
  media/folder tree as one inert ZIP with byte-identical original re-export.
  It uses a manual required title and at most an optional examination date in
  M1, with no OCR/Assist requirement. It is absent from global capture,
  nonmedical Cases and Mobile. OQ-012 and the Medical part of OQ-014 are
  resolved. Care closes manually, may be `done` while Cost children remain
  active, and a Cost Case closes only with user confirmation after all actually
  started payer paths are terminal or deliberately ended.
- Rule-derived deadlines retain start anchor, source, rule/pack version,
  confirmation and review status. Multiple payer deadlines remain separate;
  only the earliest confirmed applicable open deadline may be derived as a
  compact attention value. Provider name/default/raw LLM never finalizes a
  material deadline, and pack updates never silently recalculate history.
- The researched Austrian medical baseline activates a 42-month pack rule only
  for OeGK, SVS and BVAEB after professional release review. KFA and private
  provider/tariff rules require separate evidence. Active Country-/Provider
  rules require OPS-09 monthly source checks, at least six-monthly human
  review, developer reminders, immutable versions, withdrawal and release
  gates.
- Accident/damage baseline composition currently uses one
  `accident_or_damage_settlement` per event/discovery and regulation context,
  with only coarse optional routing variants for accident, vehicle accident,
  property damage and theft/loss. `Medizinischer Unfall` routes directly to
  `medical_care` and creates no empty accident wrapper. If nonmedical accident
  handling later becomes independently relevant, both Cases are linked with
  `caused_by`. Each independent damage-related economic obligation may become
  an optional `part_of` `damage_cost_settlement` only when the obligation is
  independently tracked. Insurance handling is a normal
  `insurance_settlement` Case that may contain several invoices and repeated
  submission/resubmission events.
  Damage Cost Settlement remains fachlich distinct from Medical Cost
  Settlement, whose optional social- and supplementary-insurance stages are
  domain-specific. Policies are Records; matches are suggestions and never
  prove coverage, responsibility or expected payment. OQ-014 requires the
  requested Accident/Damage family re-review before implementation.
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
  one context. An actually accompanied contract conclusion may be a finite
  Case whose result is the durable Record; importing an existing contract
  never fabricates a historical conclusion Case. Only independently meaningful
  disputes become linked Cases.
- Managed persons and managed organizations share one management principle;
  external doctors, providers, insurers and authorities remain ExternalParty.
- Tax capability means dated, jurisdictional document collection and review,
  never implicit deductibility, bookkeeping, tax calculation, advice or filing.
- Documents have typed temporal facts rather than one universal date. Keep
  system timestamps, issue/receipt/service/validity/due dates, events,
  appointments, deadlines, tasks, expected responses and reminders
  semantically distinct and provenance-bearing. OCR/parser/model may propose a
  top semantic value for each type-relevant date field; the field offers other
  detected dates, no-date and manual-entry fallbacks. The visible review or a
  narrowly proven rule establishes the active meaning. Calendar integration
  is later, selective and consented.
- M1 corrections update only the user's confirmed product data. They are not
  document donation, human analysis-improvement review, online learning or
  production-data fine-tuning. Any later optional improvement program needs a
  separate consent/privacy/security/legal/AI/operations gate.
- Contextual actions use progressive disclosure. Financial sections appear
  only for confirmed data, stay context-specific and deduplicate `part_of`
  and cross-context roll-ups. Mappm provides a private household payment/cost
  overview, not formal bookkeeping, tax accounting or an Austrian
  `Einnahmen-Ausgaben-Rechnung`.
- `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` is the sole SSOT
  for workflow-pattern IDs/titles and every discussed domain-template ID,
  German title, catalog status and disposition. Discovery, medical,
  country/provider and pillar documents may only reference and elaborate its
  registered IDs. Namespaced country/provider variant keys are allowed only
  with an explicit mapping to one registered canonical ID and never become a
  second global catalog. Never create or maintain a parallel Case/workflow
  list; add or change a canonical entry in the SSOT first or in the same
  change.
- A dedicated Case-family workshop is discussion-only until the agent has
  summarized the complete result in chat and the user explicitly approves it
  for documentation. Do not create a Draft, workshop file or Decision before
  that approval. During discussion, distinguish already accepted constraints,
  proposals, open questions and rejected alternatives, and advance one
  decision at a time. After explicit approval, create or update exactly one
  owning family Decision and register coverage in the catalog in the same
  change. New family Decisions use
  `docs/technical/DECISION_<CASE_FAMILY>_MODEL.md`; an unambiguous existing
  Decision may remain the owner and must be expanded instead of duplicated.
  One subconcept may own explicitly listed tightly coupled entries, but one
  catalog ID may have only one owner.
- Document classification follows minimum sufficient classification. Mappm
  optimizes household findability and actionability, not taxonomic
  completeness. This is neither a subtype ban nor a target to minimize subtype
  count. Retain every type/semantic variant with durable use or materially
  different behavior; `medical_invoice` is the reference example because it
  may drive Medical Cost Settlement and payment/Payer-submission behavior. A new
  Case/workflow document term otherwise defaults to title/alias,
  Fact, relationship role, Record kind, source/format or a broad/general type.
  Add a base type or semantic variant only after the product-value gate in
  `DECISION_DOCUMENT_TYPE_CATALOG.md`: durable later use or materially
  different behavior, no sufficient existing axis, stable/testable recognition
  and complexity justified. Never derive a type list from a scenario's
  document list.

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
3. Delegate substantive Case-family work to `case-concept`, document
   taxonomy/promotion to `document-concept`, and Country-/Provider-pack work to
   `country-pack-concept`.
4. Before substantive Case-family discussion, identify its registered catalog
   ID, accepted constraints and any existing owner. Do not edit or create the
   family Decision yet.
5. Discuss one decision at a time and label accepted constraints, proposals,
   open questions and rejected alternatives without turning UI examples into
   product decisions.
6. Resolve or explicitly mark every required block from
   `DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md`.
7. Summarize the complete result in chat and wait for explicit user approval to
   document it.
8. Only after approval, create or update the single owning family Decision and
   its catalog coverage in the same change.
9. For every new Case/workflow, classify each document term as existing type,
   broad/general document, title/alias, Fact/Party, relationship role/slot,
   Record kind or source/format before proposing any new type.
10. Update only the authoritative document for the decision level.
11. Mark open decisions and Backend-/Data-Feasibility explicitly.
12. Run `case-concept-review` before declaring a family implementation-ready.
13. Create or update GitHub Issues only for actionable follow-up work.
14. Summarize what changed and what remains undecided.

## Handoff Targets

- UI implementation plan: `ui-architect`.
- Foundation implementation: `foundation-builder`.
- Data/storage design: `data-architect`.
- Quality/testing/readiness: `quality-readiness`.
- API contracts/Mappm Cloud/Capture/Sync: `contract-api`.
- Case-family definition: `case-concept`.
- Document taxonomy/promotion: `document-concept`.
- Country-/Provider-pack definition: `country-pack-concept`.
- Case-family final review: `case-concept-review`.
