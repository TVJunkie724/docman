---
name: ui-builder
description: Use when implementing an approved DocMan/Mappm Flutter UI implementation plan. Requires an approved plan before any UI code changes and enforces exact plan fidelity, Riverpod target architecture, Clean Architecture, theme-token usage, fake repository boundaries, verification, tests, and handoff to audit.
---

# Mappm UI Builder

Use this skill to implement an approved Mappm UI plan. No approved plan means
no code.

Read first:

- `.codex/skills/ui-onboarding/SKILL.md`
- approved implementation plan completely.
- `.codex/skills/git-safety/SKILL.md` for branch/merge/conflict work.

## Non-Negotiables

- Implement exactly what the approved plan specifies.
- Do not redesign, reinterpret, expand scope, or add unplanned features.
- If the plan is unclear or contradicts code reality, stop and ask for plan
  revision.
- Use Riverpod for new target-architecture state/DI.
- Do not expand BLoC/GetIt/Isar/PocketBase legacy paths unless explicitly
  planned.
- Presentation must not import `lib/data/`.
- Feature-state providers must not call Drift, Isar, PocketBase, file storage,
  secure storage SDKs, HTTP clients, or Microcks directly.
- Route data access through Domain repository interfaces.
- Use theme/design-system tokens; do not hardcode planned token values unless
  the plan explicitly says so.
- No `print()`, TODO/FIXME/HACK, commented-out code, or debug-only behavior in
  production paths.
- For F37 work, preserve one `Case` type, typed non-owning Case links,
  Custom/Guided parity, distinct Records/Documents/insurance-settlement Cases
  and repeatable submission events, plus reversible composition exactly as
  planned. Never add a Subcase entity or strict tree as a convenience
  implementation.
- Do not display unconfirmed financial/tax suggestions as facts, empty insight
  sections, single-value charts or automatic roll-ups outside approved
  `part_of` relationships.
- For Assist/Capture/Review work, preserve the accepted small-/medium-model
  boundary: user-selected Managed Subject/Case context is authoritative;
  Product-/Document-defined fields receive only their reviewable top proposal,
  alternatives and no-value/manual fallback; mixed semantic content remains
  one generic document; no semantic wrong-profile/case/document error,
  autonomous state/deadline/relation, date-bearing automatic title or M1
  training/donation flow may be added. Scan-quality suggestions are technical,
  non-blocking and dismissible.
- For F38 work, render only approved real processing stages. Preserve
  background/restart state, Review Queue, Reduced Motion and privacy-safe copy;
  never synthesize percent progress, countdowns or feature-advertising
  carousels.

## Workflow

1. Read the approved plan and source docs.
2. Verify baseline when feasible:
   - Prefer `scripts/verify.sh`.
   - If known R3 debt blocks it, run targeted `flutter analyze`, `flutter test`,
     or changed-scope checks and report baseline debt.
3. Inspect existing code: providers, screens, widgets, theme, entities,
   repositories, bootstrap, tests.
4. Implement in dependency order:
   - Domain interfaces/entities if planned.
   - Fake/data adapters if planned.
   - Provider registration.
   - Riverpod state/notifiers.
   - Leaf widgets.
   - Screens.
   - Navigation.
   - Theme tokens.
   - Tests.
5. Verify after each meaningful layer.
6. Cross-check the plan line by line.
7. Run final verification.
8. Report ready for `ui-auditor`.

## Code Quality Standards

- Smart screens watch providers; child widgets receive data/callbacks.
- Keep business logic and side effects out of `build()`.
- Handle loading/data/error/empty states for async flows.
- Use `const` constructors where possible.
- Stable keys for lists and moving widgets.
- Extract large subtrees into named widgets.
- Keep text fitting across desktop/mobile and text scale.
- Preserve accessibility semantics and focus order.
- Keep imports clean and layer-safe.

## Verification

Use the narrowest meaningful checks first, then broaden:

```bash
dart analyze <changed-dart-files>
flutter test <targeted-test-file>
flutter analyze
flutter test
scripts/verify.sh
rg "\\bprint\\(" lib test
rg "TODO|FIXME|HACK" lib test
rg "import .*data/" lib/presentation
```

If broad checks fail from known baseline debt, separate baseline debt from new
regressions with evidence.

## Completion Report

Include:

- summary of implemented plan.
- high-signal files changed.
- verification commands and results.
- deviations: should be none; if any, explain approved reason.
- residual risks.
- explicit statement: ready for `ui-auditor` or blocked.
