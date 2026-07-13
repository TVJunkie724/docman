---
title: "DocMan/Mappm - Concept Coverage Matrix"
description: "Coverage matrix for required playbook concept families in the existing DocMan/Mappm project"
tags: [execution, concepts, coverage, playbook]
lastUpdated: "2026-07-12"
status: "active-baseline"
owner: "ui-concept"
---

# DocMan/Mappm - Concept Coverage Matrix

## Coverage

| Family | Required | Status | Owner | Existing artifacts | Blocks | Notes |
|---|---|---|---|---|---|---|
| F Concepts | yes | covered | ui-concept/foundation | F1..F36 plus per-file quality matrix | affected phases | F24 remains intentionally draft; F36 owns Local/Cloud Vault lifecycle; every file adopts the quality contract |
| Design System | yes | active-baseline | ui-concept/design | MP-DS-00..07, exact DS-04 mapping and HTML mock | UI phases | affected rows still require phase-specific review |
| Product Pillars | yes | covered-proposed | product-concept | pillars plus pillar quality contract/matrix | affected phases | proposed status prevents implicit implementation but no longer blocks roadmap setup |
| Roadmap Phases | yes | covered | product-concept | R0-R15 mapping plus approval-ready R3.5 contract | future phases | R3.5 needs explicit approval; other index entries require their own implementation contract |
| Decisions | yes | covered | product-concept | decision traceability matrix | affected phases | draft-safe decisions block only phases that depend on them |
| Regulatory | yes | seeded-draft | compliance/product | REG-00..08 and dated source register | legal/release/AI phases | legal reviewer required before affected implementation |
| Security | yes | seeded-draft | security/product | SEC-00..05 and accepted trust/privacy decisions | sensitive phases | threat/key/update details require phase review |
| Data Lifecycle | yes | seeded-draft | data/privacy | DATA-00..06 and storage/backup/sync decisions | persistence/sync phases | classification precedes new data types |
| Ops | yes | seeded-active | quality/release/ops | OPS-00..08, frontend entrypoint and scripts | R3/release | CI provider/runtime remains scheduled, not forgotten |
| Core/Advanced Assist, AI/OCR/LLM | Core Assist active-required; Advanced conditional | accepted-direction with implementation-blocking details | ai/compliance | Account/Vault/Assist decision, AI-00..06, REG-02 and intelligence decision | C1-C3/R5 traceability; Advanced R9 | production Core Assist blocked pending VC-02/OQ-003/provider/data/legal review |
| Commercial | conditional-planned | seeded-draft | commercial/product | COM-00..04 | R10/R15 | pricing and commitments remain user/product decisions |

## Quality Audit

Detailed review findings are tracked in
`docs/execution/CONCEPT_QUALITY_AUDIT.md`.

## Design-System Coverage

Design-system family coverage is tracked in
`docs/design-system/concepts/MP-DS-COVERAGE_MATRIX.md`. Mock evidence for
additional form lifecycle, permission, review and bulk-import gaps lives in
`docs/design-system/Mock/pages/component-form-governance.html`.

## Rules

- Concrete F/pillar rows live in
  `docs/execution/CONCEPT_FILE_QUALITY_MATRIX.md`; DS subfamilies live in
  `docs/design-system/concepts/MP-DS-COVERAGE_MATRIX.md`.
- No affected phase can be approved while required concept coverage is
  `missing` or unresolved `needs-review`.
- Generic playbook templates must be adapted to Mappm terminology, privacy
  model, Local/Cloud Vault authority and backend/provider decisions.
- `planned` requires owner, implementation trigger, review date and target
  phase, issue or backlog item.
- `deferred` requires reason, owner, implementation trigger, review date and
  target phase, issue or backlog item.
- `blocked` requires owner, blocker, next action and re-check trigger.
- `not-applicable` requires reason, owner and review date.
