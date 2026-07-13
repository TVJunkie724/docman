---
title: "DocMan/Mappm - Decision Traceability Matrix"
description: "Traceability from product decisions and discovery answers to concepts, phases and issues"
tags: [execution, decisions, traceability, playbook]
lastUpdated: "2026-07-12"
status: "active-baseline"
owner: "product-concept"
---

# DocMan/Mappm - Decision Traceability Matrix

## Traceability

| Decision / Answer | Status | Owning artifact | Concepts | Phases | Review status |
|---|---|---|---|---|---|
| Product name is Mappm; DocMan remains technical repo/workspace name for now | accepted | `docs/technical/DECISION_PRODUCT_NAME.md` | F8/F20/F31 branding/distribution concepts | R0, R10 | accepted |
| UI language uses German product terms; `Case` maps to "Vorgang" | accepted | `docs/technical/DECISION_PRODUCT_LANGUAGE.md` | Product overview, Cases/Records pillar | R0, R4 | accepted |
| Commercial Core is sellable and production-ready, with deferred features absent | accepted | `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md` | enterprise quality contracts, roadmap | C0-C7 | accepted |
| Every normal Free/Paid Local and Cloud mode requires an account; Vault authority and Assist are separate; Detached Recovery prevents lock-in | accepted-direction/open-details | `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md` | F12/F13/F36, SEC/DATA/AI/COM | C0-C4 | VC-02/03/07/08 and OQ-003 details open |
| Local and Cloud Vault authority plus migration/cancellation lifecycle | accepted | `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` | F1/F2/F4-F18, F36, SEC/DATA/OPS/COM | C0-C5 | accepted |
| Managed Cloud backend is ASP.NET Core + PostgreSQL + S3-compatible storage + Microcks; Local Development Cloud is developer-only | accepted-rebaseline | `docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md` | F11, F16, OPS/API concepts | C1-C5 | accepted |
| Account and device trust apply to every normal product mode; Local authority remains independent | accepted-rebaseline | `docs/technical/DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md` | F12/F13/F36, SEC-02/03, REG-04 | C0/C1/C4 | provider/offline/recovery details open |
| Local Vault and encrypted export key/recovery model | open-blocking | VC-07, SEC-03, DATA-03/05 | F10/F12/F36 | C0/C1/C4 | must close before Local data implementation |
| Customer Home Hub/self-hosting is superseded | superseded | Vault/Cloud decision, `PILLAR_HOME_HUB_SYNC.md` | Cloud/Identity/Sync pillar | all | do not implement |
| UI/backend coupling is contract-first and frontend uses Domain ports/Data adapters | draft-safe | `docs/technical/DECISION_BACKEND_CONTRACT_FIRST_ARCHITECTURE.md` | F11, F15, F30, contract-api | R3, R4, R6 | needs final acceptance |
| Documents, OCR/LLM output and many metadata classes are sensitive | accepted | `docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md` | F5, F7, F9, SEC-*, DATA-* | R2, R3, R4, R9 | accepted |
| Core Assist is required in Commercial Core; Advanced Assist remains conditional | accepted-rebaseline | `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md`, `DECISION_INTELLIGENCE_SCOPE.md` | AI-*, REG-02, F30/F34 | C1-C3; advanced later | VC-02/OQ-003 and AI/REG gates required before real processing |
| Domain workflows use a generic engine plus curated, versioned jurisdiction/provider definitions; AI may select but not invent them | accepted-direction/open-scope | `docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md` | Templates/Workflows, Intelligence, Cases/Records | C0/C3 and later activated workflow slices | WF-01/WF-02 block country-pack release claims |
| Mappm Account is required normally; eIDAS/EUDI/ID Austria remains an optional provider/trust path | accepted-direction/open-details | `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`, `DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md`, VC-08 and REG-04 | F12/F13/F36, SEC-02/03 | C0/C1/C4 | VC-08 and OQ-004 block identity implementation |
| Commercialization, billing, SLA and procurement model | planned | COM-00..04 plus VC-03/VC-04 | COM-* | C0/C4/C5 | user/product review needed |
| Project-local frontend entrypoint is `frontend.sh` and delegates to scripts | accepted | `docs/ops/OPS-08_PROJECT_ENTRYPOINTS.md` | OPS-00/OPS-08, F1/F6/F16 | R0/R2/R15 | accepted |
| Playbook governance applies across C0-C7; R0-R15 remain traceability IDs | accepted-rebaseline | `docs/roadmap-standard/STANDARD_PHASES.md`, `docs/execution/PLAYBOOK_AGENT_TRACK_CLOSEOUT.md` | roadmap-standard, F concepts, pillars | C0-C7 over R0-R15 | accepted |
| Design-system coverage must map MP-DS concepts, F concepts and HTML mock evidence before UI implementation | accepted | `docs/design-system/concepts/MP-DS-COVERAGE_MATRIX.md` | MP-DS, F23-F36 | C1-C4/R3/R4 | accepted |
| Root-level Flutter repository layout is an accepted adaptation of the generic app-folder default | accepted | `docs/technical/DECISION_REPOSITORY_LAYOUT.md` | F1, OPS-08 | R0/R2/R3 | accepted |
| Proposed first playbook implementation-ready phase is R3.5 target-path quality baseline | proposed | `docs/roadmap/phases/R3_5_TARGET_PATH_QUALITY_BASELINE.md` | F1/F3/F4/F15/F16, OPS-08 | R3.5 | ready for explicit user approval; implementation blocked until recorded |
| Regulatory baseline uses dated official-source register and phase-specific legal review | accepted-baseline | `docs/regulatory/REGULATORY_SOURCE_REGISTER.md` | REG-00..08 | C0-C7 plus affected R slices | refresh at trigger |

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
