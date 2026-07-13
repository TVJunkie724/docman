---
title: "OPS-02 Monitoring Observability"
description: "Metrics, logs, traces, alerts and privacy-safe observability"
tags: [ops, monitoring, observability]
status: "draft"
owner: "ops/quality"
lastUpdated: "2026-07-12"
---

# OPS-02 Monitoring Observability

## 2026 Vault/Cloud Applicability

Managed Cloud requires service, tenant-isolation, queue, storage, backup,
migration, entitlement and deletion-job signals with privacy-safe references.
Local Vault operation does not imply remote telemetry; any client diagnostics
or crash reporting needs purpose, consent/legal basis, minimization, retention
and an offline-safe failure path. Development and production signals are
strictly separated.

## Required Decisions

- Signals and metrics.
- Privacy-safe logs.
- Alert thresholds.
- Error/reference-code mapping.
- Retention.
- Customer-facing status.
- SLOs and alerts for export/migration availability during grace/read-only.
- Cardinality and cost controls that forbid account/Vault/document values as labels.

## Stop Rules

- Stop if production failures cannot be detected without leaking sensitive data.
