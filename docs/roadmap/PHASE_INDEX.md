---
title: "DocMan - Phase Index"
description: "Detaillierter Phasen- und Subphasen-Index fuer planbare Implementation-Slices"
tags: [roadmap, phases, subphases, implementation-plan, planning]
lastUpdated: "2026-05-12"
version: "0.1"
status: "proposed"
---

# DocMan - Phase Index

## Zweck

Dieses Dokument beschreibt die Roadmap-Phasen als planbare Implementation-Slices.

Die Hauptroadmap `docs/ROADMAP_REBUILD.md` bleibt der Überblick. Dieses Dokument
enthaelt die konkrete Phasen- und Subphasenstruktur.

## Planungsregel

Eine Phase ist erst implementierbar, wenn sie in Subphasen zerlegt ist, die je
ein klares Ziel, Scope, Out of Scope, Deliverables, Tests und Akzeptanzkriterien
haben.

Wenn eine Subphase mehrere Saeulen ohne klare Boundary vermischt, wird sie
weiter geteilt.

## Implementation-Plan Template

Jede konkrete Subphase soll spaeter nach diesem Schema geplant werden:

```text
Phase:
Subphase:
Status:
Primary pillars:
Goal:
Scope:
Out of scope:
Inputs / decisions:
Dependencies:
Deliverables:
Architecture boundaries:
Data / API / storage boundaries:
Security / privacy notes:
Tests / verification:
Acceptance criteria:
Done means:
Explicit non-goals:
```

## R0 - Product and Architecture Decisions

Ziel: Grundsatzentscheidungen treffen, bevor Code weiterwächst.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R0.1 Naming and Language | Produktname und Kernbegriffe klaeren | Product Name, Product Language |
| R0.2 Product Scope | MVP und langfristiges DMS-Ziel trennen | MVP Scope, DMS Target Architecture |
| R0.3 Architecture Direction | Local-first, Backend-Rolle, State, Storage entscheiden | Data Flow, State Management, Backend Role, File Storage |
| R0.4 Security and Privacy Baseline | sensible Daten, Sync-Grenzen und Trust Boundaries definieren | Privacy Sync Scope, Security Privacy Model |
| R0.5 Intelligence and Workflow Boundaries | KI und Workflows nicht in den MVP ziehen | Intelligence Scope, Workflow Rules |

## R1 - Documentation Source of Truth

Ziel: Dokumentation als aktive Steuerung herstellen.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R1.1 Legacy Documentation Cleanup | alte Roadmaps/Refactoring-Pläne entfernen oder entwerten | bereinigte Docs |
| R1.2 Foundation Concept Rewrite | F-Konzepte DocMan-spezifisch neu schreiben | F1-F18 Konzepte |
| R1.3 Pillar Model | Produkt-, Plattform- und Governance-Saeulen definieren | `docs/pillars/` |
| R1.4 Roadmap Structure | Hauptroadmap, Phase Index und Pillar Roadmap trennen | Roadmap-Dokumenthierarchie |
| R1.5 GitHub Planning Baseline | Issues/Milestones/Epics als Umsetzungsstruktur vorbereiten | Execution Plan |

## R2 - Technical Foundation

Ziel: Der aktuelle Spike wird in eine saubere App-Basis ueberfuehrt.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R2.1 Target Project Structure | Clean Architecture Zielstruktur neben Legacy etablieren | Zielpfade, Imports, Module |
| R2.2 Riverpod Foundation | Riverpod als State/DI-Fundament aufbauen | ProviderScope, Provider-Struktur |
| R2.3 Domain Ports and Failures | Domain-Ports, Result/Failure, Notifications definieren | Domain Contracts, Failure Model |
| R2.4 Local Persistence Boundary | SQLite/Drift und File Store Grenzen vorbereiten | Local DB/File Store Boundary |
| R2.5 Secure Storage Boundary | Secrets/Pairing/Tokens sauber trennen | Secure Storage Port |
| R2.6 Foundation Verification | Zielpfad analysierbar und testbar machen | Smoke Tests, Analyzer Zielpfad |

## R3 - Quality and Production Readiness Foundation

Ziel: Das Projekt wird reproduzierbar, testbar und wartbar.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R3.1 Bootstrap and Codegen | frische Checkouts reproduzierbar machen | setup/codegen/verify scripts |
| R3.2 Fake Repositories | App-/Domain-Tests ohne Netzwerk ermoeglichen | Fake Repos |
| R3.3 Test Fixtures | synthetische Daten fuer alle MVP-Domains | fixtures |
| R3.4 Contract Baseline | OpenAPI/Microcks fuer Home-Hub/Capture vorbereiten | contracts/openapi, Microcks config |
| R3.5 Target Path Gates | Legacy vom Zielpfad trennen | Analyzer, import checks |
| R3.6 Readiness Gates | Security, Compliance, Data Lifecycle, Observability minimum pruefen | MVP Quality Gates |

## R4 - Desktop Core + Mobile Capture MVP

Ziel: Erster nutzbarer Produkt-Slice.

R4 ist zu gross fuer einen Implementation-Step und wird zwingend in Subphasen
gebaut.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R4.1 Capture & Inbox Foundation | gemeinsame Draft-/Inbox-/Upload-Begriffe festlegen | Capture ports, Draft model |
| R4.2 Desktop Import + Draft Inbox | lokale Dateien in Draft-Inbox aufnehmen | Desktop import, Draft review |
| R4.3 Mobile Scanner Spike | native Scanner-Qualitaet beweisen | Android/iOS Scanner evidence |
| R4.4 Mobile Scan Client | Mobile Scan und lokale Queue MVP bauen | scan session, local queue |
| R4.5 Upload Limits and Retry | D32 finalisieren und umsetzen | limits, retry, cleanup rules |
| R4.6 Home Hub Capture Contract | Upload-Contract gegen Microcks modellieren | OpenAPI scenarios |
| R4.7 API-proxied Upload Slice | erster echter Capture Upload zum Home Hub | CaptureUploadPort strategy |
| R4.8 Cases/Subcases MVP | Vorgänge und Subvorgänge nutzbar machen | Case UI/domain |
| R4.9 Document/Record Metadata MVP | Dokumente, FileRecords, Record-aware Metadaten | document metadata |
| R4.10 Tasks/Quick Access MVP | Aufgaben, Fälligkeiten, Schnellzugriff | task overview, quick access |
| R4.11 Search MVP | lokale strukturierte Suche | SQLite/Drift/FTS5 adapter |
| R4.12 External Actions MVP | manuelle externe Links | task/case action links |
| R4.13 Security/Privacy MVP Gate | sensible Logs/Tokens/Storage pruefen | privacy gate |
| R4.14 QA/Regression MVP Gate | MVP-Regression gruen bekommen | tests, smoke checks |
| R4.15 UX/A11y MVP Gate | Bedienbarkeit, leere/fehlerhafte Zustände, A11y | UX review |

## R5 - Household Profiles and Access

Ziel: Ordna wird von einer Einzelperson-App zu einer Haushalts-App.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R5.1 Profile Data Classification | sensible Profildaten klassifizieren | profile data policy |
| R5.2 Profile Domain Model | Profile/Kinder/Erwachsene modellieren | profile model |
| R5.3 Profile-aware MVP Objects | Cases, Docs, Tasks, Drafts profilbewusst machen | profile links |
| R5.4 Partner/Adult Management | gemeinsame Verwaltung vorbereiten | access model |
| R5.5 Profile UX Gate | Profilwechsel und Korrekturen klar machen | UX validation |

## R6 - Home Hub, Sync and Auth

Ziel: Daten koennen zwischen Geraeten repliziert und Sessions sicher verwaltet
werden.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R6.1 Home Hub Skeleton | ASP.NET-Core Home-Hub Basis | API skeleton, health |
| R6.2 Pairing and Device Tokens | Pairing/Device Management umsetzen | pairing endpoints |
| R6.3 Upload Sessions | serverseitige Upload Sessions und Validation | upload sessions |
| R6.4 Sync Journal | Aenderungsjournal und Tombstones | sync journal |
| R6.5 Conflict Detection | Konflikte erkennen und darstellen | conflict model |
| R6.6 Sync Contract Tests | OpenAPI/Microcks + Server verification | sync contracts |
| R6.7 Privacy Sync Gate | remote Datenklassen und Encryption-Faehigkeit pruefen | privacy gate |

## R7 - Extended Mobile

Ziel: Mobile wird vom Capture-Kanal zur Begleit-App.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R7.1 Batch Scan | mehrere Dokumente/Seiten besser erfassen | batch scan |
| R7.2 Mobile Draft Review | Drafts mobil korrigieren | review-light |
| R7.3 Mobile Case Preview | Vorgänge/Dokumente mobil ansehen | mobile preview |
| R7.4 Mobile Search | einfache mobile Suche/Filter | mobile search |
| R7.5 Offline Mobile Sync | robustere Offline-/Sync-Zustaende | mobile sync states |
| R7.6 Platform Support Gate | iOS/Android Unterschiede pruefen | support matrix |

## R8 - Structured Facts, Claims and Insights

Ziel: Dokumente werden strukturiert auswertbar.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R8.1 Fact Model | erste Facts manuell erfassen | facts model |
| R8.2 Claims Model | Erstattungen/Reklamationen/Garantien modellieren | claims |
| R8.3 Financial Entries | Ausgaben/Erstattungen/Prämien erfassen | financial entries |
| R8.4 Validity and Deadlines | Gültigkeiten/Ablaufdaten/Fristen | validity facts |
| R8.5 First Insights | erste Auswertungen | insights views |
| R8.6 Facts QA Gate | Korrekturen, Tests, Datenschutz | facts gate |

## R9 - Intelligence, OCR and Automation

Ziel: Ordna unterstützt beim Erkennen, Sortieren und Vorschlagen.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R9.1 OCR Pipeline | Text extrahieren | OCR worker/contracts |
| R9.2 Classification Suggestions | Dokumenttypen und Metadaten vorschlagen | classifier |
| R9.3 Fact Suggestions | Facts/Claims vorschlagen | suggestion model |
| R9.4 Form Prefill | Formularfelder vorbereiten | prefill proposals |
| R9.5 Review UX | Vorschläge pruefen/annehmen/verwerfen | review UI |
| R9.6 AI Trust Gate | Privacy, Audit, Redaction, lokale Modelle pruefen | AI gate |

## R10 - Compliance, Legal and Distribution Readiness

Ziel: Distribution und rechtliche Mindestfaehigkeit vorbereiten.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R10.1 GDPR/DSGVO Review | Datenschutzanforderungen pruefen | compliance checklist |
| R10.2 Store Policy Review | Apple/Google/Microsoft Anforderungen | store checklist |
| R10.3 License Review | Third-party Notices | license docs |
| R10.4 Release Signing | Signing/Notarization/Packaging | release pipeline |
| R10.5 Review Access | Demo/Testdaten fuer Review | review access |

## R11 - Data Resilience and Operations

Ziel: echte Haushaltsdaten bleiben langfristig sicher und wiederherstellbar.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R11.1 Backup | lokale und Home-Hub Backups | backup |
| R11.2 Restore Test | Restore wirklich pruefen | restore runbook |
| R11.3 Retention and Delete | Retention, Tombstones, Loeschung | lifecycle rules |
| R11.4 Storage Integrity | Hash/Checksum/Repair | integrity checks |
| R11.5 Upload Cleanup | abgebrochene Uploads bereinigen | cleanup jobs |
| R11.6 Ops Health | Admin/Storage/Runtime Health | health dashboard |

## R12 - Support, Diagnostics and Architecture Governance

Ziel: Fehleranalyse ohne Datenleck und langfristige Architekturdisziplin.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R12.1 Redacted Diagnostics | Diagnosepakete ohne sensible Daten | diagnostic bundles |
| R12.2 Support Mode | lokaler Supportmodus | support mode |
| R12.3 Architecture Audits | Architecture/DoD Audits | audit process |
| R12.4 Issue Governance | Issues, Milestones, Epics reifen | governance |
| R12.5 Deprecation Rules | alte Pfade sauber entfernen | deprecation policy |

## R13 - Integrations and External Workflow Expansion

Ziel: externe Apps, Websites und Importpfade kontrolliert ausbauen.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R13.1 External Link Catalog | Links strukturieren | link catalog |
| R13.2 Mail and Print Outbox | Mail/Druck/Download | outbox |
| R13.3 Calendar Integration | Reminder an Kalender anbinden | calendar adapter |
| R13.4 Portal Links | SV/Versicherung/Schule Links | portal actions |
| R13.5 Import Channels | Mail/Watch Folder/API prüfen | import adapters |
| R13.6 Credential Boundary Gate | keine unsicheren Fremd-Credentials | security review |

## R14 - Secure Sharing and Collaboration

Ziel: sichere Freigaben und Zusammenarbeit.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R14.1 Share Model | Freigaben modellieren | share model |
| R14.2 Redacted Export Packages | redigierbare Exportpakete | redaction |
| R14.3 Time-limited Access | zeitlich begrenzte Freigaben | expiring access |
| R14.4 Access History | Zugriffshistorie | audit |
| R14.5 Collaboration UX | Partner-/Haushaltskollaboration | collaboration UI |

## R15 - Advanced Platform and Productization

Ziel: optional groessere Betriebsformen und Productization.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R15.1 Hosted/Self-hosted Cloud Option | groessere Betriebsformen pruefen | deployment model |
| R15.2 Multi-household Model | mehrere Haushalte/Mandanten optional | tenant model |
| R15.3 Advanced Admin/Ops | staerkere Admin-/Ops-Oberflaeche | admin console |
| R15.4 Advanced Observability | Betriebsmetriken erweitern | observability stack |
| R15.5 Upgrade Strategy | langfristige Migration/Upgrade | upgrade runbook |
