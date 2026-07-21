---
title: "Mappm - Commercial Core Roadmap"
description: "Verbindliche Roadmap vom Spike zu einer verkaufbaren Local-/Cloud-Vault-Applikation"
tags: [roadmap, commercial-core, vault, cloud, product, planning]
lastUpdated: "2026-07-21"
version: "3.0"
status: "accepted-rebaseline"
owner: "product-concept"
---

# Mappm - Commercial Core Roadmap

## Status und Zuständigkeit

Diese Roadmap ist die verbindliche Übersicht über Release-Reihenfolge,
Entscheidungsstand und Gates. Sie enthält keine historische Home-Hub-Roadmap.
Frühere Roadmapstände bleiben ausschließlich über Git nachvollziehbar und
autorisieren keine Implementierung.

Die Dokumentzuständigkeiten sind getrennt:

- dieses Dokument: Commercial-Core-Gates, R-Slice-Zuordnung,
  Entscheidungsregister und Reihenfolge;
- `docs/roadmap/PHASE_INDEX.md`: fachliche R0-R15-Slices und Subphasen;
- `docs/roadmap/phases/`: geprüfte Implementation Contracts;
- `docs/roadmap/PILLAR_ROADMAP_INDEX.md`: zeitliche Säulen-Slices;
- `docs/pillars/`: dauerhafte Produkt- und Assurance-Verantwortung;
- `docs/execution/DECISION_TRACEABILITY_MATRIX.md`: detaillierte
  Entscheidungstraceability;
- `docs/discovery/OPEN_QUESTIONS_REGISTER.md`: offene und blockierende Fragen;
- `docs/ROADMAP_EXECUTION_PLAN.md`: GitHub-Milestones, Epics und Issues.

Ein Roadmap- oder Phase-Index-Eintrag ist keine Implementierungsfreigabe. Diese
entsteht erst durch einen geprüften und ausdrücklich freigegebenen Phase-as-
Implementation-Contract.

## Produktbaseline

Mappm ist eine klassische Client-/Managed-Service-Applikation mit zwei
expliziten Vault-Modi:

| Vault-Modus | Autorität | Lokaler Zustand | Normaler Zugang | Exit |
|---|---|---|---|---|
| Local Vault | Gerät | verschlüsselte Metadaten und Dateien | Mappm Account, Device Trust und Entitlement mit begrenzter Offline-Kontinuität | Detached Recovery, Export und Restore |
| Cloud Vault | Mappm Cloud | richtlinienbegrenzter Cache plus dauerhafte Pending Operations | Mappm Account, Device Trust und Entitlement | Export, Reaktivierung, verifizierte Cloud-to-Local-Migration und getrennte Löschung |

Core Assist ist Bestandteil des Commercial Core und bleibt von der
Vault-Autorität getrennt. Assist-Verarbeitung darf weder Cloud-Backup noch einen
Wechsel des Speicherorts implizieren. Die Local Development Cloud dient nur
Entwicklung und Integration mit synthetischen Daten. Customer Home Hub,
Tailscale-Pairing und kundenseitiges Self-hosting sind kein Produktmodus.

Der erste Release ist ein verkaufbarer Commercial Core mit wenigen
vollständigen Kernflows. Enthaltene Slices müssen sicher, datenschutzkonform,
barrierefrei, getestet, supportbar, aktualisierbar, verteilbar und betreibbar
sein. Spätere Funktionen bleiben geplant, werden aber nicht halb implementiert.

Normative Grundlagen:

- `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md`;
- `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`;
- `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`;
- `docs/technical/DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md`;
- `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`;
- `docs/technical/DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`;
- `docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`;
- `docs/concepts/CONCEPT_F36_VAULT_MODES_CLOUD_LIFECYCLE.md`.

## Commercial-Core-Release-Train

| Gate | Verbindliches Ergebnis | Exit-Kriterium |
|---|---|---|
| C0 Product and Trust Contract | Scope, Cloud-Timing, Vault-/Account-/Assist-Modell, Trust, Keys, Recovery, Pläne, Retention, Taxonomie und Workflow-Coverage entschieden | betroffene VC-, WF- und OQ-Fragen geschlossen oder mit Owner, Zielphase, Termin und zulässigem Nicht-Scope explizit verschoben |
| C1 Vault, Account and Provider Foundation | Clean Architecture, Account/Device/Entitlement für jeden normalen Modus, ausgewählte Provider, Secure Storage, Local-/Cloud-Autorität und Migrationszustände | deterministische Fakes und Zielpfad-Gates grün; keine Legacy-Authority-Leaks; betroffene VC-Gates geschlossen |
| C2 Capture, Core Assist and Review Vertical | globales Mobile-/Desktop-Capture, explizite Dokumentgrenzen, dauerhafte asynchrone Verarbeitung sowie Titel-, Typ-, Fact- und Routingvorschläge | Happy/Unhappy/Offline/Quota/Restart/Partial-Batch/A11y/Privacy für aktivierte Free/Paid- und Vault-Kombinationen grün; Verarbeitung ändert nie Vault-Autorität |
| C3 Document Core, Cases, Records, Search and Tasks | jedes akzeptierte Dokument besitzt einen primären Case oder Record; leichte Custom Cases, Beziehungen, kompakter Review, Suche, Aufgaben und Quick Access funktionieren | vollständige Kernflows, Custom-/Guided-Parität, Mehrfachbeziehungen, Korrektur und Wiederauffindbarkeit grün; keine Länderbehauptung ohne freigegebenes Pack |
| C4 Lifecycle and Commercial Safety | Local Export/Backup/Restore sowie bei aktiviertem Cloud Vault Backup, beide Migrationen, Entitlement/Grace, Reaktivierung und Löschung | anwendbare Restore-/Migrationsdrills und Entitlement-Matrix grün; nicht anwendbare Zeilen begründet dokumentiert |
| C5 Compliance, Operations and Release | CI/CD, Signing, Updates, Observability, Incident/Support, Store-, Rechts- und Regulatory-Gates sowie Katalog-Update/Withdrawal | reproduzierbarer Release Candidate; Quellenprüfung aktuell; jedes aktivierte Länder-/Workflow-Pack datiert freigegeben |
| C6 Closed Beta | genehmigte Beta-Daten, Support, SLO-Evidence, Rollback und Recovery unter realistischen Bedingungen geprüft | keine offenen P0/P1; Exit-, Wiederherstellungs- und Supportflows bestätigt |
| C7 Commercial 1.0 | verkaufbarer und betreibbarer Release mit eindeutigen Produktgrenzen | dokumentiertes Go/No-Go durch Product, Security, Privacy, Quality, Operations und Release |

## R0-R15 als aktuelle Slice-Struktur

R0-R15 bleiben stabile Traceability-IDs. Ihre Reihenfolge ist nicht automatisch
linear; ein C-Gate zieht nur die jeweils benötigten, freigegebenen Slices.

| R-Slice | Aktuelle Funktion | C-Gate-Zuordnung |
|---|---|---|
| R0 Product and Architecture Decisions | Produkt-, Trust-, Taxonomie-, Workflow- und Scope-Entscheidungen | C0 |
| R1 Documentation Source of Truth | Dokumentstruktur, Zuständigkeit und Traceability | C0-C1 |
| R2 Technical Foundation | Clean Architecture, Riverpod, Domain Ports, Local-/Secure-Storage-Grenzen | C1 |
| R3 Quality and Production Readiness Foundation | Fakes, Fixtures, Analyzer, Verify, CI-Baseline, Contract-Mocks | C1 und C5 |
| R4 Capture and Review Core | Capture, Processing, Review, Cases/Records, Suche, Tasks | C2-C3 |
| R5 Core Assist and Managed Subjects | Pflicht-Assist-Slices in C2/C3; Profile nach freigegebenem Scope | C2-C3 |
| R6 Cloud, Identity, Sync and Migration | Managed Cloud, Account/Device, Entitlements, Sync und Migration | C1 und C4 |
| R7 Extended Mobile | Mobile Review, Suche und erweiterte Batch-Ergonomie | nach C2/C3 oder ausdrücklich aktivierter Commercial-Core-Slice |
| R8 Facts, Claims, Catalog and Insights | Facts, Claims, Workflows, Abos, Steuer-/Medizin-Slices nur nach ihren Gates | C3 oder spätere aktivierte Slices |
| R9 Intelligence and Automation | C2/C3-Pflichtpipeline plus spätere qualitätsgegatete Advanced-Automation | C2-C3 und später |
| R10 Compliance, Legal and Distribution | datierte Rechts-/Store-Prüfung, Signing und Distribution | C5 |
| R11 Data Resilience and Operations | Local-/Cloud-Backup, Restore, Retention, Integrity und Cleanup | C4-C5 |
| R12 Support, Diagnostics and Governance | redigierte Diagnose, Support und Architektur-Audits | C5-C7 |
| R13 Integrations and External Actions | Mail, Druck, Kalender, Portale und weitere Importpfade | später oder ausdrücklich aktiviert |
| R14 Secure Sharing and Collaboration | Exportpakete, zeitlich begrenzte Freigaben und Kollaboration | nach C4/C5 und eigener Trust-Entscheidung |
| R15 Managed-Service Productization | Skalierung, Admin/Ops, Observability und Upgrades der verwalteten Cloud | C5 und nach Commercial 1.0; kein Customer-Self-hosting-Slice |

Die genaue Subphasenstruktur steht ausschließlich in
`docs/roadmap/PHASE_INDEX.md`.

## Säulenrouting

Produkt-Slices werden aus den Produkt- und Plattform-Säulen gezogen:

- Capture & Inbox;
- Cases, Records und Dokumente;
- Verträge und Abonnements;
- Aufgaben, Erinnerungen, Agenda und Quick Access;
- Search, Facts und Insights;
- Export, Sharing und External Actions;
- Managed Subjects und Access;
- Templates und Workflows;
- Cloud, Identity und Sync;
- Intelligence und Automation;
- Admin, Settings und Storage Health.

Jeder Slice aktiviert zusätzlich die anwendbaren Assurance Tracks für Quality,
Security/Privacy, Data Lifecycle, Compliance, Release, Operations,
Observability, Support, Accessibility, Plattformkompatibilität und
Architektur-Governance. Die vollständige Landkarte steht in
`docs/pillars/PILLAR_INDEX.md`.

## Entscheidungsregister

| Thema | Status | Owning Artifact | Nächster Gate |
|---|---|---|---|
| Produktname `Mappm`, technischer Workspace vorerst `docman` | accepted | `DECISION_PRODUCT_NAME.md` | Package-/Store-Migration vor Distribution |
| Verkaufbarer Commercial Core statt Prototyp-MVP | accepted | `DECISION_COMMERCIAL_CORE_SCOPE.md` | C0-C7 |
| Commercial 1.0 Oesterreich-first; deutschsprachiger Raum als naechste geplante Expansion | accepted/planned | `DECISION_COMMERCIAL_CORE_SCOPE.md` | WF-01 fuer exakten AT-Scope; WF-03 vor erstem post-oesterreichischen Marktclaim |
| Local-/Cloud-Vault-Autorität, Migration und Kündigungsmodell | accepted/open-details | `DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` | VC-01, VC-04 bis VC-07 |
| Account, Device Trust und Entitlement in jedem normalen Modus | accepted/open-details | `DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`, `DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md` | VC-03, VC-08 |
| Managed Mappm Cloud mit ASP.NET Core, PostgreSQL und S3-kompatiblem Storage | accepted-rebaseline | `DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md` | C1 Contract-/Backend-Slices |
| SQLite/Drift, separater File Store und Secure-Storage-Grenze | accepted/open-key-details | `DECISION_LOCAL_DATABASE.md`, F10, F12 | VC-07 vor Local-Datenimplementierung |
| Riverpod und Domain-Ports statt neuer BLoC/GetIt-/SDK-Kopplung | accepted | F1, F2, State-/Repository-Decisions | C1 |
| Ein generischer Case mit typisierten `CaseLink`-Beziehungen | accepted | `DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md` | C3 |
| Genau ein Owning Subkonzept ab Beginn jedes dedizierten Case-Familienworkshops; keine leeren Stubs fuer reine Katalogkandidaten; Katalog bleibt SSOT fuer ID/Status/Coverage, Subkonzept fuer Verhalten | accepted-governance/open-coverage | `DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` | Medical abgedeckt; Unfall/Schaden als naechstes, weitere Familien vor fachlicher Akzeptanz/Implementierung |
| Minimal ausreichende Dokumentklassifikation: Grundart, Variante, Domain, Record-Art, Quelle und Linkrolle getrennt; Details ohne dauerhaften oder verhaltensaendernden Produktwert bleiben Titel/Alias/Fact/Rolle oder generischer Typ | accepted-taxonomy/open-catalog | `DECISION_DOCUMENT_TYPE_CATALOG.md` | OQ-011/R0.6 mit Produktwerttest je Kandidat und Case-Familie |
| Globales Capture, asynchrone Assist-Verarbeitung und verpflichtende Titelvorschläge | accepted-direction | `DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md` | C2 |
| Mobile Scan/Foto/Galerie/Datei sowie Desktop Picker/Drag-and-drop; keine Desktop-Webcam-Scans | accepted | `DECISION_DOCUMENT_CAPTURE.md`, `DECISION_DESKTOP_IMPORT_SCOPE.md` | C2 |
| Smartphone-zu-Desktop-Capture, Local-to-Local-Handoff und macOS Continuity Camera | draft | `DECISION_CROSS_DEVICE_CAPTURE_HANDOFF.md` | OQ-013 vor jeder Implementierungsphase; blockiert Core-Capture nicht |
| Kuratierte, versionierte Country-/Provider-Packs statt hardcodierter Länderlogik | accepted-direction/open-schema | `DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md` | WF-01/WF-02 fuer AT, WF-03 fuer Expansion und R0.6 |
| Medizinischer Care-Anker, `part_of`-Kostenabrechnung je Verpflichtung, Payer-Claims, dokumentweises Matching mit einem Ankerdokument je neuem Medical-Subcase, stets gueltige dokumentunabhaengige Cases, getrennte Zahlungs-/Claim-Zustaende, Wiederkehr, Payer-Defaults ohne Deckungsberechnung, generische Sonderformulare und optionaler case-lokaler Desktop-Medienarchiv-Randfall | accepted-core | `DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`, `DECISION_CASE_DOCUMENT_RECORD_MODEL.md`, `DECISION_DESKTOP_IMPORT_SCOPE.md` | OQ-012 geschlossen; keine freie Medical-Mehrfachabspaltung in M1; Medienarchiv nur bei M1-Aktivierung in R8.12; WF-01/WF-02 nur fuer konkrete AT-Provider-Claims |
| Managed Persons und optionale Organizations | accepted-direction/open-release-scope | `DECISION_MANAGED_SUBJECTS_BUSINESS_CONTEXTS.md` | OQ-009 |
| Verträge/Abos als langlebige Record-Kontexte | accepted-direction | `DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md` | R8.9-Scope-Review |
| Steuer als ländergebundene Dokumentensammlung, nicht Buchhaltung/Beratung | accepted-direction/open-pack-scope | `DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md` | OQ-010/WF-02 |
| Typisierte Zeit-Facts, Ereignisse, Termine, Fristen, Aufgaben und Reminder statt eines universellen Dokumentdatums | accepted-direction | `DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md` | C2/C3 Domain-/Contract-Slices; externe Kalender erst R13.3 |
| Erste implementierungsreife Phase R3.5 | proposed, nicht freigegeben | `docs/roadmap/phases/R3_5_TARGET_PATH_QUALITY_BASELINE.md` | ausdrückliche User-Freigabe |

Vollständige Zeilen und Querverweise stehen in
`docs/execution/DECISION_TRACEABILITY_MATRIX.md`.

## Offene Gates

`docs/discovery/OPEN_QUESTIONS_REGISTER.md` ist die einzige Liste offener
Produktfragen. Besonders relevant sind:

- VC-01 bis VC-08 für Cloud-Timing, Trust, Pläne, Grace, Cache, Keys, Recovery
  und Identity;
- WF-01/WF-02 fuer die exakte oesterreichische Workflow-Coverage und fachliche
  Betriebsverantwortung;
- WF-03 fuer Rechtsraeume und Reihenfolge der geplanten deutschsprachigen
  Expansion nach Oesterreich;
- OQ-009 für Organization-/Business-Scope;
- OQ-010 für Steuerpakete;
- OQ-011 für Case-/Dokument-/Workflow-Taxonomie;
- OQ-013 fuer noch nicht freigegebene Smartphone-/Continuity-/Local-to-Local-
  Capture-Uebergabe.

Eine offene Frage darf nur verschoben werden, wenn Owner, Grund, zulässiger
Nicht-Scope, Zielphase, Re-Check-Trigger und Datum dokumentiert sind. Code,
Contracts oder UI dürfen keine offene Frage implizit entscheiden.

## Verbindliche Planungsregel

Jede implementierbare Phase muss Ziel, Scope, Non-Goals, User Flow,
Desktop-/Mobile-Struktur soweit anwendbar, Zustände, Interaktionen,
Abhängigkeiten, Daten-/Contract-Grenzen, Security/Privacy, Accessibility,
Lokalisierung, Fehlerverhalten, Tests, Verification, Stop Rules und Handoff
definieren. Frontend- und Backend-Implementation bleiben getrennte Issues.
Frontend darf Backend-Bedarf beschreiben; Contract-/Backend-Owner entscheiden
DTOs, Endpunkte, Mapping, Persistence und Policy-Architektur.

Spätere Pflichtbereiche wie Store, CI/CD, Security, Privacy, AI, Sync, Backup,
Sharing, Support und Commercial bleiben in Roadmap und Phasenabhängigkeiten
sichtbar, auch wenn ihre Implementierung erst später möglich ist.

## Nächste Sequenz

1. R3.5 nur nach ausdrücklicher Freigabe als unabhängigen Quality-Slice
   umsetzen.
2. R0.6 und die betroffenen C0-Trust-/Commercial-Fragen mit dem User schließen.
3. C1 Provider-, Account-, Vault-, Secure-Storage- und Contract-Foundation
   phasenweise planen und implementieren.
4. C2 Capture/Core-Assist/Review als vollständigen Vertical Slice liefern.
5. C3 Cases/Records/Search/Tasks und aktivierte Fachvorlagen vervollständigen.
6. C4 Lifecycle-/Recovery-/Commercial-Safety für alle aktivierten Vault-Modi
   nachweisen.
7. C5 Release, Compliance, Operations und Support schließen.
8. C6 Beta durchführen und C7 nur nach dokumentiertem Go/No-Go freigeben.

## Stop Rules

Planung oder Implementierung stoppen, wenn:

- eine historische Home-Hub-, Pairing-, accountfreie oder universell
  local-first Annahme wieder als Zielmodell erscheint;
- ein R-Slice oder GitHub-Milestone als Implementierungsfreigabe behandelt wird;
- eine betroffene offene Frage ohne dokumentierte Entscheidung beantwortet wird;
- Core Assist still in einen späteren optionalen AI-Slice verschoben wird;
- Customer Self-hosting als aktiver Produktmodus geplant wird;
- eine Phase Security, Privacy, Accessibility, Tests, Operations, Support,
  Store/Distribution oder Data Lifecycle nur auf einen späteren Hardening-Block
  abschiebt;
- Frontend-Issues Backend-Contracts, DTOs, Endpunkte, Mapping, Persistence oder
  Policy-Architektur festlegen;
- Länder-, Steuer-, Medizin- oder Versicherungsbehauptungen ohne datiertes,
  freigegebenes Pack implementiert oder beworben werden.
