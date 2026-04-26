---
name: docman-ui-builder
description: Use when implementing an approved DocMan Flutter UI implementation plan. Requires an approved plan before code changes and enforces Riverpod target architecture, Clean Architecture, theme-token usage, verification after each layer, tests, and exact plan fidelity.
---

# DocMan UI Builder

Use this skill to implement an approved DocMan UI plan.

Read `.codex/skills/docman-ui-onboarding/SKILL.md` first. Use `.codex/skills/docman-git-safety/SKILL.md` for branch, merge, or conflict work.

## Non-Negotiables

- No approved plan means no implementation.
- Implement exactly what the approved plan specifies.
- Do not redesign, reinterpret, or add unplanned features.
- Use Riverpod for new target-architecture state management and dependency injection.
- Do not expand BLoC/GetIt unless the approved foundation migration plan explicitly requires temporary compatibility work.
- Presentation must not import `lib/data/`.
- Riverpod feature-state providers must not call Isar or PocketBase directly.
- Route data access through Domain repository interfaces exposed by providers.

## Workflow

1. Read the approved implementation plan completely.
2. Verify baseline health when feasible:

```bash
flutter analyze
flutter test
```

If baseline is broken, report it before implementing unless the user explicitly asked you to fix it.

3. Research existing providers or legacy BLoCs, screens, shared widgets, dependency setup, theme, domain entities, and repositories.
4. Implement in dependency order:
   - Domain interfaces/entities.
   - Data repository implementations.
   - Provider-based dependency injection.
   - Riverpod providers, Notifiers, state, and logic.
   - Leaf widgets.
   - Screens.
   - Navigation.
   - Theme tokens.
5. Run `flutter analyze` after each meaningful layer.
6. Cross-check every plan item against the code.
7. Run `flutter test`.
8. Report files changed, verification results, deviations, and open items.

## Code Quality Standards

- Prefer smart screen widgets and dumb child widgets.
- Use `const` constructors where possible.
- Provide stable keys for list items and moving widgets.
- Keep build methods focused; extract large subtrees.
- Keep side effects and repository calls out of `build()`.
- Handle loading, data, error, and empty states for async flows.
- Dispose streams and controllers through provider lifecycle hooks or widget lifecycle as appropriate.
- Follow existing folder structure and import ordering.

## Anti-Patterns

- Do not call Isar or PocketBase from widgets or feature-state providers.
- Do not hardcode colors or dimensions when a theme token exists or is specified.
- Do not skip loading, error, or empty states.
- Do not leave `print()`, TODO/FIXME/HACK, or commented-out code.
- Do not continue past an analysis failure without fixing the current layer.

## Definition Of Done

- All plan components implemented.
- `flutter analyze` is clean or any pre-existing issues are clearly identified.
- `flutter test` passes or failures are clearly identified.
- Clean Architecture boundaries are respected.
- Responsive behavior, interactions, animations, and accessibility match the plan.
- Ready for `docman-ui-auditor`.
