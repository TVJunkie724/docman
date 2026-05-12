---
title: "DocMan - Pillar Roadmap Index"
description: "Detaillierte Säulen-Roadmap mit MVP-, Post-MVP- und Enterprise-Slices pro Produkt-, Plattform- und Governance-Säule"
tags: [roadmap, pillars, mvp, post-mvp, enterprise, planning]
lastUpdated: "2026-05-12"
version: "0.1"
status: "proposed"
---

# DocMan - Pillar Roadmap Index

## Zweck

Dieses Dokument beschreibt die Umsetzung pro Saeule.

Die Hauptroadmap `docs/ROADMAP_REBUILD.md` enthaelt die Reihenfolge und das
Decision-Register. Der Phase Index `docs/roadmap/PHASE_INDEX.md` beschreibt
Phasen und Subphasen. Dieses Dokument zeigt je Saeule, welche Slices in MVP,
Post-MVP und Enterprise/Operations gehoeren.

## Pillar-Slice-Übersicht

| Saeule | MVP/Baseline | Post-MVP | Enterprise/Operations |
|---|---|---|---|
| Capture & Inbox | Desktop Import, Mobile Scan, Draft-Inbox, API-proxied Upload | Batch Scan, mobile Review, weitere Importpfade | resumable Upload, cleanup, integrity, import governance |
| Cases/Documents/Records | Vorgänge, Subvorgänge, Dokumente, Record-aware Metadaten | Mehrfachlinks, Versionen, Claims/Facts | Retention, Sharing, Recovery |
| Tasks/Reminders/Quick Access | Aufgaben, Fälligkeiten, Schnellzugriff | mobile Reminder, Facts/Claims Reminder | Kalender, geteilte Aufgaben, Audit |
| Search/Facts/Insights | lokale strukturierte Suche | Facts, Claims, Financial Entries, Insights | semantische Suche, Search Service, Reindex/Repair |
| Export/Sharing/External Actions | manuelle Links | Mail, Druck, Portal-/Claim-Aktionen | sichere Freigaben, Redaction, Zugriffshistorie |
| Household Profiles/Access | aktives Profil, Profilzuordnung | Kinderprofile, Partnerzugriff | Rechte, Sharing, Multi-Household optional |
| Templates/Workflows | einfache Status-/Task-Hilfen | Claims/Insurance/Doctor Workflows | AI-Vorschläge, externe Aktionsketten |
| Home Hub & Sync | Capture Gateway, Pairing vorbereitet | Sync Journal, Konflikte, Upload Sessions | Backup, Ops, Cloud-artige Varianten optional |
| Intelligence/Automation | vorbereitet, nicht MVP | OCR, Klassifikation, Fact-Vorschläge | lokale LLMs, Reprocessing, Job Ops |
| Admin/Settings/Storage Health | lokale Einstellungen, Home-Hub Status | Device/Sync/Storage Status | Admin-Konsole, Backup/Restore Health |
| QA | Fakes, Fixtures, Gates | Regression pro Saeule | Release, Restore, AI Evaluation, Governance Audits |
| Observability/Runtime | Failure/Notification/Audit Basis | Home-Hub Metrics, redigierte Diagnose | Loki/Grafana/Prometheus/Tempo optional |
| Security/Privacy | Secure Storage, keine sensiblen Logs | Sync Privacy, Kinder-/Profildaten, AI Boundary | E2EE/Zero-Knowledge-faehige Modelle, Sharing |
| Compliance/Legal | Readiness-Minimum | Store/DSGVO/AI/Sync Checks | Public distribution, sharing, hosted options |
| Release/Distribution | Bootstrap/Verify/CI | mobile/release pipelines | signing, notarization, rollback, upgrade |
| Data Lifecycle/Resilience | lokale Persistenz, keine Datenverluste | sync tombstones, migration, upload cleanup | backup, restore, retention, integrity |
| DX/Architecture Governance | Struktur, Skills, Decisions, Issues | Handoffs, architecture audits | deprecation, governance, platform rules |
| Design System/UX | MVP UI, A11y/empty/error states | profiles/sync/mobile/insights UX | design audits, distribution UX |
| Support/Diagnostics | redigierte lokale Fehlerzustände | Home-Hub/AI/Restore Diagnose | Support mode, diagnostic bundles |
| Compatibility/Platform | macOS + mobile capture priorisiert | iOS/Android parity, scanner evidence | Windows/Linux optional, support matrix |
| Integration Governance | manuelle Links | Mail, Kalender, Portale, Importpfade | credential boundaries, plugin/API governance |

## MVP-relevante Saeulen

Diese Saeulen brauchen vor R4-Implementation eigene Handoffs:

| Handoff | Primaere Saeule | Muss klaeren |
|---|---|---|
| Capture & Inbox R4 Handoff | Capture & Inbox | Draft-Inbox, Desktop Import, Mobile Scan, Upload Queue, D32 Limits |
| Cases/Documents/Records R4 Handoff | Cases/Documents/Records | Case/Subcase, Document, FileRecord, Record-aware Metadaten |
| Tasks/Reminders/Quick Access R4 Handoff | Tasks/Reminders | Aufgaben, Fälligkeiten, Schnellzugriff |
| Search MVP Handoff | Search/Facts | SQLite/Drift/FTS5 Queries, Filter, Indizes |
| Home Hub Capture Contract Handoff | Home Hub/Sync | OpenAPI, Microcks, API-proxied Upload |
| Security/Privacy MVP Gate | Security/Privacy | Secure Storage, Redaction, Tokens, sensible Daten |
| QA/Microcks/Fake Repo Gate | QA | Fakes, Fixtures, Contract Tests, analyzer gates |

## Post-MVP Gruppierung

| Zeitraum | Saeulenfokus |
|---|---|
| R5 | Household Profiles, Security/Privacy, UX |
| R6 | Home Hub & Sync, Security, Data Lifecycle, Observability |
| R7 | Capture & Inbox Mobile, Compatibility, Support |
| R8 | Search/Facts/Insights, Templates/Workflows, QA |
| R9 | Intelligence/Automation, Security, Observability |
| R10 | Compliance, Release, Compatibility |
| R11 | Data Lifecycle, Admin/Settings, Observability |
| R12 | Support, DX/Governance, QA |
| R13 | Integration Governance, Export/Sharing, Workflows |
| R14 | Secure Sharing, Household Access, Security |
| R15 | Platform/Productization, Admin/Ops, Release |

## Regeln fuer Säulen-Handoffs

Ein Saeulen-Handoff darf erst als bereit gelten, wenn es beantwortet:

- Welche Subphase nutzt diese Saeule?
- Was ist der MVP/Baseline-Slice?
- Was ist explizit Post-MVP?
- Welche Decisions gelten?
- Welche Domain-/API-/Storage-Grenzen gelten?
- Welche Tests/Fakes/Contracts braucht die Saeule?
- Welche Security-/Privacy-/Observability-Gates gelten?
- Welche GitHub Issues/Epics bilden die Arbeit ab?
