---
title: "DocMan - Roadmap Execution Plan"
description: "Konkrete Umsetzung der Rebuild-Roadmap in GitHub Milestones, Epics und Issues pro Phase und Säule"
tags: [roadmap, execution, milestones, epics, issues, github]
lastUpdated: "2026-05-29"
version: "0.5"
status: "accepted"
---

# DocMan - Roadmap Execution Plan

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
- Home-Hub-Technologie: `docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md`
- Produkt-/Enterprise-Säulen: `docs/pillars/PILLAR_*.md`
- Frontend-/Foundation-Konzepte: `docs/concepts/CONCEPT_F*.md`
- Phasen und Reihenfolge: `docs/ROADMAP_REBUILD.md`

## Milestone-Strategie

GitHub-Milestones folgen dem Produkt-Milestone-Modell. Bereiche wie Cases,
Documents oder Capture werden ueber Epics, Labels und Issue-Body gefuehrt,
nicht als eigene Milestones.

| Roadmap-Milestone | GitHub-Milestone | Bemerkung |
|---|---|---|
| M0/M1 | `Ordna M1 Foundation and Quality` | Entscheidungen, Foundation, QA, Production Readiness |
| M2 | `Ordna M2 Capture and Review Core` | Capture, Draft-Inbox, Review, Dokumente, Vorgänge, Suche, Tasks |
| M3 | `Ordna M3 Assisted Review` | OCR/Text, Metadatenvorschlaege, Review von Vorschlaegen |
| M4 | `Ordna M4 Household and Sync` | Profile, Haushalt, Pairing, Home Hub, Sync, Extended Mobile |
| M5 | `Ordna M5 Facts, Workflows and Insights` | Facts, Claims, Auswertungen, Workflows, externe Aktionen |
| M6 | `Ordna M6 Automation, Resilience and Distribution` | Backup, Restore, Compliance, Release, Sharing, lokale LLMs, Ops |

## Label-Minimum

Jedes Issue braucht:

- `type:feature-request` oder `type:bug`
- genau ein `status:*`
- mindestens ein `area:*`
- mindestens ein `layer:*`
- `priority:*` oder bei Bugs `severity:*`

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
| #1 | Finalize R2 local database decision | R2 Decision, erledigt |
| #2 | Finalize R2 Home Hub auth and pairing decision | R2 Decision, erledigt |
| #3 | Finalize R2 security and privacy baseline | R2 Decision, erledigt |
| #4 | Write R2 technical foundation implementation plan | R2 Plan, erledigt |
| #5 | Plan migration to F1 target project structure | R2/R3 Foundation |
| #6 | Introduce Riverpod foundation and stop expanding BLoC/GetIt | R2 Foundation |
| #7 | Define DocMan Failure and Result model | R2 Foundation |
| #8 | Establish local storage and draft inbox persistence foundation | R2/R4 Foundation |
| #9 | Isolate mock UI and establish fake repositories | R3 QA/Foundation |
| #10 | Replace template tests with DocMan foundation tests | R3 QA/Foundation |
| #11 | Prepare Mobile Capture M2 concept handoff | R4 Capture |
| #12 | Prepare M2 Capture and Review Core concept handoff | R4 M2 |
| #13 | Finalize product name | R0/R10 Naming/Distribution; accepted as `Ordna`, rename follow-up needed |
| #14 | Define R3 Quality & Production Readiness phase | R3 Epic/Phase Definition |

## Angelegte Phase-Epics

Diese Epics wurden in GitHub angelegt:

| Issue | Titel | Phase | Milestone |
|---|---|---|---|
| #15 | Epic: R4 Capture and Review Core | R4 | `Ordna M2 Capture and Review Core` |
| #16 | Epic: R4 Capture and Draft Inbox M2 | R4 | `Ordna M2 Capture and Review Core` |
| #17 | Epic: R5 Household Profiles and Access | R5 | `Ordna M4 Household and Sync` |
| #18 | Epic: R6 Home Hub, Auth and Sync | R6 | `Ordna M4 Household and Sync` |
| #19 | Epic: R7 Extended Mobile Capture and Review | R7 | `Ordna M4 Household and Sync` |
| #20 | Epic: R8 Structured Facts, Claims and Insights | R8 | `Ordna M5 Facts, Workflows and Insights` |
| #21 | Epic: R9 OCR, Fact Suggestions and Local Intelligence | R9 | `Ordna M3 Assisted Review` |
| #22 | Epic: R10 Compliance, Legal and Distribution Readiness | R10 | `Ordna M6 Automation, Resilience and Distribution` |
| #23 | Epic: R11 Backup, Restore, Retention and Storage Health | R11 | `Ordna M6 Automation, Resilience and Distribution` |
| #24 | Epic: R12 Support, Diagnostics and Architecture Governance | R12 | `Ordna M6 Automation, Resilience and Distribution` |

## Angelegte R3/R4 Child-Issues

Diese nächsten Child-Issues wurden in GitHub angelegt:

| Issue | Titel | Parent | Milestone |
|---|---|---|---|
| #25 | Implement target-path analyzer and verify gates | #14 | `Ordna M1 Foundation and Quality` |
| #26 | Create synthetic fixtures for documents, cases, profiles and capture | #14 | `Ordna M1 Foundation and Quality` |
| #27 | Establish OpenAPI and Microcks contract baseline | #14 | `Ordna M1 Foundation and Quality` |
| #28 | Add R3 compliance and data-lifecycle readiness checklist | #14 | `Ordna M1 Foundation and Quality` |
| #29 | Define visual and accessibility regression baseline | #14 | `Ordna M1 Foundation and Quality` |
| #30 | Implement M2 case and subcase management | #15 | `Ordna M2 Capture and Review Core` |
| #31 | Implement document and draft inbox review flow | #15 | `Ordna M2 Capture and Review Core` |
| #32 | Implement record-aware document metadata model | #15 | `Ordna M2 Capture and Review Core` |
| #33 | Implement mobile scan upload queue M2 | #16 | `Ordna M2 Capture and Review Core` |
| #34 | Implement Home Hub capture upload contract client | #16 | `Ordna M2 Capture and Review Core` |
| #35 | Implement M2 tasks, due dates and quick access | #15 | `Ordna M2 Capture and Review Core` |
| #36 | Implement M2 structured search and filters | #15 | `Ordna M2 Capture and Review Core`; follows `DECISION_SEARCH_TECHNOLOGY.md` |
| #37 | Implement M2 external action links | #15 | `Ordna M2 Capture and Review Core` |

## Phase Epics

### R2 - Technical Foundation

GitHub milestone: `Ordna M1 Foundation and Quality`

Existing anchor issues:

- #5 Plan migration to F1 target project structure.
- #6 Introduce Riverpod foundation and stop expanding BLoC/GetIt.
- #7 Define DocMan Failure and Result model.
- #8 Establish local storage and draft inbox persistence foundation.

Additional child issues:

| Proposed title | Primary pillars | Labels |
|---|---|---|
| Implement R2 bootstrap and target app shell | Developer Experience; Design System/UX | `area:foundation`, `area:frontend`, `layer:frontend`, `layer:platform` |
| Wire configuration and environment profiles | Admin/Settings; Developer Experience | `area:foundation`, `area:platform`, `layer:platform` |
| Establish secure storage boundary for pairing and local secrets | Security/Privacy; Home Hub & Sync | `area:security`, `area:auth`, `layer:security`, `layer:data` |
| Document R2 target-path migration completion criteria | Developer Experience | `area:docs`, `area:foundation`, `layer:docs` |

### R3 - Quality & Production Readiness

GitHub milestone: `Ordna M1 Foundation and Quality`

Existing anchor issues:

- #9 Isolate mock UI and establish fake repositories.
- #10 Replace template tests with DocMan foundation tests.
- #14 Define R3 Quality & Production Readiness phase.

Additional child issues:

| Proposed title | Primary pillars | Labels |
|---|---|---|
| #25 Implement target-path analyzer and verify gates | Quality Assurance; Developer Experience | `area:quality`, `area:foundation`, `layer:tests`, `layer:platform` |
| #26 Create synthetic fixtures for documents, cases, profiles and capture | Quality Assurance; Security/Privacy | `area:quality`, `area:documents`, `layer:tests` |
| #27 Establish OpenAPI and Microcks contract baseline | Home Hub & Sync; QA | `area:api-contracts`, `area:sync`, `layer:api`, `layer:tests` |
| #28 Add R3 compliance and data-lifecycle readiness checklist | Compliance/Legal; Data Lifecycle | `area:distribution`, `area:security`, `layer:docs` |
| #29 Define visual and accessibility regression baseline | Design System/UX; QA | `area:design-system`, `area:quality`, `layer:tests`, `layer:frontend` |

### R4 - Capture and Review Core

GitHub milestone: `Ordna M2 Capture and Review Core`

Existing anchor issues:

- #11 Prepare Mobile Capture M2 concept handoff.
- #12 Prepare M2 Capture and Review Core concept handoff.

Recommended epics:

| Epic | Milestone | Primary pillars |
|---|---|---|
| #15 Epic: R4 Capture and Review Core | `Ordna M2 Capture and Review Core` | Cases/Records, Documents, Tasks, Search, External Actions |
| #16 Epic: R4 Capture and Draft Inbox M2 | `Ordna M2 Capture and Review Core` | Capture & Inbox, Home Hub & Sync |

Child issues:

| Proposed title | Milestone | Labels |
|---|---|---|
| #30 Implement M2 case and subcase management | `Ordna M2 Capture and Review Core` | `area:cases`, `layer:frontend`, `layer:domain`, `priority:high` |
| #31 Implement document and draft inbox review flow | `Ordna M2 Capture and Review Core` | `area:documents`, `layer:frontend`, `layer:domain`, `layer:data`, `priority:high` |
| #32 Implement record-aware document metadata model | `Ordna M2 Capture and Review Core` | DMS-Zielarchitektur: DocumentRecord, FileRecord, Versionen, Profilbezug und spätere Link-Objekte vorbereiten; `area:documents`, `area:data-storage`, `layer:domain`, `layer:data`, `priority:high` |
| #33 Implement mobile scan upload queue M2 | `Ordna M2 Capture and Review Core` | `area:capture`, `area:sync`, `layer:frontend`, `layer:sync`, `priority:high` |
| #34 Implement Home Hub capture upload contract client | `Ordna M2 Capture and Review Core` | `area:capture`, `area:api-contracts`, `layer:api`, `layer:sync`, `priority:high` |
| #35 Implement M2 tasks, due dates and quick access | `Ordna M2 Capture and Review Core` | `area:cases`, `area:documents`, `layer:frontend`, `layer:domain`, `priority:medium` |
| #36 Implement M2 structured search and filters | `Ordna M2 Capture and Review Core` | Search-Boundary plus SQLite/Drift/FTS5 per `DECISION_SEARCH_TECHNOLOGY.md`; `area:documents`, `area:cases`, `layer:frontend`, `layer:data`, `priority:high` |
| #37 Implement M2 external action links | `Ordna M2 Capture and Review Core` | `area:documents`, `area:cases`, `layer:frontend`, `layer:domain`, `priority:medium` |

### R5 - Assisted Review and Household Profiles

GitHub milestones:

- `Ordna M3 Assisted Review`
- `Ordna M4 Household and Sync`

Recommended epic:

- #17 Epic: R5 Household Profiles and Access.
- New Epic: R5 Assisted Review and Metadata Suggestions.

Child issues:

| Proposed title | Labels |
|---|---|
| Implement text extraction boundary for draft review | `area:ai-analysis`, `area:documents`, `layer:domain`, `layer:data`, `priority:high` |
| Add metadata suggestion review UI | `area:ai-analysis`, `area:documents`, `layer:frontend`, `priority:high` |
| Implement household and profile domain model | `area:profiles`, `layer:domain`, `layer:data`, `priority:high` |
| Make inbox, cases, records and tasks profile-aware | `area:profiles`, `area:documents`, `area:cases`, `layer:frontend`, `layer:domain`, `priority:high` |
| Define child profile and adult manager UX | `area:profiles`, `area:frontend`, `area:design-system`, `layer:frontend`, `priority:medium` |
| Plan partner access and sharing boundary | `area:profiles`, `area:security`, `layer:docs`, `layer:security`, `priority:medium` |

### R6 - Sync and Auth

GitHub milestone: `Ordna M4 Household and Sync`

Recommended epic:

- #18 Epic: R6 Home Hub, Auth and Sync.

Child issues:

| Proposed title | Labels |
|---|---|
| Implement paired device management | `area:auth`, `area:sync`, `layer:frontend`, `layer:security`, `priority:high` |
| Define Sync Journal and conflict domain model | `area:sync`, `area:data-storage`, `layer:domain`, `layer:data`, `priority:high` |
| Implement Home Hub sync OpenAPI baseline | Zielstack: ASP.NET Core + PostgreSQL + MinIO/S3, Vertrag zuerst ueber OpenAPI/Microcks; `area:api-contracts`, `area:sync`, `layer:api`, `layer:backend`, `priority:high` |
| Add conflict review UX concept and handoff | `area:sync`, `area:frontend`, `layer:docs`, `layer:frontend`, `priority:medium` |
| Prepare optional identity provider boundary | `area:auth`, `area:security`, `layer:domain`, `layer:security`, `priority:medium` |

### R7 - Extended Mobile

GitHub milestone: `Ordna M4 Household and Sync`

Recommended epic:

- #19 Epic: R7 Extended Mobile Capture and Review.

Child issues:

| Proposed title | Labels |
|---|---|
| Implement mobile batch scan concept and prototype | `area:capture`, `area:frontend`, `layer:frontend`, `priority:medium` |
| Add mobile metadata correction flow | `area:capture`, `area:documents`, `layer:frontend`, `priority:medium` |
| Add mobile case detail read-only view | `area:capture`, `area:cases`, `layer:frontend`, `priority:medium` |
| Define mobile share sheet import boundary | `area:capture`, `area:documents`, `layer:frontend`, `layer:platform`, `priority:low` |

### R8 - Structured Facts and Insights

GitHub milestone: `Ordna M5 Facts, Workflows and Insights`

Recommended epic:

- #20 Epic: R8 Structured Facts, Claims and Insights.

Child issues:

| Proposed title | Labels |
|---|---|
| Implement document facts domain model | `area:documents`, `area:data-storage`, `layer:domain`, `layer:data`, `priority:high` |
| Implement claims and reimbursement tracking | `area:cases`, `area:documents`, `layer:domain`, `layer:frontend`, `priority:high` |
| Implement financial entries for expenses and reimbursements | `area:documents`, `area:data-storage`, `layer:domain`, `layer:data`, `priority:medium` |
| Implement first local insights view | `area:frontend`, `area:documents`, `layer:frontend`, `layer:data`, `priority:medium` |
| Add workflow templates for doctor visit, accident and insurance | `area:cases`, `area:documents`, `layer:domain`, `layer:frontend`, `priority:medium` |

### R9 - Intelligence and Automation

GitHub milestones:

- `Ordna M3 Assisted Review` for OCR/metadata suggestion slices.
- `Ordna M6 Automation, Resilience and Distribution` for local LLMs, reprocessing and job operations.

Recommended epic:

- #21 Epic: R9 OCR, Fact Suggestions and Local Intelligence.

Child issues:

| Proposed title | Labels |
|---|---|
| Select OCR engine and processing boundary | `area:ai-analysis`, `area:security`, `layer:docs`, `layer:backend`, `priority:high` |
| Implement OCR job model and review queue | `area:ai-analysis`, `area:documents`, `layer:domain`, `layer:data`, `priority:high` |
| Add suggested metadata review UI | `area:ai-analysis`, `area:frontend`, `layer:frontend`, `priority:medium` |
| Plan local LLM inference service boundary | `area:ai-analysis`, `area:api-contracts`, `layer:api`, `layer:backend`, `priority:medium` |

### R10 - Compliance & Distribution Readiness

GitHub milestone: `Ordna M6 Automation, Resilience and Distribution`

Recommended epic:

- #22 Epic: R10 Compliance, Legal and Distribution Readiness.

Child issues:

| Proposed title | Labels |
|---|---|
| Define DSGVO/GDPR product compliance checklist | `area:distribution`, `area:security`, `layer:docs`, `priority:high` |
| Prepare Apple, Google and Microsoft Store policy matrix | `area:distribution`, `layer:docs`, `priority:medium` |
| Add open-source license compliance review | `area:distribution`, `layer:platform`, `layer:docs`, `priority:medium` |
| Define review/demo mode without private data | `area:distribution`, `area:security`, `layer:frontend`, `layer:docs`, `priority:medium` |

### R11 - Data Resilience & Operations

GitHub milestone: `Ordna M6 Automation, Resilience and Distribution`

Recommended epic:

- #23 Epic: R11 Backup, Restore, Retention and Storage Health.

Child issues:

| Proposed title | Labels |
|---|---|
| Define backup and restore strategy | `area:data-storage`, `area:security`, `layer:docs`, `priority:high` |
| Implement storage integrity checks | `area:data-storage`, `area:documents`, `layer:data`, `layer:frontend`, `priority:medium` |
| Define soft delete, tombstones and retention model | `area:data-storage`, `area:sync`, `layer:domain`, `layer:data`, `priority:high` |
| Add restore drill verification checklist | `area:quality`, `area:data-storage`, `layer:tests`, `priority:medium` |

### R12 - Support & Governance

GitHub milestone: `Ordna M6 Automation, Resilience and Distribution`

Recommended epic:

- #24 Epic: R12 Support, Diagnostics and Architecture Governance.

Child issues:

| Proposed title | Labels |
|---|---|
| Define redacted diagnostics package | `area:platform`, `area:security`, `layer:platform`, `layer:security`, `priority:medium` |
| Add support-mode UX concept | `area:frontend`, `area:platform`, `layer:docs`, `layer:frontend`, `priority:low` |
| Establish architecture decision review cadence | `area:docs`, `area:foundation`, `layer:docs`, `priority:medium` |
| Align GitHub milestones, labels and project board fields | `area:docs`, `area:platform`, `layer:docs`, `layer:platform`, `priority:medium` |

## GitHub Metadata

The following labels are required by the DocMan GitHub Issue skill and were created/verified on 2026-05-06:

- `area:quality`
- `area:api-contracts`
- `area:data-storage`
- `layer:api`

## Creation Status

Current status:

1. Missing labels were created or verified.
2. Phase epics R4-R12 were created.
3. R3/R4 child issues were created.
4. R3/R4 epics were linked to created child issues through GitHub comments.
5. R5-R12 child issue creation remains deferred until the current phase approaches, unless a blocker needs early tracking.

This keeps GitHub useful instead of flooding it with stale speculative issues.
