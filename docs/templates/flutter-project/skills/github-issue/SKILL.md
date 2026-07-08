---
name: github-issue
description: Use when creating, classifying, triaging, or updating [PROJECT_NAME] GitHub Issues, including bugs, features, epics, frontend/backend/API handoffs, documentation work, labels, milestones, dependencies, and implementation follow-ups.
---

# [PROJECT_NAME] GitHub Issue

Repository:

```text
[REPO_OWNER_NAME]/[PROJECT_NAME]
```

## Principle

GitHub Issues are the tracker source of truth for actionable work. Decisions
belong in `docs/technical/DECISION_*.md`. Concepts belong in `docs/concepts/`
or `docs/design-system/concepts/`.

## Owner Prefixes

Use exactly one:

- `Frontend:`
- `Backend:`
- `Contract:`
- `Foundation:`
- `Quality:`
- `Docs:`
- `Epic:`

## Non-Mixed Implementation Rule

- Frontend and backend implementation work must not share one implementation issue.
- If frontend work needs backend work, create a linked backend or contract follow-up.
- If backend work affects frontend consumption, create a linked frontend or contract follow-up.
- Contract issues may define shared API behavior, but runtime implementation belongs in linked owner issues.
- Frontend may describe backend needs from the UI, client, fake repository, mock
  consumer, or user-flow perspective, but must not decide backend contracts,
  DTOs, endpoint shapes, mapping rules, persistence design, policy architecture,
  or server-side processing architecture.
- The backend team or the owning backend/contract/security skill decides
  backend-owned contracts, DTOs, endpoints, mapping, persistence, policy
  architecture, and processing.

## Required Issue Body

Every implementation issue must include:

- Objective.
- Scope.
- Non-goals.
- Required reading.
- Acceptance criteria.
- Tests and verification.
- Security/privacy notes.
- Dependencies/blockers.
- Follow-up issues required before close.

## Stop Rules

Do not create a vague issue. Enrich it through the owning skill first.
