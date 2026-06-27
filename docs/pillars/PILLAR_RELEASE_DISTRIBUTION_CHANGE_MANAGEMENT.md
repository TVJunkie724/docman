---
title: "Enterprise-Säule - Release, Distribution and Change Management"
description: "Enterprise-Bereich fuer CI/CD, Versionierung, Migrationen, Rollback, Signing, Release Notes und Distribution"
tags: [pillar, enterprise, release, distribution, ci-cd, migrations]
lastUpdated: "2026-06-10"
version: "0.2"
status: "proposed"
---

# Enterprise-Säule - Release, Distribution and Change Management

## Zweck

DocMan braucht reproduzierbare Releases und kontrollierte Änderungen.

## Scope

- CI/CD.
- Versionierung.
- Migrationen.
- Rollback-Strategie.
- App Signing.
- Release Notes.
- private Distribution.
- spätere Store-Distribution.
- Umgang mit Datenmodelländerungen.

R10-D1 entscheidet: private/self-hosted Distribution kommt zuerst; Store-Regeln
werden vorbereitet, aber oeffentliche Stores sind kein frueher Blocker.

## M2-Minimum

- lokaler Verify-/Bootstrap-Pfad.
- Codegen reproduzierbar.
- Migrationsrichtung dokumentiert.
- keine unreproduzierbaren Build-Artefakte als Source of Truth.

## Verwandte Konzepte

- F16 CI/CD Pipeline.
- F8 Distribution Readiness.
- F8b Review Access Strategy.
- `docs/technical/DECISION_DISTRIBUTION_STRATEGY.md`.
