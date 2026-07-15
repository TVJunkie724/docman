---
title: "Enterprise-Säule - Developer Experience and Architecture Governance"
description: "Enterprise-Bereich fuer Bootstrap, Codegen, Architekturregeln, Decisions, GitHub Issues, Milestones und Definition of Done"
tags: [pillar, enterprise, dx, architecture, governance]
lastUpdated: "2026-07-15"
version: "0.2"
status: "proposed"
owner: "foundation/quality-readiness"
---

# Enterprise-Säule - Developer Experience and Architecture Governance

## Zweck

Mappm soll langfristig wartbar bleiben und von neuen Arbeitsabschnitten sicher
erweitert werden koennen.

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

## C1-Minimum

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

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
