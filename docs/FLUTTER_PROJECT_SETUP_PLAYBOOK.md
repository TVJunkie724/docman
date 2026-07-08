---
title: "Flutter Project Setup Playbook"
description: "Allgemeines Playbook fuer zukuenftige Agents zum Aufsetzen production-ready Flutter-Projekte mit verbindlicher Projektstruktur, Dokumentationsstruktur, F-Konzepten, Roadmaps, Phasen und Skill-Rollen"
tags: [flutter, playbook, project-setup, architecture, governance, quality, frontend, agents]
lastUpdated: "2026-07-08"
status: "draft"
---

# Flutter Project Setup Playbook

## 1. Zweck

Dieses Playbook gibt zukuenftigen Agents vor, wie ein neues Flutter-Projekt
aufgesetzt wird, damit Projektstruktur, Dokumentationsstruktur,
Konzeptlandschaft, Roadmaps, Phasen, Skills und Quality Gates von Anfang an
production-ready und enterprise-grade sind.

Es ist allgemein gehalten und nicht an ein bestimmtes Produkt gebunden. Jedes
neue Projekt muss die hier beschriebenen Strukturen auf seine Domain,
Plattformen, Datenschutzanforderungen, Backend-Grenzen und Release-Ziele
adaptieren.

Das Playbook ist kein UI-Styleguide und kein Flutter-Tutorial. Es definiert die
Arbeitsweise, Dokumentationsstruktur, Konzeptfamilien, Quality Gates,
Skill-Rollen und Stop-Regeln, bevor Feature-Implementation beginnt.

Agenten muessen dieses Playbook als Setup-Vertrag behandeln. Wenn ein neues
Projekt davon abweicht, muss die Abweichung explizit dokumentiert und begruendet
werden.

## 2. Grundprinzip

Ein produktionsrelevantes Flutter-Projekt braucht zuerst klare
Planungsartefakte, dann Code.

Der Standardfluss ist:

```text
Product Direction
  -> Decisions
  -> Pillars
  -> Cross-cutting Concepts
  -> Design-System Concepts
  -> Roadmap Phase as Implementation Contract
  -> Architect Plan
  -> Plan Review
  -> Builder Implementation
  -> Auditor Evidence Review
  -> Issue / Roadmap / Docs Closeout
```

Keine production-relevante UI, Plattform-, Backend- oder Datenarbeit startet
ohne freigegebenes Konzept oder eine freigegebene Phase. Eine Phase ist kein
grober Epic-Text, sondern ein Implementation Contract.

## 3. Zielbild

Ein neues Flutter-Projekt hat nach dem Setup:

- projekt-lokale Skills unter `.codex/skills/`.
- ein Project Overview als zentrale Produktorientierung.
- ein Decision-Register mit akzeptierten und offenen Entscheidungen.
- Pillar-Dokumente fuer Produkt-, Plattform- und Governance-Saeulen.
- Cross-cutting Frontend/Foundation-Konzepte.
- Design-System-Konzepte als SSOT fuer sichtbare UI.
- Roadmap-Phasen als Implementation Contracts.
- GitHub Issues als Source of Truth fuer actionable Arbeit.
- klare Clean-Architecture-Grenzen.
- Test-, Build-, Codegen- und Review-Gates.
- synthetische, privacy-safe Fixtures und Demo-Daten.
- klare Stop-Regeln fuer Agenten und Entwickler.

## 4. Empfohlene Repository-Struktur

```text
project/
├── .codex/
│   └── skills/
├── docs/
│   ├── PROJECT_OVERVIEW_GUIDE.md
│   ├── ROADMAP_REBUILD.md
│   ├── ROADMAP_EXECUTION_PLAN.md
│   ├── concepts/
│   ├── design-system/
│   │   ├── README.md
│   │   └── concepts/
│   ├── pillars/
│   ├── roadmap/
│   │   ├── PHASE_INDEX.md
│   │   ├── PILLAR_ROADMAP_INDEX.md
│   │   └── phases/
│   └── technical/
│       └── DECISION_*.md
├── lib/
│   ├── app/
│   ├── core/
│   ├── domain/
│   ├── data/
│   └── presentation/
├── test/
├── integration_test/
└── scripts/
    ├── bootstrap.sh
    ├── codegen.sh
    └── verify.sh
```

Regeln:

- `docs/technical/DECISION_*.md` enthaelt Entscheidungen, nicht Issues.
- `docs/concepts/` enthaelt querschnittliche Regeln.
- `docs/design-system/concepts/` enthaelt visuelle und UI-System-Regeln.
- `docs/pillars/` enthaelt fachliche und Governance-Saeulen.
- `docs/roadmap/phases/` enthaelt implementation-faehige Phasen.
- `.codex/skills/` enthaelt projekt-lokale Rollenvertraege.

## 4.1 Minimales Dokumentations-Bootstrap

Ein neues Projekt soll mindestens diese Dateien anlegen, bevor production-
relevante Implementation startet:

```text
docs/
├── PROJECT_OVERVIEW_GUIDE.md
├── ROADMAP_REBUILD.md
├── ROADMAP_EXECUTION_PLAN.md
├── concepts/
│   ├── CONCEPT_F1_PROJECT_STRUCTURE.md
│   ├── CONCEPT_F2_STATE_MANAGEMENT.md
│   ├── CONCEPT_F3_CODING_CONVENTIONS.md
│   ├── CONCEPT_F4_TESTING_STRATEGY.md
│   ├── CONCEPT_F5_ERROR_HANDLING.md
│   ├── CONCEPT_F6_ENVIRONMENT_CONFIGURATION.md
│   ├── CONCEPT_F7_LOGGING.md
│   ├── CONCEPT_F8_DISTRIBUTION_COMPLIANCE.md
│   ├── CONCEPT_F8B_REVIEW_ACCESS_STRATEGY.md
│   ├── CONCEPT_F9_LEGAL_PRIVACY.md
│   ├── CONCEPT_F10_LOCAL_STORAGE.md
│   ├── CONCEPT_F11_API_INTEGRATION.md
│   ├── CONCEPT_F12_SECURE_STORAGE.md
│   ├── CONCEPT_F13_CONFIGURATION_SURFACES.md
│   ├── CONCEPT_F14_FORM_FAMILY.md
│   ├── CONCEPT_F15_MOCK_REPOSITORY.md
│   ├── CONCEPT_F16_CI_CD_QUALITY_GATES.md
│   ├── CONCEPT_F17_PLATFORM_MOBILE_STANDARDS.md
│   ├── CONCEPT_F18_NOTIFICATIONS_FAILURES_OBSERVABILITY.md
│   └── CONCEPT_F19_DESIGN_SYSTEM_GOVERNANCE.md
├── design-system/
│   ├── README.md
│   └── concepts/
│       ├── DS-00_DESIGN_SYSTEM_UMBRELLA.md
│       ├── DS-01_FOUNDATIONS_AND_TOKENS.md
│       ├── DS-02_LAYOUT_AND_SHELL.md
│       ├── DS-03_CORPORATE_DESIGN.md
│       ├── DS-04_COMPONENT_SYSTEM.md
│       ├── DS-05_PRODUCT_PATTERNS.md
│       ├── DS-06_ACCESSIBILITY_AND_QUALITY_GATES.md
│       └── DS-07_PLATFORM_ADAPTATION.md
├── pillars/
│   └── PILLAR_INDEX.md
├── roadmap/
│   ├── PHASE_INDEX.md
│   ├── PILLAR_ROADMAP_INDEX.md
│   └── phases/
└── technical/
    └── DECISION_000_TEMPLATE.md
```

Die Nummern duerfen projektweise erweitert werden, aber nicht zufaellig
umgedeutet werden. Wenn ein Projekt andere Namen nutzt, muss es im
Project Overview ein Mapping geben.

## 5. Skill-System

Projekt-lokale Skills beschreiben Rollen, nicht lose Hinweise. Sie muessen so
geschrieben sein, dass Agenten wiederholbar arbeiten koennen.

Minimaler Skill-Satz:

| Skill | Aufgabe |
|---|---|
| `onboarding` | Projektstruktur, Zielarchitektur, Legacy, Verifikation und Grenzen lesen |
| `git-safety` | Branching, Pull, Merge, Staging, Commit, Push und Konfliktregeln |
| `github-issue` | Issues, Epics, Labels, Milestones und Follow-up-Regeln |
| `product-concept` | Produktstrategie, Roadmap, Decisions und Pillars |
| `ui-concept` | Frontend-Konzepte, Phasen, UI-Zielbild und Handoffs |
| `ui-concept-review` | Review von Konzepten auf Vollstaendigkeit und Umsetzbarkeit |
| `ui-architect` | Code-naher UI-Implementation-Plan aus approved Konzept/Phase |
| `ui-plan-review` | Review des UI-Plans vor Implementation |
| `ui-builder` | Implementation exakt nach approved Plan |
| `ui-auditor` | Evidenzbasierte Pruefung nach Implementation |
| `ui-audit-review` | Review des Audits und Closeout |
| `ui-debugger` | Reproduktion, Diagnose und Fix-Plan fuer UI-Probleme |
| `ui-mocker` | isolierte visuelle/interactive Mocks ohne Produktpersistenz |
| `frontend-error-handling` | user-safe Fehler, Reference Codes, Diagnostics, Logging, Retry, Mock-Fehler |
| `frontend-test-coverage` | H/U/E-Testplanung, Fake-/Provider-/Widget-/Contract-Coverage |
| `data-architect` | lokale Daten, Repository Interfaces, Migrationsstrategie |
| `contract-api` | OpenAPI/Contract/Mock Backend/API-Handoffs |
| `foundation-builder` | Bootstrap, State/DI, Codegen, Scripts, Foundation |
| `quality-readiness` | Tests, Fakes, Fixtures, CI, Analyzer, Release Gates |

Optional je nach Projekt:

- `backend-architect`
- `backend-builder`
- `backend-auditor`
- `backend-debugger`
- `ops-architect`
- `ai-architect`
- `ai-builder`
- `contract-guardian`
- backend-spezifische `error-handling` / `test-coverage` Skills, falls die
  Frontend-Skills nicht reichen.

Skill-Regeln:

- Skills sind projekt-lokal und werden committed.
- Namen brauchen keinen Projekt-Prefix.
- Jeder Skill hat klare Boundaries: was er darf und was nicht.
- Builder-Skills duerfen nicht ohne approved Plan arbeiten.
- Auditor-Skills pruefen gegen Plan, Tests, Architekturgrenzen und DoD.
- GitHub-Issue-Skills erzwingen getrennte Frontend-/Backend-Implementation-
  Issues und verlinkte Folgeissues, wenn mehrere Owner betroffen sind.

## 6. Clean Architecture

Empfohlene Flutter-Grenze:

```text
Presentation -> Domain -> Data
```

Regeln:

- `presentation/` darf Domain Entities und Repository Interfaces verwenden.
- `presentation/` importiert nicht direkt aus `data/`.
- `domain/` kennt keine Flutter Widgets, HTTP Clients, Datenbanken oder
  konkrete Storage-Technologien.
- `data/` implementiert Domain Repository Interfaces.
- State Provider rufen keine Datenbank, Dateiablage oder HTTP Clients direkt.
- Infrastruktur-Details bleiben hinter Ports, Adaptern oder Repository
  Implementierungen.

Empfohlene State-/DI-Richtung fuer neue Projekte:

- Riverpod fuer State Management und Dependency Injection.
- Feature State ueber Notifier, AsyncNotifier, StreamProvider oder generierte
  Provider.
- Screens beobachten Provider.
- Child Widgets erhalten Daten und Callbacks ueber Konstruktoren.
- Business Logic gehoert nicht in `build()`.
- Lokaler Widget-State bleibt fuer Controller, Fokus, Scroll und Animationen.

## 7. Decision-System

Vor produktiver Implementation muessen die wichtigsten Entscheidungen
dokumentiert sein.

Minimaler Decision-Satz:

- Produktname und Produktsprache.
- Zielplattformen: Desktop, Mobile, Web, Companion-Modus.
- State Management und DI.
- lokale Datenstrategie.
- Datei-/Blob-Storage, falls relevant.
- Secure Storage und Secrets.
- Backend-Rolle: local-only, self-hosted, managed cloud, hybrid.
- API-/Contract-Strategie.
- Auth/Identity/Pairing.
- Privacy und Datenklassifikation.
- Logging, Diagnostics und Observability.
- Test Fixtures und Echtdatenverbot.
- Codegen Artifact Policy.
- Quality Gates und Release Gates.
- Distribution-/Store-Strategie.
- Design-System-Governance.
- AI/OCR/Processing Boundary, falls relevant.
- Sync/Backup/Sharing Boundary, falls relevant.

Decision-Regeln:

- Entscheidungen leben in `docs/technical/DECISION_*.md`.
- Jede Decision hat Status: `draft`, `proposed`, `accepted`, `deprecated`.
- Offene Fragen duerfen nicht in Implementation versteckt werden.
- Issues koennen Follow-ups tracken, ersetzen aber keine Decisions.

## 8. Konzeptfamilien

### 8.1 Cross-Cutting Frontend/Foundation Concepts

Diese Konzepte definieren Regeln, die fuer viele oder alle Features gelten.

Empfohlene Grundliste:

| Datei | Konzept | Zweck |
|---|---|---|
| `CONCEPT_F1_PROJECT_STRUCTURE.md` | Project Structure | Ordner, Ownership, Import-Grenzen |
| `CONCEPT_F2_STATE_MANAGEMENT.md` | State Management | Provider, State Ownership, async/error/empty handling |
| `CONCEPT_F3_CODING_CONVENTIONS.md` | Coding Conventions | Naming, Dateistruktur, Immutability, Linting |
| `CONCEPT_F4_TESTING_STRATEGY.md` | Testing Strategy | Unit, Widget, Golden, Integration, Fakes, Fixtures |
| `CONCEPT_F5_ERROR_HANDLING.md` | Error Handling | User Messages, Technical Errors, Reference Codes |
| `CONCEPT_F6_ENVIRONMENT_CONFIGURATION.md` | Environment Configuration | Build Modes, Config, Feature Flags |
| `CONCEPT_F7_LOGGING.md` | Logging | Privacy-safe Logs, Diagnostics, Redaction |
| `CONCEPT_F8_DISTRIBUTION_COMPLIANCE.md` | Distribution Compliance | Store, Packaging, Permissions, Review Gates |
| `CONCEPT_F8B_REVIEW_ACCESS_STRATEGY.md` | Review Access | Demo Accounts, Review Data, Test Modes |
| `CONCEPT_F9_LEGAL_PRIVACY.md` | Legal / Privacy | Datenschutz, Consent, Export, Delete, DSAR |
| `CONCEPT_F10_LOCAL_STORAGE.md` | Local Storage | DB, File Store, Migrations, Backup Readiness |
| `CONCEPT_F11_API_INTEGRATION.md` | API Integration | Clients, Contracts, Auth, Retry, Offline Behavior |
| `CONCEPT_F12_SECURE_STORAGE.md` | Secure Storage | Tokens, Secrets, Keychain/Keystore, Rotation |
| `CONCEPT_F13_CONFIGURATION_SURFACES.md` | Configuration Surfaces | Settings, Admin, Preferences |
| `CONCEPT_F14_FORM_FAMILY.md` | Form Family | Form Patterns, Validation, Dirty State |
| `CONCEPT_F15_MOCK_REPOSITORY.md` | Mock Repository | Fake Data, Mock Contracts, Isolation |
| `CONCEPT_F16_CI_CD_QUALITY_GATES.md` | CI/CD Pipeline | Build, Verify, Codegen, Release Gates |
| `CONCEPT_F17_PLATFORM_MOBILE_STANDARDS.md` | Mobile/Platform Standards | Capture, Permissions, Narrow Layout |
| `CONCEPT_F18_NOTIFICATIONS_FAILURES_OBSERVABILITY.md` | Notifications / Failures / Observability | Async Feedback, Recovery, Support |
| `CONCEPT_F19_DESIGN_SYSTEM_GOVERNANCE.md` | Design-System Governance | DS Ownership, Component Approval |

Jedes Konzept muss enthalten:

- Status.
- Scope.
- Non-Goals.
- Ownership.
- Regeln.
- Edge Cases.
- Security/Privacy.
- Accessibility.
- Testing.
- Verification.
- Stop Rules.
- Handoff-Ziel.

### 8.2 Design-System Concepts

Design-System-Konzepte sind Source of Truth fuer sichtbare UI.

Empfohlene Struktur:

| Konzept | Zweck |
|---|---|
| DS-00 Umbrella | Governance, Struktur, SSOT-Regeln |
| DS-01 Foundations and Tokens | Farben, Typografie, Spacing, Radius, Elevation |
| DS-02 Layout and Shell | App Shell, Navigation, Responsive Layout |
| DS-03 Corporate Design | Marke, Tonalitaet, Logo, App Icon |
| DS-04 Component System | Buttons, Inputs, Lists, Cards, Tables, Feedback |
| DS-04-Form Family | Form Anatomy, Validation, Pickers, File Controls |
| DS-05 Product Patterns | Workspaces, Review, Detail, Empty, Onboarding |
| DS-06 Accessibility and Quality Gates | Contrast, Semantics, Focus, Motion, Visual QA |
| DS-07 Platform Adaptation | Desktop, Mobile, Web, Keyboard, Touch |

Regeln:

- Produktseiten duerfen keine lokalen Komponentenvarianten erfinden.
- Neue visuelle Patterns brauchen DS-Owner oder explizite Ausnahme.
- Desktop und Mobile/Narrow werden gemeinsam geplant.
- UI-Text, Fehler, Empty States und Loading States gehoeren zum Konzept.
- Accessibility und Visual QA sind Pflicht, nicht Polishing.

## 9. Pillars

Pillars strukturieren Produkt- und Governance-Bereiche. Sie sind keine
Implementationsaufgaben, sondern dauerhafte Verantwortungsraeume.

Typische Product Pillars:

- Onboarding / Account / Identity.
- Dashboard / Home.
- Core Workspace.
- Capture / Intake / Import.
- Records / Documents / Content.
- Tasks / Reminders / Workflow.
- Search / Insights / Reporting.
- Profiles / Teams / Permissions.
- Export / Sharing / External Actions.
- Settings / Admin / Storage Health.

Typische Platform/Governance Pillars:

- Backend / Sync / API.
- Intelligence / Automation.
- Security / Privacy.
- Compliance / Legal.
- Quality Assurance.
- Observability / Runtime Operations.
- Release / Distribution.
- Data Lifecycle / Backup / Restore.
- Developer Experience.
- Design System / UX Governance.
- Support / Diagnostics.
- Platform Compatibility.
- Integration Governance.

Pillar-Regeln:

- Jeder Pillar hat Zweck, Scope, Non-Goals, Milestone-Slices und Risiken.
- Pillars duplizieren keine F-/DS-Regeln.
- Roadmap-Phasen ziehen kleine Slices aus Pillars.
- Cross-cutting Risiken werden als Dependencies sichtbar gemacht.

## 10. Phasen als Implementation Contracts

Eine Phase ist erst implementation-ready, wenn sie beantwortet:

| Bereich | Pflichtinhalt |
|---|---|
| Ziel | ein konkretes Ergebnis |
| Scope | In Scope, Out of Scope, Deferred |
| User Flow | Entry, erste Sicht, Aktionen, Resultate |
| Screen Structure | Desktop und Mobile/Narrow ASCII |
| Interaction | Hover, Focus, Keyboard, Disabled, Loading, Retry |
| State | local, session, persistent, backend-owned, derived, dirty |
| Data Grounding | Domain Owner, Repository, Fake, Contract |
| Backend Boundary | API/Contract-Frage oder explizit nicht betroffen |
| Security/Privacy | Datenklassen, Logs, Screenshots, Fixtures |
| Accessibility | Semantics, Focus Order, Contrast, Motion |
| Localization | Sprache, Formate, Copy-Konventionen |
| Testing | Unit, Widget, Golden, Integration, Contract, Manual |
| Verification | konkrete Commands und erwartete Evidenz |
| Stop Rules | wann Agenten nicht improvisieren duerfen |
| Handoff | naechster Skill oder Owner |

Wenn eine Phase diese Fragen nicht beantworten kann, wird sie geteilt,
zurueckgestuft oder blockiert.

## 11. Issue-Governance

GitHub Issues sind Source of Truth fuer actionable Arbeit.

Regeln:

- Decisions bleiben in Decision-Dokumenten.
- Konzepte bleiben in Konzeptdateien.
- Issues tracken Implementation, Bugs, Epics und Follow-ups.
- Jedes Issue hat genau einen primaeren Owner.
- Frontend- und Backend-Implementation werden getrennt.
- Wenn ein Frontend-Issue Backend-Arbeit braucht, wird ein verlinktes
  Backend- oder Contract-Folgeissue angelegt.
- Wenn ein Backend-Issue Frontend-Konsum oder UI-Auswirkungen erzeugt, wird ein
  verlinktes Frontend- oder Contract-Folgeissue angelegt.
- Contract-Issues duerfen API-Vertraege definieren; Runtime-Implementation
  gehoert in getrennte Frontend-/Backend-Issues.

Empfohlene Owner-Prefixes:

- `Frontend:`
- `Backend:`
- `Contract:`
- `Foundation:`
- `Quality:`
- `Docs:`
- `Epic:`

Jedes Issue braucht:

- Problem/Ziel.
- Scope und Non-Goals.
- betroffene Konzepte/Decisions/Pillars.
- Akzeptanzkriterien.
- Tests/Verification.
- Security/Privacy-Hinweise.
- Dependencies und Blocker.
- Follow-up-Regeln.

## 12. Mock-, Fake- und Demo-Daten

Ein neues Flutter-Projekt darf frueh ohne Backend UI bauen, aber nicht ohne
saubere Grenzen.

Regeln:

- Mocks sind isoliert und duerfen keine echte Persistenz, echten HTTP-Clients
  oder produktiven Secrets verwenden.
- Fake Repositories implementieren Domain Interfaces.
- Demo-Daten sind synthetisch, realistisch und privacy-safe.
- Keine privaten Echtdaten in Fixtures, Screenshots, OpenAPI Examples, Logs
  oder Design-Mocks.
- Mock-Daten bilden Loading, Empty, Error, Partial, Conflict und Permission
  States ab.
- Mocks sind Planungs- und Review-Werkzeuge, nicht automatisch Produktpfad.

## 13. Backend- und Contract-Grenzen

Auch wenn zuerst nur Flutter gebaut wird, muessen Backend-Grenzen frueh
modelliert werden.

Moegliche Backend-Modi:

- local-only.
- local-first mit spaeterem Sync.
- self-hosted Backend.
- managed cloud.
- hybrid.

Regeln:

- UI haengt an Domain Interfaces, nicht an konkreten Backend-Controllern.
- API-Vertraege werden contract-first geplant, wenn mehrere Clients oder Teams
  betroffen sind.
- Mock Backend oder Contract Fixtures muessen dieselben Fehler- und
  Edge-Case-Zustaende wie die App kennen.
- Auth, Sync, Backup, Sharing, AI/OCR und Payments brauchen explizite Trust
  Boundaries.
- Sensitive Daten duerfen nicht spaeter "zufaellig" in die Cloud wandern.

## 14. Quality Gates

Minimaler lokaler Gate:

```bash
scripts/bootstrap.sh
scripts/codegen.sh
scripts/verify.sh
```

Falls das Projekt noch Legacy-Schulden hat, muessen Skills und Docs erlauben:

- targeted verification fuer den betroffenen Pfad.
- ehrliche Kennzeichnung von Baseline Debt.
- keine neuen Regressionen.

Empfohlene Gates:

- format/lint/analyze.
- unit tests.
- widget tests.
- golden tests fuer visuell stabile Komponenten.
- provider/state tests.
- fake repository tests.
- contract/client tests.
- accessibility/semantics checks.
- build smoke tests pro Zielplattform.
- release/readiness checks.

## 15. Setup-Reihenfolge fuer ein neues Flutter-Projekt

1. Produktthese und Zielplattformen formulieren.
2. Repository- und Dokumentationsstruktur anlegen.
3. Projekt-lokale Skills erstellen.
4. Product Overview schreiben.
5. Grundsatz-Decisions schreiben.
6. Pillar-Landkarte erstellen.
7. F-/Frontend/Foundation-Konzepte anlegen.
8. Design-System-Umbrella und Foundations anlegen.
9. Quality-, Fixture- und Mock-Regeln definieren.
10. Roadmap-Milestones und Phase-Index anlegen.
11. Ersten production-ready Slice als Phase schreiben.
12. `ui-architect` Plan erstellen.
13. Plan reviewen.
14. Implementieren.
15. Audit und Closeout durchfuehren.

## 16. Start-Checkliste

Ein Projekt ist bereit fuer die erste production-relevante UI-Implementation,
wenn:

- Product Overview existiert.
- zentrale Decisions existieren.
- Pillars existieren.
- F-/Foundation-Konzepte fuer Struktur, State, Testing, Error, Storage,
  API/Contract, Mock und Privacy existieren.
- Design-System-Foundation existiert.
- erster Slice als Implementation Contract existiert.
- Fake Repository Contract existiert.
- Security/Privacy-Regeln fuer Demo-Daten existieren.
- Verification Commands existieren.
- GitHub Issue oder Phase-Handoff existiert.
- `ui-architect` Plan approved ist.

## 17. Anti-Patterns

- Direkt mit Screens starten, weil "Backend spaeter kommt".
- Mocks bauen, die spaeter niemand gegen Domain Interfaces austauschen kann.
- Produktentscheidungen in Issues verstecken.
- Design-System-Regeln in einzelnen Feature-Screens erfinden.
- "Responsive" schreiben, aber nur Desktop planen.
- "Error Handling" schreiben, aber keine Reference Codes oder Recovery States
  definieren.
- "Privacy" schreiben, aber Logs, Screenshots, Fixtures und Demo-Daten
  vergessen.
- Frontend und Backend in ein Implementation-Issue mischen.
- Phase als Epic-Text behandeln.
- Auditor nur als Screenshot-Abnahme verstehen.

## 18. Adaptionshinweise

Bei jedem neuen Projekt muessen diese Punkte bewusst angepasst werden:

- Produktdomain und Sprache.
- Zielplattformen.
- State-/DI-Entscheidung.
- lokale Datenbank und Dateiablage.
- Backend-Modus und API-Strategie.
- Auth/Identity.
- Datenschutz-/Compliance-Niveau.
- Design-System-Reifegrad.
- Teststrategie.
- Release-/Store-Anforderungen.
- AI/OCR/Processing-Grenzen.
- Sync/Backup/Sharing-Bedarf.

Das Playbook ist der Rahmen. Die konkreten Projektkonzepte sind die bindende
Source of Truth.

## 19. Template-Artefakte

Dieses Repository enthaelt zusaetzlich wiederverwendbare Startvorlagen:

```text
docs/templates/flutter-project/
├── README.md
└── skills/
    ├── onboarding/SKILL.md
    ├── git-safety/SKILL.md
    ├── github-issue/SKILL.md
    ├── product-concept/SKILL.md
    ├── ui-concept/SKILL.md
    ├── ui-concept-review/SKILL.md
    ├── ui-architect/SKILL.md
    ├── ui-plan-review/SKILL.md
    ├── ui-builder/SKILL.md
    ├── ui-auditor/SKILL.md
    ├── ui-audit-review/SKILL.md
    ├── ui-debugger/SKILL.md
    ├── ui-mocker/SKILL.md
    ├── frontend-error-handling/SKILL.md
    ├── frontend-test-coverage/SKILL.md
    ├── data-architect/SKILL.md
    ├── contract-api/SKILL.md
    ├── foundation-builder/SKILL.md
    └── quality-readiness/SKILL.md
```

Verwendung:

1. Templates in das neue Projekt nach `.codex/skills/` kopieren.
2. Platzhalter wie `[PROJECT_NAME]`, `[PRODUCT_NAME]`, `[DEFAULT_BRANCH]`,
   `[REPO_OWNER_NAME]` und `[ARCHITECTURE_DECISIONS]` ersetzen.
3. Projektstruktur, Zielplattformen, Backend-Modus, Datenschutzgrenzen und
   Quality Gates eintragen.
4. Skills committen.
5. Erst danach Konzepte, Roadmaps, Phasen und Implementation planen.

Template-Regeln:

- Template-Skills sind Startpunkte, keine fertigen Projektentscheidungen.
- Projekt-lokale Skills duerfen keinen generischen Produkt-Prefix brauchen.
- Jeder neue Skill muss klare Boundaries, Required Reading, Workflow, Stop
  Rules und Output-Format haben.
- Sobald das Projekt eigene Decisions hat, muessen die Skills auf diese
  Decisions verweisen.
