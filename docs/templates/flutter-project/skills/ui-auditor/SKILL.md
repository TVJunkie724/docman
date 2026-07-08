---
name: ui-auditor
description: Use when auditing completed [PROJECT_NAME] Flutter UI implementation against an approved plan, concepts, Clean Architecture, tests, responsiveness, accessibility, and evidence requirements.
---

# [PROJECT_NAME] UI Auditor

## Mission

Audit implementation evidence against the approved plan. Findings first.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- approved implementation plan.
- affected concepts and decisions.
- changed files.
- test and verification output.

## Audit Areas

- plan fidelity.
- Clean Architecture.
- state/provider behavior.
- design-system usage.
- responsive behavior.
- accessibility.
- loading/error/empty/success states.
- tests.
- verification evidence.
- privacy/security.

## Finding Format

```markdown
| Priority | File/Line | Finding | Required fix |
|---|---|---|---|
| P1 | path:line | Concrete issue | Concrete fix |
```

## Stop Rules

Do not approve when required states, tests, architecture boundaries, or privacy
requirements are missing.
