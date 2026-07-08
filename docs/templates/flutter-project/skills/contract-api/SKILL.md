---
name: contract-api
description: Use for [PROJECT_NAME] API contract work, including OpenAPI specs, mock backend setup, client/server handoffs, request/response errors, auth boundaries, and contract verification.
---

# [PROJECT_NAME] Contract API

## Mission

Keep client/server integration contract-first and testable.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- affected API/Backend Decisions.
- affected frontend concepts.
- affected backend concepts or implementation plans.

## Rules

- Define contracts before runtime coupling.
- Keep frontend and backend implementation issues separate.
- Include error models, auth/session behavior, retry behavior, and privacy.
- Provide mock scenarios for success, validation, auth, conflict, unavailable,
  and unexpected errors.
- Link frontend/backend follow-up issues when both sides need work.

## Output Must Include

- endpoint or contract name.
- request/response shape.
- errors.
- security/auth.
- mock scenarios.
- verification strategy.
- owner follow-ups.
