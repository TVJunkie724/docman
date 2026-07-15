---
title: "Konzept F23 - Component System"
description: "Mappm Komponentenfamilien fuer Buttons, Status, Tags, Feedback, Callouts, Data Display und Component Composition"
tags: [concept, frontend, design-system, components, buttons, status, tags, feedback, data-display]
lastUpdated: "2026-07-15"
version: "1.2"
status: "accepted"
owner: "ui-concept"
---
# Konzept F23 - Component System

## Status

Accepted.

F23 definiert die gemeinsam wiederverwendbaren UI-Komponentenfamilien. Forms
werden bewusst in F24 separat behandelt, weil die Form Family noch nicht
ausgereift genug ist.

## Zweck

Mappm braucht Komponenten fuer echte Dokumentarbeit: wiederholt, ruhig,
privacy-sicher, testbar, responsive und ohne konkurrierende Ad-hoc-Varianten.

Detailkonzepte:

- `CONCEPT_F26_BUTTON_FAMILY.md` ist die build-relevante Spezifikation fuer
  Buttons und Command-Hierarchie.
- `CONCEPT_F34_STATUS_TAGS_FEEDBACK_AND_DATA_DISPLAY.md` ist die
  build-relevante Spezifikation fuer Status, Tags, Feedback, Callouts,
  Dokumentzeilen, Facts und Timelines.

## Subkonzept F23.1 - Component Catalogue

Quelle: `docs/design-system/Mock/pages/components.html`.

Komponentenfamilien:

- Buttons und Commands.
- Status und Badges.
- Tags und Filterchips.
- Feedback, Callouts, Empty States.
- Data Display: Dokumentzeilen, Facts, Timeline.
- Icons und Labels als Funktionssprache.

Regel:

Jede Komponente muss Zustaende, Privacy-Grenze, Accessibility und
mobile/desktop Verhalten kennen.

## Subkonzept F23.2 - Buttons and Command Hierarchy

Quelle: `docs/design-system/Mock/pages/component-buttons.html`.

Detaillierte build-relevante Spezifikation: `CONCEPT_F26_BUTTON_FAMILY.md`.

Button-Rollen:

| Rolle | Verwendung |
|---|---|
| Primary | genau eine klare Hauptaktion im Kontext. |
| Secondary | wichtige Alternative ohne Hauptfluss-Dominanz. |
| Light State | aktive, empfohlene oder ausgewaehlte Aktion mit Petrol-Mist/Petrol, weniger dominant als Primary. |
| Ghost/Text Only | leise Navigation, Abbrechen, spaeter. |
| Icon Only | bekannte, wiederholte Toolbar-Aktion mit Accessibility Label und Tooltip. |
| Danger | destruktive Aktion, immer mit Text und Bestaetigung. |
| Inverse/Dark | Aktionen auf dunklen Shell- oder Diagnoseflaechen. |

Button-Zustaende:

| Zustand | Regel |
|---|---|
| default | stabile visuelle Basis ohne Bewegung. |
| hover | leichte Erhebung oder Kontraststeigerung, keine Layoutverschiebung. |
| focus | sichtbarer Fokus-Ring, tastaturbedienbar. |
| pressed | klare gedrueckte Rueckmeldung. |
| loading | blockiert Wiederholung, zeigt Busy-Zustand. |
| disabled | nicht klickbar und durch naheliegenden Kontext erklaert. |

Button-Groessen:

| Groesse | Verwendung |
|---|---|
| small | Tabellenzeilen, kompakte Toolbars, Inline-Aktionen. |
| default | normale Dialoge, Karten, Detailseiten und Formulare. |
| large | Capture, mobile Hauptaktion, Wizard-Abschluss. |
| block | mobile Sheets und fokussierte One-Step-Flows. |

Regeln:

- Keine Icon-only Buttons fuer kritische Aktionen.
- Primaere Aktionen nutzen Mappm Coral, aber sparsam und nie mehrfach im selben
  Arbeitskontext.
- Secondary nutzt Outline/Neutral, Light State nutzt Petrol, Danger nutzt Brick
  oder Danger-Light.
- Dark/Inverse Varianten sind eigene Varianten und werden nicht durch zufaellige
  Umfaerbung normaler Buttons erzeugt.
- Button-Text ist handlungsorientiert: "Dokument scannen", "Pruefung abschliessen".
- Destruktive Aktionen werden nicht nur durch Farbe erklaert.
- Loading, Disabled, Focus und Pressed sind Pflichtzustaende der Button Family.

## Subkonzept F23.3 - Status Signals

Quelle: `docs/design-system/Mock/pages/component-status.html`.

Detaillierte build-relevante Spezifikation:
`CONCEPT_F34_STATUS_TAGS_FEEDBACK_AND_DATA_DISPLAY.md`.

Statusfamilien:

- Draft/Review.
- Erledigt/Gesichert.
- Sync/Queue.
- Privacy/Sensibel.
- Konflikt/Fehler.
- Workflow-Labels.

Regeln:

- Status ist Text plus Form plus ggf. Farbe/Icon.
- Statusfarben bleiben klein: Badge, Icon, Akzent, nicht grosse Flaeche.
- Workflow-Badges duerfen bestehende Flutter-Sprache weiterfuehren:
  uppercase, 20px Radius, Past/Current/Future, Pfeile, Shadow fuer Current.
- Konflikte erscheinen nur prominent, wenn sie wirklich existieren.

## Subkonzept F23.4 - Tags and Filter Chips

Quelle: `docs/design-system/Mock/pages/component-tags.html`.

Detaillierte build-relevante Spezifikation:
`CONCEPT_F34_STATUS_TAGS_FEEDBACK_AND_DATA_DISPLAY.md`.

Unterscheidung:

| Element | Zweck |
|---|---|
| FilterChip | Filterzustand, oft mit Count. |
| TagChip | Schlagwort am Dokument/Vorgang. |
| StatusBadge | Workflow oder fachlicher Zustand. |

Regeln:

- Tags ersetzen keinen Status.
- Tags sind suchbar und filterbar.
- Freie Tags bleiben moeglich, aber System-Tags duerfen kuratiert sein.
- Tag-Optik muss mit FilterTab-Sprache konsistent bleiben.

## Subkonzept F23.5 - Feedback and Callouts

Quelle: `docs/design-system/Mock/pages/component-feedback.html`.

Detaillierte build-relevante Spezifikation:
`CONCEPT_F34_STATUS_TAGS_FEEDBACK_AND_DATA_DISPLAY.md`.

Primaere Feedbackformen:

| Pattern | Verwendung |
|---|---|
| Snackbar | kurze Bestaetigung. |
| Inline Error | Feld-/Formularfehler. |
| Queue Row | Upload wartet, Retry moeglich. |
| Empty State | leerer Arbeitsbereich. |
| Callout | laengere seitenspezifische Systemmeldung. |

Callout-SSOT:

- CSS: `.callout-card`, `.callout-token`, `.callout-body`.
- Icon Registry: `data-callout-icon` in `docs/design-system/Mock/assets/js/navigation.js`.
- Akzent: Corporate-Farben, keine generische Ampel.
- Form: neutrale Card, Outline-Icon, kurzer Corner-Akzent mit Radius.

Regeln:

- Callouts sind nicht Standard-Listencards.
- Callouts ersetzen keine Inline-Fehler.
- Globale Meldungen enthalten keine privaten Dokumenttitel, OCR-Texte,
  Versicherungsnummern oder Gesundheitsdetails.

## Subkonzept F23.6 - Data Display

Quelle: `docs/design-system/Mock/pages/data-display.html`.

Detaillierte build-relevante Spezifikation:
`CONCEPT_F34_STATUS_TAGS_FEEDBACK_AND_DATA_DISPLAY.md`.

Dokumentzeile:

- Typ-Icon links.
- Titel als Hauptinformation.
- Typ/Domain als erste Meta-Ebene.
- Person/Profile als eigene Chip-Ebene ohne Prefix.
- Status rechts ruhig und neutral, ausser bei Konflikt/blockierendem Zustand.

Typfarben:

- aus Mappm-Palette ableiten.
- nicht zu bunt.
- Bedeutung bleibt ueber Typtext, Titel und Status lesbar.

Facts:

- Facts sind strukturierte Daten, keine freien Tags.
- Fact-Gruppen muessen kompakt, scanbar und spaeter auswertbar sein.
- Dokumentbeziehungen duerfen sichtbar sein, ohne Dateien zu duplizieren.

## Definition of Done

F23 ist umgesetzt, wenn:

- jede Komponentenfamilie als Flutter-Widget-Familie geplant ist.
- keine Komponente eigene Farben, Icons oder Callout-Varianten erfindet.
- Zustaende leer, loading, error, disabled, selected, active und readonly
  risikobasiert abgedeckt sind.
- Accessibility Labels und Tastaturbedienung fuer relevante Komponenten stehen.
- Widget-Tests oder visuelle Tests fuer zentrale Varianten existieren.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Eigener Scope und
Status bleiben massgeblich. Der gemeinsame Vertrag liefert die verbindlichen
Defaults fuer Ownership, Security/Privacy, Accessibility/Lokalisierung,
Verifikation, Stop Rules und Handoff, soweit dieses Dokument keine strengere
Regel definiert. Ein Widerspruch stoppt die betroffene Phase und wird in diesem
Konzept aufgeloest.
