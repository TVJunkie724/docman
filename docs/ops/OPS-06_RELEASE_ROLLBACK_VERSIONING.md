---
title: "OPS-06 Release Rollback Versioning"
description: "Versioning, migration rollout, staged release, rollback and EOL"
tags: [ops, release, rollback, versioning]
status: "draft"
owner: "release/ops"
lastUpdated: "2026-07-12"
---

# OPS-06 Release Rollback Versioning

## 2026 Vault/Cloud Applicability

Client, OpenAPI/generated client, backend, database, object metadata,
infrastructure and entitlement policy versions have an explicit compatibility
matrix. Rollback may not reintroduce two authorities, lose pending operations,
make exports unreadable or strand a migration. Local data/schema upgrades need
preflight, backup and repair; Cloud rollout uses staged expansion/contraction
and provider rollback evidence.

## Required Decisions

- Versioning scheme.
- Release channels.
- Migration rollout.
- Staged rollout.
- Rollback path.
- Release notes.
- EOL/support window.
- Minimum client version and grace/read-only/export behavior for unsupported clients.

## Stop Rules

- Stop if a release has irreversible migration without rollback/recovery plan.
