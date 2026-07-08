---
title: "DocMan/Mappm - Applicability Matrix"
description: "Playbook applicability matrix for the existing DocMan/Mappm project"
tags: [discovery, applicability, governance, playbook]
lastUpdated: "2026-07-08"
status: "draft"
owner: "product-concept"
---

# DocMan/Mappm - Applicability Matrix

## Status Values

`always-plan`, `applicable`, `planned`, `deferred`, `blocked`,
`not-applicable`, `needs-review`.

Traceability rules:

- `planned` needs owner, implementation trigger, review date and target phase,
  issue or backlog item.
- `deferred` needs owner, reason, implementation trigger, review date and
  target phase, issue or backlog item.
- `blocked` needs owner, blocker, next action and re-check trigger.
- `not-applicable` needs owner, reason and review date.
- `needs-review` needs owner, open question and re-check trigger.

## Applicability

| Area | Status | Reason | Owner | Required artifact | Review date |
|---|---|---|---|---|---|
| Product Overview | always-plan | exists and remains source of product direction | product-concept | `docs/PROJECT_OVERVIEW_GUIDE.md` | 2026-07-15 |
| Project-local Skills | always-plan | exists under `.codex/skills/`; must remain DocMan-specific | project | `.codex/skills/*` | 2026-07-15 |
| F Concepts | always-plan | exists, but DocMan numbering differs from generic playbook | ui-concept | `docs/concepts/*`, coverage mapping | 2026-07-15 |
| Design System | always-plan | MP-DS foundation and HTML mock exist; component/form families need expansion | ui-concept | `docs/design-system/*` | 2026-07-15 |
| Roadmap/Pillars | always-plan | exists as R0-R15 plus pillars; must map to playbook P0-P11 | product-concept | `docs/roadmap/*`, `docs/pillars/*` | 2026-07-15 |
| Execution Governance | always-plan | newly initialized by reconciliation | project-bootstrap-runner | `docs/execution/*` | 2026-07-15 |
| CI/CD and Local Verification | always-plan | scripts exist; CI/CD/release gates need OPS/F16 reconciliation | quality-readiness | F16, OPS-07, scripts | 2026-07-15 |
| Security | always-plan | security/privacy decisions exist; SEC templates need Mappm adaptation | security/product-concept | `docs/security/*`, existing decisions | 2026-07-15 |
| Privacy/Data Lifecycle | always-plan | sensitive documents and metadata are core product facts | privacy/data | REG-01, DATA-* | 2026-07-15 |
| Regulatory | always-plan | app is intended to become sellable and handles sensitive documents | compliance/product | REG-00..REG-08 | 2026-07-15 |
| Store/Platform Compliance | planned | desktop/mobile distribution is expected, but store submission is later | release/compliance | REG-08, F8, OPS-06 | 2026-08-01 |
| Backend/API | applicable | Home Hub, ASP.NET Core direction, OpenAPI/Microcks already decided | contract-api | F11, F22, F30, backend decisions | 2026-07-15 |
| Sync/Backup/Sharing | planned | product direction requires later sync/backup/sharing; M2 remains limited | data/security | DATA-05, SEC-02, sync decisions | 2026-08-01 |
| AI/OCR/LLM | applicable | Assisted Review is planned as M3 and affects privacy/compliance | ai/compliance | REG-02, AI-* | 2026-07-22 |
| Commercial/Billing | planned | product may be sold, but pricing/billing is not yet defined | commercial/product | COM-* | 2026-08-15 |
| eIDAS/EUDI/ID Austria | planned | trusted identity is strategically relevant for Austria/EU, later provider boundary | identity/compliance | REG-04, identity decision | 2026-08-15 |

## Stop Rules

- Stop if a phase treats regulatory, security, AI, cloud, sync, store or
  commercial scope as absent because it is not implemented yet.
- Stop if a conditional area is removed instead of being marked with strict
  traceability.
- Stop if DocMan-specific accepted decisions are overwritten by generic
  playbook defaults.
