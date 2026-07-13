---
title: "Decision - Account, Vault and Assist Product Model"
description: "Verbindliches Mappm-Produktmodell fuer Accountpflicht, Local/Cloud-Datenautoritaet, Core Assist, Tarife, Offline-Nutzung und accountunabhaengigen Exit"
tags: [decision, product, account, vault, local, cloud, intelligence, entitlements, recovery]
lastUpdated: "2026-07-12"
status: "accepted-direction"
owner: "product-concept"
---

# Decision - Account, Vault and Assist Product Model

## Status

Accepted as product direction on 2026-07-12. Exact identity provider,
cryptographic trust model, processing provider/retention, free and paid quotas,
prices, device limits and launch packaging remain explicit open decisions.

## Product Decision

Mappm requires a Mappm Account for normal product operation, including the free
plan and Local Vaults. Account requirement, document storage authority,
intelligence processing and commercial plan are separate dimensions:

| Dimension | Answers |
|---|---|
| Account | who may use Mappm, which devices are trusted and which entitlements apply |
| Vault authority | where durable document files, metadata, cases and tasks are authoritative |
| Assist | whether and how selected document content is processed for OCR, classification, extraction and workflow suggestions |
| Plan | quotas, device/Vault limits, Cloud storage and advanced capabilities |

A Local Vault does not become a Cloud Vault merely because Mappm Assist
temporarily processes a document. A Cloud account does not imply that Local
Vault documents are durably stored or backed up in Mappm Cloud.

## Product Modes

The normal product presents plans and storage choices, not four unrelated apps:

| Product expression | Account | Durable authority | Assist | Backup/sync baseline |
|---|---|---|---|---|
| Free Local | required | Local Vault | Core Assist with a meaningful limited quota | encrypted user-controlled export/restore |
| Paid Local | required | Local Vault | larger/advanced entitlement according to plan | encrypted user-controlled export/restore |
| Mappm Cloud | required | Cloud Vault with local cache/pending work | entitled Core/Advanced Assist | managed backup and multi-device according to plan |
| Detached Recovery | no active account required | existing Local Vault or verified local exit copy | no Cloud Assist | local access/export only |

Exact plan names, quotas, prices and whether a free Cloud allowance exists are
not decided here. Every normal plan must make storage authority and processing
consequences explicit.

## Why Account Is Required

Mappm's core promise is not manual filing. It is to understand a document,
connect it to people and institutions, place it into a case and suggest the next
reviewable steps. Useful service-backed processing requires:

- authenticated user and device context;
- consent and processing-policy evidence;
- entitlements and abuse/rate limits;
- provider routing and incident control;
- workflow-catalog and model version traceability;
- supportable recovery and security events.

An account is therefore part of the normal product contract even when durable
document storage remains local.

## Core Assist Contract

Core Assist is required for the first sellable product promise and must be
available in a meaningful, limited form in the free plan. It includes the
approved subset of:

- text extraction/OCR;
- document type and sender/actor recognition;
- key metadata and fact suggestions;
- existing case and profile matching;
- published workflow-definition and next-step suggestions;
- indexing input for unified document/case/profile/task search;
- confidence, evidence and human review.

Advanced Assist may add broader extraction, semantic retrieval, higher quotas,
specialized workflows or automation. Exact tiering remains VC-03.

Core Assist is not authority. Users can review, correct or reject suggestions.
It may select only curated workflow definitions and may not invent binding
deadlines, entitlements or legal/medical/financial obligations.

## Local Vault Plus Assist

For a Local Vault:

- document bytes, metadata, cases, tasks and accepted suggestions remain
  durably authoritative on the device;
- only the minimum content required for an approved processing job is sent to
  the selected Assist provider;
- processing upload, transient artifacts, retention, subprocessors, region,
  training prohibition and deletion behavior follow the accepted trust and AI
  policy;
- returned suggestions are not accepted domain data until the applicable
  review rule permits it;
- processing failure never corrupts or blocks access to the Local Vault;
- use of Assist never silently enables Cloud backup, sync or sharing;
- the UI distinguishes `lokal gespeichert`, `zur Analyse übertragen`,
  `Analyse ausstehend` and `Vorschlag geprüft`.

No real-document Cloud Assist may ship before VC-02 and OQ-003 plus the
applicable AI, security, privacy and regulatory gates are accepted.

## Offline, Opt-Out and Queueing

Account requirement does not mean permanent connectivity:

- the app starts and core Local Vault access works offline using a secure,
  bounded cached account/device state;
- capture, viewing, manual correction, case/task work and search over existing
  local indexes remain available offline;
- Assist jobs are visibly queued, cancellable before transmission where
  technically possible and retried according to policy;
- expired or invalid entitlement state degrades predictably and never deletes
  data;
- users may exclude a document from Cloud Assist or disable automatic
  processing, with clear explanation that classification and workflow setup may
  then require manual work.

The product does not market opt-out/manual operation as equivalent to the full
Assist experience.

## Account-Independent Exit and Recovery

Account requirement must not become data lock-in. Mappm provides a detached
recovery capability for existing local data:

- Local Vault documents remain accessible after subscription cancellation;
- before voluntary account deletion, each Local Vault can be retained as a
  detached recovery Vault or explicitly deleted from the device;
- Cloud Vaults offer verified Cloud-to-Local migration or complete export
  before the account lifecycle removes normal access;
- detached recovery supports open, local search, export and manual maintenance
  of existing documents, cases, tasks and metadata;
- no Cloud Assist, sync, sharing, managed backup or new paid capability remains;
- reconnecting to normal service is an explicit re-attachment/reactivation
  flow, not an automatic upload;
- local content keys and recovery material cannot depend solely on a live
  server account or refresh token.

Detached Recovery is an exit guarantee, not an account-free acquisition or
onboarding mode. New users cannot start the normal product without an account.

## Account, Subscription and Data Lifecycle Separation

These actions are distinct:

- sign out or session expiry;
- device revocation;
- plan downgrade or subscription cancellation;
- Local or Cloud Vault deletion;
- account deletion;
- Local Vault detachment to recovery;
- Cloud-to-Local migration or export.

Default commercial transitions:

- cancelling Paid Local downgrades to Free Local with its account, Local
  authority and free Core Assist limits when that plan remains eligible;
- cancelling Cloud storage follows the Cloud grace/export/Cloud-to-Local path
  and may then continue as account-backed Free/Paid Local;
- deleting the account requires Local detachment/export/deletion choices and
  Cloud lifecycle resolution;
- Detached Recovery is not the automatic consequence of every subscription
  cancellation.

Account deletion must inventory all Vaults, pending processing jobs, active
migrations, subscriptions and shared access. It may not remotely erase a Local
Vault without an explicit device-local destructive choice. Cloud deletion
follows its separate grace, retention and legal lifecycle.

## Security and Privacy Consequences

- Account identity and household/profile identity remain separate concepts.
- Local Vault encryption keys are device/recovery scoped, not merely account
  access tokens.
- Session, entitlement and processing tokens use Secure Storage.
- Assist payloads and OCR text are sensitive data and never enter normal logs,
  analytics, support bundles or model training without a separately accepted
  lawful policy.
- The app must show processing purpose and material provider/trust consequences
  without implying that Local Vault data is Cloud-stored.
- Identity recovery may restore account access but cannot bypass the accepted
  Vault key/trust model.

## Commercial Consequences

- Free means price/limits, not anonymous or manual-only use.
- Core Assist quota must be large enough to demonstrate the central product
  value; an unusably small allowance is not an acceptable dark pattern.
- Paid Local may monetize higher processing limits and advanced Assist while
  preserving Local authority.
- Mappm Cloud monetizes managed storage, backup, multi-device continuity and
  related services in addition to Assist entitlements.
- Cancellation and downgrade copy states separately what happens to account,
  Assist, Cloud storage and Local data.
- Paid Local cancellation prefers an ordinary Free Local downgrade; it never
  forces export or Detached Recovery merely because payment ends.

## Required States

Account/device, entitlement, Vault authority, Assist job and subscription state
must not be collapsed into one generic status. At minimum the model represents:

- account/session: `active`, `offlineCached`, `reauthRequired`, `suspended`,
  `deletionPending`, `deleted`, `detachedRecovery`;
- entitlement: `freeActive`, `paidActive`, `quotaLimited`, `expired`,
  `graceReadOnly`, `none`;
- Assist job: `notRequested`, `queued`, `uploading`, `processing`,
  `reviewReady`, `failedRetryable`, `failedFinal`, `cancelled`, `deleted`;
- Vault authority and subscription lifecycle as defined in the Vault decision.

These are conceptual states. Exact API DTOs and persistence mappings remain
owned by their backend/contract/data phases.

## Open Decisions

- VC-02: Managed Trust or Zero-Knowledge/E2EE and resulting Assist design.
- VC-03: free/paid plans, Core/Advanced Assist quotas, Local/Cloud limits,
  device limits, trial and billing provider.
- VC-08: identity provider, passkey/MFA, recovery proof, account/household and
  device binding for all normal product modes.
- OQ-003: exact Assist payload, provider, region, retention, redaction,
  subprocessor and training rules.
- platform-specific offline entitlement duration and detached-recovery key
  handling remain part of VC-07/VC-08 and implementation contracts.

## Stop Rules

Stop if:

- a phase equates account presence with Cloud document authority;
- Local Assist silently stores documents as a Cloud backup;
- Free Local omits the Core Assist value proposition without an explicit
  product re-decision;
- normal Local onboarding bypasses account/device/entitlement policy;
- every app launch requires network access to open a healthy Local Vault;
- account deletion can strand or silently erase Local data;
- recovery depends solely on a live account token or server-only key;
- manual/opt-out mode is presented as feature-equivalent to Assist;
- UI, frontend or an LLM decides backend processing, retention or policy
  architecture.

## Supersedes

This decision supersedes account-free Local assumptions in:

- `DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`;
- `DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md`;
- `DECISION_LOCAL_LOGIN.md`;
- `DECISION_AUTH_PAIRING.md`;
- `DECISION_COMMERCIAL_CORE_SCOPE.md`;
- F36, COM-01 and affected roadmap/skill baselines.
