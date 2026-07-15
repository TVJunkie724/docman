---
title: "DocMan/Mappm - Decision Traceability Matrix"
description: "Traceability from product decisions and discovery answers to concepts, phases and issues"
tags: [execution, decisions, traceability, playbook]
lastUpdated: "2026-07-15"
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
| UI/backend coupling is contract-first and frontend uses Domain ports/Data adapters | accepted-provisional | `docs/technical/DECISION_BACKEND_CONTRACT_FIRST_ARCHITECTURE.md` | F11, F15, F30, contract-api | C1-C4/R3/R4/R6 | architecture/ownership accepted; every concrete contract still needs its own Contract/API and Backend phase approval |
| Documents, OCR/LLM output and many metadata classes are sensitive | accepted | `docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md` | F5, F7, F9, SEC-*, DATA-* | R2, R3, R4, R9 | accepted |
| Core Assist is required in Commercial Core; Advanced Assist remains conditional | accepted-rebaseline | `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md`, `DECISION_INTELLIGENCE_SCOPE.md` | AI-*, REG-02, F30/F34 | C1-C3; advanced later | VC-02/OQ-003 and AI/REG gates required before real processing |
| Global capture always runs async Backend/Core Assist; mobile closes one explicit logical document before the next scan, session/import items are processed independently, editable titles are mandatory, current routing is user-confirmed and later auto-routing is class-specific/undoable | accepted-direction | `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md` | F10/F15/F17/F29/F30/F37, Capture/Inbox, Intelligence | C2/C3; automation later | exact UI/provider/SLO open; behavior and quality gates accepted |
| Completed review requires a primary Case or Record; unmatched content uses a lightweight Custom Case with generated title, subject and document only | accepted-direction | `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`, `DECISION_CASE_DOCUMENT_RECORD_MODEL.md` | F30/F37, Capture/Inbox, Cases/Records | C2/C3/R4 | accepted direction; persistence/UI details require phase contract |
| Document taxonomy separates base type, semantic variant, domain, Record kind, source/format and relationship role; complete catalog is not yet accepted | accepted-taxonomy/open-catalog | `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md`, OQ-011 | F30/F37, Cases/Records, Templates/Workflows, Search | C0/R0.6 before C2/C3 schema/routing implementation | lean base-type/variant mapping against workflow patterns, templates and full alias vocabulary required before implementation |
| Domain workflows use a generic engine plus curated, versioned jurisdiction/provider definitions; AI may select but not invent them | accepted-direction/open-schema | `docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`, `docs/discovery/DYNAMIC_DOMAIN_COUNTRY_PACK_MODEL_DRAFT.md` | Templates/Workflows, Intelligence, Cases/Records, Data, Contracts | C0/R0.6/C3 and later activated workflow slices | R0.6 must normalize layers; schema/registry/signature/DSL remain explicit Contract/Data decisions; WF-01/WF-02 block country-pack release claims |
| One `Case` type, typed `CaseLink` graph, workflow branches/Claims and reversible top-down/bottom-up composition | accepted | `docs/technical/DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md` | F37, Cases/Records, Templates/Workflows | C3/R4/R8 | accepted; phase must still define exact relation UX and persistence contract |
| Mappm has one generic Case that may remain a lightweight document/context collection; guided behavior uses optional workflow patterns and visible domain templates, while Records, Claims and branches remain separate concepts | accepted-core/open-catalog | `docs/technical/DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`, `DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`, `docs/discovery/CASE_DOCUMENT_TAXONOMY_CANDIDATES.md` | F37, Cases/Records, Templates/Workflows | C0/R0.6 before C2/C3 schema/routing implementation | Zielmodell, optionale Muster, Fachvorlagen, Records und Dokumenttaxonomie gemeinsam akzeptieren; keine sichtbare Case- oder Dokument-Massentypologie |
| Medical discovery currently proposes one care anchor and one `part_of` cost-settlement Case per economic obligation; recurring-course and benefit boundaries still require acceptance | draft-discovery | `docs/discovery/MEDICAL_CASE_MODEL_DISCOVERY.md`, OQ-012 | Cases/Records, Templates/Workflows, Tasks; F37 only after acceptance | R0.6 decision; R8.12 implementation only if activated | User workshop accepts/revises the model; WF-01/WF-02 and professional AT/provider review then block workflow implementation/release claims |
| The complete visible-template inventory has a preliminary Austrian mapping onto the generic Case/workflow model, but no AT rule is release-approved by that draft | draft-discovery | `docs/discovery/AUSTRIA_CASE_WORKFLOW_COUNTRY_PACK_DRAFT.md`, `docs/discovery/AUSTRIA_TAX_CASE_CATALOG_DRAFT.md` | all product pillars, Templates/Workflows, Compliance | R0.6/WF-01/OQ-010 | choose subpacks, owners and supported workflows; WF-02 plus current official sources/fixtures block release claims |
| Recurring contracts/subscriptions are first-class Records with one calm lifecycle, invoice matching, tasks and slim confirmed-value history | accepted-direction/open-category-scope | `docs/technical/DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md` | F37, Contracts/Subscriptions, Tasks, Search/Insights | C3/R8.9 | country cancellation rules and first-release categories require phase review |
| Managed persons and organizations share the ManagedSubject mechanism; external parties remain distinct | accepted-direction/open-release-scope | `docs/technical/DECISION_MANAGED_SUBJECTS_BUSINESS_CONTEXTS.md` | F37, Managed Profiles/Access | C0/C3/R5 | OQ-009 blocks business-scope activation, not person-profile work |
| Tax is jurisdictional document collection and review, not bookkeeping, tax calculation, advice or filing | accepted-direction/open-pack-scope | `docs/technical/DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md` | F37, Search/Insights, Templates/Workflows | C3/R8.11 | OQ-010 and WF-02 block any tax-pack release claim |
| Review actions are contextual and progressive; financial sections use confirmed entries and deduplicated `part_of` roll-up only | accepted | `docs/technical/DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md` | F30/F34/F37, Capture/Inbox, Search/Insights | C2/C3/R4/R8 | accepted; UI phase must prove no empty/noisy sections and no double counting |
| Mappm Account is required normally; eIDAS/EUDI/ID Austria remains an optional provider/trust path | accepted-direction/open-details | `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`, `DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md`, VC-08 and REG-04 | F12/F13/F36, SEC-02/03 | C0/C1/C4 | VC-08 and OQ-004 block identity implementation |
| Commercialization, billing, SLA and procurement model | planned | COM-00..04 plus VC-03/VC-04 | COM-* | C0/C4/C5 | user/product review needed |
| Project-local frontend entrypoint is `frontend.sh` and delegates to scripts | accepted | `docs/ops/OPS-08_PROJECT_ENTRYPOINTS.md` | OPS-00/OPS-08, F1/F6/F16 | R0/R2/R15 | accepted |
| Playbook governance applies across C0-C7; R0-R15 remain traceability IDs | accepted-rebaseline | `docs/roadmap-standard/STANDARD_PHASES.md`, `docs/execution/PLAYBOOK_AGENT_TRACK_CLOSEOUT.md` | roadmap-standard, F concepts, pillars | C0-C7 over R0-R15 | accepted |
| Design-system coverage must map MP-DS concepts, F concepts and HTML mock evidence before UI implementation | accepted | `docs/design-system/concepts/MP-DS-COVERAGE_MATRIX.md` | MP-DS, F23-F37 | C1-C4/R3/R4/R8 | accepted; F37 requires phase-owned visual evidence |
| Root-level Flutter repository layout is an accepted adaptation of the generic app-folder default | accepted | `docs/technical/DECISION_REPOSITORY_LAYOUT.md` | F1, OPS-08 | R0/R2/R3 | accepted |
| Proposed first playbook implementation-ready phase is R3.5 target-path quality baseline | proposed | `docs/roadmap/phases/R3_5_TARGET_PATH_QUALITY_BASELINE.md` | F1/F3/F4/F15/F16, OPS-08 | R3.5 | ready for explicit user approval; implementation blocked until recorded |
| Regulatory baseline uses a dated official-source register and phase-specific legal review, including Austrian DSG/NISG 2026, AI-Omnibus publication watch, CRA reporting, EHDS, consumer law and Store sources | accepted-governance | `docs/regulatory/REGULATORY_SOURCE_REGISTER.md` | REG-00..08 | C0-C7 plus affected R slices | baseline checked 2026-07-15; refresh at row-specific trigger |

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
