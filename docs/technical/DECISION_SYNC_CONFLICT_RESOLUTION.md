---
title: "Decision - Legacy Sync Conflict Resolution"
description: "Historischer Verweis auf die ersetzte Home-Hub-Sync-Konfliktentscheidung"
tags: [decision, superseded, sync, conflicts, history]
lastUpdated: "2026-07-15"
status: "superseded"
owner: "data-architect/product-concept"
---
# Decision - Legacy Sync Conflict Resolution

## Status

Ersetzt. Die frühere Konfliktentscheidung war an eine Home-Hub-
Synchronisationsarchitektur gebunden und ist nicht implementierungsleitend.

## Aktuelle Quellen

Konfliktverhalten wird je Vault- und Contract-Scope festgelegt durch:

- `DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` für Authority und
  Offline-Grenzen;
- `CONCEPT_F36_LOCAL_CLOUD_VAULT_MIGRATION_AND_LIFECYCLE.md` für Migration,
  Pending State und Lifecycle;
- `CONCEPT_F5_ERROR_HANDLING.md` für sichtbare Fehler- und Konfliktzustände;
- den freigegebenen API-/Data-Implementation-Contract des jeweiligen Slices.

Ein späterer Cloud-Sync-Slice muss Konfliktklassen, Idempotenz,
Versions-/Precondition-Verhalten, automatische und manuelle Auflösung, Undo,
Audit, Offline- sowie Multi-Device-Tests neu spezifizieren. Dieses Dokument
liefert dafür keine Default-Regeln.
