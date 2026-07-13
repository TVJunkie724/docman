---
title: "Mappm - Conditional Implementation Matrix"
description: "Trigger matrix for optional but planning-required product areas"
tags: [roadmap, conditional, implementation, playbook]
lastUpdated: "2026-07-12"
status: "active-baseline"
owner: "product-concept"
---

# Mappm - Conditional Implementation Matrix

| Trigger | Required planning | Status | Owner | Earliest implementation trigger | Review due | Follow-up phase / issue | Possible implementation |
|---|---|---|---|---|---|---|---|
| Managed Account/Core Assist backend | Account/Vault/Assist decision, F11, F36, SEC-02/03, AI-*, OPS-01..08, COM-*, contract-api | active-required | contract-api/backend/ai | accepted normal account + Core Assist product model; VC-02/03/08 and OQ-003 block implementation details | before C1/C2 | C1-C3 plus contract/backend/frontend owner issues | identity, entitlement, Assist OpenAPI/Microcks, provider, managed infrastructure |
| Cloud Vault backend | F11, F36, SEC-02/03, DATA-04/05, OPS-01..08, COM-*, contract-api | conditional | contract-api/backend | VC-01 includes Cloud Vault storage in target release | C0 | C1-C5, Contract #27, Frontend #34, Backend #39 | Vault/sync/migration OpenAPI, Microcks, generated client, ASP.NET provider, managed infrastructure |
| Customer self-hosting | new deployment/security/support decision | not-applicable | product/security/ops | explicit future product decision | 2027-01-12 | none | no implementation; Local Development Cloud is not self-hosting |
| Sync | SEC-02, DATA-05, F11, F18, F36 | active-required for Cloud | security/data | Cloud Vault enters target release | C0 | C1/C4 | pending journal, conflict UX, trust boundary |
| Backup | DATA-05, SEC-03, OPS-04 | active-required | data/security/ops | any production data is persisted | C1 | C4 | Local encrypted export/restore; managed Cloud backup/restore |
| Sharing planned | SEC-02, DATA-02/06, identity/access | planned | security/product | document/account sharing enters scope | 2026-08-15 | R14 | permissions, revoke, audit |
| Core Assist / AI/OCR | REG-02, AI-*, DATA-01, SEC-02, F30 | active-required | ai/compliance/security | accepted C2/C3 Core Assist scope; VC-02/OQ-003 block real-document processing | before C2 | C1-C3 plus R5 traceability | OCR/extraction, actor/case/workflow suggestions, human review, evals, manual fallback |
| Store distribution planned | REG-08, F8, F8b, OPS-06, OPS-07 | planned | release/compliance | external beta or store review is planned | 2026-08-01 | R10 | signing, notarization, privacy labels, review access |
| Plan/entitlement | COM-01, F36, SEC-02 | active-required | commercial/product/backend | every normal mode has Free/Paid entitlement; VC-03 blocks values | C0 | C1-C3 | plan capabilities, Assist quotas, offline entitlement, downgrade/recovery |
| Billing planned | COM-02, F36, REG-08 | conditional | commercial | any paid Local/Cloud plan enters target release | C0 | C1/C4/C5 | provider, cancellation, grace, reactivation, invoices/payment UI |
| Enterprise customers planned | COM-03, COM-04, REG-05, SEC-* | planned | commercial/security | enterprise trial/procurement is planned | 2026-08-15 | R15 | org admin, SLA, security docs |
| eIDAS/EUDI/ID Austria planned | REG-04, SEC-02, identity/access decision | planned | identity/compliance | trusted identity is required for access, signing or sharing | 2026-08-15 | R6/R14/R15 | identity provider adapter, account binding |

## Rules

- Conditional does not mean optional to remember.
- Activation creates follow-up phases and owner-specific issues.
- Frontend implementation may describe a backend need; backend/API owners own
  contracts, DTOs, endpoints, mapping, persistence and policy architecture.
