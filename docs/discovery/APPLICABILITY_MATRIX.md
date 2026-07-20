---
title: "DocMan/Mappm - Applicability Matrix"
description: "Playbook applicability matrix for the existing DocMan/Mappm project"
tags: [discovery, applicability, governance, playbook]
lastUpdated: "2026-07-20"
status: "accepted-baseline"
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
| Design System | always-plan | MP-DS-00..07, exact DS-04 family mapping and HTML mock exist | ui-concept | `docs/design-system/*` | before each UI phase |
| Roadmap/Pillars | always-plan | C0-C7 governs release; R0-R15 preserves traceability; simplified pillars and Assurance Tracks map to P0-P11 | product-concept | `docs/ROADMAP_REBUILD.md`, `docs/roadmap/*`, `docs/pillars/*` | 2026-07-15 |
| Execution Governance | always-plan | newly initialized by reconciliation | project-bootstrap-runner | `docs/execution/*` | 2026-07-15 |
| CI/CD and Local Verification | always-plan | scripts and entrypoint exist; CI/CD/release gates are scheduled | quality-readiness | `frontend.sh`, F16, OPS-00/OPS-07/OPS-08, `docs/roadmap-standard/RELEASE_READINESS_PHASES.md` | 2026-07-15 |
| Security | always-plan | security/privacy decisions plus SEC-00..05 drafts exist | security/product-concept | `docs/security/*`, existing decisions | before each sensitive phase |
| Privacy/Data Lifecycle | always-plan | DATA-00..06 classify lifecycle requirements for sensitive documents/metadata | privacy/data | `docs/data-lifecycle/*`, REG-01 | before persistence/sync/AI/release |
| Regulatory | always-plan | REG-00..08 and dated official-source register cover EU/Oesterreich law, 2026 changes and Store sources | compliance/product | `docs/regulatory/*` | 2026-08-15 or earlier feature/legal trigger |
| Store/Platform Compliance | planned | desktop/mobile distribution is expected, but submission follows a current per-channel review | release/compliance | REG-08, F8, OPS-06 | before first submission build, otherwise 2026-08-15 |
| Managed Cloud/API | applicable | Cloud Vault is accepted; ASP.NET Core and OpenAPI/Microcks are the direction | contract-api/backend | F11, F36, Cloud decisions, Cloud pillar | C0/C1 |
| Customer Self-hosting | not-applicable | Home Hub is superseded; Local Development Cloud is developer-only | product/security/ops | Vault/Cloud decision | 2027-01-12 |
| Sync/Backup/Migration/Sharing | planned | Cloud requires sync/backup and both exit migrations; sharing remains later | data/security | F36, DATA-03/05, SEC-02/03 | C0/C4 |
| AI/OCR/LLM | applicable | Core Assist is required in C2/C3; Advanced Assist remains later; real-document processing is blocked by VC-02/OQ-003 and AI/REG gates | ai/compliance | `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`, `docs/ai/AI-00_AI_GOVERNANCE_UMBRELLA.md`, REG-02, AI-* | before C2 approval |
| Commercial/Billing | applicable | account-based Free/Paid Local and Cloud modes are accepted; Assist quotas, pricing and policy values remain open | commercial/product | `docs/commercial/*`, F36 | C0/C1/C4 |
| eIDAS/EUDI/ID Austria | planned | trusted identity is strategically relevant for Austria/EU, later provider boundary | identity/compliance | REG-04, identity decision | 2026-08-15 |
| EHDS/Health Interoperability | needs-review | Mappm handles health documents but is not currently an EHR and makes no health-interoperability claim; scope changes if such capabilities or marketing are added | legal/privacy/product | Source Register, REG-01, accepted Medical core plus extension supplement | before health-provider/EHR integration, otherwise 2027-03-26 |
| NIS2/NISG 2026 | needs-review | Austrian NISG 2026 takes material effect on 2026-10-01; entity, size, service and supply-chain scope remain a legal decision | legal/security/ops | REG-05, SEC-*, OPS-* | before Managed Cloud/Enterprise launch and no later than 2026-09-01 |
| Standard Roadmap Guardrails | always-plan | playbook phases map to C0-C7 while R0-R15 remains traceability | product-concept | `docs/roadmap-standard/STANDARD_PHASES.md`, `ALWAYS_PLAN_CHECKLIST.md`, `CONDITIONAL_IMPLEMENTATION_MATRIX.md` | 2026-07-15 |

## Stop Rules

- Stop if a phase treats regulatory, security, AI, cloud, sync, store or
  commercial scope as absent because it is not implemented yet.
- Stop if a conditional area is removed instead of being marked with strict
  traceability.
- Stop if DocMan-specific accepted decisions are overwritten by generic
  playbook defaults.
