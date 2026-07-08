---
title: "Mappm - Conditional Implementation Matrix"
description: "Trigger matrix for optional but planning-required product areas"
tags: [roadmap, conditional, implementation, playbook]
lastUpdated: "2026-07-08"
status: "active-baseline"
owner: "product-concept"
---

# Mappm - Conditional Implementation Matrix

| Trigger | Required planning | Status | Owner | Earliest implementation trigger | Review due | Follow-up phase / issue | Possible implementation |
|---|---|---|---|---|---|---|---|
| Backend planned | F11, F22-equivalent, F30-equivalent, OPS-08, contract-api | active-planned | contract-api/backend | Home Hub or sync API boundary appears | 2026-07-15 | R3/R4/R6, issues #27/#34 | OpenAPI, Microcks, generated client, backend issue |
| Cloud/managed mode planned | SEC-02, DATA-04/05, REG-01, OPS-04, COM-* | planned | product/security/commercial | managed service is accepted | 2026-08-01 | R6/R10/R15 | provider-backed source of truth, DPAs, cloud ops |
| Sync planned | SEC-02, DATA-05, F11, F18 | planned | security/data | multi-device account scope is accepted | 2026-08-01 | R6 | sync journal, conflict UX, trust boundary |
| Backup planned | DATA-05, SEC-03, OPS-04 | planned | data/security/ops | user data must survive device loss | 2026-08-01 | R11 | encrypted backup/restore |
| Sharing planned | SEC-02, DATA-02/06, identity/access | planned | security/product | document/account sharing enters scope | 2026-08-15 | R14 | permissions, revoke, audit |
| AI/OCR/LLM planned | REG-02, AI-*, DATA-01, SEC-02 | planned | ai/compliance | OCR/extraction/assistant feature enters scope | 2026-07-22 | R5/R9 | OCR/assistant, human review, evals |
| Store distribution planned | REG-08, F8, F8b, OPS-06, OPS-07 | planned | release/compliance | external beta or store review is planned | 2026-08-01 | R10 | signing, notarization, privacy labels, review access |
| Billing planned | COM-01, COM-02, REG-08 | planned | commercial | sale/trial/entitlement scope is accepted | 2026-08-15 | R10/R15 | entitlements, payment UI |
| Enterprise customers planned | COM-03, COM-04, REG-05, SEC-* | planned | commercial/security | enterprise trial/procurement is planned | 2026-08-15 | R15 | org admin, SLA, security docs |
| eIDAS/EUDI/ID Austria planned | REG-04, SEC-02, identity/access decision | planned | identity/compliance | trusted identity is required for access, signing or sharing | 2026-08-15 | R6/R14/R15 | identity provider adapter, account binding |

## Rules

- Conditional does not mean optional to remember.
- Activation creates follow-up phases and owner-specific issues.
- Frontend implementation may describe a backend need; backend/API owners own
  contracts, DTOs, endpoints, mapping, persistence and policy architecture.
