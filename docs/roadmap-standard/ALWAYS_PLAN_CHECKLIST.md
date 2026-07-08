---
title: "Mappm - Always Plan Checklist"
description: "Always-plan areas for production-ready Mappm implementation"
tags: [roadmap, checklist, always-plan, playbook]
lastUpdated: "2026-07-08"
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
| Architecture | F1/F2/F3, R2 plan | accepted-baseline | foundation | current app foundation | foundation | 2026-07-15 | R2 |
| Project entrypoints | `frontend.sh`, OPS-08 | active-draft | foundation | local setup/run needed | foundation/ops | 2026-07-15 | R2/R3 |
| Testing | F4/F16, quality skill | active-planned | staged | first implementation slice | quality | 2026-07-15 | R3 |
| Error/observability | F5/F7/F18/F34 | active-planned | staged | first async/user error flow | quality/support | 2026-07-15 | R3/R4 |
| Fake repositories | F15 | accepted-baseline | foundation | UI without backend | quality/foundation | 2026-07-15 | R3 |
| Microcks/contracts | F11, contract-api, backend decisions | active-planned | staged | Home Hub/Capture API slice | contract-api | 2026-07-15 | R3/R4/R6 |
| Privacy/legal | F9, REG-00 | active-planned | staged | personal data persisted/synced/processed | compliance/privacy | 2026-07-15 | R3/R10 |
| Security/trust | SEC-00, security decisions | active-planned | staged | secrets, sync, backend, sharing, release | security | 2026-07-15 | R2/R3/R6/R10 |
| Data lifecycle | DATA-00, storage decisions | active-planned | staged | persistence, backup, export, deletion | data-architect | 2026-07-15 | R2/R3/R11 |
| CI/CD | F16, OPS-00 | planned | staged/release | shared delivery or branch protection | quality/release | 2026-07-22 | R3/R10 |
| Design system | MP-DS-00..03, DS coverage, HTML mock | active-planned | foundation/iterative | first UI implementation slice | design/ui-concept | 2026-07-15 | R3/R4 |
| Store/distribution | F8/F8b, REG-00 | planned | release | beta/store/external distribution | release/compliance | 2026-08-01 | R10 |
| AI/OCR/LLM | AI-00, intelligence decision | planned | staged | assisted review with real documents | ai/compliance | 2026-07-22 | R5/R9 |
| Sync/backup/sharing | SEC/DATA/OPS umbrellas | planned | staged | multi-device/account/sharing scope | security/data | 2026-08-01 | R6/R11/R14 |
| Support/diagnostics | OPS-00, F18/F34 | planned | operations | external users/trials | support/ops | 2026-08-15 | R12 |
| Commercial | COM-00 | planned | release/operations | pricing/trial/customer commitments | commercial/product | 2026-08-15 | R10/R15 |

## Stop Rules

- Stop if an always-plan row is removed because it is "not needed yet".
- Stop if a phase does not name applicable always-plan rows.
- Stop if a planned row lacks owner, trigger, review due and target phase.
