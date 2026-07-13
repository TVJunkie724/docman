---
title: "DATA-01 Classification Catalog"
description: "Data classes, sensitivity, owners and allowed processing"
tags: [data, classification, privacy]
status: "draft"
owner: "data-architect/privacy"
lastUpdated: "2026-07-12"
---

# DATA-01 Classification Catalog

## 2026 Vault/Cloud Applicability

Every class records whether it may exist as Local authority, Cloud authority,
client cache/pending work, backup, export, telemetry/audit or processing input.
Documents, metadata, profiles, OCR text, previews, search indexes, migration
manifests and support diagnostics are sensitive unless a reviewed row proves
otherwise. Synthetic identifiers are not automatically anonymous when they can
be linked back to an account or Vault.

## Data Classes

- Public.
- Internal.
- Personal data.
- Sensitive personal data.
- Secrets.
- Documents/files.
- OCR/AI-derived data.
- Diagnostics/logs.

## Required Fields

| Class | Examples | Owner | Authority/cache locations | Processing/purpose | Logs/audit | Region/processors | Retention/deletion |
|---|---|---|---|---|---|---|---|

## Stop Rules

- Stop if a new data type has no classification row.
