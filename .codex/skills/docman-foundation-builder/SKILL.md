---
name: docman-foundation-builder
description: Use when implementing DocMan R2/R3 technical foundation work that is not primarily UI, including app bootstrap, Riverpod provider foundation, scripts, dependencies, codegen, cleanup of BLoC/GetIt/Isar/PocketBase expansion, secure boundaries, repository/provider wiring, and foundation verification.
---

# DocMan Foundation Builder

Use this skill for technical foundation implementation. For UI screens use `docman-ui-builder`; for data schema design use `docman-data-architect`; for R3 quality strategy use `docman-quality-readiness`.

Read:

- `.codex/skills/docman-ui-onboarding/SKILL.md`
- `.codex/skills/docman-git-safety/SKILL.md` before Git operations
- `docs/technical/R2_TECHNICAL_FOUNDATION_IMPLEMENTATION_PLAN.md` when R2 scope is involved
- `docs/ROADMAP_REBUILD.md` for phase boundaries

## Non-Negotiables

- Riverpod is the target DI/state foundation.
- Do not expand BLoC/GetIt except for explicit temporary compatibility work.
- SQLite + Drift is the target structured local data layer.
- Isar and PocketBase are legacy; do not add new product dependency on them.
- Domain interfaces must not expose SDK-specific types.
- Presentation must not import `lib/data/`.
- Secrets belong behind Secure Storage boundaries.
- Generated Dart artifacts are not committed; they must be reproducible with `scripts/codegen.sh`.

## Workflow

1. Confirm the phase/slice and related GitHub Issue.
2. Check dirty state and protect unrelated edits.
3. Run or record baseline verification:

```bash
scripts/codegen.sh
flutter test
flutter analyze
```

Use `scripts/verify.sh` when strict R3 gates are expected to pass. If it fails because legacy still leaks into product, build, tests, or analyze paths, report that as an isolation/removal blocker instead of treating the old spike as code to modernize.

4. Implement narrowly in dependency order:
   - core/domain abstractions
   - provider/repository boundaries
   - app bootstrap/configuration
   - scripts/tooling/codegen
   - tests or smoke checks
5. Run targeted verification after each meaningful layer.
6. Update docs or GitHub Issues when the implementation reveals a decision or follow-up.

## Definition Of Done

- New foundation code follows Riverpod and Clean Architecture boundaries.
- No new BLoC/GetIt/Isar/PocketBase expansion.
- Codegen is reproducible.
- No new `*.freezed.dart` or `*.g.dart` files are staged unless an approved exception exists.
- Tests pass for changed scope.
- Target-path analyzer/format debt is not increased; legacy leaks are explicitly named as isolation/removal work.
- Related GitHub Issue has commit/verification/residual-risk context when appropriate.
