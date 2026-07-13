---
title: "Enterprise-Säule - Design System and UX Governance"
description: "Enterprise-Bereich fuer Design-System, Navigation, Komponenten, leere/fehlerhafte Zustände, Accessibility und responsive UX"
tags: [pillar, enterprise, design-system, ux, accessibility]
lastUpdated: "2026-07-12"
version: "0.2"
status: "proposed"
---

# Enterprise-Säule - Design System and UX Governance

## Zweck

DocMan soll sich über Desktop und Mobile hinweg konsistent, ruhig und vertrauenswürdig anfühlen.

Die aktive Design-System-Quelle liegt unter:

```text
docs/design-system/
```

Sie fuehrt Mappm Corporate Design, Logo-/Farbableitung, Foundations, statische
Review-Mocks und spaetere UI-Governance zusammen. Das bestehende Logo unter
`assets/images/logo.png` ist ein App-Icon/Symbol-Kandidat, aber noch kein
vollstaendiges Logo-System.

## Scope

- Navigationsmodell.
- Design Tokens.
- Komponentenfamilien.
- Formulare.
- Listen, Tabellen und Detailansichten.
- leere, ladende, fehlerhafte und gesperrte Zustände.
- Accessibility.
- responsive Regeln.
- Mobile/Desktop-Konsistenz.

## M2-Minimum

- keine UI-Sonderwege ohne Grund.
- wiederverwendbare Komponenten für zentrale Workflows.
- klare Status- und Fehlerzustände.
- lesbare, dichte, aber nicht überladene Dokumentenoberfläche.
- `MP-DS-01`, `MP-DS-02` und `MP-DS-03` vor UI-Architekturarbeit pruefen.
- Coral/Rose als Brand-Akzent nutzen, nicht als dominante Arbeitsflaeche.
- keine echten privaten Daten in Design-System-Mocks.

## Verwandte Konzepte

- `docs/design-system/README.md`.
- `docs/design-system/concepts/MP-DS-00_DESIGN_SYSTEM_UMBRELLA.md`.
- `docs/design-system/concepts/MP-DS-01_FOUNDATIONS_AND_TOKENS.md`.
- `docs/design-system/concepts/MP-DS-02_LAYOUT_AND_SHELL.md`.
- `docs/design-system/concepts/MP-DS-03_CORPORATE_DESIGN.md`.
- F13 Configuration Pages.
- F14 Form Field Catalog.
- F17 Mobile Capture Client Standards.
- UI-Planungs- und Audit-Skills.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
