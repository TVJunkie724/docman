---
name: ui-auditor
description: Use when auditing a completed DocMan/Mappm Flutter UI implementation against an approved implementation plan. Performs evidence-based final quality gate checks across plan fidelity, changed files, Clean Architecture, widget tree, Riverpod state/providers, visual layout, responsiveness, interactions, accessibility, privacy/error handling, tests, verification, and Definition of Done.
---

# DocMan UI Auditor

Use this skill as the final quality gate after implementation.

Read first:

- `.codex/skills/ui-onboarding/SKILL.md`
- approved implementation plan.
- associated concept/phase/handoff.
- changed files and test evidence.

## Core Standard

The approved plan is the source of truth. The implementation must match it
exactly. Every widget, field, state, animation, breakpoint, interaction, test,
and DoD item specified in the plan must exist. Unplanned additions are findings.

Do not approve with known defects. If any required item fails, reject and require
remediation.

## Audit Phases

1. Plan integrity:
   - approved plan exists and is complete.
   - approval is documented or stated by the user.
2. Structure:
   - all planned files exist.
   - no unexpected files or scope drift.
   - names/locations match conventions.
3. Clean Architecture:
   - Presentation does not import `lib/data/`.
   - providers do not call storage/HTTP/legacy SDKs directly.
   - Domain repository interfaces are used.
4. Widget tree:
   - hierarchy, names, constructor parameters, keys, smart/dumb split match.
5. Riverpod state/providers:
   - providers, notifiers, state fields, commands, side effects, lifecycle
     match.
6. Visual/layout:
   - ASCII layout translated faithfully.
   - spacing/colors/dimensions/typography use approved tokens.
7. Responsive/text scale:
   - desktop/tablet/mobile behavior and overflow handling verified.
8. Interactions/animations:
   - hover/focus/press/keyboard/loading/error/retry/destructive/reduced motion.
9. Accessibility/localization:
   - semantics, focus traversal, contrast, German copy.
10. Error/privacy/diagnostics:
    - safe copy, redaction, no sensitive logs/screenshots/fixtures.
11. Tests/verification:
    - planned tests exist with hard assertions and pass.
    - broad or targeted checks run with baseline debt separated.
12. Plan completeness:
    - every DoD item verified; nothing skipped; nothing added.
13. F37 domain/UX integrity when applicable:
    - one Case type and correct typed relation direction; no separate Subcase
      model, hidden cascade, copy-on-compose or strict-tree assumption.
    - Custom/Guided parity, distinct Unterlage/Document/Claim/subject/party
      semantics and reversible link behavior.
    - contextual action limits, confirmed-value gating, accessible charts and
      deduplicated eligible financial roll-ups match the approved plan.
    - country/tax/cancellation behavior comes from approved policy, not UI
      invention.

## Useful Checks

```bash
scripts/verify.sh
flutter test
flutter analyze
rg "\\bprint\\(" lib test
rg "TODO|FIXME|HACK" lib test
rg "import .*data/" lib/presentation
rg "<<<<<<|>>>>>>|======" .
```

Adapt checks to changed-file scope. If `scripts/verify.sh` fails due known
legacy debt, prove whether the implementation introduced new failures.

## Audit Report

If findings exist:

```markdown
## AUDIT FAILED

| Phase | Evidence | Severity | Required Fix |
|---|---|---|---|
| ... | file:line or command output | Critical/Major/Minor | ... |

Status: REJECTED - requires remediation and re-audit.
```

If no findings exist:

```markdown
## AUDIT PASSED

Feature:
Date:
Plan:

| Phase | Result | Evidence |
|---|---|---|
| Plan Integrity | Verified | ... |
| Structure | Compliant | ... |
| Clean Architecture | No violations | ... |
| Widget Tree | Matches plan | ... |
| Riverpod State | Correct | ... |
| Visual/Layout | Matches plan | ... |
| Responsive | Verified | ... |
| Interactions | Verified | ... |
| Accessibility | Verified | ... |
| Error/Privacy | Verified | ... |
| Tests | Passed | ... |
| DoD | Complete | ... |

Status: APPROVED.
```
