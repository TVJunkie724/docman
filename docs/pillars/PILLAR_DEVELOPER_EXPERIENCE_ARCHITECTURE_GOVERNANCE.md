---
title: "Enterprise-Säule - Developer Experience and Architecture Governance"
description: "Enterprise-Bereich fuer Bootstrap, Codegen, Architekturregeln, Decisions, GitHub Issues, Milestones und Definition of Done"
tags: [pillar, enterprise, dx, architecture, governance]
lastUpdated: "2026-07-12"
version: "0.1"
status: "proposed"
---

# Enterprise-Säule - Developer Experience and Architecture Governance

## Zweck

DocMan soll langfristig wartbar bleiben und von neuen Arbeitsabschnitten sicher erweitert werden können.

## Scope

- Bootstrap-Scripts.
- Codegen-Scripts.
- Verify-Scripts.
- Architekturregeln.
- Clean Architecture Boundaries.
- Riverpod-Konventionen.
- ADRs/Decision-Dokumente.
- GitHub Issues und Milestones.
- Definition of Done.
- Handoff- und Review-Prozesse.

## M2-Minimum

- frischer Checkout kann initialisiert werden.
- generierte Dateien sind reproduzierbar.
- Issues/Milestones werden als professionelle Arbeitssteuerung genutzt.
- Entscheidungen bleiben in `docs/technical/DECISION_*.md`.

## Verwandte Konzepte

- F1 Project Structure.
- F2 State Management.
- F3 Coding Conventions.
- F16 CI/CD Pipeline.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
