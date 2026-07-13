---
title: "REG-04 eIDAS EUDI Identity Trust"
description: "eIDAS/EUDI/ID Austria identity assurance and trust boundary"
tags: [regulatory, eidas, eudi, identity]
status: "draft"
owner: "identity/compliance"
lastUpdated: "2026-07-12"
jurisdiction: "EU/EEA, Austria"
regulatoryAsOf: "2026-07-11"
sourcesCheckedAt: "2026-07-11"
nextReviewDue: "2026-08-11"
primarySources: ["docs/regulatory/REGULATORY_SOURCE_REGISTER.md"]
legalReviewer: "legal/identity compliance review required"
---

# REG-04 eIDAS EUDI Identity Trust

## Purpose

Defines how electronic identity, wallet assertions and trust levels are used.

## Required Decisions

- Supported identity providers and assurance levels.
- What identity attributes are read, stored or only verified.
- Account binding, re-verification and revocation.
- Signature/seal requirements, if applicable.
- Household/team/organization identity model.
- Audit trail and user-visible identity state.

## Stop Rules

- Stop if identity data is stored or used for access decisions without
  attribute minimization, assurance level and revocation policy.
