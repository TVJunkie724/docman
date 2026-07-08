---
title: "Mappm - Standard Phase Mapping"
description: "Mapping of the generic playbook phases to the existing Mappm R0-R15 roadmap"
tags: [roadmap, phases, mapping, playbook]
lastUpdated: "2026-07-08"
status: "active-baseline"
owner: "product-concept"
---

# Mappm - Standard Phase Mapping

Mappm keeps its R0-R15 roadmap. Generic playbook phases P0-P11 are applied as
governance gates and mapped to existing phases instead of replacing them.

| Playbook phase | Purpose | Mappm mapping | Status |
|---|---|---|---|
| P0 Bootstrap | repo/docs/skills/scripts baseline | R0/R1/R2, T0 closeout | done |
| P1 Applicability | determine always-plan and conditional areas | R1 plus discovery/execution docs | done |
| P2 Discovery Interview | record accepted answers and open questions | discovery summary/register | done |
| P3 Foundation Decisions | trace decisions to concepts/phases | R0 decision register and traceability matrix | done |
| P4 Concept Seeding | ensure required concept families exist or are scheduled | F concepts, MP-DS, REG/SEC/DATA/OPS/AI/COM | done for reconciliation |
| P5 Standard Pillars | map product/platform/governance pillars | `docs/pillars/*`, pillar roadmap index | done for reconciliation |
| P6 Standard Roadmap | keep always-plan areas scheduled | R0-R15 plus roadmap-standard docs | done for reconciliation |
| P7 Quality CI/CD Baseline | local gates and CI plan | R3/R10 | planned |
| P8 Security Privacy Baseline | trust/privacy/data gates | R2/R3/R6/R10/R11/R14 | active-planned |
| P9 Design System Foundation | DS concepts and mock evidence | MP-DS and HTML mock | active-planned |
| P10 First Implementation Contract | first narrow implementation-ready phase | R2/R3 or R4.5 | planned |
| P11 Verification Closeout | verify and close residual risks | execution closeout | active-baseline |

## Phase Rule

No R-phase may be treated as implementation-ready only because it appears in
the index. It needs a detailed phase document or approved handoff that answers
the phase-as-implementation-contract checklist.
