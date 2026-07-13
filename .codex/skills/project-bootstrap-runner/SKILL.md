---
name: project-bootstrap-runner
description: Execute or reconcile the Mappm Flutter setup playbook end to end, including T0-T7 track status, discovery, applicability, decision traceability, concept and design-system coverage, roadmap gates, first implementation contract, handoffs, GitHub Issues and verification. Use when setting up Mappm from the embedded playbook, resuming an incomplete playbook run, reviewing track completion or preparing the project for its first approved implementation slice.
---

# Mappm Project Bootstrap Runner

Coordinate setup and governance only. Do not implement product code unless a
later, approved specialist handoff explicitly authorizes it.

## Required Reading

Read completely:

- `.codex/skills/ui-onboarding/SKILL.md`.
- `docs/flutter-project-playbook/PLAYBOOK.md`.
- `docs/execution/PLAYBOOK_EXECUTION_RUNBOOK.md`.
- discovery, coverage, traceability and roadmap-standard documents.
- the specialist skill for every track being changed.

## Track Sequence

Execute T0 through T7 in order:

1. T0: repository, docs, project-local skills and entrypoints.
2. T1: applicability, always-plan and conditional matrices.
3. T2: decision interview summary, open questions and user confirmations.
4. T3: accepted/draft-safe decisions and traceability.
5. T4: per-file F/MP-DS/REG/SEC/DATA/AI/OPS/COM coverage.
6. T5: pillars, roadmap phases, issue ownership and deferred triggers.
7. T6: one approved implementation-contract phase, specialist handoff and
   conforming GitHub Issue.
8. T7: local verification, CI status, residual risks and closeout evidence.

## Status Rules

- Use one normative track table in the runbook. Other documents reference it.
- Mark `done` only when required artifacts and evidence exist.
- Use `in-progress` when work can continue and `blocked` when a named decision
  or external review prevents it.
- Never call a gate definition an implementation-ready phase.
- Planned/deferred rows require owner, trigger, review date and phase/issue.
- Every track needs a completion section with evidence, reviewer, acceptance
  source/date, residual risk and next handoff.

## Owner Boundaries

Use `product-concept`, `ui-concept`, `ui-concept-review`, `quality-readiness`,
`foundation-builder`, `data-architect`, `contract-api` and `github-issue` for
their respective artifacts. Frontend may state backend needs but may not decide
contracts, DTOs, endpoints, mapping, persistence or policy architecture.

## Verification

Check exact paths, normative statuses, internal links, required skill folders,
GitHub milestone/title/label consistency and the commands named by T7. Record
known legacy debt separately from new regressions.

## Stop Rules

Stop before implementation when any T0-T6 P0/P1 finding remains, when an open
question would be answered implicitly, or when the first phase lacks approval,
handoff, issue ownership or falsifiable verification.
