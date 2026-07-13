---
title: "Design System Coverage Review"
description: "Abgleich aller Mappm Design-System-Mock-Seiten gegen F-Konzepte und Detailkonzepte"
tags: [concept, frontend, design-system, coverage, review, ssot]
lastUpdated: "2026-07-14"
version: "1.3"
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
| `component-form-governance.html` | MP-DS-04, F24 | F27, F29, F30, F34 | abgedeckt |
| `patterns.html` | F25 | F35 | abgedeckt |
| `vault-cloud-lifecycle.html` | MP-DS-05, F25 | F36 | abgedeckt |
| `component-accessibility.html` | F25 | F35 | abgedeckt |
| Phase-owned Case/Record/Subscription mock | MP-DS-05, F25 | F37 | ausstehend vor betroffenem UI-Slice |

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
| F36 | Local/Cloud Vault, migration, subscription exit and deletion lifecycle |
| F37 | Vorgänge, Unterlagen, Case-Komposition, Abos, Agenda, kontextuelle Aktionen und Finanzdarstellung |

## Review Findings

### Finding 1 - F24 bleibt bewusst Draft

F24 ist als Umbrella weiterhin `draft`, weil die Form Family trotz detaillierter
Subkonzepte spaeter noch in einen konkreten Flutter-Architekturplan ueberfuehrt
werden muss. Die Detailkonzepte F27-F30 sind fuer ihren Scope `accepted` und
build-relevant.

Entscheidung: kein Fix erforderlich.

### Finding 4 - F37 ist normativ, visuelle Evidenz bleibt phasenbezogen offen

Die Produktregeln fuer Case/Record-Trennung, Custom Cases, Komposition,
Vertragskontext, Agenda und schlanke Finanzdarstellung sind in F37 und
MP-DS-05 abgedeckt. Der bestehende `patterns.html`-Mock beweist diese neuen
Interaktionen noch nicht vollstaendig. Vor dem ersten betroffenen UI-Slice muss
die Phase deshalb einen fokussierten Desktop-/Mobile-Mock mit Auswahl-, Link-,
Chart-, Empty-, Error- und Accessibility-Zustaenden liefern und reviewen.

Entscheidung: als Phase-Gate erfasst; kein generischer Mock darf die konkrete
Phase vorwegnehmen.

### Finding 2 - Mock ist visuelle Evidenz, Konzepte sind Bau-SSOT

Der Mock bleibt wichtig fuer visuelle Reviews. Zukuenftige Agents sollen aber
nicht aus HTML/CSS raten, sondern die F-Konzepte als Bauanleitung lesen.

Entscheidung: in F19 festgehalten.

### Finding 3 - Form-Governance-Promotion geschlossen

Die am 2026-07-08 ergaenzte Seite `component-form-governance.html` wurde am
2026-07-10 gegen MP-DS-04 und F27/F29/F30/F34 promotet. Sie zeigt Lifecycle,
Locale-/Identity-Felder, sensible und permissioned Zustaende, Remote-Validation,
Review-Diff sowie Bulk-Import-Fehler und verweist nicht mehr nur auf eine
Coverage-Matrix.

Entscheidung: kein Fix erforderlich.

## Future Review Trigger

Dieser Review muss aktualisiert werden, wenn:

- eine neue Mock-Seite entsteht.
- eine bestehende Mock-Seite ein neues Pattern einfuehrt.
- eine F-Konzeptnummer umbenannt oder zusammengelegt wird.
- Flutter-Implementierung eine Abweichung vom Design-System vorschlaegt.
- die erste F37-betroffene UI-Phase zur Freigabe ansteht.

## Definition of Done

- [x] Alle Mock-Seiten sind in F19/MP-DS-04 gemappt.
- [x] Jede Mock-Seite hat ein Umbrella-Konzept.
- [x] Komplexe Bereiche haben Detailkonzepte.
- [x] Form Family ist in implementierbare Detailbereiche aufgeteilt.
- [x] Coverage-Status ist dokumentiert.
- [x] Fehlende phasenbezogene F37-Mock-Evidenz ist als verbindliches Gate markiert.
