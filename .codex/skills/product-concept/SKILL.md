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
