---
name: ui-debugger
description: Use when diagnosing [PROJECT_NAME] Flutter UI defects, layout issues, state bugs, provider cycles, API/client failures, secure-storage/session bugs, platform runtime issues, test failures, accessibility issues, visual regressions, or frontend logs.
---

# [PROJECT_NAME] UI Debugger

## Mission

Reproduce, isolate, explain, and fix or plan the smallest durable solution for
frontend problems. This skill is diagnostic first; it is not permission for
redesign, broad refactors, silent fallbacks, or temporary workarounds.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- relevant concepts, decisions, plans, and tests.
- affected code and recent changes.
- exact error, log, stack trace, failing command, screenshot, or reproduction.

Also use:

- `frontend-error-handling` when the issue involves user-facing errors,
  validation, auth/API failure, reference codes, diagnostics, logging, retry, or
  notifications.
- `frontend-test-coverage` when the fix needs tests or when a failing test
  reveals missing coverage.

## Diagnostic Taxonomy

Classify the issue before editing:

| Category | Examples |
|---|---|
| Build/static analysis | compile errors, analyzer issues, generated drift |
| Test failure | unit, provider, widget, golden, integration |
| State/provider | lifecycle bug, provider cycle, stale result, invalid ref use |
| API/client/contract | mapper failure, generated client drift, auth header, mock mismatch |
| UI runtime/layout | overflow, constraints, focus, semantics, animation |
| Platform/session/storage | secure storage, keychain/keystore, permissions, packaging |
| Error/logging | unsafe copy, leaked URL/token, missing reference code, noisy stack |

## Workflow

1. Reproduce or localize the issue with the narrowest useful command.
2. Identify expected behavior from docs or plans.
3. Trace ownership boundary: Presentation, State, Domain, Data, Platform,
   Contract, or Backend.
4. Build the causal chain:

```text
Symptom:
Immediate failing call:
Upstream dependency:
Root cause:
Correct fix boundary:
Verification:
```

5. Propose or implement the smallest durable fix.
6. Add or update a targeted test when feasible.
7. Verify with targeted tests or manual evidence.

## Forbidden Fixes

- swallowing exceptions to make UI continue.
- adding silent defaults for config, URLs, IDs, ports, tokens, or secrets.
- hiding backend contract issues in widgets.
- introducing new UI primitives when an existing design-system primitive fits.
- changing backend code from a UI debugging task without explicit owner handoff.
- weakening security, signing, storage, session, or privacy rules.

## Output

For diagnosis:

- root cause.
- impact.
- fix boundary.
- verification plan.

For implemented fixes:

- summary.
- high-signal files changed.
- tests/commands run.
- residual risk.

## Stop Rules

Stop when expected behavior is not specified, the fix requires product
decision, or frontend/backend ownership is mixed.

Also stop when:

- the fix would require backend contract, DTO, endpoint, mapping, persistence,
  or policy decisions.
- the safest fix requires a concept/decision update.
- the error path has no approved user-safe presentation rule.
