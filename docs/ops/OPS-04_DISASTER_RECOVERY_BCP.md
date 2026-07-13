---
title: "OPS-04 Disaster Recovery BCP"
description: "Disaster recovery, business continuity, RPO/RTO and restore drills"
tags: [ops, disaster-recovery, bcp]
status: "draft"
owner: "ops/quality"
lastUpdated: "2026-07-12"
---

# OPS-04 Disaster Recovery BCP

## Product Baseline

Local Vault continuity is user-controlled and depends on documented encrypted
export/restore. Cloud Vault continuity is a managed-service obligation covering
identity, API, metadata, object storage, queues/workers, keys, backups,
entitlements and observability. Client cache is degraded access, not disaster
recovery.

## Required Decisions

- Critical services.
- RPO/RTO.
- Restore procedure.
- Offline/degraded mode.
- DR drills.
- Customer communication.
- Region/provider outage and dependency failure scenarios.
- Key/KMS, identity, billing-webhook and object/metadata consistency recovery.
- Queue replay and idempotency after restore.
- Read-only/degraded-mode policy and exit/export availability.
- Evidence cadence, owner, timestamp, result and remediation deadline.

## Stop Rules

- Stop if critical data/service has no recovery target and restore evidence.
- Stop commercial launch when the latest required restore/region/failover drill
  is missing, failed or exceeded accepted RPO/RTO without approved remediation.
