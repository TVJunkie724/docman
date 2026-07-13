---
title: "COM-02 Billing Trials Plans"
description: "Billing, trials, subscriptions, invoices and platform payment rules"
tags: [commercial, billing, subscriptions]
status: "draft"
owner: "commercial/product"
lastUpdated: "2026-07-12"
---

# COM-02 Billing Trials Plans

## Product Contract

Billing owns payment and subscription transitions; it never owns document
deletion. Subscription cancellation, Vault deletion and account deletion are
three separate workflows. During the paid remainder and grace/read-only period
the product clearly shows dates, allowed actions and consequences without
dark patterns.

Required cancellation journey:

1. confirm cancellation and paid-through date;
2. keep normal service until that date;
3. enter bounded read-only/grace with reactivation, export and Local migration;
4. notify before retention/deletion transitions using accepted channels;
5. require separate confirmation for Cloud Vault deletion;
6. apply account deletion only after its own data/legal/dependency checks.

For Local Vaults, paid-plan cancellation normally falls back to Free Local with
its reduced Assist limits. Account deletion separately offers retention as
Detached Recovery, encrypted export or explicit device-local deletion. Billing
cannot remotely delete Local data. Loss of Assist entitlement degrades to the
applicable free/manual behavior and never changes Vault authority.

## Required Decisions

- Billing provider.
- Trial and cancellation.
- Free Local, Paid Local and Cloud packaging plus Core/Advanced Assist quotas.
- Refunds and invoices.
- App store payment restrictions.
- Tax/VAT handling owner.
- Failed payment and grace period.
- Reactivation in paid-active, grace and retention-pending states.
- Store subscription versus direct billing source-of-truth and restore-purchase behavior.
- Proration, plan upgrade/downgrade and quota-over-limit behavior.
- Billing support, dispute and webhook reconciliation/idempotency.

## Stop Rules

- Stop if billing flow conflicts with store/platform policy or entitlement
  behavior.
- Stop if billing webhooks can change Vault state without an idempotent,
  auditable entitlement transition.
- Stop until VC-03/VC-04 and current store/legal rules are reviewed and dated.
- Stop if Free pricing language implies anonymous use or if cancellation copy
  conflates Assist loss, Cloud storage lifecycle and Local data ownership.
