---
title: "DATA-06 Audit Logs Legal Hold"
description: "Audit trails, legal hold, tamper evidence and privacy-safe logs"
tags: [data, audit, legal-hold, logs]
status: "draft"
owner: "data/compliance"
lastUpdated: "2026-07-12"
---

# DATA-06 Audit Logs Legal Hold

## 2026 Vault/Cloud Applicability

Audit records use privacy-safe actor/device/Vault/operation references and never
contain document bytes, OCR text, filenames, tokens or signed URLs. Required
events include authority switch, account/device changes, entitlement/grace,
export, migration, deletion request/completion, key operations and privileged
support actions. Consumer legal hold is not assumed; if activated later it must
have a lawful owner and visibly explain any deletion restriction.

## Required Decisions

- Audit events.
- Actor identity and timestamp source.
- Tamper evidence.
- Retention and deletion.
- Legal hold override.
- User/admin visibility.
- Audit retention after Vault/account deletion and unlinkability requirements.

## Stop Rules

- Stop if audit logs contain sensitive payloads or legal hold conflicts with
  deletion rights without explicit review.
