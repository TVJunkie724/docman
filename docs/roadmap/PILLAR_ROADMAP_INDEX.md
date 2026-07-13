---
title: "Mappm - Pillar Roadmap Index"
description: "Commercial-Core-Slices pro Produkt-/Plattform-Säule und Assurance Track"
tags: [roadmap, pillars, milestones, enterprise, planning]
lastUpdated: "2026-07-12"
version: "1.0"
status: "accepted-rebaseline"
---

# Mappm - Pillar Roadmap Index

## Zweck

Dieses Dokument beschreibt die Umsetzung pro Saeule.

Die Hauptroadmap `docs/ROADMAP_REBUILD.md` enthaelt die Reihenfolge und das
Decision-Register. Der Phase Index `docs/roadmap/PHASE_INDEX.md` beschreibt
Phasen und Subphasen. Dieses Dokument zeigt je Saeule, welche Slices in die
fruehen Milestones, spaetere Milestones und Enterprise/Operations gehoeren.

## Commercial-Core-Slice-Übersicht

| Saeule/Track | C1-C3 Core | C4-C5 Lifecycle/Release | Spätere Erweiterung |
|---|---|---|---|
| Capture & Inbox | Desktop Import, Mobile Scan, Draft-Inbox, Cloud Upload Queue | Upload-Integrität, Cleanup, Support-Evidence | Batch Scan, weitere Importpfade |
| Cases/Documents/Records | Vorgänge, Dokumente, Version-/Record-fähige Metadaten | Retention, Export/Restore | Mehrfachlinks, Claims/Facts |
| Tasks/Reminders/Quick Access | Aufgaben, Fälligkeiten, Schnellzugriff | Release-/Notification-Gates | Kalender, geteilte Aufgaben |
| Search/Facts/Insights | strukturierte Local-/Cloud-Vault-Suche | Reindex/Repair, Exportkonsistenz | Facts, Claims, semantische Suche |
| Export/Sharing/External Actions | Export und manuelle Links | Portabilität, Cloud-to-Local, sichere Löschung | Sharing, Mail, Portale |
| Household Profiles/Access | betroffene Person und Profilzuordnung; Account ist keine betroffene Person | Account-/Access-/DSAR-Konsistenz | Partnerzugriff, Rechte |
| Templates/Workflows | Case/Subcase/Reference- und Mehrfachbeziehungsgrenzen vorbereiten; keine Länder-Claims | Workflow-Pack-Scope, Quellen-/Review-/Update-Governance nur falls aktiviert | versionierter Katalog, Golden Country Packs, erwartete Dokumente, geführte Vorgänge |
| Account/Cloud/Identity/Sync | Account/Device/Offline Entitlement für alle Normalmodi; Cloud Provider/Contracts/Cache/Pending | Detached Recovery, Grace, Migration, Backup/Restore, Ops | Sharing, Organisationsmodelle |
| Intelligence/Automation | Core-Assist-Provider-/Trust-/Review-/Evidence-Modell | C2/C3 AI-/Legal-/Ops-Gates; Free/Paid quota/manual fallback | Advanced Assist, semantische Antworten, Reprocessing, Automatisierung |
| Client Platform/Settings/Health | Vault-, Account-, Cache- und Storage-Zustand | Export, Migration, Kündigung, Diagnose | erweiterte Administration |
| QA | Local/Cloud Fakes, Fixtures, Contracts, Gates | Migration/Restore/Release Drills | AI Evaluation, Governance Audits |
| Observability/Runtime | Failure/Notification/Audit Basis | Cloud Metrics, redigierte Diagnose, SLO/Incident | erweiterte Tracing-/Analytics-Slices |
| Security/Privacy | Secure Storage, Trust Boundaries, keine sensiblen Logs | Key-/Recovery-, Sync-, Backup-, Deletion-Gates | Sharing/E2EE-Erweiterungen |
| Compliance/Legal | DSGVO-/Vertrags-/Datenklassen-Baseline | Store, Subscription, Cloud, CRA und Release Checks | Enterprise-/Sharing-Regeln |
| Release/Distribution | Bootstrap, Verify, CI | Signing, Notarization, Rollback, Upgrade, Store | weitere Plattformen/Kanäle |
| Data Lifecycle/Resilience | Authority, Cache, Pending Queue, keine Datenverluste | Backup, Restore, Migration, Retention, Integrity | Legal Hold/Enterprise |
| DX/Architecture Governance | Struktur, Skills, Decisions, Issues | Handoffs, architecture audits | deprecation, governance, platform rules |
| Design System/UX | M2 UI, A11y/empty/error states | profiles/sync/mobile/insights UX | design audits, distribution UX |
| Support/Diagnostics | redigierte Local-/Cloud-Fehlerzustände | Cloud/AI/Restore-/Migration-Diagnose | Support mode, diagnostic bundles |
| Compatibility/Platform | macOS + mobile capture priorisiert | iOS/Android parity, scanner evidence | Windows/Linux optional, support matrix |
| Integration Governance | manuelle Links | Mail, Kalender, Portale, Importpfade | credential boundaries, plugin/API governance |

## M2-relevante Saeulen

Diese Saeulen brauchen vor R4-Implementation eigene Handoffs:

| Handoff | Primaere Saeule | Muss klaeren |
|---|---|---|
| Capture & Inbox R4 Handoff | Capture & Inbox | Draft-Inbox, Desktop Import, Mobile Scan, Upload Queue, R4.5 Limits/Retry/Cleanup |
| Cases/Documents/Records R4 Handoff | Cases/Documents/Records | Case/Subcase, Document, FileRecord, Record-aware Metadaten |
| Tasks/Reminders/Quick Access R4 Handoff | Tasks/Reminders | Aufgaben, Fälligkeiten, Schnellzugriff |
| Search Core Handoff | Search/Facts | SQLite/Drift/FTS5 Queries, Filter, Indizes |
| Cloud Capture Contract Handoff | Cloud/Identity/Sync | OpenAPI, Microcks, API-proxied Upload, Account/Device/Entitlement |
| Security/Privacy M2 Gate | Security/Privacy | Secure Storage, Redaction, Tokens, sensible Daten |
| QA/Microcks/Fake Repo Gate | QA | Fakes, Fixtures, Contract Tests, analyzer gates |

## R4.5 Upload-Limits/Retry Säulenschnitt

R4.5 ist eine kleine Querschnittsphase und betrifft mehrere Saeulen:

| R4.5 Subphase | Primaere Saeule | Sekundaere Saeulen |
|---|---|---|
| R4.5.1 Upload Policy and Validation | Capture & Inbox | Security/Privacy, QA |
| R4.5.2 Queue State Machine | Capture & Inbox | Data Lifecycle, Design System/UX |
| R4.5.3 Retry and Idempotency | Cloud/Identity/Sync | Capture & Inbox, Security/Privacy |
| R4.5.4 Cleanup and Retention | Data Lifecycle/Resilience | Admin/Settings, Support/Diagnostics |
| R4.5.5 Contract Requirements | Cloud/Identity/Sync | QA, DX/Governance |
| R4.5.6 UX and Diagnostics Requirements | Design System/UX | Observability, Support/Diagnostics |
| R4.5.7 Test Fixtures and Gates | QA | Capture & Inbox, Cloud/Identity/Sync |

## Milestone-Gruppierung

| Zeitraum | Saeulenfokus |
|---|---|
| R5 | Assisted Review, Household Profiles, Security/Privacy, UX |
| R6 | Cloud/Identity/Sync, Security, Data Lifecycle, Observability, Commercial |
| R7 | Capture & Inbox Mobile, Compatibility, Support |
| R8 | Search/Facts/Insights, Templates/Workflows einschließlich Katalogfundament und geprüftem Länderpaket, QA/Compliance |
| R9 | Intelligence/Automation einschließlich kataloggebundenem Workflow Matching, Security, Observability |
| R10 | Compliance, Release, Compatibility |
| R11 | Data Lifecycle, Admin/Settings, Observability |
| R12 | Support, DX/Governance, QA |
| R13 | Integration Governance, Export/Sharing, Workflows |
| R14 | Secure Sharing, Household Access, Security |
| R15 | Platform/Productization, Admin/Ops, Release |

## Regeln fuer Säulen-Handoffs

Ein Saeulen-Handoff darf erst als bereit gelten, wenn es beantwortet:

- Welche Subphase nutzt diese Saeule?
- Was ist der naechste Milestone-Slice?
- Was ist explizit ein spaeterer Milestone?
- Welche Decisions gelten?
- Welche Domain-/API-/Storage-Grenzen gelten?
- Welche Tests/Fakes/Contracts braucht die Saeule?
- Welche Security-/Privacy-/Observability-Gates gelten?
- Welche GitHub Issues/Epics bilden die Arbeit ab?
