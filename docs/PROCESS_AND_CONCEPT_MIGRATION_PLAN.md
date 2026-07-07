---
title: "DocMan - Process and Concept Migration Plan"
description: "Arbeitsplan zur Migration der strengen Matchmia/Stonehall Arbeitsweise nach DocMan/Ordna"
tags: [process, migration, skills, concepts, roadmap, quality, frontend]
lastUpdated: "2026-07-07"
status: "draft"
---

# DocMan - Process and Concept Migration Plan

## Status

Draft.

Dieses Dokument plant die Migration der strengeren Matchmia/Stonehall
Arbeitsweise nach DocMan/Ordna. Ziel ist nicht, Matchmia-Inhalte blind zu
kopieren, sondern die Prozessqualitaet, Skill-Strenge, Konzept-Hierarchie und
Implementation-Contract-Logik auf Ordnas Produkt, Architektur und Privacy-
Anforderungen zu adaptieren.

## Zielbild

DocMan/Ordna soll vor weiterer UI- oder Backend-Implementation denselben
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

## Grundregeln

- Keine blinde Kopie von Matchmia-Domain-Inhalten.
- Prozess- und Qualitaetsregeln werden uebernommen.
- Projektbegriffe werden auf Ordna angepasst: Haushalt, Vorgang, Dokument,
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
- Design-System-Regeln auf Ordna-DS-Konzepte mappen.
- Privacy/Trust/Document-Payload-Regeln aus Ordna Decisions einbauen.

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
und auf Ordna-Strenge bringen.

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
  an `OD-FE-*` / `OD-DS-*` naming scheme?
- Should Matchmia's generated-client assumptions become OpenAPI-client neutral
  for DocMan until Flutter client generation is decided?
- Which GitHub labels/milestones already exist in `TVJunkie724/docman`, and
  which must be created before strict issue enforcement is fully usable?
- Should we introduce a DocMan project board before bulk issue migration?
