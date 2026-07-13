---
title: "DATA-03 Export Portability"
description: "Export formats, portability, machine readability and DSAR support"
tags: [data, export, portability]
status: "draft"
owner: "data-architect/privacy"
lastUpdated: "2026-07-12"
---

# DATA-03 Export Portability

## Vault Exit Contract

Export is available for Local and Cloud Vaults. It is not equivalent to
Cloud-to-Local migration: export produces a documented portable artifact;
migration verifies capacity, inventory, payload checksums, target activation
and source preservation before any optional Cloud deletion.

Cloud export and Local migration remain available during accepted read-only and
grace states. Quota, cancelled write entitlement or payment failure must not
block data exit. Security suspension or legal restriction may limit an action
only through an accepted, user-visible policy and support path.

## Required Decisions

- Export scope.
- Export formats.
- Human-readable and machine-readable output.
- Metadata and file inclusion.
- Redaction and third-party data.
- DSAR/self-service path.
- Export manifest/schema version, checksums and completeness report.
- Encryption, passphrase/key handoff and lost-key behavior.
- Partial failure, resume, retry, cancellation and storage-capacity preflight.
- Import/restore compatibility and deprecation window for old export versions.
- Cloud-to-Local platform eligibility and post-migration deletion choice.

## Stop Rules

- Stop if user/customer data cannot be exported in a documented format.
- Stop if export is advertised without round-trip/import or independent
  completeness verification evidence.
