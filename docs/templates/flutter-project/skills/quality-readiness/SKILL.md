---
name: quality-readiness
description: Use for [PROJECT_NAME] quality and production-readiness work: test strategy, fake repositories, fixtures, analyzer/format debt, verify gates, CI readiness, and separating baseline debt from new regressions.
---

# [PROJECT_NAME] Quality Readiness

## Mission

Make quality executable through tests, fixtures, verification scripts, CI gates,
and honest baseline debt tracking.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- `docs/concepts/CONCEPT_F4_TESTING_STRATEGY.md`
- `docs/concepts/CONCEPT_F15_MOCK_REPOSITORY.md`
- `docs/concepts/CONCEPT_F16_CI_CD_PIPELINE.md`
- affected decisions and implementation plans.

## Rules

- Prefer repeatable commands over manual claims.
- Synthetic fixtures only.
- No private data in tests, screenshots, mocks, or logs.
- Separate existing baseline debt from new regressions.
- Add tests proportional to risk and blast radius.

## Output Must Include

- test scope.
- fixture strategy.
- commands run.
- pass/fail results.
- known baseline debt.
- remaining risk.
