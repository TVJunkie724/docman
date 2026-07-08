---
title: "Mappm SEC-00 Security And Trust Umbrella"
description: "Security, trust and encryption planning contract for sensitive document handling"
tags: [security, privacy, encryption, trust, local-first, cloud, playbook]
lastUpdated: "2026-07-08"
status: "draft"
owner: "security/product-concept"
---

# Mappm SEC-00 Security And Trust Umbrella

## Purpose

Mappm is private-first and offline-capable, but future sync, sharing, backups
and intelligence services require explicit trust boundaries. Security is not a
later add-on; it is part of every data, backend and UI decision.

## Trust Model Direction

| Area | Direction | Status |
|---|---|---|
| Local data | encrypted local storage and secure key handling are required before production use | planned |
| Cloud transfer | only through explicit provider contracts and documented consent/user intent | planned |
| Backups | encrypted, restorable and auditable; provider boundary must be documented | planned |
| Sharing | account/recipient identity, access expiry and revocation must be designed before implementation | planned |
| Intelligence services | sensitive content transfer requires purpose, minimization, retention and provider review | planned |
| Identity | eIDAS/EUDI/ID Austria may become a trusted provider boundary | planned |

## Required Security Concepts

- key management and secure storage.
- encryption at rest and in transit.
- account/device trust and session lifecycle.
- audit-relevant document access events.
- provider exchangeability.
- deletion, export and restore guarantees.
- offline/demo mode isolation from live services.
- incident/support diagnostic boundaries.

## Stop Rules

- Stop if a phase moves document bytes or extracted facts to a service without
  documented trust boundary and user-visible purpose.
- Stop if fake/demo data can be confused with live sensitive data.
- Stop if sharing, backup or sync is implemented before access, revocation and
  recovery expectations are specified.
