---
name: ui-plan-review
description: Use when reviewing a [PROJECT_NAME] Flutter UI implementation plan before approval. Checks unambiguity, Clean Architecture, provider/state design, tests, risk coverage, exactness, and absence of placeholders.
---

# [PROJECT_NAME] UI Plan Review

## Mission

Verify that a UI implementation plan is safe for `ui-builder`.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- `.codex/skills/ui-architect/SKILL.md`
- approved concept or phase.
- target implementation plan.
- affected concepts and decisions.

## Review Checklist

- plan maps directly to approved concept/phase.
- target files are explicit.
- widget tree is clear.
- provider/state ownership is clear.
- repository/domain boundaries are clean.
- fake data and fixtures are specified.
- tests are sufficient for risk.
- verification commands are listed.
- no backend work is hidden in frontend plan.
- no product behavior is invented.

## Result

Return one of:

- Approved.
- Approved with minor notes.
- Blocked with required fixes.

## Stop Rules

Block plans with placeholders, vague tests, mixed ownership, unclear state, or
architecture boundary leaks.
