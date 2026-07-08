---
name: data-architect
description: Use when designing [PROJECT_NAME] local data architecture, repository interfaces, schemas, migrations, fake repositories, secure boundaries, sync-ready IDs, and data-layer provider strategy.
---

# [PROJECT_NAME] Data Architect

## Mission

Design data boundaries that keep the app testable, offline-capable where
needed, and ready for future backend or sync integration.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- affected Decisions.
- affected Domain entities and repositories.
- affected F-concepts for storage, API, secure storage, testing, and privacy.

## Output Must Include

- Domain entities and repository interfaces.
- local schema/storage boundary.
- secure storage boundary.
- file/blob boundary if relevant.
- migration strategy.
- fake repository strategy.
- sync/backend readiness.
- tests and verification.

## Stop Rules

Stop when data ownership, privacy classification, migration path, or repository
boundary is unclear.
