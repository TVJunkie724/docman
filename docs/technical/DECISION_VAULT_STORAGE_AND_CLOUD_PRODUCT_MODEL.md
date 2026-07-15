---
title: "Decision - Vault Storage Modes and Mappm Cloud Product Model"
description: "Verbindliche Produkt- und Architekturentscheidung fuer lokale und cloudverwaltete Vaults, Assist-Trennung, Migration, Subscription-Lifecycle und lokale Development Cloud"
tags: [decision, vault, local, cloud, account, assist, subscription, storage, migration, portability]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "product-concept"
---

# Decision - Vault Storage Modes and Mappm Cloud Product Model

## Status

Accepted on 2026-07-12 from the user/product-owner discussion. Pricing,
concrete retention durations, launch sequencing and final cryptographic trust
architecture remain explicitly open in the registers named below. Account and
Assist behavior is governed by
`DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`.

## Product Decision

Mappm is a provider-based document product with two user-selectable Vault
operating modes:

| Mode | Authoritative data | Account | Primary product role |
|---|---|---|---|
| `Mappm Local` | local structured store plus local document file store | required in normal operation; detached recovery remains possible | local-authoritative document product with Core Assist and guaranteed cloud exit |
| `Mappm Cloud` | Mappm Cloud metadata and object storage | required | cloud-authoritative vault, multi-device use, managed backup and service capabilities |

Mappm as a whole is no longer universally `local-first`. It is
`storage-provider-first`:

- Local Vaults are local-authoritative.
- Cloud Vaults are cloud-authoritative.
- Cloud clients may keep an encrypted local cache and pending-operation queue,
  but that cache is not an independent second source of truth.
- The UI and Domain use Vault/Repository ports and do not encode provider
  technology, storage paths, ASP.NET DTOs or S3 details.

## Vault Boundary

Storage mode is selected per Vault/workspace, never per individual document.
A Vault contains its metadata, files, search state, tasks and lifecycle state
under one authority.

Examples:

```text
Privates Archiv
  storageMode: local

Familienarchiv
  storageMode: cloud
```

A user may own multiple Vaults with different modes. Cross-Vault links do not
create shared ownership and may not silently copy document payloads.

## Local Vault Contract

- Structured metadata uses the approved local database boundary.
- Documents use a local file-store boundary, not database blobs by default.
- Secrets and encryption material remain in Secure Storage.
- Normal product use requires a Mappm Account, but healthy Local Vault access
  does not require continuous network connectivity.
- Core Assist may temporarily process selected content under the accepted AI
  trust contract without changing Local authority or enabling Cloud backup.
- Backup, restore and portability use encrypted, documented export packages.
- A Local Vault is single-device unless a later accepted peer/transfer feature
  explicitly says otherwise.
- Customer-facing Home Hub, NAS, Tailscale and self-hosted server setup are not
  part of the supported Local product.

## Cloud Vault Contract

- Mappm Cloud is authoritative for metadata, payloads, versions, account/device
  access, lifecycle and multi-device state.
- PostgreSQL is the planned server metadata store and S3-compatible object
  storage is the planned payload boundary; Domain and UI remain independent of
  both.
- Clients store only required encrypted cache data, previews and pending
  operations according to cache/retention policy.
- Offline capture and edits may enter a durable pending queue. They become
  cloud-confirmed only after server acknowledgement.
- Non-cached cloud documents are visibly unavailable offline; the UI may not
  imply that every Cloud document is stored locally.
- Cloud replication, provider backups and user-visible restore are separate
  controls. Replication alone is not marketed as backup.

## Account and Assist Are Not Storage Modes

- Account/device/entitlement state applies to normal Local and Cloud operation.
- Local/Cloud remains solely the durable data-authority choice.
- Assist processing is a separately visible service operation and never an
  implicit provider migration.
- Detached Recovery preserves account-independent access to an existing Local
  Vault or verified Cloud exit copy without reopening normal anonymous use.
- Exact free/paid Assist and Cloud entitlements remain VC-03.

## Local Development Cloud

The former Home Hub product direction is superseded. Its useful technical stack
continues only as the Local Development Cloud:

```text
Microcks
  -> contract mock and scenario verification

Local Development Cloud
  -> ASP.NET Core API
  -> PostgreSQL
  -> MinIO/S3-compatible object storage
  -> identity/dev services
  -> workers
  -> synthetic seed data

Shared Development / Staging / Production
  -> managed Mappm Cloud environments
```

The Local Development Cloud:

- is not a customer product or supported deployment.
- uses the same approved OpenAPI contracts as managed environments.
- contains no real or anonymized household documents, production secrets or
  copied production databases.
- is resettable and reproducibly seeded.
- does not introduce LAN discovery, Tailscale or self-hosting behavior into
  Domain or product UI.

## Upgrade: Local To Cloud

Changing a Vault provider is an explicit migration, not a settings toggle:

```text
preflight
  -> entitlement/account/device/storage checks
  -> inventory metadata and files
  -> resumable encrypted upload
  -> server-side receipt and checksum verification
  -> metadata/count reconciliation
  -> user-visible completion
  -> Cloud becomes authoritative
  -> local source becomes an inactive read-only recovery snapshot
  -> snapshot retained until policy/user cleanup
```

Rules:

- The Local Vault remains authoritative until all required files and metadata
  are verified in Cloud.
- Retry and app restart must not duplicate files, records or tasks.
- Partial migration is resumable and visibly incomplete.
- Cloud billing/entitlement failure leaves the Local Vault and its detached
  recovery path usable; Assist availability follows its separate entitlement.
- New Local changes are journaled during transfer. Final verification uses a
  short, explicit write-freeze so no mutation can fall between reconciliation
  and authority switch.
- After activation, the former Local Vault cannot remain independently writable;
  it is an inactive read-only recovery snapshot with a distinct status.
- Reopening that snapshot requires an explicit rollback/clone workflow. It may
  never silently resume as the same writable Vault after Cloud has accepted
  writes.
- Failure or crash during finalization resolves from durable migration state to
  exactly one authority: either restore/unfreeze Local before Cloud activation,
  or complete Cloud activation and keep Local inactive.
- Snapshot cleanup is separate, optional and never implied by migration success.

## Downgrade: Cloud To Local

Cloud cancellation offers migration to Mappm Local on a supported target
platform. On an unsupported current device it offers a complete export and a
guided continuation on a supported device; VC-05 decides the platform matrix.

```text
preflight local storage and platform support
  -> download complete metadata and payload inventory
  -> resume interrupted transfers
  -> verify checksums, counts and required indexes
  -> final write freeze and pending-operation reconciliation
  -> activate Local Vault on the selected target device
  -> Cloud source becomes an inactive read-only exit snapshot
  -> snapshot remains until explicit deletion/retention lifecycle
```

Rules:

- Insufficient local storage blocks the switch, not current read/export access.
- The local Vault becomes authoritative only after complete verification.
- Missing/corrupt items are listed individually and keep migration incomplete.
- Other Cloud clients are notified that authority changed and may not continue
  writing to the frozen source.
- Failure before Local activation unfreezes Cloud authority. Failure or crash
  after the atomic authority record changes completes Local activation and
  leaves Cloud as an inactive exit snapshot; restart must never guess.
- Cloud source deletion is a separate destructive action with renewed
  confirmation. Voluntary deletion may proceed without export after explicit
  informed confirmation; Mappm may recommend but never force an export.
- A user may export without activating Mappm Local.

## Subscription And Cancellation Lifecycle

Required lifecycle:

| State | Cloud behavior | Required user options |
|---|---|---|
| `active` | full entitled behavior | manage plan, export, switch to Local |
| `cancelScheduled` | full behavior until paid period ends | revoke cancellation, prepare Local migration/export |
| `graceReadOnly` | no new writes/uploads; safe read/download/export | reactivate, migrate to Local, export, request deletion |
| `retentionPendingDeletion` | access according to legal/contract policy; no normal writes | reactivate if allowed, support recovery if allowed, see deletion date |
| `deleted` | Cloud Vault payload/metadata deleted under verified workflow | retain deletion evidence without sensitive content |

Cancellation never immediately deletes or permanently traps documents.
Mappm must provide:

- a free complete export path.
- a safe migration path to Mappm Local on supported platforms, with complete
  export and supported-device handoff otherwise.
- a clearly dated, time-limited read-only/grace period.
- multiple notifications before destructive retention expiry.
- separation between subscription cancellation, Cloud Vault deletion and
  account deletion.

Before `cancelScheduled` becomes `graceReadOnly`, Mappm reconciles pending
operations on every recently active device where possible. Unconfirmed local
work is never discarded: it stays visibly pending and must be included in the
exit reconciliation/export or resolved before Local activation. Grace does not
pretend such work was stored in Cloud.

Permanent free Cloud storage is not promised. Concrete grace/retention periods,
quota behavior and reactivation rules require Commercial, Legal, Data Lifecycle
and Support approval before sale.

## Entitlements And Quotas

- Entitlements apply to every normal account and may govern Core/Advanced
  Assist quotas, Cloud Vault creation, storage amount, device count and sharing.
- The free plan has a meaningful limited Core Assist entitlement; exact limits
  remain VC-03.
- Loss of entitlement may block new Cloud writes but never the user's export,
  Local migration or legally required access/delete flows.
- Quota exhaustion blocks new payload growth, not reads of existing documents.
- Offline entitlement caching needs expiry, tamper and clock-skew behavior.
- Account deletion cannot be used as a shortcut for subscription cancellation.
- Subscription and entitlement scope may be account-, plan- or Vault-based as
  decided by VC-03. Regardless of billing shape, cancellation UI inventories
  every affected Cloud Vault and applies export/migration/retention state per
  Vault; one successful exit may not hide another affected Vault.

## Security And Trust Boundary

Accepted minimum:

- TLS in transit; encrypted databases/object storage/backups at rest.
- tenant/Vault authorization at every server operation.
- separate key, secret and application-data boundaries.
- no document bytes, OCR text, tokens, signed URLs or private metadata in
  normal logs/telemetry/support packages.
- dated EU/EEA hosting, processor, transfer and subprocessor review before real
  customer data.
- tested deletion, key rotation, incident and restore processes.

Open security decision:

- `Managed Trust`: Mappm-controlled services may decrypt within an accepted,
  audited processing boundary, supporting server OCR/LLM and recovery.
- `Zero Knowledge / E2EE`: only authorized clients hold usable content keys;
  server processing and recovery require a different design.

No production Cloud Vault, real-document OCR/LLM or marketing promise may begin
until this choice and its recovery/AI implications are accepted.

## UX Requirements

Users must always see:

- which Vault is open.
- `Auf diesem Gerät` or `Mappm Cloud` as storage authority.
- local availability separately from Cloud confirmation/backup status.
- pending upload, offline, read-only, quota, payment/grace and migration state.
- exact consequences before upgrade, downgrade, deletion or cache cleanup.

The UI must not use ambiguous labels such as only `synchronisiert` when it means
`in Mappm Cloud gespeichert`, `lokal verfügbar` or `im Backup enthalten`.

## Superseded Product Assumptions

This decision supersedes the product/deployment direction in:

- `DECISION_DATA_FLOW.md`.
- `DECISION_BACKEND_ROLE.md`.
- `DECISION_PRIVACY_SYNC_SCOPE.md`.
- `DECISION_FIRST_UTILITY_SCOPE.md` where it requires a customer Home Hub.
- `DECISION_LEGAL_PRIVACY_READINESS.md` where private/self-hosted is first
  distribution.
- `DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md` only as customer deployment; its
  stack remains the Local Development Cloud and managed-cloud baseline.

Existing upload limits, checksums, idempotency, Capture Inbox and review rules
remain valid after replacing the destination term with an approved Cloud Vault
contract.

## Open Decisions

Die folgende Tabelle spiegelt die stabilen `VC-*`-IDs im Kontext dieser
Entscheidung. Status und Re-check-Trigger werden ausschliesslich im
`docs/discovery/OPEN_QUESTIONS_REGISTER.md` gepflegt.

| ID | Question | Owner | Blocks |
|---|---|---|---|
| VC-01 | Must first commercial 1.0 include Cloud Vault storage/multi-device, or may account-backed Local + Managed Core Assist ship first? | product/commercial | Cloud-Vault release roadmap acceptance |
| VC-02 | Managed Trust or Zero-Knowledge/E2EE? | security/product/AI | production Cloud, recovery, OCR/LLM |
| VC-03 | Local pricing, Cloud plans, quotas, device limits and billing provider? | commercial/product | billing/store implementation |
| VC-04 | Paid-period, grace, read-only retention and deletion durations? | commercial/legal/data/support | cancellation implementation and terms |
| VC-05 | Which platforms may activate a Local Vault and receive Cloud-to-Local migration? | product/platform | downgrade UX and storage preflight |
| VC-06 | Which metadata/previews are cached by default in Cloud mode? | product/security/data | Cloud client storage implementation |
| VC-07 | How are Local Vault metadata, files and export packages encrypted, backed up and recovered on each supported platform? | security/data/platform | Local persistence, backup/restore and commercial Local release |
| VC-08 | Which Cloud identity provider, verification, MFA/passkey, recovery-proof and household/account-binding policy applies? | security/product/identity | Cloud account/device implementation and support recovery |

## Stop Rules

Stop if:

- implementation treats storage mode as a per-document switch.
- Local data is deleted before verified Cloud migration.
- automatic/provider-initiated Cloud deletion runs before the agreed
  grace/retention workflow or while an exit migration/export is still active.
- a completed migration leaves both Local and Cloud sources writable.
- cancellation removes export, Local migration or required data access.
- product code exposes Local Development Cloud as supported self-hosting.
- a phase assumes server decryption, AI access or account recovery before
  VC-02 is accepted.
- a phase treats account presence, Assist processing or Local cache as proof of
  Cloud Vault authority.
- Local persistence or backup implementation chooses key ownership/recovery
  before VC-07 is accepted.
- Cloud account/session implementation chooses identity, MFA or recovery policy
  before VC-08 is accepted.
- frontend decides Cloud DTOs, endpoints, persistence or policy architecture.

## Required Handoffs

- Product/roadmap: `product-concept`.
- Vault UX and settings: `ui-concept` -> `ui-architect`.
- local/cache/migration data model: `data-architect`.
- OpenAPI/Microcks and generated clients: `contract-api`.
- backend provider and policies: separate Backend issues.
- security/trust/keys: security owner plus legal/privacy review.
- subscription/retention: commercial, legal, data and support owners.
