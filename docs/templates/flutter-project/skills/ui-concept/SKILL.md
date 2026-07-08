---
name: ui-concept
description: Use when creating or revising [PROJECT_NAME] Flutter UI/frontend concepts, F-concepts, design-system concepts, roadmap entries, phases, subphases, implementation-contract phase documents, and UI handoffs.
---

# [PROJECT_NAME] UI Concept

## Mission

Plan production UI before code. A phase is an implementation contract that lets
`ui-architect` create a code-level plan without inventing product behavior.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- `docs/PROJECT_OVERVIEW_GUIDE.md`
- `docs/ROADMAP_REBUILD.md`
- affected `docs/concepts/CONCEPT_F*.md`
- affected `docs/design-system/concepts/*.md`
- affected `docs/pillars/PILLAR_*.md`
- affected `docs/technical/DECISION_*.md`

## Concept Quality Gate

Every UI concept or phase must define:

- status.
- scope, non-goals, deferred work.
- user flow.
- desktop and mobile/narrow structure.
- states: empty, loading, error, success, blocked, dirty.
- data grounding and fake repository need.
- backend/API/contract boundary.
- security/privacy.
- accessibility/localization.
- test and verification expectations.
- stop rules.
- next handoff target.

## Stop Rules

Do not hand off to implementation when:

- product behavior is vague.
- design-system ownership is unclear.
- fake data rules are missing.
- privacy-sensitive states are unspecified.
- frontend/backend scope is mixed.
