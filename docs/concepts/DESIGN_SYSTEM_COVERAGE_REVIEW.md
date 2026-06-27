---
title: "Design System Coverage Review"
description: "Abgleich aller Ordna Design-System-Mock-Seiten gegen F-Konzepte und Detailkonzepte"
tags: [concept, frontend, design-system, coverage, review, ssot]
lastUpdated: "2026-06-22"
version: "1.0"
status: "accepted"
---

# Design System Coverage Review

## Status

Accepted.

Dieser Review dokumentiert den Stand nach der Promotion des HTML-Mocks in
Design-System- und F-Konzepte. Ziel ist eine eindeutige SSOT-Kette fuer
zukuenftige Flutter-Agents.

## Ergebnis

Alle aktuell vorhandenen Mock-Seiten unter
`docs/design-system/Mock/pages/` sind durch ein Umbrella-Konzept und, wo
noetig, ein Detailkonzept abgedeckt.

## Coverage Matrix

| Mock-Seite | Umbrella | Detailkonzept | Status |
|---|---|---|---|
| `index.html` | F19 | F19 | abgedeckt |
| `corporate-design.html` | F20 | F31 | abgedeckt |
| `corporate-logo.html` | F20 | F31 | abgedeckt |
| `corporate-colors.html` | F20 | F31 | abgedeckt |
| `corporate-voice.html` | F20 | F31 | abgedeckt |
| `corporate-standards.html` | F20 | F31 | abgedeckt |
| `foundations.html` | F21 | F32 | abgedeckt |
| `color-palette.html` | F21 | F32 | abgedeckt |
| `icon-set.html` | F21 | F32 | abgedeckt |
| `fonts.html` | F21 | F32 | abgedeckt |
| `spacing.html` | F21 | F32 | abgedeckt |
| `product-shell.html` | F22 | F33 | abgedeckt |
| `component-navigation.html` | F22 | F33 | abgedeckt |
| `components.html` | F23 | F34 | abgedeckt |
| `component-buttons.html` | F23 | F26 | abgedeckt |
| `component-status.html` | F23 | F34 | abgedeckt |
| `component-tags.html` | F23 | F34 | abgedeckt |
| `component-feedback.html` | F23 | F34 | abgedeckt |
| `data-display.html` | F23 | F34 | abgedeckt |
| `component-forms.html` | F24 | F27, F28, F29, F30 | abgedeckt |
| `component-form-interactions.html` | F24 | F28, F29 | abgedeckt |
| `patterns.html` | F25 | F35 | abgedeckt |
| `component-accessibility.html` | F25 | F35 | abgedeckt |

## Detailkonzept Coverage

| Konzept | Abdeckung |
|---|---|
| F19 | Governance, SSOT, Mock Page Ownership, Agent Gate |
| F20 | Corporate Design Umbrella |
| F21 | Foundations Umbrella |
| F22 | Shell/Navigation Umbrella |
| F23 | Component System Umbrella |
| F24 | Form Family Umbrella |
| F25 | Patterns, Accessibility and Visual QA Umbrella |
| F26 | Button Family |
| F27 | Form Field Anatomy, Required Policy and Validation |
| F28 | Form Pickers and Selection Controls |
| F29 | Date, Time, File and Scan Controls |
| F30 | Form Facts, Layouts and Assisted Review |
| F31 | Brand System Detail |
| F32 | Foundations, Tokens, Typography and Icons |
| F33 | Shell, Navigation and Workspace Layout |
| F34 | Status, Tags, Feedback and Data Display |
| F35 | Product Patterns, Accessibility and Visual QA Detail |

## Review Findings

### Finding 1 - F24 bleibt bewusst Draft

F24 ist als Umbrella weiterhin `draft`, weil die Form Family trotz detaillierter
Subkonzepte spaeter noch in einen konkreten Flutter-Architekturplan ueberfuehrt
werden muss. Die Detailkonzepte F27-F30 sind fuer ihren Scope `accepted` und
build-relevant.

Entscheidung: kein Fix erforderlich.

### Finding 2 - Mock ist visuelle Evidenz, Konzepte sind Bau-SSOT

Der Mock bleibt wichtig fuer visuelle Reviews. Zukuenftige Agents sollen aber
nicht aus HTML/CSS raten, sondern die F-Konzepte als Bauanleitung lesen.

Entscheidung: in F19 festgehalten.

### Finding 3 - Kein offenes Mock-Coverage-Loch

Es wurde keine Mock-Seite gefunden, die ohne Konzept-Owner bleibt.

Entscheidung: kein Fix erforderlich.

## Future Review Trigger

Dieser Review muss aktualisiert werden, wenn:

- eine neue Mock-Seite entsteht.
- eine bestehende Mock-Seite ein neues Pattern einfuehrt.
- eine F-Konzeptnummer umbenannt oder zusammengelegt wird.
- Flutter-Implementierung eine Abweichung vom Design-System vorschlaegt.

## Definition of Done

- [x] Alle Mock-Seiten sind in F19 gemappt.
- [x] Jede Mock-Seite hat ein Umbrella-Konzept.
- [x] Komplexe Bereiche haben Detailkonzepte.
- [x] Form Family ist in implementierbare Detailbereiche aufgeteilt.
- [x] Coverage-Status ist dokumentiert.
