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
| Design System | yes | active-draft | ui-concept/design | `docs/design-system/concepts/MP-DS-00..03`, `docs/design-system/concepts/MP-DS-COVERAGE_MATRIX.md`, `docs/design-system/Mock/` | UI phases | DS-04..07 and DS-04 subfamilies mapped; detailed concepts still expand before affected handoff |
| Product Pillars | yes | draft | product-concept | `docs/pillars/*` | T5/T6 | Exists; needs playbook traceability fields and phase-as-contract links |
| Roadmap Phases | yes | draft | product-concept | `docs/ROADMAP_REBUILD.md`, `docs/roadmap/*` | T5/T6 | R0-R15 exists; map generic P0-P11 to DocMan phases |
| Decisions | yes | draft | product-concept | `docs/technical/DECISION_*.md` | T3/T6 | Many accepted decisions exist; matrix must classify accepted/draft-safe/needs-review |
| Regulatory | yes | umbrella-draft | compliance/product | `docs/regulatory/REG-00_REGULATORY_UMBRELLA.md`, existing F8/F9 and legal decisions | T4/T7 | Expand REG-01..REG-08 before affected implementation; all legal checks need dated re-review |
| Security | yes | umbrella-draft | security/product | `docs/security/SEC-00_SECURITY_TRUST_UMBRELLA.md`, security/privacy decisions | T4/T7 | Expand SEC subfamilies and map to trust/encryption decisions |
| Data Lifecycle | yes | umbrella-draft | data/privacy | `docs/data-lifecycle/DATA-00_DATA_LIFECYCLE_UMBRELLA.md`, storage, backup, sync decisions | T4/T7 | Expand DATA subfamilies before persistence/sync/sharing phases |
| Ops | yes | active-draft | quality/release/ops | `frontend.sh`, `docs/ops/OPS-00_OPERATIONS_UMBRELLA.md`, `docs/ops/OPS-08_PROJECT_ENTRYPOINTS.md`, scripts | T7 | Add OPS-07 CI/CD and release/support details before production gates |
| AI/OCR/LLM | conditional-applicable | umbrella-draft | ai/compliance | `docs/ai/AI-00_AI_GOVERNANCE_UMBRELLA.md`, intelligence decision | M3/T4 | Expand AI-01..AI-06 before assisted review implementation |
| Commercial | conditional-planned | umbrella-draft | commercial/product | `docs/commercial/COM-00_COMMERCIAL_UMBRELLA.md`, product strategy discussion | release/commercial phases | Expand COM-01..COM-04 before sales/trial/SLA decisions |

## Quality Audit

Detailed review findings are tracked in
`docs/execution/CONCEPT_QUALITY_AUDIT.md`.

## Design-System Coverage

Design-system family coverage is tracked in
`docs/design-system/concepts/MP-DS-COVERAGE_MATRIX.md`. Mock evidence for
additional form lifecycle, permission, review and bulk-import gaps lives in
`docs/design-system/Mock/pages/component-form-governance.html`.

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
