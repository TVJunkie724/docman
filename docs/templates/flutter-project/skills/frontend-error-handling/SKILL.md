---
name: frontend-error-handling
description: Use when [PROJECT_NAME] frontend work touches error handling, user-facing error presentation, validation failures, auth/API/client failures, local notifications, reference codes, diagnostic IDs, logging hygiene, fake/mock error scenarios, retries, or support diagnostics.
---

# [PROJECT_NAME] Frontend Error Handling

## Mission

Keep frontend errors user-safe, supportable, testable, privacy-safe, and aligned
with approved concepts. Use this together with `ui-concept`, `ui-architect`,
`ui-builder`, `ui-debugger`, `ui-auditor`, `contract-api`, or
`frontend-test-coverage` whenever work touches error behavior.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- `docs/concepts/CONCEPT_F5_ERROR_HANDLING.md`
- `docs/concepts/CONCEPT_F18_NOTIFICATIONS_FAILURES_OBSERVABILITY.md`
- relevant API/contract/security/privacy decisions.
- relevant phase or implementation plan.

## Non-Negotiable Rules

- Silent fallbacks are forbidden unless explicitly approved by concept or user.
- User-facing messages are short, calm, action-oriented, and localized.
- Never show stack traces, raw exception text, backend internals, endpoint URLs,
  tokens, tenant/org/user IDs, secrets, config values, or raw payload fragments
  in user-facing UI.
- Technical details belong in sanitized structured logs.
- Every handled error is either deliberately logged or explicitly documented as
  intentionally silent.
- Visible reference codes must come from the project catalog or concept.
- Backend/API contract drift is handled at contract/repository boundaries, not
  hidden with UI-only fake defaults.

## Classification Workflow

For every new or changed error path:

1. Identify source: validation, auth/session, platform, API/client, contract,
   repository, state, widget/layout, or backend notification.
2. Identify actor: user, admin/support, developer, or no action in-session.
3. Decide visibility: message, reference code, diagnostic ID, retry, details,
   or silent-with-reason.
4. Define safe copy and localization key.
5. Define sanitized log shape.
6. Define fake/mock scenario.
7. Add tests for visible behavior and hidden logging/sanitization behavior.

## Required Edge Cases

Cover applicable cases:

- user cancellation.
- unauthorized/expired session.
- forbidden/permission boundary.
- missing setup/config.
- not found.
- timeout/offline/DNS/socket failure.
- backend 5xx/unavailable.
- malformed payload or contract parsing failure.
- validation error and dirty form state.
- unknown fallback error.

## Test Gate

Use `frontend-test-coverage` for exact coverage. At minimum, prove:

- correct user-safe text.
- no raw sensitive details leak.
- reference code visibility is correct.
- retry/cancel/action behavior is correct.
- logging sanitizer removes URLs, IDs, tokens, raw payload, raw exception text,
  and stack traces where required.

## Stop Rules

Stop when:

- no approved user-facing error model exists.
- a visible reference code would need to be invented ad hoc.
- handling would hide backend/API drift.
- logging would expose sensitive data.
- fallback behavior would alter product semantics.
