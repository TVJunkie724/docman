---
name: ui-debugger
description: Use when debugging DocMan/Mappm Flutter UI/runtime/build/test failures, Riverpod provider issues, layout overflow, desktop/mobile platform UI problems, fake repository behavior, generated/client boundaries, error presentation, or frontend logs. Finds root cause and applies the smallest production-grade fix without redesigning.
---

# Mappm UI Debugger

Use this skill for Flutter/UI diagnostics, not redesign.

Read first:

- active error/log/stack trace/failing command output.
- `.codex/skills/ui-onboarding/SKILL.md`
- relevant F-concepts, design-system concepts, plan, and implementation files.
- `ui-builder` only if implementing a fix.

## Entry Checks

Before editing:

1. Capture the exact symptom and command/output.
2. Identify the affected layer:
   - Presentation: widgets/layout/semantics/animation.
   - Logic: Riverpod providers/notifiers/state.
   - Domain: entities/repository interfaces/workflows.
   - Data: fakes/adapters/local persistence/API client.
   - Platform: macOS/iOS/Android/Windows/Linux plugin/runtime.
3. Build the causal chain:

```text
Symptom:
Immediate failing call/widget/provider:
Upstream dependency:
Root cause:
Correct fix boundary:
Verification:
```

Do not guess around stack traces. Treat them as primary evidence.

## Allowed Fixes

- Fix the smallest layer that owns the root cause.
- Split responsibilities along existing Clean Architecture boundaries.
- Add explicit parameters or providers to remove hidden coupling.
- Add targeted tests that would fail before the fix.
- Improve diagnostics if missing evidence caused the gap.

## Forbidden Fixes

- Swallowing exceptions to hide failures.
- Adding silent defaults for IDs, profiles, secrets, backend URLs, storage, or
  trust state.
- Letting Presentation call Data/storage/API directly.
- Replacing a real bug with fake/demo data.
- Broad refactors or redesigns unless explicitly requested.
- Weakening privacy, redaction, logging, secure storage, or trust boundaries.

## Verification

Prefer narrow first:

```bash
dart analyze <changed-files>
flutter test <targeted-test-file>
flutter analyze
flutter test
scripts/verify.sh
```

If broad verification is blocked by known legacy debt, report it and provide
targeted evidence for the fix.

## Output

For diagnosis-only:

```markdown
## Root Cause
## Impact
## Fix Plan
## Verification
```

For implemented fixes:

- concise fix summary.
- files changed.
- verification run.
- residual risk.
