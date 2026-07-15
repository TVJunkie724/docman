---
name: foundation-builder
description: Use when implementing approved Mappm C1/R2/R3 technical foundation work that is not primarily UI, including bootstrap, Riverpod providers, scripts, codegen, legacy cleanup, Local/Cloud Vault boundaries, secure storage, repository/provider wiring, and verification.
---

# Mappm Foundation Builder

Use this skill for technical foundation implementation. For UI screens use `ui-builder`; for data schema design use `data-architect`; for R3 quality strategy use `quality-readiness`.

Read:

- `.codex/skills/ui-onboarding/SKILL.md`
- `.codex/skills/git-safety/SKILL.md` before Git operations
- `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md`
- `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`
- `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`
- the exact approved phase implementation contract and handoff; the old
  `R2_TECHNICAL_FOUNDATION_IMPLEMENTATION_PLAN.md` is superseded
- `docs/ROADMAP_REBUILD.md` and `docs/roadmap/PHASE_INDEX.md` for boundaries

## Non-Negotiables

- Riverpod is the target DI/state foundation.
- Do not expand BLoC/GetIt except for explicit temporary compatibility work.
- SQLite + Drift is the target client structured store: Local authority or
  Cloud cache/pending state according to the active Vault provider.
- Isar and PocketBase are legacy; do not add new product dependency on them.
- Domain interfaces must not expose SDK-specific types.
- Presentation must not import `lib/data/`.
- Secrets belong behind Secure Storage boundaries.
- Generated Dart artifacts are not committed; they must be reproducible with `scripts/codegen.sh`.

## Workflow

1. Confirm the phase/slice and related GitHub Issue.
   Stop if no approved implementation contract exists or an applicable
   VC-01..VC-08, OQ-003 or WF-01/WF-02 decision is still open.
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
