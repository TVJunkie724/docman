---
title: "SEC-01 Threat Model"
description: "Threat actors, assets, attack surfaces and mitigations"
tags: [security, threat-model]
status: "draft"
owner: "security"
lastUpdated: "2026-07-12"
---

# SEC-01 Threat Model

## 2026 Vault/Cloud Scope

The model must cover Local device loss/malware, insecure export/backup and key
loss; Cloud account takeover, broken tenant authorization, storage/backup/key
compromise and malicious insiders; migration split-brain/tampering/replay;
entitlement and deletion abuse; supply-chain compromise; and privacy leakage
through logs, notifications, support or AI providers.

## Assets

- User documents.
- Metadata and OCR text.
- Profiles and identity data.
- Tokens, keys and sessions.
- Backups, exports and diagnostics.

## Required Analysis

- Threat actors.
- Attack surfaces.
- Abuse cases.
- Mitigations.
- Residual risks.
- Verification evidence.
- Billing/store webhook, identity provider and lower-environment crossover.
- Preventive, detective and recovery controls with falsifiable evidence.

## Stop Rules

- Stop if a sensitive feature has no asset/threat mapping.
