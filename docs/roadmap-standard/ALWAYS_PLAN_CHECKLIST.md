---
title: "Mappm - Always Plan Checklist"
description: "Always-plan areas for production-ready Mappm implementation"
tags: [roadmap, checklist, always-plan, playbook]
lastUpdated: "2026-07-12"
status: "active-baseline"
owner: "product-concept"
---

# Mappm - Always Plan Checklist

Always-plan means the area must be visible, owned and scheduled early. It does
not mean every area is implemented immediately.

| Area | Current artifact | Planning status | Implementation timing | Earliest trigger | Owner | Review due | Target phase |
|---|---|---|---|---|---|---|---|
| Product overview | `docs/PROJECT_OVERVIEW_GUIDE.md` | accepted-baseline | bootstrap | done | product | 2026-07-15 | R0/R1 |
| Project-local skills | `.codex/skills/*` | accepted-baseline | bootstrap | done | project | 2026-07-15 | R1 |
| Architecture | F1/F2/F3, Vault/Commercial-Core decisions | accepted-rebaseline | foundation | current app foundation | foundation | 2026-07-15 | C0/C1/R2 |
| Project entrypoints | `frontend.sh`, OPS-08 | active-draft | foundation | local setup/run needed | foundation/ops | 2026-07-15 | R2/R3 |
| Testing | F4/F16, quality skill | active-planned | staged | first implementation slice | quality | 2026-07-15 | R3 |
| Error/observability | F5/F7/F18/F34 | active-planned | staged | first async/user error flow | quality/support | 2026-07-15 | R3/R4 |
| Fake repositories | F15 | accepted-baseline | foundation | UI without backend | quality/foundation | 2026-07-15 | R3 |
| Vault authority and exit | Vault/Cloud decision, F10, F36, DATA-02/03/05 | accepted-baseline | foundation/lifecycle | any persistence | product/data/security | every affected phase | C0-C4 |
| Microcks/contracts | F11, contract-api, backend decisions | active-planned | staged | Cloud/Capture API slice | contract-api | C1 | R3/R4/R6, C1/C2 |
| Privacy/legal | F9, REG-00 | active-planned | staged | personal data persisted/synced/processed | compliance/privacy | 2026-07-15 | R3/R10 |
| Security/trust | SEC-00, security decisions | active-planned | staged | secrets, sync, backend, sharing, release | security | 2026-07-15 | R2/R3/R6/R10 |
| Data lifecycle | DATA-00, storage decisions | active-planned | staged | persistence, backup, export, deletion | data-architect | 2026-07-15 | R2/R3/R11 |
| CI/CD | F16, OPS-00 | planned | staged/release | shared delivery or branch protection | quality/release | 2026-07-22 | R3/R10 |
| Design system | MP-DS-00..07, DS coverage, HTML mock | active-planned | foundation/iterative | first UI implementation slice | design/ui-concept | 2026-07-15 | R3/R4 |
| Store/distribution | F8/F8b, REG-00 | planned | release | beta/store/external distribution | release/compliance | 2026-08-01 | R10 |
| Core Assist / AI/OCR/LLM | Account/Vault/Assist decision, AI-00, intelligence decision | active-required for Core; Advanced staged | implementation-blocked by VC-02/OQ-003 | C2/C3 Core Assist with real documents; Advanced Assist later | ai/compliance | before C2 approval | C1-C3/R5 traceability; Advanced R9 |
| Cloud lifecycle/entitlements | F36, COM-01/02, DATA-02/03 | active-planned | staged | paid Cloud scope | commercial/product/data | C0 | C1/C4/C5 |
| Sync/backup/sharing | SEC/DATA/OPS umbrellas | planned | staged | Cloud Vault or sharing scope | security/data | C0/C4 | R6/R11/R14 |
| Support/diagnostics | OPS-00, F18/F34 | planned | operations | external users/trials | support/ops | 2026-08-15 | R12 |
| Commercial | COM-00 | planned | release/operations | pricing/trial/customer commitments | commercial/product | 2026-08-15 | R10/R15 |

## Stop Rules

- Stop if an always-plan row is removed because it is "not needed yet".
- Stop if a phase does not name applicable always-plan rows.
- Stop if a planned row lacks owner, trigger, review due and target phase.
