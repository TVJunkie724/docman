---
title: "SEC-03 Encryption Key Management"
description: "Encryption, key storage, rotation, recovery and loss handling"
tags: [security, encryption, keys]
status: "draft"
owner: "security"
lastUpdated: "2026-07-12"
---

# SEC-03 Encryption Key Management

## Required Key Domains

- Local Vault data/file key and encrypted export key.
- Cloud transport, service-side storage and backup keys.
- If VC-02 chooses Zero-Knowledge/E2EE: per-Vault/user/device wrapping,
  sharing and recovery keys without server plaintext access.
- Account/device session credentials and rotation/revocation material.
- Environment-separated Development/Staging/Production service keys.

Key identifiers may be logged only in a non-sensitive operational form. Keys,
recovery secrets and plaintext document material never enter logs, analytics,
crash reports, support bundles, fixtures or lower environments.

## Required Decisions

- Encryption at rest.
- Encryption in transit.
- Key generation and storage.
- Key rotation and revocation.
- Backup/restore key handling.
- Account/device recovery.
- Lost key behavior.
- Key ownership and decrypting principals for each processing step.
- Device add/remove, account recovery, Cloud-to-Local migration and export key handoff.
- Algorithm/version agility, cryptographic inventory and migration/rollback.
- HSM/KMS/secure-enclave expectations and break-glass audit.

## Stop Rules

- Stop if sensitive data is stored, synced or backed up without key ownership
  and recovery/loss policy.
- Stop until VC-02 is accepted before Cloud storage, backup, sharing or managed
  OCR/LLM implementation chooses key ownership.
- Stop until VC-07 is accepted before Local persistence, backup/export or
  recovery implementation chooses encryption, key storage or loss behavior.
