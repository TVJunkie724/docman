---
name: docman-data-architect
description: Use when designing or planning DocMan data architecture, including SQLite + Drift schemas, local file store boundaries, secure storage separation, migrations, repository interfaces, local-first sync-ready IDs, fake/in-memory repository strategy, and retirement of legacy Isar/PocketBase persistence.
---

# DocMan Data Architect

Use this skill for data/storage architecture and implementation planning. Use `docman-foundation-builder` for concrete foundation implementation and `docman-quality-readiness` for tests/coverage.

Read:

- `.codex/skills/docman-ui-onboarding/SKILL.md`
- `docs/technical/DECISION_LOCAL_DATABASE.md`
- `docs/concepts/CONCEPT_F10_LOCAL_STORAGE.md`
- `docs/concepts/CONCEPT_F12_SECURE_STORAGE.md`
- `docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md`

## Target Direction

- SQLite + Drift for structured local metadata.
- Files/documents outside structured DB, referenced by stable file records.
- Secure Storage for secrets, tokens, pairing credentials, and encryption material.
- Repository interfaces in Domain; implementations in Data.
- Sync-ready stable IDs and timestamps.
- No new Isar/PocketBase expansion.

## Design Checks

- Does the model preserve local-first operation?
- Are documents and metadata both treated as sensitive?
- Are secrets separated from normal DB tables?
- Can fake repositories implement the same contract?
- Can Drift tests run in memory or isolated temp storage?
- Are migrations explicit and reversible enough for MVP safety?
- Does UI access data only through providers/domain repositories?

## Planning Output

For data implementation plans include:

- entities/value objects affected
- Drift tables and indexes at conceptual level
- repository interface changes
- file store boundary
- secure storage boundary
- migration/legacy-retirement strategy
- fake/in-memory test strategy
- verification and data-loss risk checks

Do not prescribe UI widgets. Hand UI surfaces to `docman-ui-architect`.
