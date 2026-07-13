---
title: "DocMan - Process and Concept Migration Plan"
description: "Arbeitsplan zur Migration der strengen Matchmia/Stonehall Arbeitsweise nach DocMan/Mappm"
tags: [process, migration, skills, concepts, roadmap, quality, frontend]
lastUpdated: "2026-07-12"
status: "superseded-by-closeout"
---

# DocMan - Process and Concept Migration Plan

> This migration plan is historical and no longer authorizes product or
> architecture work. Current governance lives in `docs/execution/`, current
> product scope in the Vault/Commercial-Core decisions, and current sequencing
> in the C0-C7 roadmap.

## Status

Superseded by the completed execution closeout and current quality contracts.

Dieses Dokument plant die Migration der strengeren Matchmia/Stonehall
Arbeitsweise nach DocMan/Mappm. Ziel ist nicht, Matchmia-Inhalte blind zu
kopieren, sondern die Prozessqualitaet, Skill-Strenge, Konzept-Hierarchie und
Implementation-Contract-Logik auf das Mappm-Produkt, seine Architektur und Privacy-
Anforderungen zu adaptieren.

Die generalisierte Fassung dieser Arbeitsweise fuer neue Flutter-Projekte steht
als Git-Submodule in `docs/flutter-project-playbook/PLAYBOOK.md`.

Wichtig: `docs/flutter-project-playbook/` ist ein externes Toolkit-Subrepo
(`stonehall-caroline/frontend-setup-playbook`). DocMan/Mappm kopiert daraus
keine Entscheidungen blind. Alle aktiven Mappm-Artefakte bleiben projektlokal
in `docs/`, `.codex/skills/` und den Mappm-spezifischen Roadmaps,
Konzepten, Pillars und Decisions.

## Zielbild

DocMan/Mappm soll vor weiterer UI- oder Backend-Implementation denselben
Arbeitsrhythmus bekommen:

```text
Product / Pillar / F-Concept
  -> Phase as implementation contract
  -> Architect plan
  -> Plan review
  -> Builder implementation
  -> Auditor evidence review
  -> Issue / roadmap / docs closeout
```

Keine production-relevante UI oder Backend-Arbeit soll ohne freigegebenes
Konzept, Phase oder Implementation Plan starten.

## Migrationsinventar und Zielbild

Die Migration uebernimmt keine Matchmia-Domain. Sie uebernimmt die Arbeitsweise,
Konzept-Strenge, Quality Gates und die Aufteilung in bindende
Querschnittskonzepte, Design-System-Konzepte, Pillar-Konzepte, Phasen und
Implementation-Handoffs.

### Zielbild nach der Migration

Nach der Migration hat Mappm:

- projekt-lokale Skills unter `.codex/skills/` ohne Projekt-Prefix.
- F-Konzepte als bindende Querschnittsregeln fuer Frontend/Foundation.
- MP-DS-Konzepte als Design-System-SSOT fuer Tokens, Shell, Komponenten,
  Forms, Feedback, Datenanzeige, Accessibility und Visual QA.
- Pillar-Dokumente als Produkt-/Governance-Saeulen, nicht als lose Ideenliste.
- Roadmap-Phasen als Implementation Contracts mit Scope, Non-Goals,
  UX-Verhalten, Data/Contract-Grounding, Security/Privacy, Tests und Stop
  Rules.
- GitHub Issues als tracker-seitige Source of Truth fuer actionable Arbeit.
- klare Trennung von Produktentscheidung, Konzept, Phase, Architekturplan,
  Implementation, Audit und Follow-up.
- keine UI-Implementation ohne approved Concept/Phase und approved
  `ui-architect` Plan.

### Migration 1 - Projekt-lokale Skills

Quelle:

- Matchmia `.codex/skills/*`

Ziel:

- DocMan `.codex/skills/*`

Zu migrieren/adaptieren:

- UI-Pipeline: `ui-concept`, `ui-concept-review`, `ui-architect`,
  `ui-plan-review`, `ui-builder`, `ui-auditor`, `ui-audit-review`,
  `ui-debugger`, `ui-mocker`, `ui-onboarding`.
- Issue-Governance: `github-issue`.
- Git-Safety: `git-safety`.
- Foundation/Data/Contract/Quality Skills: `foundation-builder`,
  `data-architect`, `contract-api`, `quality-readiness`.
- Noch offen aus Matchmia: backend-, ai-, ops- und guardian-artige Skills, aber
  nur soweit sie zum Mappm ASP.NET-Core/Home-Hub/Processing-Ziel passen.

Mappm-Ziel:

- Skills sind Rollenvertraege.
- Builder arbeitet nur aus approved Plans.
- Auditor prueft evidenzbasiert gegen Plan, Clean Architecture, Tests und DoD.
- Issue-Skill erzwingt getrennte Frontend-/Backend-Implementation-Issues und
  verlinkte Folgeissues, wenn beide Seiten betroffen sind.

### Migration 2 - Frontend-Querschnittskonzepte

Quelle:

- Matchmia `Documentation/Frontend/concepts/MM-FE-*`
- historische Matchmia `Documentation/Frontend/deprecated/CONCEPT_F*.md` nur
  als Referenz, nicht als bindende Vorlage.

Ziel:

- DocMan `docs/concepts/CONCEPT_F*.md`

Zu migrieren/adaptieren:

| Bereich | Matchmia-Quelle | DocMan-Ziel |
|---|---|---|
| Projektstruktur | `MM-FE-01` | `CONCEPT_F1_PROJECT_STRUCTURE.md` |
| State Management | `MM-FE-02` | `CONCEPT_F2_STATE_MANAGEMENT.md` |
| Coding Conventions | `MM-FE-03` | `CONCEPT_F3_CODING_CONVENTIONS.md` |
| Environment Configuration | `MM-FE-04` | `CONCEPT_F6_ENVIRONMENT_CONFIGURATION.md` |
| API Integration | `MM-FE-05` | `CONCEPT_F11_API_INTEGRATION.md` |
| Error Code Governance | `MM-FE-06` | `CONCEPT_F5_ERROR_HANDLING.md` und F18 |
| Form Validation Contract | `MM-FE-07` | F24-F30 Form Family Konzepte |
| Mock Surfaces | `MM-FE-08` | `CONCEPT_F15_MOCK_REPOSITORY.md` und Mock-Regeln |
| Testing Strategy | `MM-FE-09` | `CONCEPT_F4_TESTING_STRATEGY.md` |
| Error Handling | `MM-FE-10` | `CONCEPT_F5_ERROR_HANDLING.md` |
| Logging | `MM-FE-11` | `CONCEPT_F7_LOGGING.md` |
| Store Distribution | `MM-FE-12` | `CONCEPT_F8_APP_STORE_COMPLIANCE.md` |
| Review Access | `MM-FE-13` | `CONCEPT_F8B_REVIEW_ACCESS_STRATEGY.md` |
| Personal Data Compliance | `MM-FE-14` | `CONCEPT_F9_LEGAL_COMPLIANCE.md` |
| Local Storage | `MM-FE-15` | `CONCEPT_F10_LOCAL_STORAGE.md` |
| Secure Storage | `MM-FE-16` | `CONCEPT_F12_SECURE_STORAGE.md` |
| Mock Repository | `MM-FE-17` | `CONCEPT_F15_MOCK_REPOSITORY.md` |
| CI/CD Quality Gates | `MM-FE-18` | `CONCEPT_F16_CI_CD_PIPELINE.md` |
| Contract Runtime Verification | `MM-FE-19` | F11, F18 und Contract/API Decisions |
| Local Review Tools | `MM-FE-20` | F8b, F16 und QA-Gates |
| Async Request Feedback | `MM-FE-21` | F18, F34 und DS Feedback |
| Concept Slicing Governance | `MM-FE-22` | Roadmap-/Phase-Regeln und `ui-concept` |
| Product Shell Layout | `MM-FE-23` | F22, F33 und MP-DS-02 |
| Mobile Shell Navigation | `MM-FE-24` | F17, F22, F33 und Mobile Capture Pillar |

Mappm-Ziel:

- F-Konzepte sind cross-cutting und duerfen keine Produktseiten als Feature
  verstecken.
- Jedes F-Konzept nennt Status, Scope, Non-Goals, Regeln, Tests, Stop Rules
  und betroffene Decisions/Pillars.
- Flutter/Riverpod/Drift/Clean-Architecture-Regeln ersetzen Matchmia-spezifische
  Annahmen.
- Privacy, lokale Daten, Secure Storage, Sync-Readiness, OpenAPI/Microcks und
  Fake-Repositories sind Pflichtbestandteile.

### Migration 3 - Design-System-Konzepte

Quelle:

- Matchmia `Documentation/DesignSystem/concepts/MM-DS-*`
- Matchmia Design-System Mock/Review-Artefakte nur als visuelle und strukturelle
  Referenz.

Ziel:

- DocMan `docs/design-system/concepts/MP-DS-*.md`
- bestehende DocMan F19-F35 als Uebergangs- oder Detailkonzepte, bis klar ist,
  was in MP-DS gehoert.

Zu migrieren/adaptieren:

| Bereich | Matchmia-Quelle | DocMan-Ziel |
|---|---|---|
| Umbrella/Governance | `MM-DS-00` | `MP-DS-00` und F19 |
| Foundations/Tokens | `MM-DS-01` | `MP-DS-01`, F21, F32 |
| Layout/Shell | `MM-DS-02` | `MP-DS-02`, F22, F33 |
| Corporate Design | `MM-DS-03` | `MP-DS-03`, F20, F31 |
| Component System | `MM-DS-04` | F23, F26-F30, F34 |
| Form Family | `MM-DS-04-01` bis `MM-DS-04-12` | F24-F30 |
| Button/Navigation/Overlay/Icon/Feedback/Data Display | `MM-DS-04-13` bis `MM-DS-04-19` | F26, F33, F34, F35 und neue MP-DS Details |
| Product Patterns | `MM-DS-05*` | F25, F35 und pillar-spezifische Patterns |
| Accessibility/Quality Gates | `MM-DS-06` | F25, F35, QA-Gates |
| Platform Adaptation | `MM-DS-07` | F17, F22, F33 und Platform Support Pillar |

Mappm-Ziel:

- Design-System-Regeln sind Source of Truth fuer sichtbare UI.
- Keine lokale Komponentenvariante ohne DS-Owner.
- Forms, Review-Flows, Assisted-Review-Suggestions, Dokumentstatus,
  Upload-Feedback, Fehler, leere Zustaende und sensible Datenanzeigen sind
  explizit geregelt.
- Desktop und Mobile/Narrow werden gemeinsam geplant; Mobile Capture bleibt
  fokussiert, nicht automatisch Vollverwaltung.

### Migration 4 - Pillars, Roadmaps und Phasen

Quelle:

- Matchmia Frontend-Roadmaps, Pillar-Roadmaps und Phase-Dokumente.
- Matchmia Regel: Phase ist Implementation Contract.

Ziel:

- `docs/ROADMAP_REBUILD.md`
- `docs/roadmap/PHASE_INDEX.md`
- `docs/roadmap/PILLAR_ROADMAP_INDEX.md`
- `docs/pillars/PILLAR_*.md`
- `docs/roadmap/phases/*.md`

Zu migrieren/adaptieren:

- Phase-Template mit Scope, Non-Goals, Dependencies, UX Contract, Data/Contract
  Grounding, Security/Privacy, Accessibility, Tests, DoD und Stop Rules.
- Pillar-Slices fuer Capture & Inbox, Cases/Records, Tasks, Search/Facts,
  Profiles, Home Hub/Sync, Intelligence, Security, Compliance, QA, Release,
  Support und Design System.
- Roadmap-Gates, die verhindern, dass UI-Slices vor F-/DS-/Pillar-Klarheit in
  Implementation gehen.

Mappm-Ziel:

- R4 Capture and Review Core wird der erste production-ready UI-Slice, aber
  erst nach freigegebenen Konzepten und Plan.
- M3 Assisted Review wird frueh als Produktwert vorbereitet, aber mit klarer
  Processing-/Trust-Grenze.
- Sync, Backup, Sharing, Managed Cloud und Identity bleiben spaetere Slices,
  werden aber durch Provider-/Trust-/Encryption-Konzepte nicht verbaut.

### Migration 5 - Backend, Contract, Data, Quality und Operations

Quelle:

- Matchmia backend-/contract-/qa-/ops-orientierte Skills und Gates.
- DocMan Decisions zu ASP.NET Core, OpenAPI/Microcks, Local-first, Trust und
  Encryption.

Ziel:

- `docs/technical/DECISION_*.md`
- spaetere backend-/contract-/quality-spezifische Skills.
- GitHub Issues fuer Backend-, Contract-, Foundation- und Quality-Arbeit.

Zu migrieren/adaptieren:

- Backend-Planung contract-first statt UI- oder controller-first.
- OpenAPI/Microcks als Integrationsgrenze.
- Frontend haengt an Domain-Ports und Data-Adaptern, nicht an ASP.NET Core.
- Drift/SQLite/File Store/Secure Storage als lokale Grenzen.
- PostgreSQL/MinIO/S3/Worker nur fuer Home Hub und spaetere Server-Varianten.
- Quality Gates fuer Analyzer, Tests, Fake Repositories, Contract Fixtures,
  Security/Privacy und Release Readiness.

Mappm-Ziel:

- Backend ist austauschbare Service-Schicht, nicht Voraussetzung fuer den
  lokalen Produktkern.
- Intelligence, OCR/LLM, Sync, Backup und Sharing haben Trust Boundary,
  Verschluesselungsmodell und Issue-/Contract-Folgearbeit.
- Kein sensibles Echtdatum in Fixture, Mock, Screenshot, Log oder OpenAPI
  Example.

### Migration 6 - First Production UI Slice

Quelle:

- DocMan Produktentscheidungen und Pillars.
- Matchmia Workflow: Concept -> Phase -> Plan -> Build -> Audit.

Ziel:

- erster UI-Slice: Capture & Review Workspace.

Zu planen:

- App Shell und Workspace Layout.
- Dashboard / Home.
- Draft Inbox.
- Document Review Detail.
- Desktop Import.
- Mobile Capture Eingang.
- Fake Repositories.
- Riverpod State.
- Loading/Error/Empty/Conflict/Privacy States.
- Accessibility, Responsive Verhalten und Visual QA.
- Tests, Golden/Widget/Provider/Fake Evidence und Audit.

Mappm-Ziel:

- UI darf ohne Backend starten, aber nicht ohne saubere Domain-/Repository-
  Verträge, Fake Data, Contract-Fragen und Security/Privacy-Regeln.
- Demo Content ist synthetisch, realistisch und privacy-safe.
- Jede sichtbare Entscheidung ist aus Konzept, Phase oder Decision ableitbar.

## Grundregeln

- Keine blinde Kopie von Matchmia-Domain-Inhalten.
- Prozess- und Qualitaetsregeln werden uebernommen.
- Projektbegriffe werden auf Mappm angepasst: Haushalt, Vorgang, Dokument,
  Profil, Home Hub, private-first, Trust Boundary.
- Bestehende akzeptierte DocMan Decisions bleiben Source of Truth.
- F-Konzepte, Pillars und Phasen muessen DocMan-spezifisch werden.
- GitHub Issues werden Quelle der Wahrheit fuer actionable Bugs, Features,
  Epics und Implementation-Handoffs.
- Phasen werden als Implementation Contracts behandelt, nicht als grobe
  Roadmap-Zeilen.

## Migration Wave 1 - Skills

Ziel: Agentenverhalten zuerst haerten, damit spaetere Konzeptmigrationen in
derselben Qualitaet passieren.

### 1.1 GitHub Issue Skill

Status: started.

Migration:

- Matchmia-Strenge auf DocMan adaptiert:
  - Owner Prefixes.
  - keine gemischten Frontend/Backend-Implementation-Issues.
  - `type:epic`.
  - Enterprise-grade Issue Contract.
  - harte Test-/Acceptance-Kriterien.
  - `Implementation Decision Required`.
  - native GitHub Blocker/Dependencies.
  - Cross-Skill Body Authoring.

Zieldatei:

- `.codex/skills/github-issue/SKILL.md`

### 1.2 UI Concept / UI Plan / UI Build Pipeline

Zu migrieren/adaptieren:

- `ui-concept`
- `ui-concept-review`
- `ui-architect`
- `ui-plan-review`
- `ui-builder`
- `ui-auditor`
- `ui-audit-review`
- `ui-debugger`
- `ui-mocker`
- `ui-onboarding`

DocMan-Anpassungen:

- Riverpod sauber als DocMan-Zielarchitektur festhalten.
- Flutter Clean Architecture: Presentation -> Domain -> Data.
- Keine Presentation-Imports aus `lib/data/`.
- Fake repositories fuer UI/Provider-Tests.
- Microcks/OpenAPI nur an API-Grenzen, nicht in UI-Mocks.
- Design-System-Regeln auf Mappm-DS-Konzepte mappen.
- Privacy/Trust/Document-Payload-Regeln aus Mappm Decisions einbauen.

### 1.3 Backend / Contract / Data / Quality Skills

Zu migrieren/adaptieren:

- backend-architect
- backend-builder
- backend-debugger
- backend-auditor
- backend-qa
- frontend-contract-guardian als DocMan contract guardian
- frontend-error-handling als DocMan error/reference handling
- frontend-test-coverage als DocMan quality/test coverage skill

DocMan-Anpassungen:

- ASP.NET Core + PostgreSQL + MinIO/S3 + Microcks.
- OpenAPI-first, nicht controller-first.
- No NSwag assumption; Codegen-Strategie fuer Flutter bleibt separat zu
  entscheiden.
- Security/Privacy/Trust Boundary als Pflichtpruefung.

## Migration Wave 2 - Shared Guardrails

Ziel: Wiederverwendbare Referenzen unter `.codex/skills/_shared/references/`
anlegen.

Zu adaptieren:

- Flutter guardrails.
- Backend guardrails.
- Testing guardrails.
- Git safety.
- AI/processing guardrails.

DocMan-spezifische Inhalte:

- `scripts/verify.sh` kann derzeit an Legacy-Format-Gates scheitern; Skills
  muessen targeted verification erlauben und Baseline-Debt ehrlich reporten.
- Branch-/Merge-Regeln folgen `git-safety`.
- Keine privaten Dokumente, echten Haushaltsdaten oder echten Secrets in
  Fixtures, Screenshots, OpenAPI Examples oder Mocks.

## Migration Wave 3 - F-Konzepte und Design-System-Konzepte

Ziel: bestehende DocMan-F-Konzepte gegen Matchmia FE/DS-Konzepte auditieren
und auf Mappm-Strenge bringen.

Betroffene DocMan-Bereiche:

- `docs/concepts/CONCEPT_F*.md`
- `docs/design-system/concepts/`
- `docs/design-system/Brand/`
- `docs/design-system/Decisions/`
- `docs/design-system/Mock/`

Vorgehen:

```text
1. Inventarisieren: Welche DocMan-F-Konzepte existieren?
2. Mapping erstellen: Matchmia MM-FE/MM-DS -> DocMan F/DS.
3. Luecken markieren: fehlt, weich, widerspruechlich, already strong.
4. Migration pro Konzept planen.
5. Konzept aktualisieren.
6. Review gegen DocMan Decisions, Roadmap und Pillars.
```

Besonders wichtig:

- Projektstruktur.
- State Management.
- Coding Conventions.
- Testing Strategy.
- Error Handling / Reference Codes.
- Logging.
- Local/Secure Storage.
- Mock Repository.
- API Integration / Contract Runtime Verification.
- Store Compliance.
- DSGVO/GDPR / Legal Privacy.
- Form Family.
- Product Shell / Navigation.
- Accessibility / Visual QA.

## Migration Wave 4 - Pillars, Roadmaps und Phases

Ziel: Jede Phase wird Implementation Contract.

Betroffene Dateien:

- `docs/ROADMAP_REBUILD.md`
- `docs/roadmap/PHASE_INDEX.md`
- `docs/roadmap/PILLAR_ROADMAP_INDEX.md`
- `docs/pillars/*.md`
- kuenftige `docs/roadmap/phases/*.md`

Regeln:

- Phasen muessen Scope, Non-Goals, Dependencies, UX-Verhalten,
  Data/Contract-Grounding, Security/Privacy, Accessibility, Tests,
  Verification und Stop Rules enthalten.
- Keine Phase darf an Builder gehen, wenn Produktverhalten offen ist.
- Offene Entscheidungen muessen in Decision-Dokumente oder
  `Implementation Decision Required` Abschnitte.
- Phase Review vor Implementation.
- Audit Review nach Implementation.

## Migration Wave 5 - First Production UI Slice

Erst nach Skills/F-Konzepte/Phase-Regeln:

```text
Capture & Review Workspace
  -> Workspace Shell
  -> Dashboard
  -> Draft Inbox
  -> Document Review Detail
  -> Fake repositories
  -> Riverpod state
  -> Tests
  -> Audit
```

Der Slice darf ohne Backend starten, aber nicht ohne:

- approved UI concept / phase.
- approved UI implementation plan.
- fake repository contracts.
- loading/error/empty states.
- accessibility and responsive behavior.
- test plan and DoD.

## Definition of Done for This Migration

- DocMan Skills reflect strict role separation and no-code-without-plan rules.
- GitHub Issue skill enforces executable issue contracts.
- Shared guardrails exist and are DocMan-specific.
- F-concepts are mapped and migration gaps are tracked.
- Pillar/phase documents define Implementation Contract expectations.
- First UI slice has a concept/phase ready for `ui-architect`.

## Open Questions

- Should DocMan keep current `docs/concepts/CONCEPT_F*.md` naming or migrate to
  an `MP-FE-*` / `MP-DS-*` naming scheme?
- Should Matchmia's generated-client assumptions become OpenAPI-client neutral
  for DocMan until Flutter client generation is decided?
- Which GitHub labels/milestones already exist in `TVJunkie724/docman`, and
  which must be created before strict issue enforcement is fully usable?
- Should we introduce a DocMan project board before bulk issue migration?
