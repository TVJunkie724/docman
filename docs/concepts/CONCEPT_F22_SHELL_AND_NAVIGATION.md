---
title: "Konzept F22 - Product Shell and Navigation"
description: "Mappm App Shell, Desktop/Mobile Navigation, Arbeitskontexte, Sidebar, Tabs, Segments und responsive Verhalten"
tags: [concept, frontend, design-system, shell, navigation, responsive, desktop, mobile]
lastUpdated: "2026-07-12"
version: "1.1"
status: "accepted"
---

# Konzept F22 - Product Shell and Navigation

## Status

Accepted.

F22 definiert die Arbeitsoberflaeche und Navigation. Es ist kein Routing-Plan,
aber verbindlich fuer die Shell- und Navigationsrichtung.

## Zweck

Mappm startet in Arbeit, nicht in Marketing. Nutzerinnen sollen direkt Eingang,
Vorgaenge, Dokumente, Aufgaben, Suche oder Profile erreichen.

Detailkonzept:

- `CONCEPT_F33_SHELL_NAVIGATION_AND_WORKSPACE_LAYOUT.md` ist die
  build-relevante Detail-Spezifikation fuer Desktop/Mobile Shell,
  Hauptbereiche, Navigation Controls, responsive Verhalten und Privacy-Regeln
  der Shell.

## Subkonzept F22.1 - Product Shell

Quelle: `docs/design-system/Mock/pages/product-shell.html`.

Desktop-Shell:

- Linke Navigation.
- Topbar mit Brand, globalem Kontext und Status-/Aktionselementen.
- Hauptbereich fuer Arbeitskontext.
- Optionales rechtes Panel fuer Preview, Details oder Metadaten.

Mobile-Shell:

- Capture-first.
- Scan/Foto/Upload schnell erreichbar.
- Review und Zuordnung reduziert, keine mobile Vollverwaltung im ersten Slice.

Privacy-Regel:

- Keine sensiblen Dokumentdetails in globaler Shell-Chrome oder permanenten
  Bannern.
- Shell-Status darf Queue, Sync, Backup, Konflikt anzeigen, aber nicht
  Dokumentinhalt oder OCR-Text.

## Subkonzept F22.2 - Primary Navigation

Arbeitsbereiche:

| Bereich | Zweck |
|---|---|
| Eingang | Draft Inbox, mobile Uploads, Importqueue, letzte Korrekturen. |
| Vorgaenge | Case-/Subcase-Arbeit, Zusammenhaenge, Dokumentgruppen. |
| Dokumente | Dokumentliste, Records, Nachweise, Sucheinstieg. |
| Aufgaben | To-dos, Fristen, Reminder, offene Aktionen. |
| Suche | Cross-cutting Suche nach Dokumenten, Vorgaengen, Facts. |
| Profile | Haushalt, Personen, verwaltete Profile, spaetere Zugriffe. |

Regeln:

- Navigation fuehrt zu Arbeitskontexten, nicht zu Feature-Marketing.
- Navigation zeigt Counts nur dort, wo Handlungsbedarf entsteht.
- Aktive Bereiche muessen textlich und visuell erkennbar sein.
- Badges duerfen keine sensiblen Details transportieren.

## Subkonzept F22.3 - Navigation Controls

Quelle: `docs/design-system/Mock/pages/component-navigation.html`.

Controls:

| Control | Verwendung |
|---|---|
| Sidebar Item | Hauptnavigation. |
| FilterTab | Listen-Filter mit Count, z. B. Entwuerfe/Zuletzt/Konflikte. |
| Segment | Moduswechsel, wenn Auswahl fachlich relevant ist. |
| Breadcrumb | Vorgang/Subvorgang/Dokument-Hierarchie. |
| Command Row | Kontextnahe Aktionen wie Oeffnen, Exportieren, Drucken. |

Flutter-Referenz:

- Existing `FilterTab`-Sprache darf weitergefuehrt werden: 24px Pill,
  Count-Badge, Coral-Aktivzustand, dezenter Shadow.
- Mobile-Inbox-Chips koennen kompakter sein, bleiben aber semantisch verwandt.

## Subkonzept F22.4 - Responsive Behavior

Regeln:

- Desktop priorisiert paralleles Arbeiten: Liste, Preview, Metadaten.
- Mobile priorisiert Capture und kurze Korrektur.
- Keine Komponente darf nur durch Hover benutzbar sein.
- Lange deutsche Labels muessen umbrechen oder kuerzer formuliert werden.
- Navigation und Aktionsleisten duerfen bei kleinen Breiten nicht ueberlappen.

## Definition of Done

F22 ist umgesetzt, wenn:

- App Shell fuer Desktop und Mobile geplant und getestet ist.
- Hauptnavigation stabile Bereiche und Counts hat.
- FilterTabs, Segments, Breadcrumbs und Command Rows klare Einsatzregeln haben.
- Privacy-Regeln fuer Shell-Status eingehalten werden.
- Responsive Screenshots oder visuelle Tests Desktop und Mobile abdecken.

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
