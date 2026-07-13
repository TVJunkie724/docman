---
title: "R3.5 Target Path Quality Baseline"
description: "Approval-ready implementation contract for separating strict Mappm target-path gates from legacy baseline debt"
tags: [roadmap, phase, r3, quality, analyzer, verification]
lastUpdated: "2026-07-12"
status: "ready-for-user-approval"
owner: "quality-readiness"
sourceIssue: "https://github.com/TVJunkie724/docman/issues/25"
---

# R3.5 Target Path Quality Baseline

## 1. Status

Ready for explicit user/product-owner approval. Implementation must not start
until that approval is recorded with date in this section, the handoff and the
decision traceability matrix. A general instruction to repair review findings
is not phase approval. This phase never approves broad legacy cleanup or
product-feature implementation.

## 2. Objective

Provide one deterministic local target-path gate that passes for the current
Mappm foundation, keeps the full-project gate visible, and classifies failures
as target-path regression, known legacy debt or tooling/infrastructure failure.

## 3. Scope

- Define the strict target set as exactly:
  - `lib/app/**`
  - `lib/core/id/id_generator.dart`
  - `lib/core/time/clock.dart`
  - `lib/presentation/theme/app_theme.dart`
  - `test/widget_test.dart`
- Add `scripts/verify_target.sh` and expose it as the discoverable
  `./frontend.sh verify-target` command.
- Keep `scripts/verify.sh` as the full-project aspiration; do not silently weaken
  it or turn analyzer warnings off globally.
- Add import/dependency checks that prevent target Presentation/App code from
  introducing BLoC, GetIt, Isar or PocketBase expansion.
- Document failure classification and exact exit behavior.
- Add deterministic failure-path evidence for forbidden imports, invalid
  invocation and interruption cleanup as required by issue #25.
- Fix only formatting or analyzer findings inside the exact target set when
  required to make the new gate truthful.

## 4. Out Of Scope

- fixing every existing analyzer/deprecation issue.
- migrating Isar/PocketBase or all legacy screens.
- CI provider selection, branch protection or release workflows.
- new product UI, repositories, backend, OpenAPI or Microcks contracts.
- suppressing target-path failures to produce a green command.

## 5. Dependencies And Inputs

- F1, F3, F4, F15 and F16.
- `DECISION_LEGACY_READINESS_SCOPE.md` and milestone quality gates.
- `frontend.sh`, `scripts/verify.sh`, `scripts/codegen.sh`.
- Issue #25, updated to the `Quality:` owner contract.

No open product, backend or legal decision blocks this phase.

## 6. Developer Flow

User-facing screen flow: not applicable; this is a developer/CI foundation
phase.

Required developer flow:

```text
fresh checkout / existing workspace
  -> ./frontend.sh doctor
  -> ./frontend.sh verify-target
      -> format check
      -> target analyzer check
      -> target tests
      -> forbidden legacy dependency check
  -> success with zero target failures
     OR classified failure with non-zero exit
```

The command must print the exact five target rows above before executing. It
must not discover or shrink its scope dynamically. It must not print secrets,
env values, absolute private paths or document data.

Exit contract:

- `0`: every target check passed.
- `1`: formatting, analysis, test or forbidden-dependency check failed.
- `2`: required tool, script or target file is missing, or invocation is invalid.
- signal interruption: preserve the shell's non-zero signal exit; never convert
  interruption into success.

## 7. Architecture And Ownership Boundaries

- `quality-readiness` owns gate behavior and evidence.
- `foundation-builder` is consulted only if bootstrap/codegen ownership changes.
- Target checks enforce App/Presentation dependency on Domain-facing
  abstractions and prohibit direct imports of Data implementations.
- This phase does not decide backend contracts, DTOs, persistence or policy.
- Generated artifacts remain reproducible outputs, not committed source.

## 8. Applicable Planning Rows

Always-plan: architecture, project entrypoints, testing, error/observability,
fake repositories, CI/CD and security/privacy diagnostics.

Conditional: CI provider is not activated; Microcks/contracts are not activated
because this phase has no API consumer/provider behavior.

## 9. Security, Privacy, Accessibility And Localization

- Only synthetic tests; no private documents or real secrets.
- Command output and retained logs must not reveal environment secrets.
- Accessibility/localization are not directly applicable to the shell command;
  human-readable output remains concise English technical output consistent
  with existing scripts.
- Future UI tests remain responsible for German copy and accessibility gates.

## 10. Verification

Current baseline measured on 2026-07-11:

- `./frontend.sh doctor`: exits `0`.
- exact target format command below: exits `1`; only
  `lib/presentation/theme/app_theme.dart` needs formatting.
- exact target analyzer command below: exits `0` with two
  `deprecated_member_use` info findings for `ColorScheme.background` in
  `app_theme.dart`.
- `flutter test test/widget_test.dart`: exits `0` with one passing test.
- `./scripts/verify.sh`: exits `1` at formatting with 35 known files; it does
  not reach full analysis/tests.

The R3.5 implementation must make the exact target command pass and may update
the target theme file only for its formatting/deprecation findings. It must not
format the other 34 legacy files as incidental churn.

Required evidence:

```bash
./frontend.sh doctor
./frontend.sh verify-target
dart format --output=none --set-exit-if-changed lib/app lib/core/id/id_generator.dart lib/core/time/clock.dart lib/presentation/theme/app_theme.dart test/widget_test.dart
dart analyze lib/app lib/core/id/id_generator.dart lib/core/time/clock.dart lib/presentation/theme/app_theme.dart test/widget_test.dart
flutter test test/widget_test.dart
./scripts/verify.sh
```

`scripts/verify_target.sh` must run the same format, analyze and widget-test
commands. Before success it must inspect all Dart files in `lib/app`, the three
named supporting source files and `test/widget_test.dart`, and fail on imports of
`package:flutter_bloc`, `package:get_it`, `package:isar` or
`package:pocketbase`, or any relative/package import resolving into `lib/data/`.

Pass criteria:

- doctor exits 0 with required files/tools reported.
- target command exits 0 and runs all named target checks.
- direct narrow analysis and widget test exit 0.
- full verify is run and its current legacy failures are recorded separately;
  it may not be reported as passing until it actually passes.
- a deliberate target-path violation makes the target command exit non-zero in
  test evidence or a reversible validation fixture.

## 11. Definition Of Done

- `verify-target` is documented in `frontend.sh help` and OPS-08.
- target scope and forbidden legacy imports are explicit.
- local and future CI command ownership is documented.
- Issue #25 contains exact scope, tests, verification and residual risk.
- target command passes; full-gate debt remains visible and owned.
- handoff evidence is recorded without claiming R3 or CI/CD complete.

## 12. Stop Rules

Stop if the target set excludes a source required by `lib/app` merely to obtain
a pass, if analyzer rules are globally disabled, if full-gate failure is hidden,
if private fixtures enter tests, or if implementation expands legacy BLoC,
GetIt, Isar or PocketBase paths.

## 13. Handoff

After explicit approval, execute through
`.codex/skills/quality-readiness/SKILL.md` using
`docs/execution/handoffs/R3_5_QUALITY_READINESS_HANDOFF.md`. After implementation,
return evidence to issue #25 and the playbook T7 baseline.
