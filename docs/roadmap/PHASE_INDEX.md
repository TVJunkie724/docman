---
title: "DocMan - Phase Index"
description: "Detaillierter Phasen- und Subphasen-Index fuer planbare Milestone-Implementation-Slices"
tags: [roadmap, phases, subphases, implementation-plan, planning]
lastUpdated: "2026-07-12"
version: "1.0"
status: "accepted-rebaseline"
---

# DocMan - Phase Index

## Commercial-Core-Rebaseline

Die Reihenfolge wird durch C0-C7 in `docs/ROADMAP_REBUILD.md` gesteuert. R0-R15
bleiben stabile Traceability-IDs und fachliche Slice-Kandidaten. Kein Eintrag
in diesem Index ist ohne detaillierten, geprüften Implementation Contract
freigegeben.

| Historischer Slice | Neuer Slice/Gate |
|---|---|
| R0.5/R5 accountfreie Local- und spätere Assisted-Review-Annahme | C0 Account/Vault/Assist Contract; C1 account/device/entitlement; C2/C3 Core Assist |
| R0.3 Local-first/Home-Hub-Richtung | C0 Vault authority, Cloud timing und Trust Contract |
| R3.4 Home-Hub Contract Baseline | C1 Mappm Cloud OpenAPI/Microcks Foundation |
| R4.6 Home Hub Capture Contract | C2 Cloud Capture Contract |
| R4.7 Upload zum Home Hub | C2 Cloud Capture Provider Slice |
| R6 Home Hub, Sync and Auth | C1/C4 Cloud, Identity, Entitlements, Sync and Migration |
| R11 lokale/Home-Hub Backups | C4 Local Export/Restore plus Managed Cloud Backup/Restore |
| R15 Hosted/Self-hosted Option | C5 Managed Cloud Productization; customer self-hosting not in scope |

Local Development Cloud ist ein C1/C2 Engineering-Deliverable, kein
Kundenfeature. Alle späteren historischen Texte sind unter dieser Rebaseline zu
lesen.

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

## Playbook Alignment

Der allgemeine Flutter Project Setup Playbook Track ist auf diese Roadmap
angewendet, ersetzt sie aber nicht.

Owning artifacts:

- `docs/roadmap-standard/STANDARD_PHASES.md`
- `docs/roadmap-standard/ALWAYS_PLAN_CHECKLIST.md`
- `docs/roadmap-standard/CONDITIONAL_IMPLEMENTATION_MATRIX.md`
- `docs/roadmap-standard/RELEASE_READINESS_PHASES.md`
- `docs/execution/PLAYBOOK_AGENT_TRACK_CLOSEOUT.md`

Regeln:

- R0-R15 bleiben die Mappm-Phasen.
- Playbook P0-P11 sind Governance-/Setup-Gates und werden auf R0-R15 gemappt.
- Eine Phase ist nicht implementation-ready, nur weil sie in diesem Index
  steht.
- Jede implementation-ready Phase muss die Always-Plan- und Conditional-Zeilen
  nennen, die sie betrifft.
- Store, CI/CD, Security, Privacy, Data Lifecycle, AI/OCR/LLM, Sync, Backup,
  Sharing, Support und Commercial bleiben geplant, auch wenn sie erst spaeter
  implementiert werden.
- Frontend- und Backend-Implementation bleiben getrennte Issues. Frontend darf
  Backend-Bedarf beschreiben; Backend/API entscheidet Contracts, DTOs,
  Endpoints, Mapping, Persistence und Policy Architecture.

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
Applicable always-plan rows:
Applicable conditional rows:
Security / privacy notes:
Tests / verification:
Acceptance criteria:
Done means:
Explicit non-goals:
Handoff target:
Stop rules:
```

## R0 - Product and Architecture Decisions

Ziel: Grundsatzentscheidungen treffen, bevor Code weiterwächst.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R0.1 Naming and Language | Produktname und Kernbegriffe klaeren | Product Name, Product Language |
| R0.2 Product Scope | ersten nutzbaren Produkt-Slice und langfristiges DMS-Ziel trennen | First Utility Scope, DMS Target Architecture |
| R0.3 Architecture Direction | Local/Cloud Vault authority, Managed Backend, State und Storage entscheiden | Vault/Cloud Product Model, State Management, Backend Role, File Storage |
| R0.4 Security and Privacy Baseline | sensible Daten, Sync-Grenzen und Trust Boundaries definieren | Privacy Sync Scope, Security Privacy Model |
| R0.5 Intelligence and Workflow Boundaries | Core Assist im Commercial Core von Advanced Assist und kuratierten Workflows trennen | Account/Vault/Assist Model, Intelligence Scope, Workflow Rules |

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
| R2.5 Secure Storage Boundary | Account-/Device-/Assist-Tokens und lokale Key-/Recovery-Grenzen sauber trennen | Secure Storage Port |
| R2.6 Foundation Verification | Zielpfad analysierbar und testbar machen | Smoke Tests, Analyzer Zielpfad |

## R3 - Quality and Production Readiness Foundation

Ziel: Das Projekt wird reproduzierbar, testbar und wartbar.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R3.1 Bootstrap and Codegen | frische Checkouts reproduzierbar machen | setup/codegen/verify scripts |
| R3.2 Fake Repositories | App-/Domain-Tests ohne Netzwerk ermoeglichen | Fake Repos |
| R3.3 Test Fixtures | synthetische Daten fuer alle fruehen Produkt-Domains | fixtures |
| R3.4 Contract Baseline | OpenAPI/Microcks fuer Mappm Cloud, Identity, Vault und Capture vorbereiten | contracts/openapi, Microcks config |
| R3.5 Target Path Gates | Legacy vom Zielpfad trennen | `docs/roadmap/phases/R3_5_TARGET_PATH_QUALITY_BASELINE.md` (ready for user approval), analyzer, import checks |
| R3.6 Readiness Gates | Security, Compliance, Data Lifecycle, Observability minimum pruefen | Milestone Quality Gates |
| R3.7 Playbook Verification Closeout | Playbook-Agent-Track, Konzeptcoverage, DS-Gaps und Roadmap-Gates pruefen | Closeout, Coverage, Always-Plan/Conditional Matrix |

## R4 - Capture and Review Core

Ziel: Erster nutzbarer Produkt-Slice.

R4 ist zu gross fuer einen Implementation-Step und wird zwingend in Subphasen
gebaut.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R4.1 Capture & Inbox Foundation | gemeinsame Draft-/Inbox-/Upload-Begriffe festlegen | Capture ports, Draft model |
| R4.2 Desktop Import + Draft Inbox | D35 Review-Workflow und D36 Desktop Import umsetzen | file picker, drag/drop, draft review |
| R4.3 Mobile Scanner Spike | native Scanner-Qualitaet beweisen | Android/iOS Scanner evidence |
| R4.4 Mobile Scan Client | Mobile Scan, optionale Kontextauswahl und lokale Queue bauen | scan session, context selection, local queue |
| R4.5 Upload Limits and Retry | D32 umsetzen | `docs/roadmap/phases/R4_5_UPLOAD_LIMITS_RETRY_PLAN.md` |
| R4.6 Cloud Capture Contract | Capture als OpenAPI/Microcks-Spec modellieren | mobile-capture-upload.openapi.yaml |
| R4.7 Cloud Upload Slice | erster echter Capture Upload zur Local Development Cloud/Staging | CaptureUploadPort strategy |
| R4.8 Cases/Relations/Custom Core | eigenständige Vorgänge, typisierte Beziehungen, Custom Cases sowie Top-down-/Bottom-up-Komposition nutzbar machen | Case, CaseLink, DocumentCaseLink, multi-select composition UI/domain |
| R4.9 Document/Record Metadata Core | D38/D39/D41 Dokument-Metadaten, betroffene Person, Validierung und Preview umsetzen | metadata, review validation, preview, pdfrx adapter |
| R4.10 Tasks/Quick Access Core | Aufgaben, Fälligkeiten, Schnellzugriff | task overview, quick access |
| R4.11 Search Core | lokale strukturierte Suche | SQLite/Drift/FTS5 adapter |
| R4.12 External Actions Core | manuelle externe Links | task/case action links |
| R4.13 Security/Privacy M2 Gate | sensible Logs/Tokens/Storage pruefen | privacy gate |
| R4.14 QA/Regression M2 Gate | M2-Regression gruen bekommen | tests, smoke checks |
| R4.15 UX/A11y M2 Gate | Bedienbarkeit, leere/fehlerhafte Zustände, A11y | UX review |

## R5 - Assisted Review and Household Profiles

Rebaseline: R5 bleibt eine stabile Traceability-ID. R5.1-R5.3 sind keine
spätere Option mehr, sondern werden in C1/C2/C3 als Core Assist umgesetzt.
R5.4-R5.8 bleiben Profil-/Haushaltsslices entsprechend ihrer C-Gate-Zuordnung.

Ziel: Mappm reduziert manuelle Review-Arbeit und wird von einer Einzelperson-App zu einer Haushalts-App.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R5.1 Assisted Review Text Extraction | C2 Core Assist: OCR/Text-Extraktion fuer Draft Review production-ready liefern | provider/contract/client boundary, offline queue, deletion |
| R5.2 Metadata Suggestions | C2/C3: Titel, Typ, Datum, Akteure, Betrag, Fälligkeit, Vorgang/Workflow und Tags vorschlagen | evidence/confidence suggestion model |
| R5.3 Suggestion Review UX | C2/C3: Vorschlaege annehmen, korrigieren oder ablehnen | review, quota, opt-out/manual fallback interaction |
| R5.4 Profile Data Classification | sensible Profildaten klassifizieren | profile data policy |
| R5.5 Managed Subject Domain Model | Personen, Kinder und vorbereitete Organisationsprofile modellieren | ManagedSubject, PersonProfile, OrganizationProfile |
| R5.6 Subject-aware Objects | Cases, Docs, Tasks, Drafts personen-/organisationsbewusst machen | managed-subject links and private/business separation |
| R5.7 Partner/Adult Management | gemeinsame Verwaltung vorbereiten | access model |
| R5.8 Profile UX Gate | Profilwechsel und Korrekturen klar machen | UX validation |

## R6 - Cloud, Identity, Sync and Migration

Ziel: Daten koennen zwischen Geraeten repliziert und Sessions sicher verwaltet
werden.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R6.1 Managed Cloud Skeleton | ASP.NET-Core Cloud-Basis plus Local Development Cloud | API skeleton, readiness |
| R6.2 Account and Device Sessions | Account/Device Management umsetzen | identity/session contracts |
| R6.3 Upload Sessions | serverseitige Upload Sessions und Validation | upload sessions |
| R6.4 Sync Journal | Aenderungsjournal und Tombstones | sync journal |
| R6.5 Conflict Detection | Konflikte erkennen und darstellen | conflict model |
| R6.6 Sync Contract Tests | OpenAPI/Microcks + Server verification | sync contracts |
| R6.7 Privacy Sync Gate | remote Datenklassen und Encryption-Faehigkeit pruefen | privacy gate |
| R6.8 Entitlement and Grace | Plan, Quota, Kündigung, Read-only und Reaktivierung | commercial lifecycle |
| R6.9 Vault Provider Migration | Local-to-Cloud und Cloud-to-Local verifiziert umsetzen | migration workflow |

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
| R8.7 Workflow Catalog Foundation | generische, versionierte Definitionen und gepinnte Vorgangsinstanzen modellieren | catalog schema, validators, step/branch/Claim/CaseLink runtime, fixtures |
| R8.8 First Reviewed Country Pack | ausgewählte Golden Workflows für einen freigegebenen Rechtsraum publizieren | dated sources, applicability, localization, professional review, withdrawal/update ownership |
| R8.9 Contracts and Subscriptions | Verträge/Abos, beliebige Abrechnungsintervalle, Invoice Matching, Kündigungsfristen und Reminder modellieren | contract/subscription Record, recurring invoice roles, workflow facts |
| R8.10 Contextual Financial Summaries | bestätigte Financial Entries dedupliziert und schlank pro Case/Record darstellen | part_of roll-up, one-value row, accessible mini chart |
| R8.11 Tax and Business Collection Foundation | länder- und subject-gebundene Unterlagensammlung ohne Buchhaltungs-/Steuerclaim vorbereiten | tax collection Case, period/jurisdiction model, business handoff/export boundary |

## R9 - Intelligence, OCR and Automation

Ziel: Mappm unterstützt beim Erkennen, Sortieren und Vorschlagen.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R9.1 OCR Pipeline | Text extrahieren | OCR worker/contracts |
| R9.2 Classification Suggestions | Dokumenttypen und Metadaten vorschlagen | classifier |
| R9.3 Fact Suggestions | Facts/Claims vorschlagen | suggestion model |
| R9.4 Form Prefill | Formularfelder vorbereiten | prefill proposals |
| R9.5 Review UX | Vorschläge pruefen/annehmen/verwerfen | review UI |
| R9.6 AI Trust Gate | Privacy, Audit, Redaction, lokale Modelle pruefen | AI gate |
| R9.7 Context and Workflow Matching Suggestions | bestehende Vorgänge, Records/Abos, Managed Subjects und anwendbare veröffentlichte Definitionen vorschlagen, aber keine Abläufe/Lebensereignisse erfinden | ranked matches, evidence, confidence, unsupported fallback, undo |

## R10 - Compliance, Legal and Distribution Readiness

Ziel: Distribution und rechtliche Mindestfaehigkeit vorbereiten.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R10.1 GDPR/DSGVO Review | Datenschutzanforderungen pruefen | compliance checklist |
| R10.1a EU Regulatory Refresh | EU AI Act, Cyber Resilience Act, eIDAS/EUDI, NIS2, Data Act und Store-Regeln mit aktuellem Datum pruefen | dated REG review, source check, legal review trigger |
| R10.2 Store Policy Review | Apple/Google/Microsoft Anforderungen | store checklist |
| R10.3 License Review | Third-party Notices | license docs |
| R10.4 Release Signing | Signing/Notarization/Packaging | release pipeline |
| R10.5 Review Access | Demo/Testdaten fuer Review | review access |
| R10.6 Commercial Readiness Gate | Licensing, Entitlements, Billing, Trial, Support/SLA pruefen | COM review, support boundary |

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
| R13.3 Agenda and Calendar Integration | Mappm-Agenda konsolidieren und Reminder optional datenschutzsicher an externe Kalender anbinden | agenda model, consented calendar adapter, redacted titles |
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
