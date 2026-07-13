---
title: "Konzept F21 - Foundations, Tokens and Visual Primitives"
description: "Mappm Foundations fuer Farben, Typografie, Icons, Spacing, Radius, Elevation und Token-Promotion in Flutter"
tags: [concept, frontend, design-system, tokens, typography, icons, spacing, colors]
lastUpdated: "2026-07-12"
version: "1.1"
status: "accepted"
---

# Konzept F21 - Foundations, Tokens and Visual Primitives

## Status

Accepted.

F21 definiert die visuelle Grammatik fuer Mappm. Es ist noch kein Dart-API-Plan,
aber verbindlich fuer jede spaetere Theme-/Token-Implementierung.

## Zweck

Foundations verhindern, dass jede Komponente eigene Farben, Abstaende, Radien,
Icons oder Schriftgroessen erfindet.

Detailkonzept:

- `CONCEPT_F32_FOUNDATIONS_TOKENS_TYPOGRAPHY_ICONS.md` ist die
  build-relevante Detail-Spezifikation fuer Palette, semantische Tokens,
  Typografie, Lucide Icon Map, Spacing, Radius, Density und Elevation.

## Subkonzept F21.1 - Foundations Overview

Quelle: `docs/design-system/Mock/pages/foundations.html`.

Foundation-Gruppen:

- Palette.
- Typography.
- Icon Set.
- Spacing.
- Radius.
- Elevation.
- Density.
- Statussignale.

Regeln:

- Token zuerst semantisch benennen, nicht nach Hexwert.
- Statusfarben sind Produktrollen, keine Brandfarben.
- App-Arbeitsbereiche bleiben dicht, ruhig und scannbar.
- Wiederholte UI-Elemente verwenden zentrale Komponenten.

## Subkonzept F21.2 - Palette and Semantic Colors

Quelle: `docs/design-system/Mock/pages/color-palette.html`.

Token-Gruppen:

| Gruppe | Zweck |
|---|---|
| Brand and Warmth | Coral, Rose, Apricot, Paper. |
| Structure and Trust | Petrol Deep, Petrol, Petrol Ink, Petrol Soft/Mist. |
| Text and Surface | Ink, Slate, Line, White, App Background. |
| Status | Success, Warning, Danger, Info, Privacy, Neutral. |

Flutter-Regeln:

- Theme darf nicht direkt `Colors.red`, `Colors.blue` usw. in Produktwidgets
  verstreuen.
- Komponenten nutzen semantische Tokens: `capture`, `structure`, `privacy`,
  `warning`, `success`, `danger`, `surface`, `line`.
- Farbentscheidungen muessen im Light Mode funktionieren und Dark Mode nicht
  verbauen.

## Subkonzept F21.3 - Icon System

Quelle: `docs/design-system/Mock/pages/icon-set.html`.

Entscheidung:

- Lucide ist das primaere Produkt-Icon-Set.
- Das App-Symbol ist kein Produkt-Icon-Set.

Regeln:

- Icons sind Funktionssprache, nicht Dekoration.
- Sicherheits-, Export-, Delete-, Pairing- und Capture-Aktionen brauchen Icon
  plus Text.
- Icon-only Buttons nur fuer sehr bekannte Toolbar-Aktionen und mit Tooltip
  sowie Accessibility Label.
- Callouts nutzen semantische Outline-Icons; keine Buchstaben-Codes.

Core-Icon-Rollen:

| Rolle | Beispiel |
|---|---|
| Scan/Capture | Mobile Scan, Desktop Import. |
| Inbox | Draft Inbox, Queue. |
| Document | Datei, PDF, Nachweis. |
| Folder/Case | Vorgang, Sammlung, Ablage. |
| User/Profile | Person, Haushalt. |
| Search/Filter | Suche, Filterchips. |
| Calendar/Bell | Frist, Reminder, Aufgabe. |
| Download/Link | Export, externe Aktion. |
| Shield/Alert/Check | Privacy, Risiko, Erfolg. |

## Subkonzept F21.4 - Typography

Quelle: `docs/design-system/Mock/pages/fonts.html`.

Entscheidung:

- Manrope ist die geplante primaere Produkt- und Corporate-Schrift.
- System Sans bleibt technischer Fallback, bis Font-Bundling implementiert ist.
- Keine Serifenschrift fuer Highlights in der Produkt-UI.

Regeln:

- Lange deutsche Labels muessen lesbar bleiben.
- Keine negative Letter-Spacing.
- Display-Typografie nur fuer echte Page-/Empty-State-Kontexte.
- Kompakte Panels nutzen kleinere, dichtere Hierarchie.

## Subkonzept F21.5 - Spacing, Radius, Density, Elevation

Quelle: `docs/design-system/Mock/pages/spacing.html`.

Regeln:

- Dichte Arbeitsbereiche verwenden klare Abstaende statt dekorativer Kartenflut.
- Radius bleibt ruhig; groessere Radien sind nur fuer App Icon, Dialoge oder
  bestehende Flutter-Referenzmuster erlaubt.
- Elevation sparsam; Border und Flaechenhierarchie vor starkem Shadow.
- Wiederholte Listen-/Card-Elemente brauchen stabile Hoehen und responsive
  Constraints, damit Text nicht springt.

## Token Promotion Gate

Ein Token ist implementierungsreif, wenn:

- Rolle und Nicht-Rolle beschrieben sind.
- Kontrast fuer relevante Groessen geprueft ist.
- Flutter-Name und Theme-Ort im UI-Architekturplan stehen.
- Mindestens ein Mock-Beispiel seine Verwendung zeigt.
- Tests oder visuelle QA fuer kritische Verwendung geplant sind.

## Definition of Done

F21 ist umgesetzt, wenn:

- Flutter Theme keine freien Produktfarben mehr streut.
- Icon-, Font-, Spacing- und Radius-Entscheidungen zentral dokumentiert sind.
- die wichtigsten Tokens in Widget-Tests oder visuellen Golden-/Screenshot-
  Gates pruefbar sind.
- Dark Mode und Plattformvariation nicht verbaut werden.

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
