---
title: "DocMan - Rebuild Roadmap"
description: "Vorgeschlagene Roadmap, um DocMan vom aktuellen Spike zu einer stabilen, lokalen, erweiterbaren Dokumenten-App zu entwickeln"
tags: [roadmap, rebuild, product, planning, foundation]
lastUpdated: "2026-05-29"
version: "1.20"
---

# DocMan - Rebuild Roadmap

## 1. Zweck

Diese Roadmap ist der aktive Neustart der Projektplanung. Sie ersetzt die alten Säulen-Roadmaps als Steuerungsdokument: Entscheidungen treffen, Foundation stabilisieren und die Arbeit in nutzbare Milestones schneiden.

## 2. Leitidee

Ordna sollte zuerst als Desktop-App mit Mobile Capture funktionieren: unterwegs Dokumente erfassen, zuhause am Desktop prüfen und Vorgängen zuordnen. Danach muss Assisted Review schnell folgen, weil optionale Metadaten realistisch nicht dauerhaft manuell gepflegt werden.

Langfristig ist DocMan/Ordna jedoch nicht nur "Dokumente an Vorgängen".
Das Ziel ist ein privates DMS fuer Haushalt, Personen, Vorgänge, Records,
Versionen, strukturierte Fakten, Aufgaben, externe Aktionen, Suche,
Auswertungen, Backup, Sync und Intelligence. Jeder Milestone liefert einen
konkreten Nutzwert und darf das Zielmodell nicht verbauen.

```text
M0 Product Direction
  -> M1 Foundation and Quality
      -> M2 Capture and Review Core
          -> M3 Assisted Review
              -> M4 Household and Sync
                  -> M5 Facts, Workflows and Insights
                      -> M6 Automation, Resilience and Distribution
```

## 2.1 Dokumentationsmodell

DocMan trennt bewusst zwischen Roadmap, Produkt-Säulen, querschnittlichen Konzepten und Entscheidungen.

| Dokumenttyp | Ort | Zweck |
|---|---|---|
| Roadmap | `docs/ROADMAP_REBUILD.md` | Top-Level-Phasen, Reihenfolge, Decision-Register und offene Entscheidungen |
| Phase Index | `docs/roadmap/PHASE_INDEX.md` | detaillierte Phasen/Subphasen als planbare Implementation-Slices |
| Pillar Roadmap Index | `docs/roadmap/PILLAR_ROADMAP_INDEX.md` | detaillierte Säulen-Roadmaps mit Milestone-Slices und Operations-Slices |
| Execution Plan | `docs/ROADMAP_EXECUTION_PLAN.md` | konkrete GitHub-Milestones, Epics und Issue-Kandidaten |
| Produkt-Säulen | `docs/pillars/PILLAR_*.md` | fachliche App-Bereiche, die getrennt gedacht und teilweise parallel entwickelt werden können |
| F-Konzepte | `docs/concepts/CONCEPT_F*.md` | querschnittliche Frontend-/Foundation-Regeln wie Struktur, State, Testing, Mocks, Runtime, Design- und UI-Standards |
| Decisions | `docs/technical/DECISION_*.md` | akzeptierte oder explizit offene Architektur-/Produktentscheidungen |

Feature- oder Produktbereichsplanung gehört nicht als neues `F21`, `F22` usw. in die Frontend-Konzepte, sondern in die Produkt-Säulen oder in Roadmap-Phasen.

## 2.1.1 Planungsregel

Jede Phase wird so geplant, als muesste sie spaeter ein konkreter
Implementation-Plan werden.

Eine Phase oder Subphase ist nur gut geschnitten, wenn sie hat:

- ein klares Ziel.
- Scope und Out of Scope.
- primaere Saeulen.
- konkrete Deliverables.
- Abhaengigkeiten.
- Test-/Quality-/Security-Gates.
- Akzeptanzkriterien.

Wenn ein Block mehrere Verantwortungen vermischt oder zu gross fuer einen
einzigen Arbeitsschritt ist, wird er in Subphasen geteilt.

## 2.2 Säulenlandkarte

Die vollständige Säulenlandkarte steht in `docs/pillars/PILLAR_INDEX.md`.

Kurzform:

| Gruppe | Säulen |
|---|---|
| Produkt | Capture & Inbox; Vorgänge/Dokumente/Records; Tasks/Reminders/Quick Access; Search/Facts/Insights; Export/Sharing/External Actions; Household Profiles/Access; Templates/Workflows |
| Plattform | Home Hub & Sync; Intelligence & Automation; Admin/Settings/Storage Health |
| Enterprise/Governance | QA; Observability/Runtime; Security/Privacy; Compliance/Legal; Release/Distribution; Data Lifecycle; Developer Experience; Design System/UX; Support/Diagnostics; Compatibility/Platform Support; Integration Governance |

## 2.3 Milestone-Modell

Die Roadmap wird in Milestones geplant. Der erste nutzbare Produkt-Slice ist
ein Milestone, kein Sondermodus mit abweichender Architektur.

| Milestone | Nutzen | Wichtigste Phasen |
|---|---|---|
| M0 Product Direction | Produkt, Sprache, Datenschutz, DMS-Ziel und technische Richtung sind entschieden | R0-R1 |
| M1 Foundation and Quality | Zielarchitektur, Tests, Fakes, Contracts und lokale Grenzen sind verlässlich | R2-R3 |
| M2 Capture and Review Core | Dokumente erfassen, importieren, prüfen, einer betroffenen Person zuordnen und auffindbar ablegen | R4 |
| M3 Assisted Review | OCR/Extraktion schlägt Titel, Absender, Datum, Betrag, Fälligkeit, Tags und Dokumenttyp vor | R5/R9-Slices |
| M4 Household and Sync | Haushaltsprofile, Partner-/Kinderkontext, Home Hub und Sync werden nutzbar | R5-R7 |
| M5 Facts, Workflows and Insights | geprüfte Facts, Claims, Erstattungen, Ausgaben und Workflows werden auswertbar | R8/R13 |
| M6 Automation, Resilience and Distribution | Backup, Restore, Compliance, Release, Sharing, lokale LLMs und Operations reifen | R10-R15 |

Assisted Review ist damit kein diffuser spaeterer Wunsch, sondern der naechste
Nutzwert nach dem Capture-Kern. Manuelle optionale Metadaten bleiben als
Korrekturweg erhalten, sind aber nicht der langfristige Arbeitsmodus.

## 2.4 Roadmap-Aufbau nach Säulen

Roadmap-Phasen ziehen bewusst nur kleine Slices aus den Säulen.

| Phase | Milestone | Primäre Säulen | Governance-/Operations-Slices |
|---|---|---|---|
| R2 Technical Foundation | M1 | Home Hub & Sync vorbereiten; Admin/Settings vorbereiten | Developer Experience, Security/Privacy, Observability-Grundmodell |
| R3 Quality & Production Readiness | M1 | keine neuen Produktfeatures | QA, Release/Distribution, Data Lifecycle, Developer Experience, Compliance-Minimum |
| R4 Capture and Review Core | M2 | Capture & Inbox; Vorgänge/Dokumente/Records; Tasks/Reminders; Quick Access; Search; External Actions | Design System/UX, Observability-Minimum, Security/Privacy-Minimum, Compatibility-Minimum |
| R5 Assisted Review and Profiles | M3/M4 | Assisted Review; Household Profiles/Access | Security/Privacy, Compliance, UX Governance |
| R6 Sync and Auth | M4 | Home Hub & Sync | Security/Privacy, Observability, Data Lifecycle, Integration Governance |
| R7 Extended Mobile | M4 | Capture & Inbox; Mobile UX; Search | Compatibility/Platform Support, Release/Distribution, Support/Diagnostics |
| R8 Structured Facts and Insights | M5 | Search/Facts/Insights; Templates/Workflows | QA Regression, Data Lifecycle, Compliance/Legal |
| R9 Intelligence and Automation | M3/M6 | Intelligence & Automation | Security/Privacy, Compliance/Legal, Observability, Integration Governance |

## 3. Status-Legende

| Status | Bedeutung |
|---|---|
| Proposed | Vorschlag, noch nicht final entschieden |
| Decision Needed | Blockiert durch offene Entscheidung |
| Planned | Akzeptiert, aber noch nicht begonnen |
| In Progress | In Arbeit |
| Done | Abgeschlossen |
| Deferred | Bewusst zurückgestellt |

## 3.1 Decision Register Overview

Diese Übersicht ist das schnelle Register der bisher geplanten Entscheidungen.
Details und Subphasen stehen in `docs/roadmap/PHASE_INDEX.md` und
`docs/roadmap/PILLAR_ROADMAP_INDEX.md`.

| Nr. | Decision | Status | Primaere Saeulen | Milestone Slice | Later Milestone / Operations Slice |
|---|---|---|---|---|---|
| D01 | Product Name | accepted | DX/Governance, Release | R0: Produktname `Ordna`; DocMan bleibt technischer Repo-/Workspace-Name | R10: Distribution, Branding, Store-/Review-Material, rechtliche Namenspruefung |
| D02 | Product Language | accepted | Cases/Records, UX | R0/R4: `Case` im Code, "Vorgang" in der UI, `Event` fuer Timeline | R8/R9: Records/Facts/Claims/AI-Vorschlaege sprachlich konsistent erweitern |
| D03 | State Management and DI | accepted | DX/Governance, Design System/UX | R2: Riverpod als Ziel fuer State und DI, BLoC/GetIt nicht weiter ausbauen | R4-R12: Feature-Provider pro Saeule, Audit gegen Provider-/Domain-Leaks |
| D04 | Local-first Data Flow | accepted | Home Hub/Sync, Data Lifecycle, Security | R2/R4: App lokal nutzbar, Sync-ready IDs, Home Hub nicht Voraussetzung fuer Desktop-Kern | R6/R11/R15: Sync, Backup, optionale Self-hosted-cloudartige Betriebsformen ohne local-first aufzugeben |
| D05 | Backend Role / PocketBase | draft | Home Hub/Sync, Admin/Ops, Security | R0/R4: PocketBase nicht Zielarchitektur; M2 braucht nur minimalen Capture-Gateway-Anteil | R6/R11/R15: eigener Server Stack, Sync, Ops, Backup, Admin, optionale groessere Betriebsformen |
| D06 | Home Hub Backend Technology | accepted | Home Hub/Sync, Observability, Data Lifecycle | R3/R4: OpenAPI/Microcks zuerst, ASP.NET-Core-Ziel fuer spaeteren echten Home Hub | R6/R11/R15: ASP.NET Core + PostgreSQL + MinIO/S3 + Worker + Observability |
| D07 | First Utility Scope | accepted | Capture, Cases/Records, Tasks, Search, Home Hub | R4/M2: Capture and Review Core + Mobile Capture + Draft-Inbox + minimaler Home Hub | R5-R15: Profile, Sync, Extended Mobile, Facts, AI, Compliance, Resilience, Sharing |
| D08 | Foundation Concept Rewrite | accepted | DX/Governance, Documentation | R1: alte importierte Konzepte sind nicht Source of Truth; Slots werden DocMan-spezifisch neu geschrieben | R12: Konzept-/Decision-Governance und regelmaessige Architektur-Audits |
| D09 | Mock UI Strategy | accepted | Design System/UX, QA, DX | R2/R3: Legacy-App nur Referenz; neue Mocks isoliert und synthetisch | R4-R12: Mocks als Plan-/Review-Werkzeug, nicht als Produktpfad |
| D10 | Legacy Readiness Scope | accepted | DX/Governance, QA | R2/R3: Zielpfad sauber machen; Legacy einfrieren, isolieren oder entfernen | R4-R12: keine neuen Abhaengigkeiten auf Legacy; Rest nur als Referenz oder geloeschter Altbestand |
| D11 | Local Database | accepted | Cases/Records, Search/Facts, Data Lifecycle | R2/R4: SQLite + Drift fuer strukturierte lokale Daten; Dateien/Secrets getrennt | R6/R8/R11: Sync Journal, Facts/Insights, Migrationen, Backup/Restore |
| D12 | File Storage and Docker Stack | accepted | Data Lifecycle, Home Hub/Sync, Capture | R4: lokaler File Store; Storage-Port; Docker nicht Voraussetzung fuer Desktop | R6/R11/R15: MinIO/S3, Lifecycle, Backup, Storage Health, alternative S3-kompatible Stores |
| D13 | API Contract Source and Mock Runner | accepted | QA, Home Hub/Sync, DX | R3/R4: OpenAPI + Microcks fuer Home-Hub/Capture-Vertraege | R6/R9/R11: Sync/OCR/AI/Admin-Contracts und Server-Verifikation gegen dieselben Specs |
| D14 | Test Fixtures | accepted | QA, Security/Privacy | R3: synthetische Fixtures fuer App, Domain, Capture und Contracts | R4-R12: Fixture-Katalog pro Saeule erweitern; keine privaten Echtdaten |
| D15 | Codegen Artifact Policy | accepted | DX/Governance, Release | R3: generierte Dart-Artefakte nicht committen; Bootstrap/Codegen/Verify erzwingen | R10/R12: Release-/CI-/Audit-Governance fuer reproduzierbare Builds |
| D16 | Milestone Quality Gates | accepted | QA, Release, DX | R3/R4: Local Change Gate, R3 Foundation Gate, M2 Readiness Gate | R10-R12: Release-, Distribution-, Support- und Governance-Gates |
| D17 | DMS Target Architecture | accepted | Cases/Records, Search/Facts, Data Lifecycle | R0/R4: M2 verbaut Dokumente, Records, Versionen, Beziehungen und Facts nicht | R8/R11/R14: Facts/Claims, Versionierung, Retention, Sharing, Recovery |
| D18 | Case, Document, Record and Facts Model | accepted | Cases/Records, Search/Facts, Tasks | R4: Vorgänge, Subvorgänge, Dokumente, Record-aware Metadaten, einfache Facts vorbereitet | R8/R9/R14: flexible Mehrfachbeziehungen, Claims, Financial Entries, AI-Vorschlaege, Sharing |
| D19 | Document Capture | accepted | Capture & Inbox, Cases/Records | R4/M2: Desktop Import und Mobile Scan landen zuerst in Draft-Inbox | R7/R9/R13: Batch Scan, OCR/AI-Vorschlaege, Mail/Watch-Folder/weitere Importpfade |
| D20 | Mobile Scanner Technology | provisional | Capture, Compatibility, QA | R4: native Plattform-Scanner als Favorit; Spike vor finaler Bridge-Auswahl | R7/R10/R12: Plattformparitaet, Store-/Permission-Pruefung, Supportmatrix |
| D21 | Mobile Capture Upload Strategy | accepted | Capture, Home Hub/Sync, Security, Data Lifecycle | R4: API-proxied Upload erlaubt, stabiler Upload-Port, Idempotency und Retry ganzer Uploads | R6/R11/R15: presigned/resumable, multipart, quotas, cleanup, integrity, E2EE-ready payloads |
| D22 | Auth and Pairing | accepted | Home Hub/Sync, Security, Mobile | R2/R4: QR Pairing primaer, manueller Code als Fallback, Token in Secure Storage | R6/R10/R14: Device Management, Identity Provider Boundary, sichere Freigaben |
| D23 | Local Login | accepted | Security, Profiles, UX | R4/M2: kein Desktop-Login; lokales Geraet, explizite betroffene Person und Pairing genuegen | R5/R6/R10: Profile, Partnerzugriff, Identity Provider und Distribution-Anforderungen |
| D24 | Household Profiles and Access | accepted | Profiles, Security, Compliance | R4/M2: ein Haushalt; betroffene Person je Dokument/Draft verpflichtend, ohne Default-Annahme | R5/R6/R14: Kinderprofile, Partnerzugriff, Rechte, sichere Freigaben |
| D25 | Privacy and Sync Scope | accepted | Security, Home Hub/Sync, Compliance | R2/R4: private Home-Hub-Umgebung, sensible Datenklassen, Secrets getrennt | R6/R10/R11/R15: Sync Privacy, E2EE-/Zero-Knowledge-Faehigkeit, Backup/Restore, Cloud-artige Varianten |
| D26 | Security and Privacy Model | accepted | Security, Compliance, Data Lifecycle | R2/R3/R4: Security-by-Design, Secure Storage, log-sparsam, Trust Boundaries | R6/R9/R10/R11/R14: Sync, AI/OCR, DSGVO, Backup, Sharing, Redaction |
| D27 | Workflow Rules | accepted | Templates/Workflows, Tasks, UX | R4: Workflows fuehren ueber Tasks/Statusvorschlaege, keine harten Kaefige | R8/R9/R13/R14: Claims, AI-Vorschlaege, externe Aktionsketten, geteilte Verantwortlichkeiten |
| D28 | Intelligence Scope | accepted | Intelligence, Search/Facts, Security | R4/M2: Review-Zustaende und Facts vorbereiten; M3 bringt Assisted Review statt dauerhafter Handarbeit | R9/R11/R15: OCR, Klassifikation, lokale LLMs, Reprocessing, Job Ops |
| D29 | Search Technology and Boundary | accepted | Search/Facts, Data Lifecycle | R4: SQLite/Drift/FTS5 fuer lokale strukturierte Suche | R8/R9/R15: OCR-Text, semantische Suche, optionaler Search-Service |
| D30 | External App/Website Links | bundled | External Actions, Integration Governance, Tasks | R4: manuelle Links an Task/Vorgang, keine Fremd-Credentials | R8/R13/R14: Claim-/Record-/Profil-Links, Mail/Kalender/Portale, sichere Freigaben |
| D31 | Tasks, Reminders and Quick Access | bundled | Tasks/Reminders, UX, Observability | R4: Aufgaben, Fälligkeiten, Schnellzugriff, Reminder-Daten ohne komplexe Push-Infrastruktur | R7/R8/R13/R14: mobile Reminder, Facts/Claims-Reminder, Kalender, geteilte Aufgaben |
| D32 | Upload Limits, Retry, Resume and Cleanup | accepted | Capture, Home Hub/Sync, Data Lifecycle, Observability | R4: kein Chunking/Resume, Retry ganzer Uploads, 25 Seiten/50 MB Startlimit, SHA-256, Idempotency, lokale Queue | R6/R11: resumable/multipart, serverseitiges Cleanup, quotas, metrics, integrity |
| D33 | Home Hub Capture Contract | accepted | Home Hub/Sync, Capture, QA, Security | R4: OpenAPI/Microcks 3-Step Contract initiate/upload/confirm, Idempotency, Checksums, invalid-context fallback | R6/R11: presigned/resumable, richer status, quotas, server verification |
| D34 | Mobile Capture Context Selection | accepted | Capture, Cases, Profiles, UX | R4/M2: betroffene Person/Vorgang/Notiz optional mitsenden, Draft-Inbox bleibt Fallback, keine mobile Vollverwaltung | R5/R7: Profile, mobile Review, Subvorgänge, Mehrfachzuordnung, bessere Suche |
| D35 | Draft Inbox Review Workflow | accepted | Capture, Cases, UX, Data Lifecycle | R4: Entwürfe plus letzte 10 "zuletzt verarbeitet", schnelle Korrektur, Reopen in Entwürfe | R7/R9/R13: mobile Review, OCR/AI-Vorschläge, weitere Importpfade |
| D36 | Desktop Import Scope | accepted | Capture, UX, Data Lifecycle, DX | R4: File Picker und Drag & Drop fuer PDF/JPG/PNG hinter Import-Strategy-Port | R7/R13: Combine, Watch Folder, Mail/Share Import, weitere Formate |
| D37 | Import Duplicate Detection | accepted | Capture, Data Lifecycle, UX | R4: Hash-basierte Warnung mit Optionen "Bestehendes öffnen", "Beide behalten", "Abbrechen" | R8/R11: Versionierung, Aehnlichkeit, Cleanup, Repair |
| D38 | Document Metadata and Preview | accepted | Cases/Records, Capture, Search, UX | R4/M2: generische Pflichtmetadaten inklusive betroffene Person plus Preview/Pending/Failed-Status im Draft Review | R8/R9/R11: Facts, OCR, Preview-Rebuild, Versionen |
| D39 | Preview Generation Strategy | accepted | Capture, Cases/Records, UX, Data Lifecycle | R4: `pdfrx` als PDF-Preview-Adapter hinter PreviewGenerationPort; async, erste Seite, Bildstrategie | R7/R11: mehrseitige Navigation, Preview-Rebuild, alternative Adapter |
| D40 | Document Type Catalog | accepted | Cases/Records, Capture, Search, UX | R4/M2: lockerer Typkatalog fuer Rechnung, Vertrag, Polizze, Gesundheit, Behörde, Nachweis, Schule, Garantie, Foto, Sonstiges | R8/R9/R13: Subtypen, Facts, Workflows, KI-Vorschlaege |
| D41 | Review Completion Validation | accepted | Capture & Inbox, Cases/Records, Profiles, UX | R4/M2: Review-Abschluss blockiert bei fehlender Datei, fehlender betroffener Person, Titel, Dokumenttyp oder harten Review-Konflikten | R5/R8/R9: Profilregeln, Facts, OCR/AI-Hinweise und komplexere Validierung |

## 4. Phase R0 - Produkt- und Architekturentscheidungen

**Status:** Done for product baseline

Hinweis: Die Produkt-Baseline, Security-/Privacy-Baseline, Storage-Grenze und Home-Hub-Backend-Technologie sind entschieden. Die breitere Sync-Strategie bleibt fuer R6 zu konkretisieren.

**Ziel:** Die wichtigsten Grundsatzfragen werden entschieden, bevor Code weiter wächst.

### Deliverables

- `docs/technical/DECISION_PRODUCT_NAME.md`
- `docs/technical/DECISION_PRODUCT_LANGUAGE.md`
- `docs/technical/DECISION_STATE_MANAGEMENT.md`
- `docs/technical/DECISION_DATA_FLOW.md`
- `docs/technical/DECISION_BACKEND_ROLE.md`
- `docs/technical/DECISION_FIRST_UTILITY_SCOPE.md`
- `docs/technical/DECISION_WORKFLOW_RULES.md`
- `docs/technical/DECISION_INTELLIGENCE_SCOPE.md`
- `docs/technical/DECISION_PRIVACY_SYNC_SCOPE.md`
- `docs/technical/DECISION_MOCK_UI_STRATEGY.md`
- `docs/technical/DECISION_DMS_TARGET_ARCHITECTURE.md`
- `docs/technical/DECISION_FILE_STORAGE_AND_DOCKER_STACK.md`
- `docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md`

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R0-D0 | Heisst das Produkt langfristig `DocMan`? | Entschieden: Produktname ist `Ordna`; `DocMan` bleibt vorerst technischer Repo-/Arbeitsname |
| R0-D1 | Heißt das zentrale Modell weiterhin `Incident`? | Entschieden: `Case` im Code, "Vorgang" im UI, `Event`/"Ereignis" für Timeline-Einträge |
| R0-D2 | BLoC/GetIt oder Riverpod? | Entschieden: Riverpod als State Management und DI; BLoC/GetIt wird nicht weiter ausgebaut |
| R0-D3 | Local-first oder Backend-first? | Entschieden: local-first mit generischem DocMan Sync Backend; Home Hub/Tailscale nur erste Self-Hosted-Betriebsform |
| R0-D4 | Rolle von PocketBase und Backend? | Entwurf: eigener self-hosted DocMan Server Stack per Docker/Compose; PocketBase nicht als Zielarchitektur |
| R0-D5 | Was ist der erste nutzbare Produkt-Slice? | Entschieden: Desktop-Verwaltung plus Mobile Capture mit minimalem Home-Hub-Eingangskorb |
| R0-D6 | Wie streng sind Workflows? | Entschieden: Empfehlungen/Review; harte Regeln nur für Integrität/Sicherheit |
| R0-D7 | Gehört KI/OCR in den ersten nutzbaren Produkt-Slice? | Entschieden: Nicht als Voraussetzung; Assisted Review folgt als eigener M3-Nutzwert |
| R0-D8 | Welche Sync-Grenzen gelten für sensible Daten? | Entschieden: frueher Sync nur in privater Home-Hub-Umgebung; Secrets getrennt |
| R0-D9 | Ist DocMan nur Vorgangsverwaltung mit Anhängen oder ein vollwertiges DMS? | Entschieden: vollwertiges privates DMS; M2 ist nur der erste nutzbare Slice |
| R0-D10 | Wie wird Dateiablage technisch geschnitten? | Entschieden: austauschbarer Storage-Port; App-local File Store zuerst, MinIO/S3-kompatibel fuer Home Hub |
| R0-D11 | Welche Backend-Technologie trägt den Home Hub? | Entschieden: ASP.NET Core + PostgreSQL + MinIO/S3-kompatibler Storage + Microcks |

### Akzeptanzkriterien

- Jede Entscheidung hat ein kurzes Decision-Dokument.
- Alte widersprüchliche Foundation-Dokumente sind markiert oder aus der aktiven Planung genommen.
- Es gibt eine akzeptierte Definition des ersten nutzbaren Produkt-Slices.
- Die DMS-Zielarchitektur ist dokumentiert, damit M2-Vereinfachungen spätere Mehrfachbeziehungen, Versionen, Facts, Sync, Export und Intelligence nicht verbauen.

## 5. Phase R1 - Documentation Source of Truth

**Status:** Done for active planning baseline

Hinweis: Die aktiven Planungsdokumente sind bereinigt. README/Projektbeschreibung bleiben als separates Follow-up offen, weil sie erst nach dem R2-Foundation-Plan sinnvoll finalisiert werden können.

**Ziel:** Die Dokumentation wird verlässlich, widerspruchsfrei und projektbezogen.

### In Scope

- Bestehende Produkt-Roadmaps prüfen und auf das neue Milestone-Modell abgleichen.
- `docs/concepts/CONCEPT_F*.md` als Legacy-Input behandeln und DocMan-spezifisch neu schreiben.
- Rewrite-Reihenfolge für Foundation-Konzepte festlegen.
- Mobile Capture als Produkt-Säule und querschnittliche Client-/Test-/Runtime-Regeln planen.
- F1 Project Structure neu schreiben.
- F10 Local Storage neu schreiben.
- F2 State Management neu schreiben.
- F3 Coding Conventions neu schreiben.
- F5 Error Handling neu schreiben.
- F11 API Integration neu schreiben.
- F12 Secure Storage neu schreiben.
- F4 Testing Strategy neu schreiben.
- F6 Environment Configuration neu schreiben.
- F7 Logging neu schreiben.
- F15 Mock Repository Blueprint neu schreiben.
- F13 Configuration Pages neu schreiben.
- F14 Form Field Catalog neu schreiben.
- F9 Legal / Privacy neu schreiben.
- F16 CI/CD Pipeline neu schreiben.
- F8 Distribution Readiness neu schreiben.
- F8b Review Access Strategy neu schreiben.
- Mobile-Capture-Scope in `docs/pillars/PILLAR_CAPTURE_INBOX.md` verankern.
- F18 Notifications, Failures and Observability neu erstellen.
- Produkt-Säulen unter `docs/pillars/` als eigene fachliche Bereiche definieren.
- Enterprise-/Governance-Säulen für QA, Observability, Security, Compliance, Release, Data Lifecycle, DX, UX, Support, Compatibility und Integrationsregeln definieren.
- Alte Produkt-Roadmaps und alten Refactoring-Plan löschen.
- Eine technische Foundation-Roadmap erstellen.
- README-/Projektbeschreibungs-Update als Follow-up erfassen.

### Out of Scope

- Feature-Implementation.
- UI-Redesign.
- Backend-Migration.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R1-D1 | Was passiert mit alten Foundation-Konzepten? | Entschieden: Konzept-Slots behalten, Inhalte DocMan-spezifisch neu schreiben; alte Inhalte sind nicht Source of Truth |
| R1-D2 | Bleiben alte P1 bis P7 Roadmaps aktiv? | Entschieden: Nein, alte Roadmaps gelöscht; Rebuild-Roadmap ist Source of Truth |

## 6. Phase R2 - Technical Foundation

**Status:** Proposed

**Ziel:** Der aktuelle Spike wird in eine saubere App-Basis überführt.

### In Scope

- App-Konfiguration statt harter URLs.
- Domain-Typen statt SDK-Typen in Interfaces.
- Eindeutige Dependency-Injection-Strategie.
- Lokale Persistenzstrategie.
- Sync-fähige IDs und Modellgrenzen für späteres Backend.
- Fehler- und Result-Modell.
- Notification-, Audit- und Observability-Grundmodell.
- Minimal sinnvolle Testbasis.
- Trennung von Mock-Screens und Produkt-Screens.

### Out of Scope

- Neue Produktfeatures.
- KI-Implementation.
- Mobile-Capture-Feature-Implementation.
- Vollständiger Sync.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R2-D1 | Wie wird die neue F1-Zielstruktur migriert? | Entschieden: Clean Rebuild neben dem Spike; Altbestand bleibt nur Design-/Fachreferenz |
| R2-D2 | Wie werden Fehler in Domain und UI modelliert? | Entschieden: typed Result/Failure plus UserNotifications, Telemetry, Audit und Correlation nach F18 |
| R2-D3 | Wie wird Mock-UI behandelt? | Entschieden: Legacy-App nur als Referenz; neue Mock-UI isoliert, synthetisch und nicht im Produktpfad |
| R2-D4 | Welche lokale Datenbank ist Zieltechnologie? | Entschieden: SQLite + Drift fuer strukturierte lokale Daten; Dateien und Secrets bleiben separat |
| R2-D5 | Wie funktionieren Auth/Pairing für Home Hub? | Entschieden: QR Pairing primaer, manueller Pairing-Code als Fallback; Cloud Identity spaeter optional |
| R2-D6 | Was ist das Security-/Privacy-Minimum? | Entschieden: Security-by-Design, sensible Datenklassen, Secure Storage, log-sparsam, E2EE-/Zero-Knowledge-faehig vorbereiten |

### Akzeptanzkriterien

- Projekt startet ohne Platzhalter-Konfiguration im Produktpfad.
- Domain importiert keine PocketBase-Typen.
- Tests referenzieren die echte App-Struktur.
- Dokumentierte Architektur entspricht dem Code.
- R2-Implementation folgt `docs/technical/R2_TECHNICAL_FOUNDATION_IMPLEMENTATION_PLAN.md`.

## 7. Phase R3 - Quality & Production Readiness

**Status:** Planned

**Ziel:** Der vorhandene Bestand wird testbar, wartbar und verlässlich genug, damit DocMan nicht wieder als Spike weiterwächst.

R3 ist keine Feature-Phase. Sie hebt die technische Basis auf ein Niveau, auf dem neue Produkt-Slices mit Vertrauen gebaut werden können: reproduzierbares Setup, saubere Quality Gates, klare Testpyramide, Fake-Repositories für App-Tests und Contract-Mocks für spätere Backend-Grenzen.

### In Scope

- Teststrategie aus F4 operationalisieren.
- Fake-Repository-Layer für Flutter, Riverpod und Domain-Use-Cases vorbereiten.
- Microcks-Contract-Mock-Setup für Home-Hub/Capture/Sync-Schnittstellen einplanen.
- Legacy-Flows aus dem Zielpfad entfernen, isolieren oder bewusst löschen.
- `flutter analyze` fuer den Zielpfad gruen bekommen; alte Legacy-Warnungen sind kein Produktqualitaetsziel.
- Setup-, Codegen- und Verify-Scripts für frische Checkouts anlegen.
- CI-/Quality-Gates aus F16 konkretisieren.
- Testfixtures ohne private oder sensible Echtdaten definieren.
- Produktionsreife Mindestkriterien für Security, Logging, Storage, Fehlerverhalten, Notifications, Audit und Observability prüfen.
- Compliance-/Legal-Minimum aus DSGVO/GDPR, sensiblen Datenklassen und späteren Apple/Google/Microsoft-Store-Anforderungen als nicht-blockierenden R3-Check verankern.
- Data-Lifecycle-Mindestregeln für Löschung, Backup-Vorbereitung, Migration und Recovery prüfen.

### Out of Scope

- Neue Produktfeatures.
- Vollständige Backend-Implementation.
- Vollständiger End-to-End-Testpark.
- KI/OCR-Implementation.
- App-Store-Release.
- vollständige rechtliche Prüfung für öffentliche Distribution.

### Zweistufige Teststrategie

| Stufe | Zweck | Verwendet für |
|---|---|---|
| Fake Repositories | schnelle, deterministische App-, Domain-, Provider- und Widget-Tests ohne Netzwerk | Flutter/Riverpod, lokale Milestone-Flows, Offline-Verhalten |
| Microcks / Contract Backend | stabile API-Verträge und Client-Integration gegen Home-Hub/Capture/Sync-Mocks | Mobile Capture Upload, Pairing, Sync, spätere Backend-Handoffs |

Fakes schützen App-Verhalten. Microcks schützt Schnittstellenverträge. Beide Ebenen sind notwendig, aber sie dürfen einander nicht ersetzen.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R3-D1 | Welche Legacy-Warnungen blockieren Production Readiness? | Entschieden: Nur der Zielpfad ist production-readiness-relevant; Legacy wird eingefroren, isoliert oder entfernt |
| R3-D2 | Wo liegen zentrale Testfixtures? | Entschieden: App-Fixtures unter `test/fixtures/`, API-/Microcks-Beispiele unter `contracts/` |
| R3-D3 | Welche API-Spec ist Contract-Quelle? | Entschieden: OpenAPI für Home-Hub/Capture/Sync, Microcks als Mock-/Contract-Runner |
| R3-D4 | Werden generierte Dateien committed? | Entschieden: Nein; Codegen-Artefakte werden ignoriert und per Bootstrap/Codegen/Verify reproduzierbar erzwungen |
| R3-D5 | Welche Quality Gates sind vor dem ersten Produkt-Slice verpflichtend? | Entschieden: Local Change Gate, R3 Foundation Gate und M2 Readiness Gate |

### Akzeptanzkriterien

- Frischer Checkout kann mit einem Bootstrap-Script in einen arbeitsfähigen Zustand gebracht werden.
- Codegen ist reproduzierbar dokumentiert und per Script ausführbar.
- Git enthält keine neuen generierten Dart-Artefakte wie `*.freezed.dart` oder `*.g.dart`.
- Verify-Script enthält die lokalen Mindestchecks.
- Neue Riverpod-/Domain-Logik ist mit Fake-Repositories testbar.
- API-Grenzen für Home Hub, Capture und Sync sind contract-testbar geplant.
- F18-Runtime-Readiness-Regeln für Failure, Notification, Audit, Telemetry und Redaction sind prüfbar.
- Compliance-/Legal-Minimum ist dokumentiert und widerspricht Security, Logging, Storage und Sync nicht.
- Data-Lifecycle-Risiken für Löschung, Backup, Restore und Migration sind als Milestone-Grenzen sichtbar.
- Zielpfad-Analyse ist gruen; Legacy leakt nicht mehr in Produktstart, Zielanalyse, Tests oder Builds.
- Verbleibender Legacy-Code ist eingefroren, isoliert oder zur Löschung/Migration getrackt.
- Keine Tests verwenden private Dokumente, echte Haushaltsdaten oder echte Secrets.

## 8. Phase R4 - Capture and Review Core

**Status:** Proposed

**Ziel:** Dokumente koennen mobil oder am Desktop erfasst, am Desktop geprueft, einer betroffenen Person zugeordnet und in Vorgängen/Records auffindbar abgelegt werden.

### In Scope

- Ein Haushalt.
- Betroffene Person / Haushaltsprofil je Dokument-Draft verpflichtend setzen.
- Personen-/Profilzuordnung fuer Vorgänge, Dokumente und Drafts vorbereiten.
- Vorgänge anlegen, bearbeiten, schließen.
- Subvorgänge in einem Hauptvorgang anlegen.
- Aus markierten Dokumenten eines Vorgangs einen Subvorgang bilden.
- Dokumente als Drafts erfassen.
- Drafts einem Vorgang zuordnen.
- Aufgabenübersicht und einfache Aufgaben mit Fälligkeitsdatum.
- einfache Reminder-Daten fuer fällige Aufgaben, Fristen und Ablaufdaten vorbereiten.
- Schnellzugriff auf wichtige Dokumente/Records.
- einfache externe Aktionslinks an Aufgaben oder Vorgängen vorbereiten.
- Mobile Foto-/Scan-Erfassung.
- Mobile lokale Upload-Queue.
- Minimaler Home-Hub-Upload in die Draft-Inbox.
- Optionale mobile Vorgangszuordnung über gecachte Liste offener Vorgänge.
- Lokale Suche.
- Lokale Persistenz.
- Klare leere, ladende und fehlerhafte Zustände.

### Out of Scope

- OAuth als Pflichtpfad.
- Multi-Tenant.
- Familienberechtigungen.
- Vollständige mobile Vorgangsverwaltung.
- Vollständiger Multi-Geräte-Sync.
- KI-Implementation.
- App-Store-Distribution.
- flexible Dokument-Mehrfachverlinkung mit Rollen.
- komplexe wiederkehrende Reminder, Kalenderintegration und Multi-Geräte-Push.
- automatische externe Portalaktionen oder gespeicherte Fremd-Credentials.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R4-D1 | Braucht der lokale Slice Login? | Entschieden: Kein Desktop-Login in M2; lokale Geraetegrenze plus Mobile/Home-Hub-Pairing, Identity spaeter vorbereitet |
| R4-D2 | Was ist die minimale Dokument-Erfassung? | Entschieden: Desktop-Dateiimport und Mobile Document Scan landen zuerst in der Draft-Inbox; direkte Vorgangszuordnung ist Komfortpfad |
| R4-D3 | Welche Suchtechnologie und Suchfelder sind fuer M2 relevant? | Entschieden: Search-Boundary mit lokalem SQLite/Drift/FTS5-Adapter; strukturierte Metadaten in M2, OCR-/semantische Suche später |
| R4-D4 | Wie wird Mobile mit dem Home Hub gekoppelt? | Entschieden fuer M2: QR Pairing primaer, manueller Code als Fallback; Details im R4-Handoff |
| R4-D5 | Heissen Vorgänge künftig Sammlungen? | Entschieden: Nein, Vorgang bleibt Prozess-/Kontextbegriff; Dokumente/Records bekommen eigenen UI-Bereich |
| R4-D6 | Gehören Subvorgänge in M2? | Entschieden: Ja, schlanker Start mit `parentCaseId`; Dokumente primär zugeordnet, keine flexible Mehrfachrollen-Anzeige |
| R4-D7 | Muss M2 Haushaltsprofile vorbereiten? | Entschieden: Ja, betroffene Person ist Pflicht; mehrpersonenfaehiges Zielmodell fuer R5/R6 |
| R4-D8 | Braucht M2 Aufgaben und Erinnerungen? | Entschieden: Ja, schlanker Start mit Aufgabenübersicht, Fälligkeit und Reminder-Daten; komplexe Push-/Kalenderintegration später |
| R4-D9 | Was bedeutet Notfallzugriff? | Entschieden: Schnellzugriff auf wichtige Dokumente/Records, nicht automatisch externe Berechtigung |
| R4-D10 | Wie verknüpft DocMan externe Apps/Websites? | Entschieden: manuelle externe Aktionslinks an Task/Vorgang zuerst; später auch Claim, Record, Profil und Dokument |
| R4-D11 | Was erzeugt Mobile beim Scannen und Hochladen? | Entschieden als Zielrichtung: PDF als Nutzerartefakt, Seitenbilder/Rohdaten als technische Artefakte; Home Hub kann Rohseiten in einem spaeteren Milestone dauerhaft uebernehmen |
| R4-D12 | Welche Scanner-Technologie erreicht die gewuenschte Qualitaet? | Vorlaeufig entschieden: native Plattform-Scanner, Android Google ML Kit Document Scanner und iOS VisionKit; finale Flutter-Bridge nach Qualitaets-Spike |
| R4-D13 | Wie wird Mobile Capture hochgeladen? | Entschieden: austauschbarer Upload-Strategy-Port; M2 API-proxied erlaubt, Zielpfad presigned/resumable via Home Hub und S3-kompatiblem Storage |
| R4-D14 | Welche Upload-Limits, Retry-/Resume- und Cleanup-Regeln gelten? | Entschieden: M2 mit ganzen Uploads, 25 Seiten/50 MB Startlimit, Retry ganzer Uploads, Idempotency, SHA-256 und lokaler Queue; resumable/multipart in spaeterem Milestone |
| R4-D15 | Wie sieht der Home-Hub-Capture-Vertrag aus? | Entschieden: OpenAPI/Microcks 3-Step-Vertrag `initiateCaptureUpload -> uploadCaptureBytes -> confirmCaptureUpload`, mit Idempotency, SHA-256, maschinenlesbaren Fehlern und Draft-Inbox-Fallback bei ungueltigem Kontext |
| R4-D16 | Wie viel Kontext darf Mobile Capture beim Scannen mitgeben? | Entschieden: betroffene Person, Vorgang und Notiz sind optional beim Upload; Mobile bleibt Capture-first, Draft-Inbox ist immer Fallback, mobile Vollverwaltung folgt spaeter |
| R4-D17 | Wie funktioniert der Draft-Inbox-Review am Desktop? | Entschieden: Inbox hat Entwürfe und die letzten 10 "zuletzt verarbeitet"; schnelle Korrektur und Zurück-in-Entwürfe sind erlaubt, Inbox bleibt aber kein zweites Archiv |
| R4-D18 | Welchen Desktop-Import-Umfang braucht M2? | Entschieden: Dateiauswahl und Drag & Drop fuer PDF/JPG/PNG; beide laufen ueber denselben Import-Strategy-Port, Dateien werden kopiert, gehasht und als Drafts angelegt |
| R4-D19 | Wie geht M2 mit moeglichen Duplikaten beim Import um? | Entschieden: Hash-basierte Warnung, kein stilles Blockieren; Nutzeroptionen sind "Bestehendes öffnen", "Beide behalten" und "Abbrechen" |
| R4-D20 | Welche Dokument-Metadaten und Vorschau braucht M2? | Entschieden: generisches Metadatenmodell mit Titel, Typ, betroffener Person, Datei, Quelle, Daten, Review-Status und Preview; optionale Felder fuer Absender, Datum, Betrag, Fälligkeit, Tags |
| R4-D21 | Wie erzeugt M2 Dokumentvorschauen? | Entschieden: asynchrone Preview-Generierung hinter `PreviewGenerationPort`; `pdfrx` als bevorzugter PDF-Adapter, Bildstrategie fuer JPG/PNG, mehrseitige PDF-Preview spaeter |
| R4-D22 | Welche Dokumenttypen gibt es in M2? | Entschieden: lockerer Dokumenttyp-Katalog ohne harte typspezifische Pflichtfelder; Typ steuert Anzeige, Filter, Suche und spaetere Vorschlaege, nicht Workflow-Zwang |
| R4-D23 | Welche Felder blockieren "Review abschließen"? | Entschieden: Datei, betroffene Person, Titel, Dokumenttyp und harte Review-Konflikte sind Pflicht; optionale Metadaten bleiben Hinweise bis Assisted Review sie vorschlaegt |

### Akzeptanzkriterien

- Nutzer kann einen Vorgang mit Dokumenten am Desktop vollständig verwalten.
- Nutzer kann in einem Vorgang einen leeren Subvorgang anlegen.
- Nutzer kann markierte Dokumente eines Vorgangs als neuen Subvorgang gruppieren, ohne Dateien zu duplizieren.
- Nutzer muss Dokumente/Drafts einer betroffenen Person / einem Haushaltsprofil zuordnen und kann diese Zuordnung später korrigieren.
- Nutzer sieht offene, bald fällige und überfällige Aufgaben in einer Übersicht.
- Nutzer kann wichtige Dokumente oder Records im Schnellzugriff markieren.
- Nutzer kann einen einfachen externen Aktionslink zu einer Aufgabe oder einem Vorgang öffnen, ohne dass DocMan Fremd-Credentials speichert.
- Mobile kann Dokumente offline erfassen und später hochladen.
- Mobile Scan verwendet native Plattform-Scanner oder einen sichtbar niedrigeren Fallback.
- Mobile Upload nutzt einen austauschbaren Upload-Port; API-proxied M2 und presigned/resumable Zielpfad teilen denselben fachlichen Vertrag.
- Desktop sieht mobile Uploads in einer Draft-Inbox.
- Direkte mobile Vorgangszuordnung funktioniert als optionaler Komfortpfad.
- Desktop-App bleibt ohne Netzwerk nutzbar.
- Keine sichtbaren Mock-Daten im Produktpfad.
- Persistenz über App-Neustart funktioniert.

## 9. Phase R5 - Assisted Review and Family Profiles

**Status:** Proposed

**Ziel:** Ordna reduziert manuelle Review-Arbeit durch OCR/Extraktionsvorschlaege und baut den Haushaltskontext aus.

### In Scope

- OCR-/Textextraktions-Slice fuer Draft Review.
- Vorschlaege fuer Titel, Absender, Datum, Betrag, Fälligkeit, Tags und Dokumenttyp.
- explizite Annahme/Ablehnung/Korrektur von Vorschlaegen.
- Mehrere Profile in einem Haushalt.
- Betroffene Person pro Dokument/Vorgang/Task sichtbar und korrigierbar machen.
- Profile wechseln, ohne Dokumentzuordnung implizit umzuschreiben.
- Kinderprofile ohne eigene Accounts.
- Gemeinsame Verwaltung von Kinderprofilen durch Erwachsene.
- Einfache Manager-/Kind-Beziehung.
- Partner-/Erwachsenenfreigabe fuer Sichtung und Bearbeitung.

### Out of Scope

- Vollständige Multi-Tenancy über mehrere Haushalte.
- Komplexe Rollenmatrix.
- Remote Sharing.
- stille automatische Dokumentablage ohne Review.
- lokale LLM-/Formularautomatisierung als Voraussetzung.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R5-D1 | Welche Profildaten sind sensibel? | Entschieden: Account Profile vs. Managed Profile, manuell bearbeitbare Profilfelder und Profil-Fakten, optionale Nachweisverknuepfung, Versicherungen als Beziehungen/Records; Sync/Verschluesselung in R6/M6 |
| R5-D2 | Brauchen Kinder eigene Accounts? | Nein für frühe Phasen |
| R5-D3 | Duerfen Erwachsene Kinderprofile gemeinsam bearbeiten? | Ja, als Zielmodell; Rechte exakt in R5/R6 definieren |
| R5-D4 | Wie werden Partnerdokumente geteilt? | Haushaltsrechte statt Dokumentkopien |
| R5-D5 | Welche Vorschlaege darf Assisted Review zuerst machen? | Titel, Typ, Datum, Absender, Betrag, Fälligkeit und Tags; betroffene Person nur vorschlagen, nie still setzen |

## 10. Phase R6 - Sync and Auth

**Status:** Proposed

**Ziel:** Daten können zwischen Geräten über ein generisches DocMan Sync Backend synchronisiert und Sessions sicher verwaltet werden.

### In Scope

- Auth-Flow.
- Session-Persistenz.
- Backend-agnostischer Sync-Status.
- Konfliktstrategie.
- Remote-Dateispeicher oder Sync-Dateipfad.
- Erste Betriebsform: Self-Hosted Home Hub.

### Out of Scope

- KI-gestützte automatische Dokumentverarbeitung.
- Vollständige Mandantenverwaltung für externe Haushalte.
- Öffentliche Sharing-Funktionen.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R6-D1 | Welche konkrete Backend-Implementierung trägt den Sync? | Technologie entschieden: ASP.NET Core Home Hub mit PostgreSQL, MinIO/S3 und OpenAPI/Microcks; Sync-Strategie und Konfliktprotokoll bleiben R6-Aufgabe |
| R6-D2 | Welche Daten werden remote synchronisiert? | Privacy-Klassen definieren |
| R6-D3 | Wie werden Konflikte gelöst? | Zunächst sichtbar machen, nicht still überschreiben |

## 11. Phase R7 - Extended Mobile

**Status:** Proposed

**Ziel:** Mobile wächst vom Capture-Kanal zu einer stärkeren Begleit-App.

### In Scope

- Batch-Scan.
- Vollständigere mobile Vorgangsansicht.
- Bessere mobile Suche und Filter.
- Mobile Korrektur von Metadaten.
- Weitere Offline-Sync-Funktionen.

### Out of Scope

- Desktop-Parität.
- KI-basierte automatische Entscheidungen.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R7-D1 | Bild oder PDF als primäres Scanformat? | PDF für mehrseitige Dokumente, Bild als Rohquelle prüfen |
| R7-D2 | Muss Mobile offline scannen können? | Ja, zumindest lokal queued |

## 12. Phase R8 - Structured Facts and Insights

**Status:** Proposed

**Ziel:** DocMan kann strukturierte Fakten aus Dokumenten, Records und Vorgängen erfassen, prüfen und später auswerten.

### In Scope

- Records/Nachweise und Dokumentversionen.
- Strukturierte Fakten aus Dokumenten.
- Financial Entries für Ausgaben, Erstattungen, Prämien, Rückzahlungen und Gutschriften.
- Claims für Erstattungen, Reklamationen, Garantien und Einreichungen.
- Fristen, Gültigkeiten und Ablaufdaten.
- Reminder-Quellen aus Facts, Claims, Records und Tasks.
- Erste lokale Auswertungen nach Zeitraum, Anbieter, Kategorie, Profil und Vorgang.

### Out of Scope

- Bankimport.
- Steuer- oder Buchhaltungsprodukt.
- automatische OCR-/LLM-Übernahme ohne Review.
- Managed Cloud Analytics.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R8-D1 | Welche Facts werden zuerst manuell erfasst? | Beträge, Fälligkeiten, Claims, Gültigkeiten |
| R8-D2 | Wie heißt `Record` in der deutschen UI? | Nachweis/Unterlage testen, `Record` als Code-Arbeitsbegriff |
| R8-D3 | Welche erste Auswertung ist milestone-nah? | Arztkosten/Erstattungen und Anbieter-Ausgaben als erste Verticals prüfen |

## 13. Phase R9 - Intelligence and Automation

**Status:** Deferred

**Ziel:** Ordna erweitert Assisted Review zu Automatisierung, Reprocessing und lokalen/self-hosted Intelligence-Jobs.

### In Scope

- robuste OCR-/Reprocessing-Pipeline.
- Auto-Tagging.
- lokale/self-hosted LLM-Integration.
- Vorschläge für nächsten Workflow-Schritt.
- Formular-Prefill.
- Job-Status, Audit und Fehlerdiagnose.

### Out of Scope

- Stille automatische Statusänderungen.
- KI als Voraussetzung für Kernflows.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R9-D1 | Lokale KI auf welchem Server? | Erst nach stabiler Dokumentenbasis und realer OCR-/LLM-Hardware entscheiden |
| R9-D2 | Automatisch oder manuell gestartet? | Vorschläge manuell bestätigbar machen |

## 14. Operations- und Enterprise-Readiness-Phasen

**Status:** Proposed

Diese Phasen werden als eigene Roadmap-Linien geführt, damit
Enterprise-Themen nicht als Nebenprodukt verschwinden. Die detaillierten
Subphasen stehen in
`docs/roadmap/PHASE_INDEX.md`; die Säulen-Slices stehen in
`docs/roadmap/PILLAR_ROADMAP_INDEX.md`.

| Phase | Ziel | Primäre Säulen |
|---|---|---|
| R10 Compliance & Distribution Readiness | öffentliche/private Distribution rechtlich und prozessual vorbereiten | Compliance/Legal, Release/Distribution, Compatibility |
| R11 Data Resilience & Operations | Backup, Restore, Retention, Storage Integrity und Recovery professionalisieren | Data Lifecycle, Admin/Settings, Observability |
| R12 Support & Governance | Diagnose, Support, Architektur-Governance und Issue-/Milestone-Prozess reifen | Support/Diagnostics, Developer Experience, QA |
| R13 Integrations & External Workflow Expansion | externe Links, Mail, Druck, Kalender, Portale und Importpfade kontrolliert ausbauen | Integration Governance, Export/Sharing/External Actions, Templates/Workflows |
| R14 Secure Sharing & Collaboration | sichere Freigaben, Redaction, Partner-/Haushaltskollaboration und Zugriffshistorie vorbereiten | Household Profiles/Access, Security/Privacy, Export/Sharing |
| R15 Advanced Platform & Productization | optionale größere Betriebsformen, Cloud-/Self-hosted-cloudartige Varianten und erweiterte Admin-/Ops-Fähigkeiten prüfen | Home Hub/Sync, Admin/Settings, Observability, Release/Distribution |

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R10-D1 | Wird DocMan zuerst privat, per direktem Download oder über Stores verteilt? | Privat/self-hosted zuerst; Apple/Google/Microsoft-Store-Regeln trotzdem vorbereiten |
| R10-D2 | Welche rechtliche Prüfung braucht DocMan vor öffentlicher Distribution? | Separate Prüfung vor Store/Public Release |
| R11-D1 | Welche Backup-/Restore-Strategie ist Minimum vor echtem Haushaltsbetrieb? | Lokales Backup plus Restore-Test vor Multi-Geräte-Sync |
| R12-D1 | Wie werden Support-/Diagnosepakete redigiert? | Redaction by default, keine Dokumentinhalte oder Secrets |
| R13-D1 | Welche externen Integrationen kommen zuerst? | Manuelle Links und Export zuerst; automatische Portalaktionen erst deutlich später |
| R14-D1 | Welche Freigaben sind sicher genug? | Zeitlich begrenzte, redigierbare Freigaben vor breitem Sharing |
| R15-D1 | Braucht Ordna je eine gehostete Betriebsform? | Nur optional; local-first und self-hosted bleiben Kernannahme |

## 15. Empfohlene erste Arbeitssequenz

```text
1. R2 Draft-Entscheidungen schließen
2. R2 Implementation-Plan schreiben
3. R2 implementieren und auditieren
4. R3 Quality & Production Readiness konkretisieren und umsetzen
5. R4 Capture and Review Core konzipieren
```

## 16. Nicht in den ersten Milestones bauen

Diese Themen sind wertvoll, aber aktuell zu früh:

- KI/OCR.
- Mobile Batch Scan.
- Vollständige Multi-Tenancy.
- App-Store-Distribution.
- große Auswertungs-Dashboards.
- automatische Fact-Extraktion.
- Kalenderintegration und komplexe wiederkehrende Reminder.
- automatische Einreichung in externe Portale.
- Vollständiges Rollen- und Berechtigungsmodell.

## 17. Entscheidungsregister

| ID | Thema | Status |
|---|---|---|
| R0-D0 | Produktname | Done |
| R0-D1 | Produktbegriff | Done |
| R0-D2 | State Management und DI | Done |
| R0-D3 | Local-first Datenfluss | Done |
| R0-D4 | Backend-Rolle / PocketBase | Draft fuer Gesamtrolle; Home-Hub-Technologie entschieden |
| R0-D5 | First Utility Scope | Done |
| R0-D6 | Workflow-Regeln | Done |
| R0-D7 | Intelligence Scope | Done |
| R0-D8 | Privacy-/Sync-Scope | Done |
| R1-D1 | Umgang mit alten Foundation-Konzepten | Done |
| R1-D2 | Alte Roadmaps | Done |
| R2-D1 | Projektstruktur-Migration | Done |
| R2-D2 | Fehler-, Notification- und Observability-Modell | Done |
| R2-D3 | Mock-UI-Strategie | Done |
| R2-D4 | Lokale Datenbank | Done |
| R2-D5 | Auth/Pairing | Done |
| R2-D6 | Security/Privacy Modell | Done |
| R3-D1 | Legacy-Warnungen und Production Readiness | Done |
| R3-D2 | Testfixtures | Done |
| R3-D3 | Contract-Quelle / Microcks | Done |
| R3-D4 | Generierte Dateien committen | Done |
| R3-D5 | Milestone Quality Gates | Done |
| R4-D1 | Lokaler Login | Done |
| R4-D2 | Minimale Dokument-Erfassung | Done |
| R4-D3 | Search-Boundary und Suchtechnologie | Done |
| R4-D5 | Vorgänge, Dokumente, Records und Fakten | Done |
| R4-D6 | Subvorgänge | Done |
| R4-D7 | Haushaltsprofile vorbereiten | Done |
| R4-D8 | Aufgaben und Erinnerungen | Done |
| R4-D9 | Schnellzugriff / Notfallzugriff | Done |
| R4-D10 | Externe App-/Website-Links | Done |
| R4-D11 | Mobile Scan Artifacts und Upload-Richtung | Done for target model |
| R4-D12 | Mobile Scanner Technology | Provisional done; spike required |
| R4-D13 | Mobile Capture Upload Strategy | Done |
| R4-D14 | Upload Limits, Retry, Resume and Cleanup | Done |
| R4-D15 | Home Hub Capture Contract | Done |
| R4-D16 | Mobile Capture Context Selection | Done |
| R4-D17 | Draft Inbox Review Workflow | Done |
| R4-D18 | Desktop Import Scope | Done |
| R4-D19 | Import Duplicate Detection | Done |
| R4-D20 | Document Metadata and Preview | Done |
| R4-D21 | Preview Generation Strategy | Done |
| R4-D22 | Document Type Catalog | Done |
| R4-D23 | Review Completion Validation | Done |
| R5-D0 | Haushaltsprofile und Zugriff | Done for target model |
| R5-D1 | Profildaten und Schutzklassen | Done; sync/encryption details deferred to R6/M6 |
| R6-D2 | Remote-Sync sensibler Daten | Done for first sync planning; revisit before full sync |
| R0-D10 | File Storage und Docker Stack | Done |
| R0-D11 | Home Hub Backend Technology | Done |
