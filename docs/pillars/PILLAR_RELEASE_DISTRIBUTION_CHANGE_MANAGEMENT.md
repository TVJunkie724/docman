---
title: "Enterprise-Säule - Release, Distribution and Change Management"
description: "Enterprise-Bereich fuer CI/CD, Versionierung, Migrationen, Rollback, Signing, Release Notes und Distribution"
tags: [pillar, enterprise, release, distribution, ci-cd, migrations]
lastUpdated: "2026-07-15"
version: "0.3"
status: "proposed"
owner: "quality-readiness/release"
---

# Enterprise-Säule - Release, Distribution and Change Management

## Zweck

Mappm braucht reproduzierbare Releases und kontrollierte Aenderungen.

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

Commercial-Core- und VC-01-Gates entscheiden den ersten Local-/Cloud-Release; Store-Regeln
werden vorbereitet, aber oeffentliche Stores sind kein frueher Blocker.

## C1/C5-Minimum

- lokaler Verify-/Bootstrap-Pfad.
- Codegen reproduzierbar.
- Migrationsrichtung dokumentiert.
- keine unreproduzierbaren Build-Artefakte als Source of Truth.

## Verwandte Konzepte

- F16 CI/CD Pipeline.
- F8 Distribution Readiness.
- F8b Review Access Strategy.
- `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md` und F8. Die alte
  `DECISION_DISTRIBUTION_STRATEGY.md` ist superseded.

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
