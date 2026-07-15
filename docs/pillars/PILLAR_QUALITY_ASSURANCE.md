---
title: "Enterprise-Säule - Quality Assurance"
description: "Enterprise-Bereich fuer Teststrategie, Regression, Fake-Repositories, Microcks, Accessibility, Visual Checks und Release-Qualität"
tags: [pillar, enterprise, qa, testing, quality]
lastUpdated: "2026-07-15"
version: "0.2"
status: "proposed"
owner: "quality-readiness"
---

# Enterprise-Säule - Quality Assurance

## Zweck

QA stellt sicher, dass Mappm nicht als Spike weiterwaechst.

## Scope

- Testpyramide.
- Unit-, Widget-, Integration- und Smoke-Tests.
- Fake-Repositories.
- Microcks/Contract-Mocks.
- Accessibility-Prüfung.
- Visual-/Golden-Checks fuer stabile UI.
- Regression-Suites.
- Testfixtures ohne private Daten.
- Definition of Done je Phase.

## C1-C3-Minimum

- reproduzierbarer Verify-Befehl.
- Zielpfad-Analyse grün.
- zentrale Fake-Repositories.
- erste Produkt-Slice-Tests.
- keine echten privaten Dokumente in Tests.

## Verwandte Konzepte

- F4 Testing Strategy.
- F15 Mock Repository.
- F16 CI/CD Pipeline.
- R3 Quality & Production Readiness.

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
