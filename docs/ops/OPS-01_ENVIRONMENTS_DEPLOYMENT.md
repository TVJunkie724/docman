---
title: "OPS-01 Environments Deployment"
description: "Environment strategy, deployment, secrets and access controls"
tags: [ops, deployment, environments]
status: "draft"
owner: "ops/quality"
lastUpdated: "2026-07-12"
---

# OPS-01 Environments Deployment

## Environment Contract

| Environment | Data | Purpose | Customer-visible |
|---|---|---|---|
| local | synthetic/local developer data | Flutter with fakes or Local Vault | no |
| local-development-cloud | synthetic only | complete contract/backend integration on local network | no |
| development | synthetic only | shared engineering integration | no |
| staging | synthetic or explicitly governed test data | release candidate verification | no |
| production | customer data | commercial service | yes |

Every environment has separate identity tenants, endpoints, storage buckets,
databases, queues, keys, secrets, telemetry, billing/store configuration and
app identifiers. Production data and secrets are never copied downward.

## Required Decisions

- Local/dev/staging/prod environments.
- Secrets and config.
- Deployment approvals.
- Access controls.
- Data separation.
- Smoke tests.
- Local/project entrypoints and their environment ownership.
- Infrastructure as code, schema/object migrations and compatibility order.
- Promotion, rollback, feature/kill switch, backup and restore ownership.
- Local Development Cloud parity and contract-version pinning.

## Stop Rules

- Stop if production deployment cannot be reproduced, verified or rolled back.
- Stop if local/dev/staging/prod modes are started through undocumented or
  conflicting commands.
- Stop if Local Development Cloud can connect to production accounts, storage,
  billing, keys or telemetry.
