---
title: "COM-01 Licensing Entitlements"
description: "Plans, feature gates, seats, offline entitlement and revocation"
tags: [commercial, licensing, entitlements]
status: "accepted-baseline"
owner: "commercial/product"
lastUpdated: "2026-07-12"
---

# COM-01 Licensing Entitlements

## Accepted Baseline

- Every normal Free/Paid Local and Cloud mode requires a Mappm Account.
- Free Local includes a meaningful limited Core Assist entitlement; exact
  quota/reset behavior remains VC-03.
- Paid Local may increase Core/Advanced Assist without changing Local Vault
  authority.
- Paid Local cancellation downgrades to Free Local where eligible; it does not
  detach or delete the Local Vault merely because the paid entitlement ends.
- Cloud Vault capabilities are entitlement-backed and may have plan-specific
  storage, device, Vault, processing and sharing limits.
- Entitlement state is separate from Vault authority, local cache state,
  payment state and retention state.
- Loss of a paid Cloud entitlement never causes immediate deletion and never
  removes access to reactivation, export or an allowed Cloud-to-Local migration.
- Cached Cloud data does not silently become an authoritative Local Vault.
- A Local-to-Cloud upgrade and Cloud-to-Local exit are verified migrations, not
  feature-flag changes.
- Detached Recovery has no active service entitlement but preserves local
  access/export/manual maintenance of existing data.

## Required State Matrix

`active`, `cancelScheduled`, `graceReadOnly`, `retentionPendingDeletion` and
`deleted` require exact allowed/read/write/upload/export/migrate/reactivate/delete
behavior, offline-cache behavior, user copy, support action and audit event.
If one subscription covers multiple Vaults, evaluation and exit completion are
reported per Vault as well as for the aggregate plan.

## Required Decisions

- Plan tiers.
- Feature entitlements.
- Core/Advanced Assist definitions, quotas, reset and overage behavior.
- Seat/device limits.
- Offline entitlement cache.
- Grace periods.
- Revocation and downgrade.
- Entitlement refresh, signed/offline cache lifetime and clock-skew behavior.
- Export/migration allowance independent of normal Cloud write entitlement.
- Account suspension, security lock and legal restriction distinct from
  commercial cancellation.
- Local offline entitlement-cache duration and detached-recovery transition.

## Stop Rules

- Stop if a paid feature has no entitlement, offline and downgrade behavior.
- Stop if cancellation or payment failure can strand data in Cloud.
- Stop until VC-03 and VC-04 are accepted for the affected release.
- Stop if Free is account-free/manual-only or if Assist entitlement changes
  alter Vault authority.
