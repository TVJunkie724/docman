---
name: docman-ui-audit-review
description: Use when reviewing a DocMan UI audit report or independently re-checking an implementation after audit findings. Validates plan fidelity, Clean Architecture, tests, DoD, changed files, and evidence quality from architect and builder perspectives.
---

# DocMan UI Audit Review

Use this skill to review a completed implementation or audit report against the approved plan.

Read `.codex/skills/docman-ui-onboarding/SKILL.md` first.

## Mandatory Criteria

Check every criterion:

1. Plan fidelity: every deviation from the approved plan is a finding.
2. Clarity and maintainability.
3. No over-engineering beyond the plan.
4. No negative side effects.
5. Type compatibility at layer boundaries.
6. Everything in the plan is done.
7. ASCII layout matches.
8. Widget tree matches.
9. No hardcoded tokens unless explicitly planned.
10. Riverpod providers, state, and commands match the plan.
11. Clean Architecture boundaries are preserved.
12. New dependencies are registered through Riverpod providers.
13. Tests contain hard assertions.
14. Provider/Notifier tests exist where planned.
15. Widget tests exist where planned.
16. Planned tests pass.
17. Every Definition of Done item is complete.
18. No leftover TODO/FIXME/HACK comments, commented-out code, or debug prints.

## Process

1. Read the approved implementation plan.
2. Read the associated concept and referenced docs.
3. Read every changed source and test file.
4. Run verification commands:

```bash
flutter analyze
flutter test
rg "\\bprint\\(" lib test
rg "TODO|FIXME|HACK" lib test
```

5. Review from architect and builder perspectives.
6. Produce concrete findings with file, line, evidence, severity, and fix.
7. If there are zero findings, state that the implementation is approved.

## Finding Format

```markdown
| File | Problem | Severity | Evidence | Fix |
|---|---|---|---|---|
| lib/...:42 | ... | Critical/Major/Minor | ... | ... |
```
