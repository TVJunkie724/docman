---
title: "Mappm REG-00 Regulatory Umbrella"
description: "Regulatory planning contract for EU, Austrian, store and platform obligations"
tags: [regulatory, legal, eu, gdpr, ai-act, cra, stores, playbook]
lastUpdated: "2026-07-12"
status: "draft"
owner: "compliance/product"
---

# Mappm REG-00 Regulatory Umbrella

## Purpose

Mappm handles sensitive personal documents and may later provide cloud sync,
sharing, backups, OCR and LLM assistance. Regulatory work is therefore an
always-plan area from the start, even when a feature is not yet implemented.

This document is not legal advice. Every new project setup and every major
release must re-check current law, guidance and store rules on the actual review
date.

## Baseline Date

Baseline reviewed for planning: 2026-07-11. Official sources and application
signals are recorded in `docs/regulatory/REGULATORY_SOURCE_REGISTER.md`.

## Required Regulatory Families

| Family | Status | Owner | Trigger |
|---|---|---|---|
| GDPR / DSGVO privacy | active-planned | compliance/privacy | any personal data processing |
| Data processing agreements | planned | commercial/legal | cloud, support, analytics or processors |
| EU AI Act | planned | compliance/ai | OCR/LLM assisted review, classification, extraction or recommendations |
| Cyber Resilience Act | planned | security/release | sellable connected product or software with digital elements |
| eIDAS / EUDI / ID Austria | planned | identity/compliance | trusted identity, account binding or qualified identity flows |
| Store compliance | planned | release/compliance | mobile or desktop store distribution |
| Accessibility compliance | planned | design/quality | public/commercial distribution |
| Consumer/B2B commercial terms | planned | commercial/legal | pricing, subscriptions, SLA, procurement |

## Mandatory Review Rule

Every regulatory artifact must include:

- review date.
- jurisdiction/scope.
- feature trigger.
- owner.
- source/legal review requirement.
- current status: `draft`, `accepted`, `needs-legal-review`, `planned`,
  `deferred`, `not-applicable`.

## Stop Rules

- Stop if cloud sync, sharing, backup, OCR/LLM or analytics are implemented
  without privacy and security sign-off.
- Stop if AI/OCR/LLM behavior is described as only technical and not mapped to
  regulatory review.
- Stop if store release work begins without store compliance, privacy labels,
  signing and support obligations in scope.
- Stop if legal/regulatory dates are missing or stale during project setup.
