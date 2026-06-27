---
title: "Konzept F25 - Accessibility, Product Patterns and Visual QA"
description: "Ordna Accessibility-, Privacy-, Product-Pattern- und visuelle QA-Gates fuer enterprise-grade UI-Umsetzung"
tags: [concept, frontend, design-system, accessibility, patterns, visual-qa, privacy, production-readiness]
lastUpdated: "2026-06-22"
version: "1.1"
status: "accepted"
---

# Konzept F25 - Accessibility, Product Patterns and Visual QA

## Status

Accepted.

F25 definiert die Quality-Schicht ueber den visuellen Patterns. Es stellt
sicher, dass Mock und Flutter-Umsetzung nicht nur huebsch, sondern bedienbar,
testbar und privacy-sicher werden.

## Zweck

Ordna verwaltet sensible Haushaltsdokumente. UI-Qualitaet bedeutet hier:

- kein Datenleck durch UI-Texte, Logs oder Screenshots.
- keine unbedienbaren Hover-/Desktop-only-Flows.
- keine ueberlappenden langen Labels.
- klare Fehler- und Empty-States.
- konsistente visuelle Patterns fuer produktkritische Workflows.

Detailkonzept:

- `CONCEPT_F35_PRODUCT_PATTERNS_ACCESSIBILITY_AND_VISUAL_QA_DETAIL.md` ist die
  build-relevante Detail-Spezifikation fuer Product Patterns, Accessibility
  Gates, Privacy UI Gates, Visual QA, Handoff und Audit.

## Subkonzept F25.1 - Product Patterns

Quelle: `docs/design-system/Mock/pages/patterns.html`.

Pattern-Familien:

| Pattern | Zweck |
|---|---|
| Capture | Scan, Foto, Dateiimport, Drag & Drop. |
| Draft Inbox | Pruefen, zuordnen, korrigieren, zuletzt verarbeitet. |
| Document Detail | Preview, Metadaten, Facts, Beziehungen, Aktionen. |
| Export | Einzeldokument, Vorgang als ZIP, manuelle Weitergabe. |
| Settings | Home Hub, Pairing, Storage, Diagnose. |
| Conflict Resolution | Sync-/Review-Konflikte bewusst aufloesen. |

Regeln:

- Patterns sind keine finalen Screens, aber verbindliche Arbeitsablaeufe.
- Jede spaetere Screen-Planung muss relevante Patterns lesen.
- Mobile Capture bleibt leichtgewichtig; Desktop Review bleibt vollstaendiger.

## Subkonzept F25.2 - Accessibility

Quelle: `docs/design-system/Mock/pages/component-accessibility.html`.

Gates:

- Kontrast fuer Text, Buttons, Status, Fehler.
- Tastaturbedienung fuer Desktop-Flows.
- sichtbarer Fokus.
- Text Scale fuer lange deutsche Labels.
- Reduced Motion ohne Bedeutungsverlust.
- Screenreader-Texte ohne versteckte sensible Rohdaten.

Regel:

Status, Risiko, Sensibilitaet oder Fehler duerfen nie nur ueber Farbe,
Tooltip oder globale Meldung erkennbar sein.

## Subkonzept F25.3 - Privacy UI Gates

Privacy-Anforderungen:

- Keine privaten Dokumenttitel in globalen technischen Meldungen.
- Keine OCR-Texte in Notifications, Logs, Telemetry oder Callouts.
- Keine Versicherungsnummern, Gesundheitsdetails oder Ausweisdaten in
  Shell-Chrome, Snackbars oder globalen Bannern.
- Export- und Sharing-nahe Aktionen muessen klar sagen, was erzeugt wird.
- Schnellzugriff darf sichtbar sein, aber sensible Details muessen kontrolliert
  bleiben.

## Subkonzept F25.4 - Visual QA

Vor Merge einer UI-Implementierung:

- Desktop- und Mobile-Screenshots fuer relevante Breakpoints.
- Keine Textueberlaeufe.
- Keine ueberlappenden Elemente.
- Keine leeren/blanken Hauptbereiche.
- Loading, Empty, Error, Disabled und Success-Zustaende geprueft, wenn relevant.
- Farben und Tokens gegen F20/F21/F23 geprueft.

## Subkonzept F25.5 - Agent Review Checklist

Ein UI-Agent muss im Handoff nennen:

- gelesene F-Konzepte.
- relevante Mock-Seiten.
- umgesetzte Komponenten und Zustaende.
- Tests/Checks.
- bekannte Abweichungen vom Mock.
- offene Designfragen.

## Definition of Done

F25 ist umgesetzt, wenn:

- UI-Plaene Accessibility- und Privacy-Gates enthalten.
- visuelle Tests oder Screenshots Teil der Definition of Done sind.
- zentrale Product Patterns nicht durch isolierte Screens widersprochen werden.
- Audits konkrete Dateien, Screens, Zustaende und Tests pruefen koennen.
