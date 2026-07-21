---
title: "Mappm - Phase Index"
description: "Detaillierter Phasen- und Subphasen-Index fuer planbare Milestone-Implementation-Slices"
tags: [roadmap, phases, subphases, implementation-plan, planning]
lastUpdated: "2026-07-21"
version: "1.1"
status: "accepted"
owner: "product-concept"
---
# Mappm - Phase Index

## Commercial-Core-Zuordnung

Die Reihenfolge wird durch C0-C7 in `docs/ROADMAP_REBUILD.md` gesteuert. R0-R15
bleiben stabile Traceability-IDs und fachliche Slice-Kandidaten. Kein Eintrag
in diesem Index ist ohne detaillierten, geprüften Implementation Contract
freigegeben.

| Commercial-Core-Gate | Relevante R-Slices |
|---|---|
| C0 Product and Trust Contract | R0, R1 und die offenen Taxonomie-/Pack-Entscheidungen aus R8 |
| C1 Vault, Account and Provider Foundation | R2, R3 und Foundation-Slices aus R6 |
| C2 Capture, Core Assist and Review | R4 sowie Pflicht-Slices aus R5 und R9 |
| C3 Document Core, Cases, Records, Search and Tasks | R4, R5 und aktivierte R8-Slices |
| C4 Lifecycle and Commercial Safety | R6 und R11 |
| C5 Compliance, Operations and Release | R3 sowie R10-R12 und anwendbare R15-Slices |
| C6 Closed Beta | freigegebene Beta-, Support-, Recovery- und Rollback-Contracts |
| C7 Commercial 1.0 | ausschließlich nach dokumentiertem Go/No-Go |

Local Development Cloud ist ein C1/C2 Engineering-Deliverable mit
synthetischen Daten, kein Kundenfeature. Customer Self-hosting und Home Hub
sind nicht Teil dieses Index.

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
| R0.6 Document, Case and Pack Taxonomy Decision | den einen generischen Case, optionale Workflow-Muster/Fachvorlagen, die minimal ausreichende Menge an Dokumentgrundarten/Varianten/Rollen, Record-Arten, Grenzen und dynamische Country-/Provider-Pack-Schichten gemeinsam mit dem User entscheiden | product-value disposition je Dokumentkandidat und Case-Familie als bestehender/breiter Typ, Titel/Alias, Fact/Party, Rolle/Slot, Record oder Source/Format; accepted lean taxonomy/catalog and pack boundary, rejected alternatives, no mass subtype or large Case-type picker, accepted Medical composition including resolved OQ-012 defaults, finale Austria-first Katalog-Disposition, versioning/migration and synthetic ambiguity fixtures |

## R1 - Documentation Source of Truth

Ziel: Dokumentation als aktive Steuerung herstellen.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R1.1 Legacy Documentation Cleanup | alte Roadmaps/Refactoring-Pläne entfernen oder entwerten | bereinigte Docs |
| R1.2 Foundation Concept Rewrite | F-Konzepte Mappm-spezifisch neu schreiben | F1-F18 Konzepte |
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
| R4.1 Capture, Batch and Processing Foundation | CaptureSession/Page/Document/Processing/Proposal/Review-Begriffe und Restart-/Partial-Semantik festlegen | Domain ports, fakes, async state, artifact/page manifest; Cross-Device-Handoff nicht ohne OQ-013 |
| R4.2 Desktop Import + Capture Inbox | globalen Multi-File-Import, gemischte Batch-Trennung und Processing-/Review-Inbox umsetzen | file picker, image/file import, drag/drop, batch/outlier review, correction; keine Desktop-Webcam-Scans |
| R4.3 Mobile Scanner Spike | native Scanner-Qualitaet beweisen | Android/iOS Scanner evidence |
| R4.4 Mobile Scan Client | globales Capture, `Neuen Vorgang starten`, nativen Scan, Foto, Galerie-/Dateiimport, Multi-Page je Dokument, `Naechstes Dokument scannen` und lokale Queue bauen | scan session, photo/image evidence, picker/share import, minimal intent, explicit document units/page boundaries, local queue |
| R4.5 Upload Policy, Retry, Resume and Cleanup | versionierte Policy und robuste Upload-Basis umsetzen | `docs/roadmap/phases/R4_5_UPLOAD_LIMITS_RETRY_PLAN.md` |
| R4.6 Cloud Capture Contract | Capture als OpenAPI/Microcks-Spec modellieren | mobile-capture-upload.openapi.yaml |
| R4.7 Cloud Upload Slice | erster echter Capture Upload zur Local Development Cloud/Staging | CaptureUploadPort strategy |
| R4.8 Cases/Relations/Custom Core | primaeren Case-/Record-Kontext, leichte Custom Cases, typisierte Beziehungen/Folgeketten, reversiblen Abschluss/Wiedereroeffnung sowie Top-down-/Bottom-up-Komposition nutzbar machen | Case, CaseLink, DocumentCaseLink, lightweight Custom, late-evidence/reopen history, composition domain/UI |
| R4.9 Document/Record Metadata Core | Assist-Titel, Taxonomie-Achsen, betroffene Person, typisierte Zeitvorschlaege, Validierung und Preview umsetzen | generated title/provenance, temporal proposal semantics, metadata, review validation, preview |
| R4.10 Tasks/Quick Access Core | Aufgaben, typisierte Fälligkeiten, fokussierte Agenda und Schnellzugriff | task overview, temporal references, agenda, quick access |
| R4.11 Search Core | lokale strukturierte Suche einschließlich Zeitart-/Zeitraumfiltern | SQLite/Drift/FTS5 adapter, temporal filters |
| R4.12 External Actions Core | manuelle externe Links | task/case action links |
| R4.13 Security/Privacy Capture Gate | Dateien/OCR/Titel/Model-Output/Logs/Notifications pruefen | privacy gate |
| R4.14 QA/Regression Capture Gate | restart/offline/mixed-batch/idempotency/partial-failure gruen bekommen | tests, smoke checks |
| R4.15 UX/A11y Capture Gate | schlanker Review, leere/fehlerhafte Zustaende, Gestenalternativen und A11y | UX review |

## R5 - Assisted Review and Household Profiles

Rebaseline: R5 bleibt eine stabile Traceability-ID. R5.1-R5.3 sind keine
spätere Option mehr, sondern werden in C1/C2/C3 als Core Assist umgesetzt.
R5.4-R5.8 bleiben Profil-/Haushaltsslices entsprechend ihrer C-Gate-Zuordnung.

Ziel: Mappm reduziert manuelle Review-Arbeit und wird von einer Einzelperson-App zu einer Haushalts-App.

| Subphase | Ziel | Hauptdeliverables |
|---|---|---|
| R5.1 Assisted Review Text Extraction | C2 Core Assist: OCR/Text-Extraktion fuer Draft Review production-ready liefern | provider/contract/client boundary, offline queue, deletion |
| R5.2 Title, Metadata and Routing Suggestions | C2/C3: verpflichtende Titel fuer Document/Case/Record sowie Typ, Facts, Akteure, Case/Record/Claim/Workflow vorschlagen | evidence/confidence/provenance suggestion model |
| R5.3 Compact Suggestion Review UX | C2/C3: sichtbare Folgen mit einer schnellen bewussten Aktion bestaetigen/korrigieren; keine Hidden Acceptance | review, alternatives, quota, manual fallback interaction |
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
| R7.1 Extended Batch Ergonomics | C2-Kern fuer mixed batches um groessere Stapel, schnellere Korrektur und weitere Quellen erweitern | advanced batch ergonomics; no first support deferral |
| R7.2 Mobile Assisted Review | Vorschläge und Ausnahmen mobil kompakt korrigieren | review-light |
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
| R8.4 Validity and Deadlines | typisierte Gültigkeiten, Zeiträume, Ablaufdaten und Fristen mit Provenienz/Konfliktstatus | temporal/validity facts |
| R8.5 First Insights | erste Auswertungen | insights views |
| R8.6 Facts QA Gate | Korrekturen, Tests, Datenschutz | facts gate |
| R8.7 Workflow Catalog Foundation | generische, versionierte Definitionen und gepinnte Vorgangsinstanzen modellieren | catalog schema, validators, step/branch/Claim/CaseLink runtime, fixtures |
| R8.8 First Reviewed Country Pack | ausgewaehlte Austria-first Golden Workflows publizieren | dated AT sources, applicability, German localization, professional review, withdrawal/update ownership; keine DACH-Gesamtbehauptung |
| R8.9 Contracts and Subscriptions | Verträge/Abos, beliebige Abrechnungsintervalle, Invoice Matching, Kündigungsfristen und Reminder modellieren | contract/subscription Record, recurring invoice roles, workflow facts |
| R8.10 Contextual Financial Summaries | bestätigte Financial Entries dedupliziert und schlank pro Case/Record darstellen | part_of roll-up, one-value row, accessible mini chart |
| R8.11 Tax and Business Collection Foundation | länder- und subject-gebundene Unterlagensammlung ohne Buchhaltungs-/Steuerclaim vorbereiten | tax collection Case, period/jurisdiction model, business handoff/export boundary |
| R8.12 Conditional Medical Workflow Foundation | auf der akzeptierten Care-/Cost-/Claim-, Ankerdokument-, Case-Gueltigkeits-, Zustands-, Wiederkehr- und Payer-Default-Komposition einen ausgewaehlten medizinischen Slice planen; den seltenen Desktop-Medienpaket-Import nur bei ausdruecklicher M1-Aktivierung und erst nach R4.8 einplanen | generic runtime mapping; per-document Care/Cost matching; one anchor document/intent per new linked Medical Case; no free M1 multi-document split; zero/one/many documents without invalid Case; separate payment/SV/supplementary/lifecycle states; normal supplementary suggestion only after confirmed SV settlement/rejection; generic special forms; no coverage/benefit calculation; optionaler case-lokaler Desktop-Medienpaket-Import mit manuellem Titel, optionalem Untersuchungsdatum, Manifest und bytegleichem Re-Export; no concrete country/provider claim before OQ-011, WF-01/WF-02 and professional review |

## R9 - Intelligence, OCR and Automation

Rebaseline: R9.1-R9.5 und der Matching-Kern sind C2/C3-Pflicht und keine spaete
Option. R9 traegt erweitertes Reprocessing, neue Klassen/Provider und die
qualitaetsgegatete selektive Automatisierung.

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
| R11.1 Backup | Local-Vault-Backup/Export sowie Managed-Cloud-Backup je aktiviertem Modus | backup |
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
| R13.3 Agenda and Calendar Integration | Mappm-Agenda konsolidieren und nur bestaetigte ausgewaehlte Objekte optional datenschutzsicher an externe Kalender anbinden | temporal SSOT mapping, consented/idempotent calendar adapter, timezone/conflict/disconnect behavior, redacted titles |
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
| R15.1 Managed Cloud Scaling | Skalierung und regionale Betriebsformen der verwalteten Mappm Cloud pruefen | deployment model |
| R15.2 Multi-household Model | mehrere Haushalte/Mandanten optional | tenant model |
| R15.3 Advanced Admin/Ops | staerkere Admin-/Ops-Oberflaeche | admin console |
| R15.4 Advanced Observability | Betriebsmetriken erweitern | observability stack |
| R15.5 Upgrade Strategy | langfristige Migration/Upgrade | upgrade runbook |
