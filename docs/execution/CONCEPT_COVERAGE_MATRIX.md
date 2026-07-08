---
title: "DocMan/Mappm - Concept Coverage Matrix"
description: "Coverage matrix for required playbook concept families in the existing DocMan/Mappm project"
tags: [execution, concepts, coverage, playbook]
lastUpdated: "2026-07-08"
status: "draft"
owner: "ui-concept"
---

# DocMan/Mappm - Concept Coverage Matrix

## Coverage

| Family | Required | Status | Owner | Existing artifacts | Blocks | Notes |
|---|---|---|---|---|---|---|
| F Concepts | yes | needs-review | ui-concept/foundation | `docs/concepts/CONCEPT_F1..F35` | T4/T5/T6 | Existing DocMan set is richer/different than generic F1-F31; mapping required before completion |
| Design System | yes | draft | ui-concept/design | `docs/design-system/concepts/MP-DS-00..03`, `docs/design-system/Mock/` | UI phases | DS-04 component/form family and DS-05..07 need Mappm expansion or mapping to F23-F35 |
| Product Pillars | yes | draft | product-concept | `docs/pillars/*` | T5/T6 | Exists; needs playbook traceability fields and phase-as-contract links |
| Roadmap Phases | yes | draft | product-concept | `docs/ROADMAP_REBUILD.md`, `docs/roadmap/*` | T5/T6 | R0-R15 exists; map generic P0-P11 to DocMan phases |
| Decisions | yes | draft | product-concept | `docs/technical/DECISION_*.md` | T3/T6 | Many accepted decisions exist; matrix must classify accepted/draft-safe/needs-review |
| Regulatory | yes | planned | compliance/product | existing F8/F9 and legal decisions | T1/T4/T7 | Create/adapt REG-00..REG-08 for EU/current-date compliance reviews |
| Security | yes | planned | security/product | security/privacy decisions | T1/T4/T7 | Create/adapt SEC-00..SEC-05 and map to trust/encryption decisions |
| Data Lifecycle | yes | planned | data/privacy | storage, backup, sync decisions | T1/T4/T7 | Create/adapt DATA-00..DATA-06 |
| Ops | yes | planned | quality/release/ops | scripts exist | T0/T7 | Create/adapt OPS-00..OPS-08; include entrypoints, CI/CD, release, support |
| AI/OCR/LLM | conditional-applicable | planned | ai/compliance | intelligence decision | M3/T4 | Create/adapt AI-00..AI-06 before assisted review implementation |
| Commercial | conditional-planned | planned | commercial/product | product strategy discussion only | release/commercial phases | Create/adapt COM-00..COM-04 before sales/trial/SLA decisions |

## Rules

- Family rows are not enough for final completion; T4 must expand this matrix
  into concrete per-file rows for accepted/active concept families.
- No affected phase can be approved while required concept coverage is
  `missing` or unresolved `needs-review`.
- Generic playbook templates must be adapted to Mappm terminology, privacy
  model, local-first direction and backend/provider decisions.
- `planned` requires owner, implementation trigger, review date and target
  phase, issue or backlog item.
- `deferred` requires reason, owner, implementation trigger, review date and
  target phase, issue or backlog item.
- `blocked` requires owner, blocker, next action and re-check trigger.
- `not-applicable` requires reason, owner and review date.
