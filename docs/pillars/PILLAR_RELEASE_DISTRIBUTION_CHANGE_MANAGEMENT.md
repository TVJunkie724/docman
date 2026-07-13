---
title: "Enterprise-Säule - Release, Distribution and Change Management"
description: "Enterprise-Bereich fuer CI/CD, Versionierung, Migrationen, Rollback, Signing, Release Notes und Distribution"
tags: [pillar, enterprise, release, distribution, ci-cd, migrations]
lastUpdated: "2026-07-12"
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

Commercial-Core- und VC-01-Gates entscheiden den ersten Local-/Cloud-Release; Store-Regeln
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
- `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md` and F8. The old
  `DECISION_DISTRIBUTION_STRATEGY.md` is superseded.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
