---
name: docman-ui-auditor
description: Use when auditing a completed DocMan Flutter UI implementation against an approved plan. Performs evidence-based compliance checks across files, architecture, widget tree, Riverpod state/providers, visual layout, responsiveness, interactions, accessibility, analysis, tests, and plan completion.
---

# DocMan UI Auditor

Use this skill as the final quality gate after implementation.

Read `.codex/skills/docman-ui-onboarding/SKILL.md` first. Use `.codex/skills/docman-git-safety/SKILL.md` if merge or branch safety is involved.

## Core Standard

The implementation must match the approved plan exactly. Every widget, field, state, animation, breakpoint, interaction, and test specified in the plan must exist. Unplanned additions are findings.

## Audit Phases

1. Plan integrity:
   - Approved plan exists.
   - Plan is complete.
   - Approval is documented or stated by the user.
2. Structure:
   - All planned files exist.
   - No unexpected files were created.
   - Names and locations match conventions.
   - Import ordering is consistent.
3. Clean Architecture:
   - Presentation does not import `lib/data/`.
   - Riverpod feature-state providers do not call Isar or PocketBase directly.
   - Domain repository interfaces are used.
   - New dependencies are registered through Riverpod providers.
4. Widget tree:
   - Hierarchy matches plan.
   - New and modified widgets match names and constructor parameters.
   - Smart/dumb split, `const`, and keys are used as specified.
5. Riverpod state/providers:
   - Providers, Notifiers, state fields, commands, side effects, and async states match the plan.
6. Visual and layout:
   - Layout matches ASCII diagrams.
   - Spacing, colors, dimensions, and typography match theme-token specs.
   - No unapproved hardcoded values.
7. Responsive behavior:
   - All breakpoints are implemented and match expected layout changes.
8. Interactions and animations:
   - Hover, focus, press, drag, triggers, duration, and curves match plan.
9. Accessibility:
   - Semantic labels, focus traversal, and contrast are addressed.
10. Code quality:
    - `flutter analyze` passes.
    - `flutter test` passes.
    - No `print()`, TODO/FIXME/HACK, or commented-out code remains.
11. Plan completeness:
    - Every Definition of Done item is verified.

## Useful Checks

```bash
flutter analyze
flutter test
rg "import 'package:.*data/|import '../data/|import '../../data/" lib/presentation
rg "\\bprint\\(" lib test
rg "TODO|FIXME|HACK" lib test
rg "<<<<<<|>>>>>>|======" .
```

Adapt checks to the repository's import style and changed-file scope.

## Report Format

If findings exist:

```markdown
## AUDIT FAILED

| Phase | Item | Evidence | Required Fix |
|---|---|---|---|
| ... | ... | file:line or command output | ... |

Status: REJECTED - requires remediation.
```

If no findings exist:

```markdown
## AUDIT PASSED

Feature:
Date:
Plan:

| Phase | Result |
|---|---|
| Plan Integrity | Verified |
| Structure | Compliant |
| Clean Architecture | No layer violations |
| Widget Tree | Matches plan |
| Riverpod State | Correct |
| Visual & Layout | Matches plan |
| Responsive | Verified |
| Interactions | Verified |
| Accessibility | Verified |
| Code Quality | Clean |
| Plan Cross-Check | Complete |

Status: APPROVED FOR RELEASE.
```
