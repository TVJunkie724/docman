---
name: docman-product-concept
description: Use when creating or revising DocMan whole-product strategy, roadmap, milestone, phase, decision, or handoff documentation that is broader than UI, including first utility scope, naming, local-first strategy, privacy, backend role, mobile capture, sync, AI/OCR direction, or phase sequencing.
---

# DocMan Product Concept

Use this skill for strategic DocMan planning that is broader than UI.

Read `.codex/skills/docman-ui-onboarding/SKILL.md` first for current project context. Use `docman-github-issue` when the result creates actionable follow-up work.

## Boundaries

- Documentation and planning only.
- Do not write application code.
- Do not create low-level implementation plans; hand off to the relevant architect/builder skill.
- Do not use GitHub Issues to replace accepted decisions. Decisions belong in `docs/technical/DECISION_*.md`.

## Active Roadmap

- R0: product and architecture decisions.
- R1: documentation source of truth.
- R2: technical foundation.
- R3: quality and production readiness.
- R4/M2: Capture and Review Core.
- M3: Assisted Review.
- M4: Household and Sync.
- M5/M6: Facts, Workflows, Insights, Automation, Resilience and Distribution.

## Core Product Assumptions

- UI language: German user-facing terms, with `Case` in code and `Vorgang` in UI.
- Product name is `Ordna`; `DocMan` remains the technical repo/workspace name until renamed.
- Local-first is the product direction.
- First self-hosted path can use Home Hub/Tailscale, but product architecture must remain backend-agnostic.
- Documents are sensitive data. Privacy, secure storage, logs, and future sync/cloud design must treat both metadata and files as sensitive.
- AI/OCR is not a prerequisite for M2, but Assisted Review is the next milestone after capture/review because optional metadata should not rely on long-term manual entry.

## Documentation Targets

Use current docs:

- `docs/PROJECT_OVERVIEW_GUIDE.md`
- `docs/ROADMAP_REBUILD.md`
- `docs/concepts/CONCEPT_F*.md`
- `docs/technical/DECISION_*.md`
- `docs/technical/R2_TECHNICAL_FOUNDATION_IMPLEMENTATION_PLAN.md`

## Workflow

1. Identify whether the work is product strategy, concept, phase, decision, or handoff.
2. Read the affected roadmap/decision/concept docs.
3. Update only the authoritative document for the decision level.
4. Mark open decisions explicitly.
5. Create or update GitHub Issues only for actionable follow-up work.
6. Summarize what changed and what remains undecided.

## Handoff Targets

- UI implementation plan: `docman-ui-architect`.
- Foundation implementation: `docman-foundation-builder`.
- Data/storage design: `docman-data-architect`.
- Quality/testing/readiness: `docman-quality-readiness`.
- API contracts/Home Hub/Capture/Sync: `docman-contract-api`.
