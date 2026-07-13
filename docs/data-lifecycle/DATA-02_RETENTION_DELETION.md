---
title: "DATA-02 Retention Deletion"
description: "Retention periods, deletion guarantees, purge and recovery windows"
tags: [data, retention, deletion, gdpr]
status: "draft"
owner: "data/privacy"
lastUpdated: "2026-07-12"
---

# DATA-02 Retention Deletion

## 2026 Vault/Cloud Lifecycle

Local deletion affects the selected local Vault and its user-controlled
backups only through explicit user action. Cloud cancellation, Cloud Vault
deletion and account deletion are separate workflows. Automatic Cloud deletion
may occur only after the accepted paid/grace/retention timeline and must not
race an active export or provider migration. Voluntary informed deletion may
skip export; the product recommends but does not force one.

## Required Decisions

- Retention per data class.
- User delete vs admin delete vs legal delete.
- Soft delete and purge timing.
- Backup deletion guarantees.
- Account closure.
- Shared-data deletion impact.
- Inactive migration snapshots, pending uploads, previews/search indexes,
  telemetry/audit evidence, billing records and processor copies.
- Deletion job idempotency, reconciliation, evidence and failed-purge handling.

## Stop Rules

- Stop if deletion cannot be explained across local storage, sync, backup and
  shared recipients.
- Stop until VC-04 defines durations, notifications, reactivation and the final
  automatic deletion boundary.
