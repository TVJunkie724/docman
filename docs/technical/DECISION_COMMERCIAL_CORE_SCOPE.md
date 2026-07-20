---
title: "Decision - Commercial Core Product Scope"
description: "Verbindliches Ziel fuer eine production-ready, verkaufbare erste Mappm-Version mit bewusst begrenztem Funktionsumfang"
tags: [decision, commercial-core, release, product, account, assist, local-vault, cloud-vault]
lastUpdated: "2026-07-20"
status: "accepted"
owner: "product-concept"
---

# Decision - Commercial Core Product Scope

## Status

Accepted as product direction on 2026-07-12 and extended on 2026-07-19:
Commercial 1.0 is Austria-first. Account, entitlement and Core Assist services
are required for every normal release. Whether the Cloud Vault storage product
must also ship in the first commercial release remains VC-01.

## Decision

The first market target is a **Commercial Core**, not a throwaway MVP. It may
contain fewer features, but every included workflow must be complete,
production-ready, secure, supportable, migratable and legally releasable.

Product promise:

> Private Dokumente erfassen, sicher ablegen, automatisch verstehen, in
> Vorgänge einordnen, prüfen, finden, erledigen, exportieren und
> wiederherstellen.

## Market Sequence

Commercial 1.0 targets **Austria as the first supported commercial market**.
This decision prioritizes Austrian terminology, synthetic fixtures,
country/provider discovery, legal and store review, support readiness and the
first approved workflow pack. It does not activate every candidate in the
Austria discovery drafts. The exact Golden Workflows included in Commercial
1.0 remain the narrowed WF-01 decision and require WF-02 ownership plus current
domain/legal review.

The next planned expansion direction is the **German-speaking market area**.
Its exact jurisdictions and order remain open. Germany, Switzerland,
Liechtenstein and any further German-speaking region are separate legal and
provider contexts even when they share German localization, design-system
assets and parts of the workflow vocabulary. Language must never select a
jurisdiction or imply common legal coverage.

Austria-first is a release-prioritization decision, not an architectural
restriction. The generic Case, document taxonomy, workflow patterns, pack
contracts and backend remain internationalizable.

## Required Commercial-Core Capabilities

- account/device onboarding for every normal plan plus explicit detached
  recovery behavior.
- Vault creation with clear Local/Cloud storage authority.
- Desktop import and production-quality document capture on supported devices.
- durable Capture Sessions, asynchronous per-document Processing and compact
  proposal review with preview, recovery, partial success and restart.
- documents, files, first-class Unterlagen/versions, one Case type with typed
  CaseLinks, Custom Cases and managed person profiles.
- structured search, filters, simple tasks/deadlines and quick access.
- Core Assist sufficient for OCR/text extraction, validation of explicit mobile
  document boundaries and reviewed compound-import correction,
  mandatory editable Document/Case/Record title proposals, taxonomy,
  actor/key-field suggestions, ranked Case/Record/workflow matching and
  current-release human confirmation.
- mixed related/unrelated session/import handling with preserved originals,
  reversible split/merge/reorder and outlier review.
- a confirmed primary Case or Record for each accepted document, with a
  lightweight Custom Case fallback when no durable Record or guided/existing
  Case fits.
- Case/Record/reference and multi-document relationships that do not preclude
  later curated jurisdictional workflows.
- duplicate protection, upload/import integrity and no silent data loss.
- encrypted Local backup/export and tested restore.
- Cloud export and Cloud-to-Local exit when Cloud is offered.
- deletion, retention and account/subscription separation.
- signed builds, secure update, migrations, rollback, CI/CD and supply-chain
  evidence.
- redacted diagnostics, incident/support path and documented support window.
- privacy/legal/store/licensing readiness for selected channels.

## Cloud Capability

The managed Mappm service is required for account/device, entitlements and Core
Assist even when Commercial 1.0 offers only Local Vault authority. The Cloud
Vault storage capability is an additional planned paid product, not an
architectural afterthought. It provides Cloud authority, multi-device
continuity, managed storage/backup and the foundation for later sharing.

Mobile-to-desktop continuity requires a Cloud Vault. A Local Vault is
single-device; a Local mobile Vault does not silently transfer into a Local
desktop Vault.

Therefore a Local-Vault-first Commercial 1.0 may offer desktop import and on-device
mobile capture only as separate single-device experiences. It must not market
mobile capture as feeding a desktop Inbox. If that continuity is part of the
first sellable promise, VC-01 must include the Cloud Vault capability and
activate its full C1/C2 contract/provider slices.

VC-01 decides whether Commercial 1.0 includes both Vault modes or whether a
complete account-backed Local + Core Assist release may precede Cloud Vault
storage. It does not decide whether Mappm has a backend at all.

## Explicitly Deferred Unless Separately Activated

- open-ended AI chat, autonomous agents and unreviewed workflow generation.
- advanced semantic answers and broad facts/insights beyond the accepted Core
  Assist/search slice.
- cross-account sharing and complex household permissions.
- EUDI/ID Austria integration.
- public API/plugin ecosystem.
- customer self-hosting/Home Hub.
- broad workflow automation.
- organization/business contexts and tax-document collection unless their
  release scope and country/compliance gates are explicitly activated.
- country-specific guided workflows unless their selected workflow pack has
  passed the dated product, domain, legal, localization and release gates.

Deferred means planned with owner/trigger, not partially exposed in production.

The desktop-only medical media-package import is a documented edge capability,
not a required global Commercial-Core capture channel. If activated for M1, it
is delivered only as a contextual action in an existing confirmed
`medical_care` Case after the Case core and its storage, export, security and
quality gates are available. M1 uses a manually entered title and at most an
optional examination date; it does not require OCR/Assist for the package.
Mobile M1 does not import such packages.

## Release Gates

No commercial release while any included capability lacks:

- exact product/UX contract and accessibility/localization evidence.
- data-loss, migration, backup/restore and destructive-flow tests.
- security/privacy/threat/key review.
- current legal/store/commercial review with date and reviewer.
- monitoring, incident, support and rollback ownership.
- entitlement behavior that preserves export and Local migration.
- a meaningful Free Core Assist contract and tested manual/offline/recovery
  degradation without data loss.

## Stop Rules

Stop if a roadmap calls a feature complete while error, recovery, migration,
accessibility, support or deletion behavior remains deferred. Stop if Cloud is
marketed before VC-02..VC-08 and affected REG/SEC/DATA/OPS/COM concepts are
accepted.
Stop if the first sellable product requires users to manually enter the
metadata and case structure that Core Assist is meant to provide.
