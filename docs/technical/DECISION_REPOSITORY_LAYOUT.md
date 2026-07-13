---
title: "Decision - Repository Layout"
description: "Entscheidung zur bewussten Abweichung vom Playbook-App-Unterordner"
tags: [decision, repository, flutter, playbook, structure]
lastUpdated: "2026-07-12"
status: "accepted"
owner: "foundation/product"
---

# Decision - Repository Layout

## Status

Accepted for the current DocMan repository.

## Decision

Mappm remains a root-level Flutter repository for now: `lib/`, `test/`,
platform directories, `pubspec.yaml` and `scripts/` stay beside `docs/`.

This is an explicit adaptation of the general playbook, whose default for a new
multi-part repository is an app package folder beside `docs/`. Moving an
existing Flutter project into a new subdirectory would add package, IDE,
platform, CI, script and generated-path churn without improving the current
single-app ownership boundary.

## Consequences

- `frontend.sh` remains in the repository root and delegates to root-level
  `scripts/`.
- Future backend services use a separate repository or a clearly owned service
  directory with their own entrypoint; they do not turn the Flutter root into a
  mixed ungoverned workspace.
- A later monorepo conversion requires a new accepted decision, migration plan,
  CI/path verification and package/bundle review.
- This decision does not change Clean Architecture boundaries inside `lib/`.

## Stop Rules

- Stop if a backend, web app or second Flutter app is added without revisiting
  this decision.
- Stop if scripts assume both root-level and nested app paths.
- Stop if a repository move is performed as incidental feature work.
