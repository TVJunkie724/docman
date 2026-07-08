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
| T0 Bootstrap Reconciliation | in-progress | repo/docs/app/skills scaffold, embedded playbook, scripts | `.codex/skills/*`, `docs/flutter-project-playbook/`, `lib/`, `scripts/` | entrypoint contract not yet reconciled |
| T1 Applicability | in-progress | REG-00, Applicability Matrix, Always-Plan Checklist | `docs/discovery/APPLICABILITY_MATRIX.md`, existing decisions | regulatory/security/ops templates need DocMan adaptation |
| T2 Discovery Interview | planned | Decision Summary, Open Questions Register, Traceability Matrix | existing product decisions and this runbook | focused owner review still needed for commercial/cloud/legal questions |
| T3 Foundation Decisions | planned | decision traceability, key decision updates | many `docs/technical/DECISION_*.md` exist | accepted/draft-safe status needs matrix pass |
| T4 Concept Seeding | planned | Concept Coverage Matrix, required concept drafts | `docs/concepts/*`, `docs/design-system/concepts/*` | template families REG/SEC/AI/DATA/OPS/COM not yet expanded |
| T5 Standard Roadmap | planned | Pillar Index, Phase Index, Conditional Matrix | `docs/pillars/*`, `docs/roadmap/*` | playbook P0-P11 must be mapped to DocMan R0-R15 |
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
- DocMan lacks dedicated `docs/discovery`, `docs/execution`,
  `docs/roadmap-standard`, `docs/regulatory`, `docs/security`, `docs/ai`,
  `docs/data-lifecycle`, `docs/ops` and `docs/commercial` content adapted to
  Mappm; these are now initialized for reconciliation.

## Final Output Required Before Implementation Resumes

- Completed track table.
- Open blockers.
- Accepted assumptions.
- Deferred/planned items.
- Concept coverage status.
- Decision traceability status.
- First implementation-ready phase or reason why no phase can proceed.
