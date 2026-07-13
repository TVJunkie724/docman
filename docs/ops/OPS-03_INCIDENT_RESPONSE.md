---
title: "OPS-03 Incident Response"
description: "Incident severity, roles, communication and regulatory triggers"
tags: [ops, incident-response]
status: "draft"
owner: "ops/security"
lastUpdated: "2026-07-12"
---

# OPS-03 Incident Response

## 2026 Vault/Cloud Applicability

Scenarios include Cloud confidentiality/integrity/availability, tenant
isolation, account takeover, key compromise, corrupt backup/restore,
stuck migration/export/deletion, billing-entitlement errors and malicious
client/update incidents. Local-only incidents have a documented offline
recovery/support path and are not mislabeled as Cloud outages.

## Required Decisions

- Severity levels.
- Incident commander and roles.
- Customer communication.
- Regulatory reporting triggers.
- Postmortem process.
- Evidence retention.
- Regulatory/store/processor notification decision tree with current dated review.
- Evidence preservation without copying document content into incident systems.

## Stop Rules

- Stop if cloud/security release lacks incident owner and escalation path.
