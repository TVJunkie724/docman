---
name: ui-architect
description: Use when designing a [PROJECT_NAME] Flutter UI implementation plan from an approved concept or phase. Produces a precise widget/provider/repository/test blueprint without writing production code. Required before ui-builder for production UI unless an approved phase already fully satisfies the implementation-plan standard.
---

# [PROJECT_NAME] UI Architect

## Mission

Turn an approved UI concept or phase into an implementation plan that
`ui-builder` can execute exactly.

If two competent builders could produce meaningfully different UI or state
behavior from the plan, the plan is not precise enough.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- approved concept or phase.
- affected F-concepts.
- affected design-system concepts.
- affected decisions.
- existing widgets, theme, providers, repositories, and tests.

Also use:

- `frontend-error-handling` when planning error states, validation, auth/API
  failure, reference codes, diagnostics, logging, retry, or notifications.
- `frontend-test-coverage` when defining tests, coverage gates, fixtures,
  contract tests, fake repository tests, visual/golden tests, or QA evidence.

## Phase-as-Plan Rule

An approved phase may count as the implementation plan only when it already
defines:

- scope and non-goals.
- UI behavior and screen states.
- widget/component expectations.
- state ownership.
- data/repository/contract boundaries.
- error handling.
- tests and verification.
- stop rules.

If any of these are missing, update the phase or produce a separate plan before
implementation.

## Plan Must Include

- target files.
- branch/base branch recommendation when the project uses branches.
- widget tree.
- provider/state design.
- domain repository interfaces used.
- fake repository or fixture needs.
- loading/error/empty/success states.
- validation, retry, disabled, dirty, conflict, and permission states where
  applicable.
- responsive behavior.
- accessibility and localization.
- exact design-system tokens/components or explicit DS gaps.
- tests with happy/unhappy/edge coverage.
- verification commands.
- definition of done.
- stop rules.

## Test Planning Minimum

For every meaningful unit, define:

- at least 2 happy cases.
- at least 2 unhappy cases.
- at least 5 edge cases.

If fewer cases are sufficient, justify why the unit has fewer meaningful paths.
Assertions must be exact: values, counts, labels, codes, states, side effects,
or visible widgets. Avoid weak assertions such as `isNotNull`, `isNotEmpty`,
`no exception`, or broad substring checks when exact outcomes are known.

## Boundaries

- Do not write production code.
- Do not invent product behavior missing from the approved concept.
- Do not import Data directly into Presentation.
- Do not mix frontend/backend implementation scope.
- Do not decide backend contracts, DTOs, endpoints, mapping, persistence, or
  policy architecture from a frontend plan. Describe frontend need and create a
  linked `Backend:` or `Contract:` follow-up.
- Do not leave error handling or testing as generic "handle gracefully" or
  "add tests".
