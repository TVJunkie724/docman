---
title: "DocMan/Mappm - Playbook Reconciliation Runbook"
description: "Sequenzielles Runbook fuer den Abgleich des bestehenden DocMan/Mappm-Projekts gegen das Flutter Project Setup Playbook"
tags: [execution, playbook, reconciliation, agent, setup]
lastUpdated: "2026-07-08"
status: "draft"
owner: "project-bootstrap-runner"
---

# DocMan/Mappm - Playbook Reconciliation Runbook

## Purpose

This runbook controls the DocMan/Mappm reconciliation against
`docs/flutter-project-playbook/PLAYBOOK.md`.

DocMan/Mappm is not a new empty project. The playbook is applied as a
hardening pass:

- preserve accepted DocMan/Mappm decisions and concepts.
- keep existing project-local skills as authoritative role contracts.
- add missing playbook governance artifacts where they improve execution.
- mark gaps as `planned`, `deferred`, `blocked`, `needs-review` or
  `not-applicable` with strict traceability.

## Track Status

| Track | Status | Required artifacts | Evidence | Blockers |
|---|---|---|---|---|
| T0 Bootstrap Reconciliation | done | repo/docs/app/skills scaffold, embedded playbook, scripts | `.codex/skills/*`, `docs/flutter-project-playbook/`, `lib/`, `scripts/`, `frontend.sh`, `docs/ops/OPS-08_PROJECT_ENTRYPOINTS.md` | none |
| T1 Applicability | in-progress | REG-00, Applicability Matrix, Always-Plan Checklist | `docs/discovery/APPLICABILITY_MATRIX.md`, `docs/regulatory/REG-00_REGULATORY_UMBRELLA.md`, `docs/security/SEC-00_SECURITY_TRUST_UMBRELLA.md`, `docs/data-lifecycle/DATA-00_DATA_LIFECYCLE_UMBRELLA.md`, `docs/ops/OPS-00_OPERATIONS_UMBRELLA.md`, `docs/ai/AI-00_AI_GOVERNANCE_UMBRELLA.md`, `docs/commercial/COM-00_COMMERCIAL_UMBRELLA.md` | detailed sub-concepts need expansion |
| T2 Discovery Interview | planned | Decision Summary, Open Questions Register, Traceability Matrix | existing product decisions and this runbook | focused owner review still needed for commercial/cloud/legal questions |
| T3 Foundation Decisions | planned | decision traceability, key decision updates | many `docs/technical/DECISION_*.md` exist | accepted/draft-safe status needs matrix pass |
| T4 Concept Seeding | planned | Concept Coverage Matrix, required concept drafts | `docs/concepts/*`, `docs/design-system/concepts/*`, REG/SEC/DATA/OPS/AI/COM umbrellas | template subfamilies need expansion before affected implementation |
| T5 Standard Roadmap | planned | Pillar Index, Phase Index, Conditional Matrix | `docs/pillars/*`, `docs/roadmap/*`, `docs/roadmap-standard/DOCMAN_PLAYBOOK_TRACK_MAPPING.md` | playbook P0-P11 must be mapped to DocMan R0-R15 in detail |
| T6 Implementation Readiness | planned | first implementation-ready phase, handoff, issues | R4.5 plan exists | first phase must be rechecked against phase-as-contract standard |
| T7 Verification | planned | verify status, CI/CD readiness, completion reports | `scripts/bootstrap.sh`, `scripts/codegen.sh`, `scripts/verify.sh` | CI/CD/release gates need OPS/F16 reconciliation |

Status values: `not-started`, `in-progress`, `planned`, `blocked`, `done`,
`not-applicable`.

## Rules

- A track is not `done` until its required artifacts exist and are referenced.
- A blocked track must name blocker, owner, next action and re-check trigger.
- Critical decisions cannot be silently assumed.
- Track handoff is required whenever another owner or skill must continue.
- Every completed track needs a track report or a dedicated closeout section.
- Every accepted critical answer must appear in
  `docs/execution/DECISION_TRACEABILITY_MATRIX.md`.
- Every required or conditional concept family must appear in
  `docs/execution/CONCEPT_COVERAGE_MATRIX.md`.
- Existing DocMan decisions remain authoritative until explicitly superseded.
- Future work must remain visible with strict traceability:
  - `planned`: owner, implementation trigger, review date and target phase,
    issue or backlog item.
  - `deferred`: owner, reason, implementation trigger, review date and target
    phase, issue or backlog item.
  - `blocked`: owner, blocker, next action and re-check trigger.
  - `not-applicable`: owner, reason and review date.

## Current Reconciliation Notes

- The general Flutter playbook is embedded at `docs/flutter-project-playbook/`
  and should be treated as a toolkit/reference, not as DocMan runtime source.
- DocMan already has mature project-local skills under `.codex/skills/`.
- DocMan already has many product decisions under `docs/technical/`.
- DocMan already has F-concepts and initial MP-DS concepts, but numbering and
  family names differ from the general playbook and need a mapping pass.
- DocMan has a design-system HTML mock under `docs/design-system/Mock/`.
- Mappm now has dedicated reconciliation directories under `docs/discovery`,
  `docs/execution`, `docs/roadmap-standard`, `docs/regulatory`,
  `docs/security`, `docs/ai`, `docs/data-lifecycle`, `docs/ops` and
  `docs/commercial`.
- `frontend.sh` is the project-local frontend entrypoint. It delegates to
  existing scripts and documents the current command contract without claiming
  backend ownership.

## Track Closeout - T0 Bootstrap Reconciliation

Status: done on 2026-07-08.

Evidence:

- product name reconciled as Mappm while DocMan remains the technical repo name.
- general Flutter setup playbook embedded as submodule at
  `docs/flutter-project-playbook/`.
- project-local skills remain under `.codex/skills/`.
- project-local frontend entrypoint added at `frontend.sh`.
- entrypoint ownership and instance/config rules documented in
  `docs/ops/OPS-08_PROJECT_ENTRYPOINTS.md`.

Accepted assumptions:

- Mappm currently has no live instance matrix, generated config contract,
  per-instance icons or backend runtime entrypoint.
- These areas remain required planning topics and must be activated by future
  release, backend, config and platform phases.

## Final Output Required Before Implementation Resumes

- Completed track table.
- Open blockers.
- Accepted assumptions.
- Deferred/planned items.
- Concept coverage status.
- Decision traceability status.
- First implementation-ready phase or reason why no phase can proceed.
