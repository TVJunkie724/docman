---
title: "Konzept F19 - Design System Governance and SSOT"
description: "Querschnittliches Frontend-Konzept fuer Ordna Design-System-Governance, Mock-to-Concept-Promotion, SSOT-Regeln und Agent-Gates"
tags: [concept, frontend, design-system, ux, ssot, governance, production-readiness]
lastUpdated: "2026-06-17"
version: "1.0"
status: "accepted"
---

# Konzept F19 - Design System Governance and SSOT

## Status

Accepted.

Dieses Konzept verbindet den visuellen Ordna Design-System-Mock mit den
umsetzungsrelevanten Frontend-Konzepten. Es ist die Governance-Schicht fuer
zukuenftige UI-Agents.

## Zweck

Ordna soll nicht durch einzelne Mock-Seiten, isolierte Flutter-Widgets oder
ad-hoc Farben entstehen. Jede UI-Entscheidung muss eine einzige fachliche
Quelle haben und von dort in Umsetzung, Tests und Reviews getragen werden.

F19 definiert:

- welche Design-System-Artefakte Source of Truth sind.
- wie Mock-Seiten in F-Konzepte und spaeter in Flutter-Pläne ueberfuehrt werden.
- welche Regeln fuer SSOT, Token, Komponenten und visuelle Beispiele gelten.
- wann ein Agent mit UI-Implementierung beginnen darf.

## Quellen

| Quelle | Rolle |
|---|---|
| `docs/design-system/Mock/index.html` | Review-Oberflaeche fuer sichtbare Richtung. |
| `docs/design-system/Mock/pages/*.html` | Visuelle Evidenz und Akzeptanzbeispiele. |
| `docs/design-system/Mock/assets/css/tokens.css` | Mock-Token-Quelle fuer Farben, Radius und Schrift. |
| `docs/design-system/Mock/assets/css/base.css` | Mock-Komponenten-Quelle fuer reviewbare HTML-Beispiele. |
| `docs/design-system/Mock/assets/js/navigation.js` | Gemeinsame Mock-Navigation und zentrale Icon-Registry fuer Callouts. |
| `docs/design-system/concepts/OD-DS-*.md` | Design-System-Planungsdokumente. |
| `docs/concepts/CONCEPT_F20_*.md` bis `CONCEPT_F25_*.md` | Build-relevante Frontend-Konzepte aus dem Mock. |

## Mock Page Ownership

| Mock-Seite | Konzept-Owner | Subkonzept |
|---|---|---|
| `index.html` | F19 | Portal, SSOT, Konzeptlandkarte |
| `corporate-design.html` | F20 | Brand Idea and Corporate Handoff |
| `corporate-logo.html` | F20 | Logo System and Asset Roles |
| `corporate-colors.html` | F20 | Brand-to-Product Color Translation |
| `corporate-voice.html` | F20 | Voice and Privacy-Safe Copy |
| `corporate-standards.html` | F20 | Corporate Usage Gates |
| `foundations.html` | F21 | Foundation Overview |
| `color-palette.html` | F21 | Palette, Semantic Colors, Contrast |
| `icon-set.html` | F21 | Icon System |
| `fonts.html` | F21 | Typography |
| `spacing.html` | F21 | Spacing, Radius, Density, Elevation |
| `product-shell.html` | F22 | App Shell Layout |
| `component-navigation.html` | F22 | Navigation Controls |
| `components.html` | F23 | Component Catalogue |
| `component-buttons.html` | F23 | Button and Command Hierarchy |
| `component-status.html` | F23 | Status Signals |
| `component-tags.html` | F23 | Tags and Filter Chips |
| `component-feedback.html` | F23 | Feedback, Callouts, Empty States |
| `data-display.html` | F23 | Document Rows, Facts, Timelines |
| `component-forms.html` | F24 | Form Family Draft |
| `patterns.html` | F25 | Product Interaction Patterns |
| `component-accessibility.html` | F25 | Accessibility and QA Gates |

## SSOT-Regeln

1. Ein visuelles Element hat genau eine konzeptionelle Quelle.
2. Ein Mock-Pattern darf nur dann mehrfach vorkommen, wenn CSS/JS/Token zentral
   sind und die HTML-Seite nur Instanzen zeigt.
3. Farben werden ueber semantische Tokens verwendet, nicht ueber freie Hexwerte.
4. Callout-Icons werden ueber `data-callout-icon` und die zentrale Registry in
   `navigation.js` eingesetzt.
5. Alte oder konkurrierende Patterns muessen entfernt werden, wenn ein neues
   Pattern akzeptiert ist.
6. Design-System-Mocks enthalten nur synthetische Daten.
7. Keine Mock-Seite darf Metainformation ueber den Mock selbst als Produkt-UI
   ausgeben. Regeln gehoeren in Konzepte, sichtbare Beispiele in die Mock-Seite.

## Agent Gate

Ein UI-Agent darf eine Ordna-Komponente erst implementieren, wenn:

- das passende F-Konzept gelesen wurde.
- die relevante Mock-Seite gelesen wurde.
- die Flutter-Zielarchitektur aus `docman-ui-onboarding` beachtet wurde.
- Clean Architecture eingehalten wird: Presentation nutzt Domain-Interfaces,
  nicht Data-Implementierungen.
- die Komponente Zustände, Accessibility und Testbarkeit explizit abdeckt.

## Promotion Workflow

1. Mock iterieren.
2. Stabile Richtung in F20-F25 dokumentieren.
3. Bei Architekturarbeit UI-Plan durch `docman-ui-architect` erstellen.
4. Flutter-Implementierung erst nach Planfreigabe.
5. Audit gegen F-Konzept, Mock-Evidenz und Flutter-Plan.

## Definition of Done

F19 ist umgesetzt, wenn:

- jede Mock-Seite einem F-Konzept-Owner zugeordnet ist.
- keine konkurrierenden UI-Patterns ohne klare Rolle existieren.
- Token, Callouts, Icons und Core-Komponenten nur eine zentrale Quelle haben.
- zukuenftige Agents wissen, welche Dokumente vor Umsetzung zu lesen sind.

