---
title: "Konzept F36 - Vault Modes and Cloud Lifecycle"
description: "Mappm-spezifischer Produkt- und UX-Vertrag fuer Account, Local/Cloud Vaults, Assist, Migration, Entitlements, Kündigung, Recovery und Datenportabilität"
tags: [concept, account, vault, cloud, local, assist, migration, subscription, portability, recovery, ux]
lastUpdated: "2026-07-12"
version: "1.0"
status: "accepted"
owner: "product-concept/ui-concept"
---

# Konzept F36 - Vault Modes and Cloud Lifecycle

## Status And Source Of Truth

Accepted. The owning product decision is
`docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` together with
`docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`. F36 governs
cross-cutting frontend/product behavior; it does not decide backend DTOs,
endpoints, persistence or authorization policy architecture.

## Scope

- Vault creation and storage-mode explanation.
- account/device onboarding, offline continuity and detached recovery.
- visible Assist entitlement, processing and opt-out/manual degradation.
- visible Local versus Cloud authority and local-availability status.
- Local-to-Cloud and Cloud-to-Local migration UX.
- subscription cancellation, grace/read-only, reactivation and deletion UX.
- entitlement/quota/payment failure states.
- export, portability and safe destructive confirmation.

## Non-Goals

- pricing amounts, payment provider or store purchase implementation.
- Cloud API shapes or server storage mapping.
- final cryptographic trust model.
- cross-account sharing and organization administration.

## Required User Flows

### Create Vault

```text
sign in / create account and authorize device
  -> choose plan or Free
  -> Name and purpose
  -> choose "Auf diesem Gerät" or "Mappm Cloud"
  -> show plan/storage/Assist consequences
  -> security and recovery explanation
  -> confirm
  -> created / actionable failure
```

The default may not be selected solely to maximize paid conversion. Product and
legal review must approve default, comparison copy and trial behavior.

Normal onboarding never offers an anonymous Local Vault. `Detached Recovery`
is entered only for existing local data or a verified Cloud-to-Local exit.

### Local Vault With Assist

Required states:

- Local Vault and device/account are ready.
- Core Assist allowance and remaining quota are visible without pressure copy.
- document remains clearly `lokal gespeichert`.
- processing consent/policy is available before first transmission.
- `Analyse ausstehend`, uploading, processing, review-ready, retryable and final
  failure are distinct.
- user can cancel queued processing or exclude a document according to policy.
- manual review remains possible if offline, opted out or quota-limited.
- no UI implies Cloud backup, sync or durable Cloud storage.

### Offline Continuity And Detached Recovery

- A healthy Local Vault opens offline under bounded cached account/device state.
- Expired cache requests reauthentication without deleting or corrupting data.
- Paid Local cancellation normally returns to Free Local with reduced Assist
  entitlement. Account deletion, or loss of eligibility for normal use,
  inventories Local Vaults and offers detach, export or explicit device-local
  deletion.
- Detached Recovery exposes existing documents, local search, export and manual
  maintenance but no Assist, sync, sharing or managed backup.
- Reattachment is explicit and never uploads Local data automatically.

### Upgrade Local To Cloud

Required states:

- preflight account/entitlement/network/storage.
- inventorying.
- upload progress by count and bytes without private filenames in global UI.
- paused/offline/retryable/final failure.
- reconciliation and checksum verification.
- short, announced final write-freeze.
- complete with explicit Cloud-authority explanation.
- former Local source shown as inactive read-only recovery snapshot.
- optional snapshot/cache cleanup as separate, differently scoped actions.

Cancel before completion keeps Local authoritative. Closing/restarting the app
resumes safely.

### Cancel Or Downgrade Cloud

Required choices:

- `Auf diesem Gerät weiternutzen` when the current platform is supported.
- `Auf unterstütztem Gerät weitermachen` plus complete export when it is not.
- `Cloud-Archiv vorerst nur lesen` when policy allows.
- `Daten exportieren`.
- `Abo fortsetzen` or reactivate where allowed.
- `Cloud-Daten löschen` as a separate destructive flow.

The UI shows paid-through date, grace/read-only date, planned deletion date,
required local free space and unavailable-platform reason.

When one subscription affects multiple Vaults, the flow lists each affected
Vault, owner/access role, storage size, pending work and chosen exit action.
Completion is per Vault; an aggregate success screen may not conceal an
incomplete or blocked Vault.

### Cloud To Local Migration

Required states:

- calculating required storage.
- insufficient local storage with remediation.
- downloading/resuming.
- reconciling pending Cloud operations and announcing final write-freeze.
- verifying counts/checksums.
- missing/corrupt item list.
- Local activated.
- Cloud source frozen as an inactive read-only exit snapshot pending separate
  lifecycle decision; other Cloud clients can no longer write to it.

The primary action cannot activate Local while any required item is unverified.

## State Model

| Dimension | Values |
|---|---|
| Vault authority | `local`, `cloud` |
| account/session | `active`, `offlineCached`, `reauthRequired`, `suspended`, `deletionPending`, `deleted`, `detachedRecovery` |
| entitlement | `freeActive`, `paidActive`, `quotaLimited`, `expired`, `graceReadOnly`, `none` |
| Assist processing | `notRequested`, `queued`, `uploading`, `processing`, `reviewReady`, `failedRetryable`, `failedFinal`, `cancelled`, `deleted` |
| local availability | `complete`, `partial`, `metadataOnly`, `notAvailable` |
| Cloud write capability | `writable`, `offlineQueued`, `readOnly`, `quotaGrowthBlocked`, `paymentReview`, `noAccess` |
| migration | `none`, `preflight`, `transferring`, `paused`, `finalizingReadOnly`, `verifying`, `failedRetryable`, `failedFinal`, `completed` |
| source after migration | `activeAuthority`, `inactiveRecoverySnapshot`, `inactiveExitSnapshot`, `deleted` |
| subscription lifecycle | `active`, `cancelScheduled`, `graceReadOnly`, `retentionPendingDeletion`, `deleted` |

`reactivate` is an action/transition back to `active`, not a lifecycle state.
Quota and payment evaluation may reduce write capability but never silently
rewrite the subscription lifecycle or Vault authority.

These dimensions may not be collapsed into one generic `syncStatus`.

## Error And Recovery Matrix

| Situation | Required behavior |
|---|---|
| offline during upload/download | preserve queue/checkpoint; show retry automatically when connectivity returns |
| insufficient local storage | keep Cloud access; block activation; offer cleanup/location guidance |
| quota exceeded | preserve existing reads/export; block new growth; show plan/cleanup actions |
| payment failure | follow entitlement state; never erase cache or Cloud data immediately |
| Paid Local cancellation | retain account and Local authority; downgrade to Free Local/its Assist limits where eligible; do not force recovery mode |
| Local device temporarily offline | open from bounded cached account/device state; queue Assist; keep manual work available |
| Assist quota exhausted | preserve Local/Cloud data and manual work; show reset/plan facts without blocking export or correction |
| Assist provider failure | keep source document and accepted data intact; retry or manual fallback; never change Vault authority |
| account deletion with Local Vault | require retain-as-recovery, export or explicit local deletion choice; never remote-wipe silently |
| checksum/count mismatch | remain on original authority; list safe reference IDs; retry or support path |
| app killed during migration | resume from durable checkpoint without duplicate records |
| account/session revoked | preserve safe local pending work; require re-auth; no raw token errors |
| deletion requested during migration | stop and require explicit resolution; never race transfer and deletion |
| concurrent write during migration | journal until finalization; block during announced final freeze; never create two writable authorities |
| another Cloud device after Cloud-to-Local | show authority-changed state; disable writes; offer refresh/export/account actions |
| grace starts with unconfirmed local work | keep it visibly pending; do not claim Cloud storage; include it in exit reconciliation or require explicit conflict resolution |
| crash during final authority switch | resume from durable transaction state to one authority; never infer from cache presence |
| inactive snapshot opened | show read-only recovery/exit status; require explicit rollback or clone flow before any write |

## Security And Privacy

- Do not show document names/content in lock-screen notifications, analytics or
  global migration telemetry.
- Storage authority, entitlement and migration events use synthetic/reference
  IDs in logs.
- Screenshots, tests and support evidence use synthetic Vaults and documents.
- Destructive actions require clear scope, consequence and re-authentication
  according to the accepted security policy.
- Cache cleanup never implies Cloud deletion; Cloud deletion never implies
  account deletion.
- Assist transmission never implies Cloud Vault storage, backup or consent to
  model training.

## Accessibility And Localization

- German product copy distinguishes `lokal verfügbar`, `in Mappm Cloud
  gespeichert`, `nur lesen`, `Export` and `Löschung`.
- Progress and errors are announced semantically without repeated noisy updates.
- Keyboard/focus order reaches migration blockers and primary recovery action.
- Color is never the only carrier for Cloud/grace/quota/deletion status.
- Long dates, storage sizes and translated plan names must not clip at text
  scale `2.0`.

## Testing And Verification

Every affected phase must include:

- state-machine tests for every transition and invalid transition.
- repository/provider tests with Local and Cloud fakes.
- resumability/idempotency tests across app restart.
- widget/semantics tests for all required flows and failure states.
- privacy tests for logs, notifications and fixtures.
- contract/Microcks tests for Cloud consumer behavior.
- integration evidence proving source data remains intact until verified target
  activation.
- split-brain tests proving exactly one writable authority before, during and
  after activation, including another-device and app-restart cases.
- cancellation-boundary tests with offline pending work and grace transition.
- multi-Vault subscription tests proving scope, per-Vault completion and no
  hidden stranded Vault.
- Free/Paid Local and Cloud entitlement tests with online/offline Assist states.
- account deletion and detached-recovery tests proving local data access and no
  implicit upload or remote wipe.

## Stop Rules

Stop if:

- UI offers a simple toggle without migration.
- cancellation or quota failure blocks export/Local migration.
- read-only, deletion and account deletion are visually conflated.
- source authority changes before checksum/count verification.
- migration completion leaves both provider sources writable.
- a frontend artifact invents server contract or retention behavior.
- any applicable VC-01..VC-08 decision required by the phase is still open.
- Local onboarding bypasses the account contract or every Local launch requires
  a live network call.
- Assist state is presented as Vault sync/storage state.

## Handoff

Product flow first goes through `ui-concept-review`. Approved UI phases go to
`ui-architect`; data migration to `data-architect`; API behavior to
`contract-api`; commercial/legal durations to their specialist owners.

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies
stricter defaults where F36 is silent.
