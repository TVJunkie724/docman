---
title: "Mappm DATA-00 Data Lifecycle Umbrella"
description: "Data lifecycle planning contract for local cache, source of truth, sync, backup, export and deletion"
tags: [data, lifecycle, local-first, sync, backup, deletion, playbook]
lastUpdated: "2026-07-08"
status: "draft"
owner: "data-architect"
---

# Mappm DATA-00 Data Lifecycle Umbrella

## Purpose

Mappm must distinguish local cache, local source of truth, provider-backed
source of truth and cloud service processing before data features are built.
The data layer remains exchangeable by provider.

## Lifecycle Areas

| Area | Direction | Status |
|---|---|---|
| Local-first storage | app can operate locally with fake/offline repositories during frontend buildout | active-planned |
| Provider boundary | repositories depend on Domain ports; provider adapters can change later | accepted |
| Backend source of truth | needed for sync, sharing, backup and assistant services | planned |
| Cache policy | local cache must document retention, invalidation and encryption | planned |
| Backup/restore | must define backup owner, encryption, restore test and user-visible recovery | planned |
| Export/deletion | must support GDPR-aligned deletion/export planning before production | planned |
| Migration | schema and file migrations require tests and rollback/repair story | planned |

## Rules

- UI phases may use fake repositories and demo content.
- Fake repositories must be explicit and must not leak into production service
  wiring.
- Backend needs may be described by frontend phases, but API contracts,
  persistence, mapping and policy architecture are backend/API-owned.
- Sensitive data classification must be visible before persistence, sync,
  export or assistant flows are approved.

## Stop Rules

- Stop if a phase cannot identify its source of truth.
- Stop if a document or extracted fact is stored without lifecycle and
  deletion expectations.
- Stop if sync/backup/sharing is planned without conflict, access and recovery
  handling.
