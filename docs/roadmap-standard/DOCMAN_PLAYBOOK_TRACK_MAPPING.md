---
title: "Mappm Playbook Track Mapping"
description: "Mapping from the general Flutter setup playbook to the existing Mappm roadmap and pillars"
tags: [roadmap, playbook, phases, pillars, execution]
lastUpdated: "2026-07-12"
status: "active-baseline"
owner: "product-concept"
---

# Mappm Playbook Track Mapping

## Purpose

The general Flutter setup playbook is applied to Mappm as a reconciliation and
hardening pass, not as a replacement for the accepted Mappm roadmap.

## Track Mapping

| Playbook track | Mappm target | Status | Rule |
|---|---|---|---|
| T0 Bootstrap Reconciliation | repo, skills, scripts, submodule, product name | done | accepted root-layout adaptation documented |
| T1 Applicability | applicability, source register and concept families | done | never delete conditional areas silently |
| T2 Discovery Interview | owner Q/A, Vault/Commercial-Core baseline and VC-01..08 | done-rebaselined | open items block only affected phases |
| T3 Foundation Decisions | decision traceability matrix | done | accepted/draft-safe status required before phase approval |
| T4 Concept Seeding | per-file F/DS/REG/SEC/DATA/OPS/AI/COM coverage | done | drafts require phase-specific review |
| T5 Standard Roadmap | C0-C7 over R0-R15, simplified pillars and aligned GitHub tracker | done-rebaselined | C-gates govern release; R-IDs preserve traceability |
| T6 Implementation Readiness | fully specified R3.5 phase, approval-gated handoff and issue #25 | ready-for-user-approval | implementation is blocked until approval is recorded |
| T7 Verification | local verify, CI/CD status and release gates | verified-pending-T6-closeout | full-project debt remains visible in R3; close only after T6 approval |

## Default Roadmap Guardrails

Some areas are not implemented immediately, but must remain planned:

- store compliance and release distribution.
- CI/CD and local verification parity.
- security, privacy, deletion, export and data lifecycle.
- sync, backup, sharing and account/device trust.
- AI/OCR/LLM governance and assistant UX.
- support, diagnostics and incident readiness.
- commercial packaging, billing and SLA.

## Stop Rules

- Stop if a roadmap phase omits an always-plan area because the code is not
  ready yet.
- Stop if a broad pillar becomes a vague epic instead of producing
  implementation-contract phases.
- Stop if future work lacks owner, trigger, review date and target phase.
