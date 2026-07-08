---
title: "DocMan/Mappm - Decision Traceability Matrix"
description: "Traceability from product decisions and discovery answers to concepts, phases and issues"
tags: [execution, decisions, traceability, playbook]
lastUpdated: "2026-07-08"
status: "draft"
owner: "product-concept"
---

# DocMan/Mappm - Decision Traceability Matrix

## Traceability

| Decision / Answer | Status | Owning artifact | Concepts | Phases | Review status |
|---|---|---|---|---|---|
| Product name is Mappm; DocMan remains technical repo/workspace name for now | accepted | `docs/technical/DECISION_PRODUCT_NAME.md` | F8/F20/F31 branding/distribution concepts | R0, R10 | accepted |
| UI language uses German product terms; `Case` maps to "Vorgang" | accepted | `docs/technical/DECISION_PRODUCT_LANGUAGE.md` | Product overview, Cases/Records pillar | R0, R4 | accepted |
| Private-first, offline-capable, service-ready architecture | accepted | `docs/technical/DECISION_DATA_FLOW.md` | F10, F11, SEC/DATA concepts | R2, R4, R6 | accepted |
| Data layer must remain provider/exchangeable | accepted | `docs/technical/DECISION_TRUST_ENCRYPTION_DEPLOYMENT_MODEL.md` | F10/F11/F12, SEC-02, DATA-* | R2, R6, R11 | accepted |
| Home Hub/backend direction is ASP.NET Core + PostgreSQL + S3-compatible storage + Microcks | accepted | `docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md` | F11, F22/F30 equivalent, OPS/API concepts | R3, R4, R6 | accepted |
| UI/backend coupling is contract-first and frontend uses Domain ports/Data adapters | draft-safe | `docs/technical/DECISION_BACKEND_CONTRACT_FIRST_ARCHITECTURE.md` | F11, F15, F30, contract-api | R3, R4, R6 | needs final acceptance |
| Documents, OCR/LLM output and many metadata classes are sensitive | accepted | `docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md` | F5, F7, F9, SEC-*, DATA-* | R2, R3, R4, R9 | accepted |
| Assisted Review/OCR/LLM is not required for M2 but planned as M3 product value | accepted | `docs/technical/DECISION_INTELLIGENCE_SCOPE.md` | AI-*, REG-02, F30/F34 | R5/R9 | accepted |
| eIDAS/EUDI/ID Austria identity provider is strategically relevant | planned | `docs/technical/DECISION_TRUST_ENCRYPTION_DEPLOYMENT_MODEL.md` plus future REG-04 | REG-04, SEC-02, identity/access concepts | R6/R10/R14 | owner review needed |
| Commercialization, billing, SLA and procurement model | planned | future COM-* and product/commercial decision | COM-* | R10/R15 | user/product review needed |
| Project-local frontend entrypoint is `frontend.sh` and delegates to scripts | accepted | `docs/ops/OPS-08_PROJECT_ENTRYPOINTS.md` | OPS-00/OPS-08, F1/F6/F16 | R0/R2/R15 | accepted |

## Rules

- Every accepted critical answer must trace to a decision or owning artifact.
- Every approved phase must trace to accepted or explicitly draft-safe
  decisions.
- Open questions remain visible until closed with source and date.
- `assumption` values need review trigger and owner.
- `planned` values need owner, implementation trigger, review date and target
  phase, issue or backlog item.
- `deferred` values need owner, reason, implementation trigger, review date and
  target phase, issue or backlog item.
- `blocked` values need owner, blocker, next action and re-check trigger.
- `not-applicable` values need reason, owner, date and next review trigger.
- Phase approval is blocked when a P0/P1-equivalent decision row is
  `needs-review` or unowned.
