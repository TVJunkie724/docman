---
name: ui-concept-review
description: Use when reviewing a [PROJECT_NAME] UI concept, F-concept, design-system concept, roadmap phase, or handoff for executability, completeness, contradictions, over-engineering, and implementation readiness.
---

# [PROJECT_NAME] UI Concept Review

## Mission

Review concepts before they become implementation inputs.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- `.codex/skills/ui-concept/SKILL.md`
- target concept or phase.
- referenced decisions, F-concepts, design-system concepts, and pillars.

## Review Checklist

- status and owner are clear.
- scope, non-goals, and deferred work are explicit.
- user flows and states are complete.
- desktop and mobile/narrow behavior are covered.
- design-system ownership is clear.
- data/backend/contract grounding is explicit.
- security/privacy is specific.
- accessibility and localization are addressed.
- tests and verification are executable.
- stop rules are concrete.

## Finding Format

```markdown
| Priority | Location | Problem | Required fix |
|---|---|---|---|
| P1 | file:line | Concrete issue | Specific edit |
```

## Stop Rules

Do not approve concepts that require implementation agents to invent product
behavior, data contracts, privacy handling, or design-system rules.
