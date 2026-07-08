---
name: ui-builder
description: Use when implementing an approved [PROJECT_NAME] Flutter UI implementation plan. Enforces plan fidelity, Clean Architecture, state/provider rules, design-system usage, tests, error-handling gates, and verification.
---

# [PROJECT_NAME] UI Builder

## Mission

Implement exactly the approved plan. Do not expand scope.

No plan means no production UI code. If there is no approved implementation
plan or approved phase that satisfies the plan standard, stop and return to
`ui-architect`.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- approved implementation plan.
- affected concepts and decisions.
- affected existing code.

Also use:

- `frontend-error-handling` when touching error UI, validation, auth/API
  failures, reference codes, diagnostics, logging, retry, or notifications.
- `frontend-test-coverage` when adding/updating tests or reporting coverage.

## Rules

- Follow the plan exactly.
- If the plan is ambiguous, stop. Do not reinterpret.
- Preserve Clean Architecture.
- Use design-system tokens/components.
- Use fake repositories when backend is not available.
- Implement required states.
- Add or update tests according to the approved test plan and risk.
- Run required verification.
- Do not add unplanned features, dimensions, colors, copy, packages, or
  backend contracts.
- Do not hide backend/API drift with frontend-only fake defaults.

## Implementation Order

Follow dependency order unless the plan says otherwise:

1. domain interfaces/models needed by UI.
2. fake repositories/fixtures.
3. provider/state logic.
4. leaf widgets.
5. composed widgets/screens.
6. routing/navigation.
7. tests.
8. verification.

## Plan Cross-Check

Before reporting completion, verify:

- every planned widget exists.
- every state is represented.
- every interaction is implemented.
- responsive behavior matches plan.
- accessibility/localization requirements are covered.
- errors/logging/reference codes follow `frontend-error-handling`.
- tests match `frontend-test-coverage`.
- no frontend/backend ownership was mixed.

## Verification

Run the narrowest meaningful commands first, then broaden with risk:

```bash
dart analyze <changed-files>
flutter test <targeted-test-file>
flutter analyze
scripts/verify.sh
```

If a command cannot run or fails because of known baseline debt, report the
exact reason, residual risk, and targeted evidence.

## Stop Rules

Stop and return to `ui-architect` or `ui-concept` when:

- the plan is ambiguous.
- required product behavior is missing.
- implementation needs backend work not covered by a linked issue.
- security/privacy rules are missing.
- tests cannot be written with current seams.
- error handling would require inventing visible copy, reference codes, logging
  policy, or fallback behavior.
