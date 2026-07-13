---
title: "DATA-04 Residency Transfers"
description: "Data residency, regions, subprocessors and international transfers"
tags: [data, residency, transfers, privacy]
status: "draft"
owner: "data/privacy"
lastUpdated: "2026-07-12"
---

# DATA-04 Residency Transfers

## 2026 Vault/Cloud Applicability

Local Vault data does not leave the selected device through product behavior
unless the user exports or migrates it. Cloud Vault, backup, identity,
observability, billing/support and optional processing each require a dated
region, processor/subprocessor and transfer decision. Local Development Cloud,
Development and Staging never receive production-derived data.

## Required Decisions

- Primary hosting regions.
- Backup regions.
- AI/provider regions.
- Subprocessors.
- International transfer safeguards.
- Customer residency options.
- Region behavior during backup/restore, incident recovery, migration/export
  and processor change.

## Stop Rules

- Stop if sensitive data leaves expected region without transfer and contract
  decision.
