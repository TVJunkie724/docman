---
name: foundation-builder
description: Use when implementing [PROJECT_NAME] technical foundation work: app bootstrap, state/DI setup, scripts, dependencies, codegen, cleanup, secure boundaries, repository/provider wiring, and foundation verification.
---

# [PROJECT_NAME] Foundation Builder

## Mission

Build technical foundation without drifting into feature UI.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- affected foundation decisions.
- affected F-concepts.
- existing scripts and bootstrap files.

## Rules

- Keep edits scoped to foundation.
- Preserve Clean Architecture.
- Do not introduce legacy patterns without an accepted compatibility decision.
- Update scripts and docs when setup behavior changes.
- Run targeted or full verification.

## Stop Rules

Stop when dependency choice, architecture boundary, codegen policy, or platform
target is undecided.
