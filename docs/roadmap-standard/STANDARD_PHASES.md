---
title: "Mappm - Standard Phase Mapping"
description: "Mapping of generic playbook phases to C0-C7 release gates and R0-R15 traceability"
tags: [roadmap, phases, mapping, playbook]
lastUpdated: "2026-07-12"
status: "active-baseline"
owner: "product-concept"
---

# Mappm - Standard Phase Mapping

Mappm keeps R0-R15 as traceability IDs and uses C0-C7 as the normative
Commercial-Core release train. Generic playbook phases P0-P11 are governance
gates mapped across both structures.

| Playbook phase | Purpose | Mappm mapping | Status |
|---|---|---|---|
| P0 Bootstrap | repo/docs/skills/scripts baseline | R0/R1/R2, T0 closeout | done |
| P1 Applicability | determine always-plan and conditional areas | R1 plus discovery/execution docs | done |
| P2 Discovery Interview | record accepted answers and open questions | discovery summary/register | done |
| P3 Foundation Decisions | trace decisions to concepts/phases | R0 decision register and traceability matrix | done |
| P4 Concept Seeding | ensure required concept families exist or are scheduled | per-file F/pillar matrix, MP-DS-00..07, REG/SEC/DATA/OPS/AI/COM families | done |
| P5 Standard Pillars | map product/platform/governance pillars | `docs/pillars/*`, pillar quality contract, pillar roadmap index | done |
| P6 Standard Roadmap | keep always-plan areas scheduled | C0-C7 over R0-R15, roadmap-standard docs and aligned GitHub tracker | done-rebaselined |
| P7 Quality CI/CD Baseline | local gates and CI plan | C1/C5 plus R3/R10 traceability | planned |
| P8 Security Privacy Baseline | trust/privacy/data gates | C0-C5 plus affected R slices | active-planned |
| P9 Design System Foundation | DS concepts and mock evidence | MP-DS-00..07 and HTML mock | done as planning baseline |
| P10 First Implementation Contract | first narrow implementation-ready phase | fully specified R3.5 contract, approval-gated handoff and issue #25 | ready-for-user-approval |
| P11 Verification Closeout | verify and close residual risks | execution closeout and T0-T7 report | verified-pending-P10-approval |

## Phase Rule

No C-gate or R-slice may be treated as implementation-ready only because it
appears in an index. It needs a detailed phase document and approved handoff
that answer the phase-as-implementation-contract checklist.
