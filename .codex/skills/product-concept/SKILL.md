---
name: product-concept
description: Use when creating or revising Mappm whole-product strategy, roadmap, milestone, phase, decision, or handoff documentation that is broader than UI, including Commercial Core scope, Local/Cloud Vault modes, privacy, backend role, capture, sync, subscriptions, AI/OCR direction, or phase sequencing.
---

# DocMan Product Concept

Use this skill for strategic DocMan planning that is broader than UI.

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
- Read `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`.
- Read `docs/technical/DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md`.
- Read `docs/technical/DECISION_MANAGED_SUBJECTS_BUSINESS_CONTEXTS.md`.
- Read `docs/technical/DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md`.
- Read `docs/technical/DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md`.
- Read `docs/concepts/CONCEPT_F37_CASE_RECORD_CONTEXTUAL_EXPERIENCE.md`.
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
- Mappm has one `Case` entity. A Subvorgang is only the UI role of a normal
  Case connected with `CaseLink(relationType=part_of)`; there is no separate
  Subcase type or strict `parentCaseId` target tree.
- Split workflow stages, tasks, events, branches and Claims from Cases by
  independent goal/lifecycle/outcome, not by sender, institution, document or
  local status. Composition is reversible and supports top-down and bottom-up
  creation without copying content.
- Guided, Assist-suggested and manual/Custom Cases have equal capabilities.
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
- Contextual actions use progressive disclosure. Financial sections appear
  only for confirmed data, stay context-specific and deduplicate `part_of`
  roll-ups; Mappm is not an accounting product.

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
