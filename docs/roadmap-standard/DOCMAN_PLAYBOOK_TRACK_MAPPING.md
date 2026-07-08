---
title: "Mappm Playbook Track Mapping"
description: "Mapping from the general Flutter setup playbook to the existing Mappm roadmap and pillars"
tags: [roadmap, playbook, phases, pillars, execution]
lastUpdated: "2026-07-08"
status: "draft"
owner: "product-concept"
---

# Mappm Playbook Track Mapping

## Purpose

The general Flutter setup playbook is applied to Mappm as a reconciliation and
hardening pass, not as a replacement for the accepted Mappm roadmap.

## Track Mapping

| Playbook track | Mappm target | Status | Rule |
|---|---|---|---|
| T0 Bootstrap Reconciliation | repo, skills, scripts, submodule, product name | active | close before new app buildout |
| T1 Applicability | applicability and umbrella concepts | active | never delete conditional areas silently |
| T2 Discovery Interview | owner Q/A and open questions | planned | required before commercial/cloud/legal commitments |
| T3 Foundation Decisions | decision traceability matrix | planned | accepted/draft-safe status required before phase approval |
| T4 Concept Seeding | F/DS/REG/SEC/DATA/OPS/AI/COM coverage | planned | concepts must exist before affected implementation |
| T5 Standard Roadmap | R0-R15 plus pillars | planned | map, do not replace, Mappm roadmap |
| T6 Implementation Readiness | first implementation-ready phase | planned | phase must be an implementation contract |
| T7 Verification | local verify, CI/CD, release gates | planned | evidence required before declaring foundation ready |

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
