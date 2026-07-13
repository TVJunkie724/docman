---
title: "OPS-05 Support Diagnostics"
description: "Support tooling, diagnostics bundle, consent, redaction and impersonation policy"
tags: [ops, support, diagnostics, privacy]
status: "draft"
owner: "support/ops"
lastUpdated: "2026-07-12"
---

# OPS-05 Support Diagnostics

## 2026 Vault/Cloud Applicability

Diagnostics distinguish Local authority, Cloud authority, cache/pending,
migration, entitlement/grace, export, backup/restore and deletion without
including document/profile content. Remote support or impersonation is disabled
by default and requires a separate accepted privileged-access policy, explicit
scope, time limit, re-authentication and audit.

## Required Decisions

- Diagnostics bundle contents.
- User consent.
- Redaction.
- Support access and impersonation policy.
- Reference codes.
- Retention and deletion.
- User preview of diagnostic bundle and revocable upload consent.
- Support path when account/device recovery or retention deadline is near.

## Stop Rules

- Stop if support requires raw sensitive data or untracked impersonation.
