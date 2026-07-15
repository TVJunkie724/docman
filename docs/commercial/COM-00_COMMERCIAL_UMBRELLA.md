---
title: "Mappm COM-00 Commercial Umbrella"
description: "Commercialization, packaging, procurement and support planning contract"
tags: [commercial, pricing, billing, sla, sales, support, playbook]
lastUpdated: "2026-07-15"
status: "draft"
owner: "commercial/product"
---

# Mappm COM-00 Commercial Umbrella

## Purpose

Mappm targets a sellable Commercial Core. Commercial planning must therefore keep
packaging, cloud cost, support, procurement, subscriptions and trust messaging
visible without blocking early frontend foundation work.

## Commercial Areas

| Area | Status | Trigger |
|---|---|---|
| Packaging and editions | planned | before pricing or store launch |
| Trial/demo mode | planned | before public beta or sales demos |
| Billing/subscription | planned | before paid cloud-backed capabilities |
| SLA/support model | planned | before business customers or shared accounts |
| Procurement/security docs | planned | before B2B sale |
| Cloud cost model | planned | before OCR/LLM/sync commitments |
| Trust page/privacy messaging | planned | before public launch |

## Artefaktindex

| Artefakt | Verantwortung |
|---|---|
| `COM-01_LICENSING_ENTITLEMENTS.md` | Free/Paid, Local/Cloud, Core/Advanced Assist, Limits und Downgrade |
| `COM-02_BILLING_TRIALS_PLANS.md` | Pricing, Trial, Billing, Store/Direct Purchase und Subscription Lifecycle |
| `COM-03_SUPPORT_SLA_PROCUREMENT.md` | Supportversprechen, SLA, Procurement und Security-Unterlagen |
| `COM-04_ENTERPRISE_ADMIN_CONTRACTS.md` | Enterprise-Administration, Vertrage, Rollen und Organisationsevidenz |

## Rules

- Local and paid/service-backed capability must be distinguishable in UX and
  architecture. Normal Local and Cloud use is account-based; Free/Paid Local,
  Cloud packaging and Core/Advanced Assist quotas remain VC-03.
- Cancellation, Cloud Vault deletion and account deletion remain separate;
  export and supported Local migration are never normal paid-write features.
- Pricing cannot be decided without cloud cost, support and compliance impact.
- Commercial commitments cannot promise AI accuracy, backup recovery or
  security guarantees beyond implemented and verified behavior.

## Stop Rules

- Stop if a paid feature is planned without support, billing, compliance and
  data-processing impact.
- Stop if trial/demo data can be confused with live sensitive data.
- Stop if sales language outruns implemented trust and recovery guarantees.
