---
title: "Superseded Decision - Local-first Data Flow and Self-hosted Sync Backend"
description: "Historischer Verweis; ersetzt durch Local-/Cloud-Vault-Autoritaet und Provider-Migration"
tags: [decision, historical, superseded, data-flow]
lastUpdated: "2026-07-15"
status: "superseded"
owner: "data-architect/product"
---

# Superseded Decision - Local-first Data Flow and Self-hosted Sync Backend

Die Annahme einer universell lokalen Quelle der Wahrheit und eines Customer
Home Hubs wurde verworfen. Dieses Dokument autorisiert keine Implementierung.

Verbindlich sind:

- `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`;
- `docs/concepts/CONCEPT_F10_LOCAL_STORAGE.md`;
- `docs/concepts/CONCEPT_F36_VAULT_MODES_CLOUD_LIFECYCLE.md`;
- `docs/technical/DECISION_BACKUP_RESTORE_STRATEGY.md`.

Local Vault ist lokal autoritativ. Cloud Vault ist serverautoritativ und nutzt
lokalen Cache/Pending State. Sync ist nicht Backup. Providerwechsel geschieht
ueber verifizierte Migration und nie durch einen Toggle. Core Assist ist eine
separate Processing-Grenze und aendert keine Vault-Autoritaet.
