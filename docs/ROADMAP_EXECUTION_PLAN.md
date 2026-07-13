---
title: "Mappm - Roadmap Execution Plan"
description: "Konkrete Umsetzung der Rebuild-Roadmap in GitHub Milestones, Epics und Issues pro Phase und Säule"
tags: [roadmap, execution, milestones, epics, issues, github]
lastUpdated: "2026-07-12"
version: "0.6"
status: "accepted-rebaseline"
---

# Mappm - Roadmap Execution Plan

## Zweck

Dieses Dokument übersetzt die Rebuild-Roadmap in eine arbeitsfähige GitHub-Struktur.

Es ergänzt:

- `docs/ROADMAP_REBUILD.md`
- `docs/pillars/PILLAR_INDEX.md`
- `docs/technical/DECISION_*.md`

Die Roadmap beschreibt Phasen. Die Säulen beschreiben Verantwortungsbereiche. GitHub Milestones, Epics und Issues steuern die konkrete Arbeit.

## GitHub-Regeln

GitHub Issues sind die Quelle für actionable Arbeit.

Dokumente bleiben die Quelle für akzeptierte Entscheidungen und Konzepte:

- Entscheidungen: `docs/technical/DECISION_*.md`
- DMS-Zielarchitektur: `docs/technical/DECISION_DMS_TARGET_ARCHITECTURE.md`
- Cloud-/Local-Development-Cloud-Technologie: `docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md`
- Vault-/Commercial-Core-Modell: `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`
- Account-/Vault-/Assist-Modell: `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`
- Produkt-/Enterprise-Säulen: `docs/pillars/PILLAR_*.md`
- Frontend-/Foundation-Konzepte: `docs/concepts/CONCEPT_F*.md`
- Phasen und Reihenfolge: `docs/ROADMAP_REBUILD.md`
- Playbook-Reconciliation: `docs/execution/PLAYBOOK_AGENT_TRACK_CLOSEOUT.md`
- Always-Plan-/Conditional-Gates:
  `docs/roadmap-standard/ALWAYS_PLAN_CHECKLIST.md` und
  `docs/roadmap-standard/CONDITIONAL_IMPLEMENTATION_MATRIX.md`

Playbook-Regel:

- Kein Issue darf einen Always-Plan- oder Conditional-Bereich implizit
  auslassen, wenn der Scope ihn beruehrt.
- Store, CI/CD, Compliance, Security, Privacy, AI/OCR/LLM, Sync, Backup,
  Sharing, Support und Commercial duerfen als spaetere Slices geplant sein,
  muessen aber in Scope/Non-Goals/Dependencies sichtbar bleiben.
- Frontend- und Backend-Implementation bleiben getrennt. Wenn ein
  Frontend-Issue Backend-Bedarf entdeckt, wird ein verlinktes Backend- oder
  Contract-Folgeissue angelegt; Backend/API entscheidet Contract, DTOs,
  Endpoints, Mapping, Persistence und Policy Architecture.

## Milestone-Strategie

The existing M1-M6 GitHub milestones remain temporary backlog containers while
VC-01 decides whether Cloud Vault storage ships in Commercial 1.0. Account,
entitlement and Core Assist services are required either way. They are not release gates
and must not override C0-C7. Every active issue names its applicable C-gate and
R-traceability slice in the body. After VC-01, tracker owners either map these
containers explicitly or replace them without losing issue history.

| C-gate mapping | Existing GitHub backlog container | Bemerkung |
|---|---|---|
| C0/C1 prerequisites | `Mappm M1 Foundation and Quality` | Entscheidungen, Foundation und Quality; no release readiness by milestone alone |
| C2/C3 | `Mappm M2 Capture and Review Core` | Capture, Core Assist, Draft-Inbox, Review, Dokumente, Vorgänge, Suche, Tasks |
| C2/C3 plus later Advanced Assist | `Mappm M3 Assisted Review` | Core Assist issues must map to C2/C3; remaining container holds Advanced Assist and later expansion |
| C1/C4 plus later household | `Mappm M4 Household and Sync` | account/device foundation for every normal mode, Cloud migration/sync and profile backlog |
| later product expansion | `Mappm M5 Facts, Workflows and Insights` | Deferred beyond Commercial Core unless activated |
| C4/C5 plus later expansion | `Mappm M6 Automation, Resilience and Distribution` | Lifecycle/release work mixed with deferred automation; issue body must disambiguate |

Existing AI issues must be reconciled before implementation: OCR,
classification, actor/key-field extraction, case/workflow matching and review
needed for Core Assist belong to C2/C3 even if the temporary milestone name is
`M3`. Semantic answers, higher-tier extraction and broad automation remain
later. Milestone naming may not defer a Commercial-Core requirement.

## Label-Minimum

Jedes Issue braucht:

- genau ein `type:*`: `type:feature-request`, `type:bug` oder fuer reine
  Koordinations-Issues `type:epic`
- genau ein `status:*`
- mindestens ein `area:*`
- mindestens ein `layer:*`
- `priority:*` oder bei Bugs `severity:*`
- `scope:cross-cutting`, wenn mehrere Saeulen, Governance-Grenzen oder
  repository-weite Standards betroffen sind

Säulen werden im Issue Body angegeben, nicht als separate Labels. Labels bleiben bewusst grob genug, um GitHub handhabbar zu halten.

## Epic-Strategie

Epics sind normale GitHub Issues mit Titelpräfix `Epic:`.

Ein Epic muss enthalten:

- Roadmap-Phase.
- primäre Säulen.
- Scope.
- Non-Goals.
- Child-Issue-Liste.
- Akzeptanzkriterien.
- Verification/Handoff.

## Bestehende Issues

Diese Issues existieren bereits und werden nicht dupliziert:

| Issue | Titel | Rolle |
|---|---|---|
| #1 | Docs: Finalize R2 local database decision | R2 Decision, erledigt |
| #2 | Docs: Finalize R2 Home Hub auth and pairing decision | R2 Decision, erledigt |
| #3 | Docs: Finalize R2 security and privacy baseline | R2 Decision, erledigt |
| #4 | Docs: Write R2 technical foundation implementation plan | R2 Plan, erledigt |
| #5 | Foundation: Plan migration to F1 target project structure | R2/R3 Foundation |
| #6 | Foundation: Introduce Riverpod foundation and stop expanding BLoC/GetIt | R2 Foundation |
| #7 | Foundation: Define Mappm Failure and Result model | R2 Foundation |
| #8 | Foundation: Establish Vault storage and Draft Inbox persistence foundation | C1/R2/R4 Foundation |
| #9 | Foundation: Isolate mock UI and establish fake repositories | R3 QA/Foundation |
| #10 | Quality: Replace template tests with Mappm foundation tests | R3 QA/Foundation |
| #11 | Docs: Prepare Mobile Capture Commercial-Core handoff | C2/R4 Capture |
| #12 | Docs: Prepare M2 Capture and Review Core concept handoff | R4 M2 |
| #13 | Docs: Finalize product name | R0/R10 Naming/Distribution; accepted as `Mappm`, rename follow-up needed |
| #14 | Epic: R3 Quality and Production Readiness | R3 coordination epic |

## Angelegte Phase-Epics

Diese Epics wurden in GitHub angelegt:

| Issue | Titel | Phase | Milestone |
|---|---|---|---|
| #15 | Epic: R4 Capture and Review Core | R4 | `Mappm M2 Capture and Review Core` |
| #16 | Epic: R4/C2 Capture and Draft Inbox | R4/C2 | `Mappm M2 Capture and Review Core` |
| #17 | Epic: R5 Household Profiles and Access | R5 | `Mappm M4 Household and Sync` |
| #18 | Epic: R6 Cloud, Identity, Sync and Migration | R6/C1/C4 | `Mappm M4 Household and Sync` |
| #19 | Epic: R7 Extended Mobile Capture and Review | R7 | `Mappm M4 Household and Sync` |
| #20 | Epic: R8 Structured Facts, Claims and Insights | R8 | `Mappm M5 Facts, Workflows and Insights` |
| #21 | Epic: R9 OCR, Fact Suggestions and Managed Intelligence | R9/conditional | `Mappm M3 Assisted Review` |
| #22 | Epic: R10 Compliance, Legal and Distribution Readiness | R10 | `Mappm M6 Automation, Resilience and Distribution` |
| #23 | Epic: R11 Backup, Restore, Retention and Storage Health | R11 | `Mappm M6 Automation, Resilience and Distribution` |
| #24 | Epic: R12 Support, Diagnostics and Architecture Governance | R12 | `Mappm M6 Automation, Resilience and Distribution` |

## Angelegte R3/R4 Child-Issues

Diese nächsten Child-Issues wurden in GitHub angelegt:

| Issue | Titel | Parent | Milestone |
|---|---|---|---|
| #25 | Quality: Implement target-path analyzer and verify gates | #14 | `Mappm M1 Foundation and Quality` |
| #26 | Quality: Create synthetic fixtures for documents, cases, profiles and capture | #14 | `Mappm M1 Foundation and Quality` |
| #27 | Contract: Establish Mappm Cloud OpenAPI and Microcks baseline | #14 | `Mappm M1 Foundation and Quality` |
| #28 | Docs: Add R3 compliance and data-lifecycle readiness checklist | #14 | `Mappm M1 Foundation and Quality` |
| #29 | Quality: Define visual and accessibility regression baseline | #14 | `Mappm M1 Foundation and Quality` |

## Playbook-Reconciliation Outcomes

Diese beim Agent-Track gefundenen Anforderungen sind inzwischen umgesetzt oder
in ein bestehendes Issue ueberfuehrt. Sie duerfen nicht erneut als lose
Issue-Kandidaten dupliziert werden:

| Outcome | Phase | Owner | Evidence / remaining gate |
|---|---|---|---|
| R3 target-path analyzer and CI baseline | R3 | quality-readiness | Issue #25 plus fully specified R3.5; explicit user approval remains required before implementation. |
| MP-DS component/form family coverage | R3/R4 | ui-concept | MP-DS-04..07, F24/F27-F35, coverage matrix and HTML mock; affected rows still need phase review. |
| Dated REG-01..08 compliance artifacts | R3/R10 | compliance/product | REG-01..08 and Regulatory Source Register; legal review remains trigger-bound. |
| SEC/DATA/AI/OPS/COM subfamilies | R3-R15 | specialist owners | Seeded project-local drafts; each affected phase must complete and approve only the rows it activates. |
| First implementation-contract phase | R3.5 | product/quality | R3.5 contract and handoff are ready for explicit user approval, not yet authorized. |
| Technical identity and branding migration | R0/R10 | product/foundation | Issue #38 owns the deliberate DocMan-to-Mappm technical migration plan; product-facing text uses Mappm now. |
| #30 | Frontend: Implement M2 case and subcase management | #15 | `Mappm M2 Capture and Review Core` |
| #31 | Frontend: Implement document and draft inbox review flow | #15 | `Mappm M2 Capture and Review Core` |
| #32 | Foundation: Implement record-aware document metadata model | #15 | `Mappm M2 Capture and Review Core` |
| #33 | Frontend: Implement mobile scan pending-upload queue | #16 | `Mappm M2 Capture and Review Core` |
| #34 | Frontend: Implement Mappm Cloud capture contract consumer | #16 | `Mappm M2 Capture and Review Core` |
| #39 | Backend: Implement Mappm Cloud capture provider | #16 | `Mappm M2 Capture and Review Core`; blocked by #27 |
| #35 | Frontend: Implement M2 tasks, due dates and quick access | #15 | `Mappm M2 Capture and Review Core` |
| #36 | Frontend: Implement M2 structured search and filters | #15 | `Mappm M2 Capture and Review Core`; follows `DECISION_SEARCH_TECHNOLOGY.md` |
| #37 | Frontend: Implement M2 external action links | #15 | `Mappm M2 Capture and Review Core` |

## Phase Epics

The detailed candidate lists below preserve the pre-rebaseline issue plan.
They are non-authorizing planning input. Before creating or implementing any
listed child, re-slice it under C0-C7, apply VC-01..VC-08 and current
F/SEC/DATA/OPS/REG/COM gates, then create/update the live owner-prefixed issue.

### R2 - Technical Foundation

GitHub milestone: `Mappm M1 Foundation and Quality`

Existing anchor issues:

- #5 Foundation: Plan migration to F1 target project structure.
- #6 Foundation: Introduce Riverpod foundation and stop expanding BLoC/GetIt.
- #7 Foundation: Define Mappm Failure and Result model.
- #8 Foundation: Establish local storage and draft inbox persistence foundation.

Additional child issues:

| Proposed title | Primary pillars | Labels |
|---|---|---|
| Foundation: Implement R2 bootstrap and target app shell | Developer Experience; Design System/UX | `area:foundation`, `area:frontend`, `layer:frontend`, `layer:platform`, `priority:high`, `scope:cross-cutting` |
| Foundation: Wire configuration and environment profiles | Admin/Settings; Developer Experience | `area:foundation`, `area:platform`, `layer:platform`, `priority:medium`, `scope:cross-cutting` |
| Foundation: Establish secure storage boundary for Local/Cloud keys and account/device credentials | Security/Privacy; Cloud/Identity/Sync | `area:security`, `area:auth`, `layer:security`, `layer:data`, `priority:high`, `scope:cross-cutting` |
| Docs: Document R2 target-path migration completion criteria | Developer Experience | `area:docs`, `area:foundation`, `layer:docs`, `priority:medium`, `scope:cross-cutting` |

### R3 - Quality & Production Readiness

GitHub milestone: `Mappm M1 Foundation and Quality`

Existing anchor issues:

- #9 Foundation: Isolate mock UI and establish fake repositories.
- #10 Quality: Replace template tests with Mappm foundation tests.
- #14 Epic: R3 Quality and Production Readiness.

Additional child issues:

| Proposed title | Primary pillars | Labels |
|---|---|---|
| #25 Quality: Implement target-path analyzer and verify gates | Quality Assurance; Developer Experience | `area:quality`, `area:foundation`, `layer:tests`, `layer:platform`, `priority:high`, `scope:cross-cutting` |
| #26 Quality: Create synthetic fixtures for documents, cases, profiles and capture | Quality Assurance; Security/Privacy | `area:quality`, `area:documents`, `layer:tests`, `priority:high`, `scope:cross-cutting` |
| #27 Contract: Establish Mappm Cloud OpenAPI and Microcks baseline | Cloud/Identity/Sync; QA | `area:api-contracts`, `area:sync`, `layer:api`, `layer:tests`, `priority:high`, `scope:cross-cutting` |
| #28 Docs: Add R3 compliance and data-lifecycle readiness checklist | Compliance/Legal; Data Lifecycle | `area:distribution`, `area:security`, `layer:docs`, `priority:medium`, `scope:cross-cutting` |
| #29 Quality: Define visual and accessibility regression baseline | Design System/UX; QA | `area:design-system`, `area:quality`, `layer:tests`, `layer:frontend`, `priority:medium`, `scope:cross-cutting` |

### R4 - Capture and Review Core

GitHub milestone: `Mappm M2 Capture and Review Core`

Existing anchor issues:

- #11 Docs: Prepare Mobile Capture M2 concept handoff.
- #12 Docs: Prepare M2 Capture and Review Core concept handoff.

Recommended epics:

| Epic | Milestone | Primary pillars |
|---|---|---|
| #15 Epic: R4 Capture and Review Core | `Mappm M2 Capture and Review Core` | Cases/Records, Documents, Tasks, Search, External Actions |
| #16 Epic: R4/C2 Capture and Draft Inbox | `Mappm M2 Capture and Review Core` | Capture & Inbox, Cloud/Identity/Sync |

Child issues:

| Proposed title | Milestone | Labels |
|---|---|---|
| #30 Frontend: Implement M2 case and subcase management | `Mappm M2 Capture and Review Core` | `area:cases`, `layer:frontend`, `layer:domain`, `priority:high` |
| #31 Frontend: Implement document and draft inbox review flow | `Mappm M2 Capture and Review Core` | `area:documents`, `layer:frontend`, `layer:domain`, `layer:data`, `priority:high` |
| #32 Foundation: Implement record-aware document metadata model | `Mappm M2 Capture and Review Core` | DMS-Zielarchitektur: DocumentRecord, FileRecord, Versionen, Profilbezug und spätere Link-Objekte vorbereiten; `area:documents`, `area:data-storage`, `layer:domain`, `layer:data`, `priority:high`, `scope:cross-cutting` |
| #33 Frontend: Implement mobile scan pending-upload queue | `Mappm M2 Capture and Review Core` | `area:capture`, `area:sync`, `layer:frontend`, `layer:sync`, `priority:high`, `scope:cross-cutting` |
| #34 Frontend: Implement Mappm Cloud capture contract consumer | `Mappm M2 Capture and Review Core` | `area:capture`, `area:api-contracts`, `layer:api`, `layer:sync`, `priority:high`, `scope:cross-cutting` |
| #39 Backend: Implement Mappm Cloud capture provider | `Mappm M2 Capture and Review Core` | `area:capture`, `area:api-contracts`, `layer:backend`, `layer:api`, `layer:security`, `priority:high`, `scope:cross-cutting` |
| #35 Frontend: Implement M2 tasks, due dates and quick access | `Mappm M2 Capture and Review Core` | `area:cases`, `area:documents`, `layer:frontend`, `layer:domain`, `priority:medium`, `scope:cross-cutting` |
| #36 Frontend: Implement M2 structured search and filters | `Mappm M2 Capture and Review Core` | Search-Boundary plus SQLite/Drift/FTS5 per `DECISION_SEARCH_TECHNOLOGY.md`; `area:documents`, `area:cases`, `layer:frontend`, `layer:data`, `priority:high`, `scope:cross-cutting` |
| #37 Frontend: Implement M2 external action links | `Mappm M2 Capture and Review Core` | `area:documents`, `area:cases`, `layer:frontend`, `layer:domain`, `priority:medium`, `scope:cross-cutting` |

### R5 - Assisted Review and Household Profiles

R5 is a traceability grouping. Its Core Assist work maps to C1/C2/C3 and may
not wait for an optional later release; household/profile work retains its own
sequencing.

GitHub milestones:

- `Mappm M3 Assisted Review`
- `Mappm M4 Household and Sync`

Recommended epic:

- #17 Epic: R5 Household Profiles and Access.
- Epic: C2/C3 Core Assist and Review (tracker reconciliation required).

Child issues:

| Proposed title | Labels |
|---|---|
| Contract: Define Core Assist processing contract | `area:ai-analysis`, `area:api-contracts`, `area:documents`, `layer:api`, `priority:high`, `scope:cross-cutting` |
| Backend: Implement Core Assist processing provider | `area:ai-analysis`, `area:documents`, `layer:backend`, `layer:security`, `priority:high`, `scope:cross-cutting` |
| Foundation: Implement text extraction boundary for draft review | `area:ai-analysis`, `area:documents`, `layer:domain`, `layer:data`, `priority:high`, `scope:cross-cutting` |
| Frontend: Add metadata suggestion review UI | `area:ai-analysis`, `area:documents`, `layer:frontend`, `priority:high`, `scope:cross-cutting` |
| Foundation: Implement household and profile domain model | `area:profiles`, `layer:domain`, `layer:data`, `priority:high` |
| Frontend: Make inbox, cases, records and tasks profile-aware | `area:profiles`, `area:documents`, `area:cases`, `layer:frontend`, `layer:domain`, `priority:high`, `scope:cross-cutting` |
| Docs: Define child profile and adult manager UX | `area:profiles`, `area:frontend`, `area:design-system`, `layer:docs`, `priority:medium`, `scope:cross-cutting` |
| Docs: Plan partner access and sharing boundary | `area:profiles`, `area:security`, `layer:docs`, `layer:security`, `priority:medium`, `scope:cross-cutting` |

### R6 - Sync and Auth

GitHub milestone: `Mappm M4 Household and Sync`

Recommended epic:

- #18 Epic: R6 Cloud, Identity, Sync and Migration.

Child issues:

| Proposed title | Labels |
|---|---|
| Frontend: Implement paired device management | `area:auth`, `area:sync`, `layer:frontend`, `layer:security`, `priority:high`, `scope:cross-cutting` |
| Foundation: Define Sync Journal and conflict domain model | `area:sync`, `area:data-storage`, `layer:domain`, `layer:data`, `priority:high`, `scope:cross-cutting` |
| Contract: Define Cloud sync/migration OpenAPI baseline | Zielstack: ASP.NET Core + PostgreSQL + S3, Vertrag zuerst ueber OpenAPI/Microcks; `area:api-contracts`, `area:sync`, `layer:api`, `layer:docs`, `priority:high`, `scope:cross-cutting` |
| Docs: Add conflict review UX concept and handoff | `area:sync`, `area:frontend`, `layer:docs`, `priority:medium`, `scope:cross-cutting` |
| Docs: Prepare optional identity provider boundary | `area:auth`, `area:security`, `layer:docs`, `layer:security`, `priority:medium`, `scope:cross-cutting` |

### R7 - Extended Mobile

GitHub milestone: `Mappm M4 Household and Sync`

Recommended epic:

- #19 Epic: R7 Extended Mobile Capture and Review.

Child issues:

| Proposed title | Labels |
|---|---|
| Frontend: Implement mobile batch scan prototype | `area:capture`, `area:frontend`, `layer:frontend`, `priority:medium`, `scope:cross-cutting` |
| Frontend: Add mobile metadata correction flow | `area:capture`, `area:documents`, `layer:frontend`, `priority:medium`, `scope:cross-cutting` |
| Frontend: Add mobile case detail read-only view | `area:capture`, `area:cases`, `layer:frontend`, `priority:medium`, `scope:cross-cutting` |
| Frontend: Define mobile share sheet import boundary | `area:capture`, `area:documents`, `layer:frontend`, `layer:platform`, `priority:low`, `scope:cross-cutting` |

### R8 - Structured Facts and Insights

GitHub milestone: `Mappm M5 Facts, Workflows and Insights`

Recommended epic:

- #20 Epic: R8 Structured Facts, Claims and Insights.

Child issues:

| Proposed title | Labels |
|---|---|
| Foundation: Implement document facts domain model | `area:documents`, `area:data-storage`, `layer:domain`, `layer:data`, `priority:high`, `scope:cross-cutting` |
| Frontend: Implement claims and reimbursement tracking | `area:cases`, `area:documents`, `layer:domain`, `layer:frontend`, `priority:high`, `scope:cross-cutting` |
| Foundation: Implement financial entries for expenses and reimbursements | `area:documents`, `area:data-storage`, `layer:domain`, `layer:data`, `priority:medium`, `scope:cross-cutting` |
| Frontend: Implement first local insights view | `area:frontend`, `area:documents`, `layer:frontend`, `layer:data`, `priority:medium`, `scope:cross-cutting` |
| Docs: Approve first country pack and Golden Workflow scope | `area:cases`, `area:docs`, `area:distribution`, `layer:docs`, `priority:high`, `scope:cross-cutting` |
| Foundation: Implement versioned workflow catalog and case-instance model | `area:cases`, `area:data-storage`, `layer:domain`, `layer:data`, `priority:high`, `scope:cross-cutting` |
| Frontend: Present reviewed guided workflow instances | `area:cases`, `area:frontend`, `layer:frontend`, `priority:medium`, `scope:cross-cutting` |

### R9 - Advanced Intelligence and Automation

GitHub milestones:

- `Mappm M3 Assisted Review` only as a temporary container; any remaining Core
  Assist issue still maps to C2/C3.
- `Mappm M6 Automation, Resilience and Distribution` for local LLMs, reprocessing and job operations.

Recommended epic:

- #21 Epic: R9 OCR, Fact Suggestions and Managed Intelligence; reconcile Core
  Assist children into C2/C3 and retain only Advanced Assist/automation here.

Child issues:

| Proposed title | Labels |
|---|---|
| Backend: Select OCR engine and processing boundary | `area:ai-analysis`, `area:security`, `layer:backend`, `layer:security`, `priority:high`, `scope:cross-cutting` |
| Foundation: Implement OCR job model and review queue | `area:ai-analysis`, `area:documents`, `layer:domain`, `layer:data`, `priority:high`, `scope:cross-cutting` |
| Frontend: Add suggested metadata review UI | `area:ai-analysis`, `area:frontend`, `layer:frontend`, `priority:medium`, `scope:cross-cutting` |
| Contract: Define workflow matching suggestion contract | `area:ai-analysis`, `area:cases`, `area:api-contracts`, `layer:api`, `priority:medium`, `scope:cross-cutting` |
| Backend: Define local LLM inference service boundary | `area:ai-analysis`, `area:api-contracts`, `layer:api`, `layer:backend`, `priority:medium`, `scope:cross-cutting` |

### R10 - Compliance & Distribution Readiness

GitHub milestone: `Mappm M6 Automation, Resilience and Distribution`

Recommended epic:

- #22 Epic: R10 Compliance, Legal and Distribution Readiness.

Child issues:

| Proposed title | Labels |
|---|---|
| Docs: Define DSGVO/GDPR product compliance checklist | `area:distribution`, `area:security`, `layer:docs`, `priority:high`, `scope:cross-cutting` |
| Docs: Prepare Apple, Google and Microsoft Store policy matrix | `area:distribution`, `layer:docs`, `priority:medium` |
| Docs: Add open-source license compliance review | `area:distribution`, `layer:platform`, `layer:docs`, `priority:medium` |
| Docs: Define review/demo mode without private data | `area:distribution`, `area:security`, `layer:docs`, `priority:medium`, `scope:cross-cutting` |

### R11 - Data Resilience & Operations

GitHub milestone: `Mappm M6 Automation, Resilience and Distribution`

Recommended epic:

- #23 Epic: R11 Backup, Restore, Retention and Storage Health.

Child issues:

| Proposed title | Labels |
|---|---|
| Docs: Define backup and restore strategy | `area:data-storage`, `area:security`, `layer:docs`, `priority:high`, `scope:cross-cutting` |
| Foundation: Implement storage integrity checks | `area:data-storage`, `area:documents`, `layer:data`, `priority:medium`, `scope:cross-cutting` |
| Frontend: Add storage integrity and health status UI | `area:data-storage`, `area:documents`, `layer:frontend`, `priority:medium`, `scope:cross-cutting` |
| Foundation: Define soft delete, tombstones and retention model | `area:data-storage`, `area:sync`, `layer:domain`, `layer:data`, `priority:high`, `scope:cross-cutting` |
| Quality: Add restore drill verification checklist | `area:quality`, `area:data-storage`, `layer:tests`, `priority:medium`, `scope:cross-cutting` |

### R12 - Support & Governance

GitHub milestone: `Mappm M6 Automation, Resilience and Distribution`

Recommended epic:

- #24 Epic: R12 Support, Diagnostics and Architecture Governance.

Child issues:

| Proposed title | Labels |
|---|---|
| Foundation: Define redacted diagnostics package | `area:platform`, `area:security`, `layer:platform`, `layer:security`, `priority:medium`, `scope:cross-cutting` |
| Docs: Add support-mode UX concept | `area:frontend`, `area:platform`, `layer:docs`, `priority:low`, `scope:cross-cutting` |
| Docs: Establish architecture decision review cadence | `area:docs`, `area:foundation`, `layer:docs`, `priority:medium`, `scope:cross-cutting` |
| Docs: Align GitHub milestones, labels and project board fields | `area:docs`, `area:platform`, `layer:docs`, `layer:platform`, `priority:medium`, `scope:cross-cutting` |

## GitHub Metadata

The following reconciliation-specific labels were created or re-verified; the
complete required label contract remains in `.codex/skills/github-issue/SKILL.md`:

- `type:epic`
- `scope:cross-cutting`
- `area:quality`
- `area:api-contracts`
- `area:data-storage`
- `layer:api`

## Creation Status

Current status:

1. Missing labels were created or verified.
2. Phase epics R4-R12 were created.
3. R3/R4 child issues were created.
4. R3/R4 epics map created children in their `Issue Map` sections and use
   native dependencies where ordering is explicit.
5. R5-R12 child issue creation remains deferred until the current phase approaches, unless a blocker needs early tracking.

This keeps GitHub useful instead of flooding it with stale speculative issues.
