---
title: "Mappm - Pillar Roadmap Index"
description: "Commercial-Core-Slices pro Produkt-/Plattform-Säule und Assurance Track"
tags: [roadmap, pillars, milestones, enterprise, planning]
lastUpdated: "2026-07-23"
version: "1.3"
status: "accepted-rebaseline"
owner: "product-concept"
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
| Capture & Inbox | Mobile Scan/Foto/Galerie/Datei, Desktop Picker/Drag-and-drop, Cloud Upload Queue, dauerhafte Processing-/Proposal-Einheiten, Mixed Batch, verpflichtender Titel, kompakter Review; keine Desktop-Webcam-Scans | Upload-Integrität, Cleanup, Support-/Quality-Evidence | Cross-Device-/Continuity-/Local-to-Local-Capture erst nach OQ-013; weitere Importpfade und qualitaetsgegatete selektive Auto-Finalisierung |
| Cases/Documents/Records | eigenständige Vorgänge, CaseLinks, Custom Cases, Unterlagen, Dokumente und Bottom-up-Komposition | Retention, Export/Restore, Beziehungsintegrität; bei M1-Aktivierung seltener case-lokaler medizinischer Desktop-Medienpaket-Import | Workflow-Zweig-Promotion, weitere Rollen und gepruefter Medienviewer |
| Contracts/Subscriptions | Vertrags-/Abo-/Policy Records, optionale Abschluss-Cases, ruhige Kontexte, wiederkehrende Rechnungszuordnung und relevante Fristen vorbereiten | Reminder-/Notification-, Country-/Provider-/Tarif- und OPS-09-Gates | schlanker Rechnungsverlauf, weitere Kategorien |
| Tasks/Reminders/Quick Access | Aufgaben, typisierte Faelligkeiten, mehrere regelbasierte Fristen, fokussierte Agenda, Schnellzugriff | Rule-Provenienz, Review-/Release-/Notification-Gates | optionale consent-pflichtige Kalenderanbindung, geteilte Aufgaben |
| Search/Facts/Insights | strukturierte Local-/Cloud-Vault-Suche, typisierte Zeit-Facts und kontextuelle bestätigte Fakten | Reindex/Repair, Exportkonsistenz | Submission Events, Versicherungsabwicklungen, deduplizierte Roll-ups, semantische Suche |
| Export/Sharing/External Actions | Export und manuelle Links | Portabilität, Cloud-to-Local, sichere Löschung | Sharing, Mail, Portale |
| Managed Profiles/Access | betroffene Person/Organisation und Profilzuordnung; Account ist kein Managed Subject | Account-/Access-/DSAR-/Privat-Business-Konsistenz | Partnerzugriff, Organisationsmanager, Rechte |
| Templates/Workflows | Step/Branch/Event/CaseLink- und Custom-Case-Grenzen vorbereiten; keine Claim-Entitaet und keine Laender-Claims | Workflow-Pack-Scope, OPS-09-Quellencheck, mindestens halbjaehrlicher Fachreview, Developer-Reminder, immutable Versionen und Withdrawal | versionierter Katalog, Golden Country/Tax Packs, erwartete Dokumente, gefuehrte Vorgaenge |
| Account/Cloud/Identity/Sync | Account/Device/Offline Entitlement für alle Normalmodi; Cloud Provider/Contracts/Cache/Pending | Detached Recovery, Grace, Migration, Backup/Restore, Ops | Sharing, Organisationsmodelle |
| Intelligence/Automation | konservative Small-/Medium-Model-Baseline plus OCR, technische Scanqualitaet, grobe Typ/Domain-Kandidaten, Titel, Index und Case-/Record-Ranking; User-/Dateigrenzen bleiben autoritativ | C2/C3 AI-/Legal-/Ops-Gates; Free/Paid quota/manual fallback; keine semantische Invalidierung | Advanced Assist nur je eng belegter Klasse, semantische Antworten und breitere reversible Automatisierung |
| Client Platform/Settings/Health | Vault-, Account-, Cache- und Storage-Zustand | Export, Migration, Kündigung, Diagnose | erweiterte Administration |
| QA | Local/Cloud Fakes, Fixtures, Contracts, Gates | Migration/Restore/Release Drills | AI Evaluation, Governance Audits |
| Observability/Runtime | Failure/Notification/Audit Basis | Cloud Metrics, redigierte Diagnose, SLO/Incident | erweiterte Tracing-/Analytics-Slices |
| Security/Privacy | Secure Storage, Trust Boundaries, keine sensiblen Logs | Key-/Recovery-, Sync-, Backup-, Deletion-Gates | Sharing/E2EE-Erweiterungen |
| Compliance/Legal | DSGVO-/Vertrags-/Datenklassen-Baseline | Store, Subscription, Cloud, CRA und Release Checks | Enterprise-/Sharing-Regeln |
| Release/Distribution | Bootstrap, Verify, CI | Signing, Notarization, Rollback, Upgrade, Store | weitere Plattformen/Kanäle |
| Data Lifecycle/Resilience | Authority, Cache, Pending Queue, keine Datenverluste | Backup, Restore, Migration, Retention, Integrity | Legal Hold/Enterprise |
| DX/Architecture Governance | Struktur, Skills, Decisions, Issues | Handoffs, architecture audits | deprecation, governance, platform rules |
| Design System/UX | C2/C3 Capture-/Review-/Case-/Record-UI, A11y/Empty/Error | Lifecycle-, Profil-, Sync- und Release-UX | Design Audits und spaetere Distribution UX |
| Support/Diagnostics | redigierte Local-/Cloud-Fehlerzustände | Cloud/AI/Restore-/Migration-Diagnose | Support mode, diagnostic bundles |
| Compatibility/Platform | macOS + mobile capture priorisiert | iOS/Android parity, scanner evidence | Windows/Linux optional, support matrix |
| Integration Governance | manuelle Links | Mail, Kalender, Portale, Importpfade | credential boundaries, plugin/API governance |

## C2/C3-relevante Saeulen

Diese Saeulen brauchen vor dem jeweiligen C2/C3-Implementation-Contract eigene
Handoffs. R4 bleibt dabei nur die stabile Traceability-Gruppe:

| Handoff | Primaere Saeule | Muss klaeren |
|---|---|---|
| Capture & Inbox C2 Handoff | Capture & Inbox | globaler Eingang, Desktop/Mobile/Mixed Batch, Upload Queue, Processing/Proposals/Review, Titelvorschlag, Limits/Retry/Cleanup; medizinisches Medienarchiv ausdruecklich ausgeschlossen |
| Cases/Documents/Records C3 Handoff | Cases/Documents/Records | ein generischer `Case`, typisierte `CaseLink`-Beziehungen, Document, FileRecord, Unterlagen/Records und kontextuelle Metadaten |
| Tasks/Reminders/Quick Access C3 Handoff | Tasks/Reminders | Aufgaben, typisierte Fälligkeiten, Agenda-Eignung, Reminder-Trennung, Schnellzugriff |
| Search Core Handoff | Search/Facts | SQLite/Drift/FTS5 Queries, Zeitart-/Zeitraumfilter, Indizes |
| Cloud Capture Contract Handoff | Cloud/Identity/Sync | OpenAPI, Microcks, API-proxied Upload, Account/Device/Entitlement |
| Security/Privacy C2/C3 Gate | Security/Privacy | Secure Storage, Redaction, Tokens, sensible Daten |
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
| R8 | Search/Facts/Insights, Contracts/Subscriptions, Templates/Workflows einschließlich Katalogfundament, optional geprüftem Länder-/Tax-Pack, QA/Compliance |
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
