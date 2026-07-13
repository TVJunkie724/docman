---
name: quality-readiness
description: "Use for Mappm R3/C1 quality and production-readiness work: test coverage, fake repositories, fixtures, analyzer/format debt, verify gates, CI readiness, Vault migration/lifecycle quality, and separating legacy baseline debt from new regressions."
---

# DocMan Quality Readiness

Use this skill for R3 work and quality hardening.

Read:

- `docs/ROADMAP_REBUILD.md`
- `docs/concepts/CONCEPT_F4_TESTING_STRATEGY.md`
- `docs/concepts/CONCEPT_F15_MOCK_REPOSITORY.md`
- `docs/concepts/CONCEPT_F16_CI_CD_PIPELINE.md`
- `.codex/skills/ui-onboarding/SKILL.md`

## Core Model

DocMan uses two separate test layers:

- Fake repositories: fast Flutter/domain/Riverpod/widget tests without network.
- Contract mocks: Microcks for Mappm account/device, Core Assist, Cloud Vault,
  Capture, Sync, migration, entitlement and API boundaries.

Do not use one layer as a substitute for the other.

## Quality Priorities

1. Data loss and document safety.
2. Secure handling of secrets and sensitive logs.
3. Local Vault offline continuity, Detached Recovery and Cloud Vault
   cache/pending behavior offline.
4. Core Assist queue/review/quota/opt-out/provider-failure behavior without
   authority changes or data loss.
5. Mobile capture queue and retry reliability.
6. Drift/local storage correctness and migrations.
7. Provider/domain logic with deterministic fakes.
8. Analyzer, format, and CI gates.

## Workflow

1. Identify whether the task is coverage, fake repo, fixture, analyzer debt, format debt, CI, or production readiness.
2. Search for duplicate GitHub Issues before creating new ones.
3. Separate baseline debt from new regressions.
4. Prefer small, reviewable fixes over broad formatting churn unless the task is explicitly a formatting/debt slice.
5. Use synthetic fixtures only. Never use private household documents, real secrets, or real personal data.
6. Run the tightest useful checks:

```bash
scripts/codegen.sh
scripts/verify.sh
flutter test
flutter analyze
```

If strict gates fail, document exact failure class and whether it is known R3 debt.

## Test Guidance

- Domain and provider tests should use fake repositories, fake clock, fake ID generator, and fake secure storage.
- Widget tests should use Riverpod overrides.
- Storage tests may use in-memory Drift or isolated temp files.
- Contract tests should be owned by `contract-api`.

## Definition Of Done

- Tests make hard assertions.
- Fakes implement the same domain contracts as real repositories.
- No private/sensitive fixtures.
- New code does not increase analyzer/format debt.
- Quality gaps are tracked in GitHub Issues with verification steps.
