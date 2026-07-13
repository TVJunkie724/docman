---
title: "DATA-05 Backup Restore"
description: "Backup scope, restore, recovery, encryption and test evidence"
tags: [data, backup, restore, resilience]
status: "draft"
owner: "data/ops"
lastUpdated: "2026-07-12"
---

# DATA-05 Backup Restore

## Vault-Specific Baseline

| Concern | Local Vault | Cloud Vault |
|---|---|---|
| routine protection | encrypted export/backup selected by user and platform | managed service backup with documented RPO/RTO |
| authority | local source remains authoritative | Cloud service remains authoritative |
| restore | explicit local restore into a new/empty target | service recovery plus account/device recovery |
| device loss | recoverable only from user-held backup/export | managed recovery subject to accepted key/trust model |
| cancellation | unchanged local use | backup retention follows separate grace/retention policy; export/migration remains visible |

Sync and local cache are not backups. A successful backup is not evidence until
an isolated restore drill verifies metadata, files, relations, checksums, keys
and supported app/schema versions.

## Required Decisions

- Backup scope.
- Frequency and retention.
- Encryption and key handling.
- Restore owner and user flow.
- Multi-device recovery.
- Restore tests and evidence.
- Corruption detection, partial restore and retry/resume.
- Cross-version migration and rollback compatibility.
- Tenant/Vault isolation during managed restore.
- Deletion propagation into backups and documented recovery exceptions.

## Stop Rules

- Stop if backup exists without restore test, key policy and deletion impact.
- Stop if Cloud cancellation silently converts a backup into permanent free storage.
