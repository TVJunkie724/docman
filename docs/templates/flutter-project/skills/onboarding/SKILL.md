---
name: onboarding
description: Use before planning, implementing, auditing, or debugging substantial [PROJECT_NAME] Flutter work. Reads project structure, decisions, roadmap, Clean Architecture boundaries, state management, local storage, backend mode, quality gates, and known legacy debt.
---

# [PROJECT_NAME] Onboarding

Read this skill before substantial project work.

## Required Reading

- `docs/PROJECT_OVERVIEW_GUIDE.md`
- `docs/ROADMAP_REBUILD.md`
- `docs/roadmap/PHASE_INDEX.md`
- `docs/pillars/PILLAR_INDEX.md`
- affected `docs/concepts/CONCEPT_F*.md`
- affected `docs/design-system/concepts/*.md`
- affected `docs/technical/DECISION_*.md`

## Project Structure

Expected shape:

```text
lib/
├── app/
├── core/
├── domain/
├── data/
└── presentation/
```

## Architecture

- Target state management: `[STATE_MANAGEMENT]`.
- Local storage: `[LOCAL_STORAGE]`.
- Backend mode: `[BACKEND_MODE]`.
- Primary platforms: `[PRIMARY_PLATFORMS]`.
- Privacy level: `[PRIVACY_LEVEL]`.

Clean Architecture boundary:

```text
Presentation -> Domain -> Data
```

Rules:

- Presentation may depend on Domain interfaces and entities.
- Presentation must not import Data implementations.
- Domain must not depend on Flutter widgets, HTTP clients, databases, or file systems.
- Data implements Domain repository interfaces.

## Verification

Prefer:

```bash
scripts/bootstrap.sh
scripts/codegen.sh
scripts/verify.sh
```

If baseline debt exists, run targeted checks and report exactly what was not
verified.

## Stop Rules

Stop before implementation when:

- no approved concept, phase, or implementation plan exists.
- a required architecture decision is missing.
- frontend/backend ownership is mixed in one implementation task.
- sensitive data handling is unspecified.
- fake/demo data rules are missing.
