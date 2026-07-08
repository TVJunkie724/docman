---
title: "Flutter Project Template Artifacts"
description: "Wiederverwendbare Template-Artefakte fuer neue Flutter-Projekte"
tags: [flutter, templates, skills, project-setup]
lastUpdated: "2026-07-08"
status: "draft"
---

# Flutter Project Template Artifacts

Diese Templates sind Startpunkte fuer neue Flutter-Projekte.

Verwendung:

1. `skills/*` in das neue Projekt nach `.codex/skills/` kopieren.
2. Platzhalter ersetzen:
   - `[PROJECT_NAME]`
   - `[PRODUCT_NAME]`
   - `[DEFAULT_BRANCH]`
   - `[REPO_OWNER_NAME]`
   - `[PRIMARY_PLATFORMS]`
   - `[STATE_MANAGEMENT]`
   - `[LOCAL_STORAGE]`
   - `[BACKEND_MODE]`
   - `[PRIVACY_LEVEL]`
3. Projekt-spezifische Decisions, Konzepte und Quality Gates eintragen.
4. Templates als projekt-lokale Skills committen.

Diese Templates sind bewusst streng. Sie sollen verhindern, dass Agents direkt
mit Feature-Code starten, bevor Struktur, Konzepte, Roadmaps, Phasen und Gates
klar sind.

Besonders wichtig:

- `ui-architect`, `ui-builder`, `ui-debugger` und `ui-mocker` muessen
  `frontend-error-handling` dazunehmen, sobald Error States, Validation,
  Auth/API-Fehler, Reference Codes, Diagnostics, Logging oder Retry betroffen
  sind.
- `ui-architect`, `ui-builder`, `ui-debugger`, `ui-auditor` und
  `quality-readiness` muessen `frontend-test-coverage` dazunehmen, sobald
  Tests, Fakes, Provider-State, Widgets, Contracts oder QA-Evidence betroffen
  sind.
