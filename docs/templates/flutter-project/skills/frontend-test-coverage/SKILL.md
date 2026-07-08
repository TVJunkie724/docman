---
name: frontend-test-coverage
description: Use when [PROJECT_NAME] frontend work needs test planning, coverage review, verification gates, QA hardening, fake repository tests, provider/state tests, widget/golden tests, contract/mock tests, accessibility checks, or production-readiness evidence.
---

# [PROJECT_NAME] Frontend Test Coverage

## Mission

Make frontend test coverage complete, falsifiable, risk-based, and
production-ready. Use this skill to plan or audit the minimum credible test set
before any UI/frontend change is called done.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- `docs/concepts/CONCEPT_F4_TESTING_STRATEGY.md`
- `docs/concepts/CONCEPT_F15_MOCK_REPOSITORY.md`
- `docs/concepts/CONCEPT_F16_CI_CD_PIPELINE.md`
- affected concepts, decisions, phases, and implementation plans.

Also use:

- `frontend-error-handling` for error UI, logging, reference codes, retries,
  and diagnostics.
- `contract-api` for API/client/mock/backend contract drift.

## Non-Negotiable Rules

- Tests must prove exact outcomes. Do not accept weak assertions such as
  `isNotNull`, `isNotEmpty`, `no exception`, `>= 0`, or broad substring checks
  when exact values, counts, keys, labels, codes, statuses, or widgets are
  known.
- Every meaningful testable unit needs at least 2 happy, 2 unhappy, and 5 edge
  cases, unless the plan explains why fewer paths are complete.
- Negative paths are mandatory when applicable: unauthorized, forbidden, not
  found, validation, timeout/offline, backend 5xx, malformed payload,
  unsupported enum/mode, exact-at-limit, under-limit, over-limit, duplicate,
  idempotent writes, retry, and cancellation.
- Do not mock away the behavior under test.
- For provider/state tests, override repository/data providers, not the
  provider/notifier under test, unless testing a dumb widget.
- Fake repositories are test subjects. They need parity tests, deterministic
  data, deterministic error switches, reset behavior, and no extra public
  methods beyond the production interface.
- "Not run" without reason and residual risk is not a valid handoff.

## Test Selection Workflow

1. Identify changed layers:
   - pure helper/model.
   - mapper/DTO/generated client.
   - repository/data access.
   - fake repository.
   - provider/notifier/state machine.
   - widget/screen/navigation.
   - design-system primitive.
   - error/logging/notification behavior.
   - API/mock/contract boundary.
   - accessibility/localization.
2. Build a coverage matrix:

```markdown
| Layer | Scenario | H/U/E | Expected assertion | Command | Evidence |
|---|---|---|---|---|---|
```

3. Run narrow tests first, then broaden based on risk.
4. Report gates not applicable with explicit reason.

## Required Coverage By Surface

| Change touches | Required coverage |
|---|---|
| Pure logic/helpers | exact unit tests, malformed/null/boundary values |
| Models/serialization | missing/wrong/nullable fields, round-trip behavior |
| Repository | happy, 4xx/5xx, timeout/offline, malformed payload, auth |
| Fake repository | seeded/empty/error/reset/interface parity |
| Riverpod/provider | loading/data/error, retry, cancellation/race, dispose |
| Widget/screen | loading, empty, data, validation, error, retry, overflow |
| Navigation/shell | route, selection, back, deep link, permission boundary |
| Design-system widget | widget tests and golden/visual tests when baseline exists |
| Error/logging | user-safe copy, no leaks, sanitizer/reference-code behavior |
| Localization | visible keys, no raw fallback keys |
| Contract/mock | deterministic success and error scenarios |
| Accessibility | semantics, focus order, contrast/motion where in scope |

## Verification Commands

Prefer:

```bash
dart analyze <changed-files>
flutter test <targeted-test-file>
flutter test --coverage <targeted-or-full-scope>
flutter analyze
scripts/verify.sh
```

## Evidence Handoff

Report:

```text
Coverage decision:
- Changed layers:
- Required gates:
- Gates run:
- Gates not applicable:
- Gates not run and residual risk:
- Contract/mock evidence:
- Coverage impact:
- Remaining issues:
```

Never say "fully tested" unless every applicable gate is green or has a
documented, accepted residual risk.
