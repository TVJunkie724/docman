---
title: "Mappm OPS-08 Project Entrypoints"
description: "Project-local command contract for setup, code generation, verification, mocks and app start"
tags: [ops, entrypoints, scripts, setup, runbook]
lastUpdated: "2026-07-12"
status: "active-draft"
owner: "foundation-builder"
---

# Mappm OPS-08 Project Entrypoints

## Purpose

Mappm exposes stable project-local commands for developers, agents and QA. The
entrypoint is part of the repository contract and must remain usable without
remembering shell history.

## Required Entrypoints

| Entrypoint | Status | Owner | Scope |
|---|---|---|---|
| `frontend.sh` | active-draft | foundation/frontend | frontend setup, codegen, verify, analyze, tests, mocks handoff, app start |
| `scripts/bootstrap.sh` | active | foundation | dependency install plus code generation |
| `scripts/codegen.sh` | active | foundation/data | generated Dart artifacts |
| `scripts/verify.sh` | active | quality-readiness | format, analyzer and tests |
| `scripts/verify_target.sh` | planned in R3.5 | quality-readiness | fixed target-path format, analysis, widget test and forbidden-dependency checks |
| `scripts/run_mocks.sh` | active-draft | contract-api | local mock service handoff |
| Backend entrypoint | planned | backend/ops | Local Development Cloud and managed backend services when backend workspace exists |
| Client generator | planned | contract-api | OpenAPI-generated clients when contracts are active |

## Frontend Command Contract

`frontend.sh` must provide:

- `doctor` for non-invasive local status.
- `setup` and `setup --verify` for bootstrap behavior.
- `codegen` for generated Dart source output.
- `verify`, `analyze` and `test` for local gates.
- `verify-target`, after explicit R3.5 approval and implementation, delegating
  to `scripts/verify_target.sh` with the fixed R3.5 target and exit contract.
- `mocks` as a documented handoff to mock service scripts.
- `run --device <id>` for local Flutter execution.
- `help`/`--help` output.

R3.5 target scope is exactly `lib/app/**`,
`lib/core/id/id_generator.dart`, `lib/core/time/clock.dart`,
`lib/presentation/theme/app_theme.dart` and `test/widget_test.dart`. OPS-08 does
not authorize implementation before the R3.5 approval record is complete.

## Instance And Config Position

Mappm does not yet have separate branded deployment instances. The project still
needs the playbook instance rule because future desktop/mobile distribution may
need environment-specific config, app identity and icons.

| Artifact | Current state | Rule |
|---|---|---|
| Env files | not active | do not invent secrets or commit live credentials |
| Generated app config | not active | add only through a documented config concept and git-ignore rule |
| App icon packs | default Flutter/project assets | introduce per channel/instance through a design/release phase |
| Bundle/application id | platform defaults for current prototype | changes require release/compliance review |
| Demo/offline mode | planned through fake repositories | must not call production services |
| Live/cloud mode | planned | requires security, privacy, backend and compliance sign-off |

## Owner Boundaries

- Frontend scripts may describe backend needs and call documented mock/client
  scripts, but backend contracts, DTOs, endpoints, mapping, persistence and
  policy architecture are backend/API owner decisions.
- Contract mocks belong to contract-api/quality ownership.
- Store signing, notarization, release credentials and app identities belong to
  release/compliance ownership.

## Stop Rules

- Stop if a new command is required but not discoverable through `frontend.sh`.
- Stop if setup depends on undocumented local files or shell history.
- Stop if a command prints secrets or writes secret material into tracked files.
- Stop if fake/demo/offline flows can silently call live services.
- Stop if frontend and backend entrypoints claim the same side effect.
