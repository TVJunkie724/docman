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
- Generated files are committed and must be reproducible with `scripts/codegen.sh`.

## Workflow

1. Confirm the phase/slice and related GitHub Issue.
2. Check dirty state and protect unrelated edits.
3. Run or record baseline verification:

```bash
scripts/codegen.sh
flutter test
flutter analyze
```

Use `scripts/verify.sh` when strict R3 gates are expected to pass. If it fails from known legacy debt, report that separately.

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
- Tests pass for changed scope.
- Analyzer/format debt is not increased; any known baseline debt is explicitly named.
- Related GitHub Issue has commit/verification/residual-risk context when appropriate.
