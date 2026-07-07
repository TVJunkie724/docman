---
name: ui-audit-review
description: Use when reviewing a DocMan/Ordna UI audit report, re-checking an implementation after audit findings, or validating evidence quality after remediation. Reviews from architect, builder, and auditor perspectives for plan fidelity, Clean Architecture, tests, DoD, changed files, and evidence sufficiency.
---

# DocMan UI Audit Review

Use this skill to independently review an audit report or re-check an
implementation after remediation.

Read:

- `.codex/skills/ui-onboarding/SKILL.md`
- `.codex/skills/ui-auditor/SKILL.md`
- approved plan.
- audit report.
- changed files and verification evidence.

## Mandatory Review

Check:

1. Audit used the approved plan as source of truth.
2. Audit covered all phases in `ui-auditor`.
3. Evidence is concrete: file/line, command output, screenshots, or test names.
4. Findings are not vague and have required fixes.
5. No plan deviations were accepted as "close enough".
6. Clean Architecture boundaries were actually checked.
7. Tests contain hard assertions and were run.
8. Baseline debt vs new regressions is separated.
9. Remediation fixed findings without adding scope.
10. Final verdict is justified: APPROVED or REJECTED.

## Output

Lead with findings:

```markdown
| Evidence | Problem | Severity | Required action |
|---|---|---|---|
| ... | ... | Critical/Major/Minor | ... |
```

If no findings remain, state that the audit evidence is sufficient and the
implementation may be considered approved.
