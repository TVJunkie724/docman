---
title: "SEC-02 Trust Boundaries"
description: "Device, app, backend, cloud, AI provider and sharing trust boundaries"
tags: [security, trust-boundaries]
status: "draft"
owner: "security"
lastUpdated: "2026-07-12"
---

# SEC-02 Trust Boundaries

## Vault Authority Baseline

Local Vault trust ends at the user device and user-controlled encrypted
export/backup. Cloud Vault crosses device, transport, identity, API, metadata,
object storage, backup, observability, support and optional processing
boundaries. Local cache is not a second authority.

## Boundaries

- Local device.
- Local secure storage.
- App local database and file store.
- Mappm Cloud edge/API and account/device identity.
- Cloud metadata, object storage, queue/worker and backup systems.
- Entitlement/billing provider and store callbacks.
- Local Development Cloud, Development, Staging and Production as isolated boundaries.
- AI/OCR provider.
- Shared account or external recipient.
- Support diagnostics.

## Rules

- Each boundary defines data classes, encryption, authentication, logging and
  revocation.
- Crossing a boundary requires explicit product and security decision.
- Each boundary defines owner, threat actor, data classes, purpose, region,
  processor/subprocessor, retention, keys, authentication/authorization,
  audit, incident response, revoke/delete and degraded behavior.
- Managed Trust versus Zero-Knowledge/E2EE is VC-02. Until accepted, no Cloud
  payload/key architecture or AI-processing path is implementation-ready.
- Subscription state never weakens authentication, tenant isolation or audit.

## Stop Rules

- Stop if data crosses a boundary without classification, protection and revoke
  behavior.
