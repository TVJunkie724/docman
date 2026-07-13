---
title: "Konzept F33 - Shell, Navigation and Workspace Layout"
description: "Mappm Detailkonzept fuer Product Shell, Desktop/Mobile Layout, Hauptbereiche, Navigation Controls, Tabs, Segments, Breadcrumbs und Command Rows"
tags: [concept, frontend, design-system, shell, navigation, workspace, responsive, flutter]
lastUpdated: "2026-07-14"
version: "1.0"
status: "accepted"
---

# Konzept F33 - Shell, Navigation and Workspace Layout

## Status

Accepted.

F33 ist das Detailkonzept unter F22. Es beschreibt die Produkt-Shell und
Navigation so, dass spaetere Flutter-Screens dieselbe Arbeitslogik nutzen.

## Quellen

| Quelle | Rolle |
|---|---|
| `docs/design-system/Mock/pages/product-shell.html` | Desktop- und Mobile-Shell. |
| `docs/design-system/Mock/pages/component-navigation.html` | Navigation Controls und Beispiele. |
| F22 | Shell and Navigation Umbrella. |
| F25 | Patterns/A11y/Visual QA. |

## Shell Principle

Mappm startet in Arbeit, nicht in Landingpage oder Marketing.

Die Shell soll:

- direkten Zugang zu Eingang, Vorgaengen, Unterlagen, Aufgaben/Agenda, Suche und
  Profilen geben.
- Status nur zeigen, wenn Handlung noetig ist.
- keine sensiblen Dokumentdetails global sichtbar machen.
- Desktop-Arbeit und Mobile-Capture unterschiedlich optimieren.

## Hauptbereiche

| Bereich | Zweck | Typische Counts |
|---|---|---|
| Eingang | Draft Inbox, Upload Queue, letzte Korrekturen | Entwuerfe, Konflikte |
| Vorgaenge | eigenständige Cases, typisierte Beziehungen, Custom/Guided Workflows | offene Aufgaben, Fristen |
| Unterlagen | Records/Nachweise, aktuelle/historische Dokumentversionen | Filterergebnisse, ablaufende Unterlagen |
| Aufgaben | Todos, Fristen, Reminder | faellig/offen |
| Suche | Cross-cutting Suche | keine dauerhaften Counts |
| Profile | Haushalt, Personen, verwaltete Profile | selten Counts |
| Einstellungen | Mappm Account, Vault, Assist, Speicher/Cache, Export, Recovery, Diagnose | nur bei Problem oder Lifecycle-Aktion |

## Desktop Shell

Struktur:

1. linke Navigation.
2. Topbar mit Brand/Kontext und ruhigen Statusaktionen.
3. Hauptbereich fuer Liste/Workbench.
4. optionales rechtes Panel fuer Preview, Details oder Metadaten.

Regeln:

- Listen und Preview duerfen nebeneinander stehen.
- rechte Panels sind funktional, keine dekorativen Cards.
- globale Shell zeigt keine privaten OCR-/Dokumentinhalte.
- Status wie Sync/Backup/Queue ist technisch knapp und privacy-sicher.

## Mobile Shell

Struktur:

- Capture-first.
- schnelle Aktionen: Scan, Foto, Datei.
- minimale Review-Zuordnung.
- Queue/Erledigt fuer mobile Uploads.

Regeln:

- Mobile ist kein reduzierter Desktop-Klon.
- lange Metadatenarbeit kann spaeter am Desktop stattfinden.
- Pflichtfeld Person/Profil bleibt fachlich sichtbar.
- Navigation darf Content nicht ueberdecken; bei schmalen Viewports klarer
  Stack oder Mobile-Navigation.

## Navigation Controls

### Sidebar Item

Verwendung:

- Hauptnavigation.

Regeln:

- aktive Seite textlich und visuell erkennbar.
- Count-Badge nur fuer Handlungsbedarf.
- keine privaten Details im Badge.

### FilterTab

Verwendung:

- Listenfilter innerhalb eines Arbeitskontexts.
- Beispiel: Entwuerfe, Zuletzt, Konflikte.

Regeln:

- nicht fuer globale Navigation.
- Count optional.
- aktive Tab stabil; Layout springt nicht.

### Segment

Verwendung:

- Moduswechsel im gleichen Formular/Screen.
- Beispiel: Dokument scannen / Foto aufnehmen.

Regeln:

- Segments sind nicht FilterTabs.
- maximal wenige Optionen.
- jede Option klar beschriftet.

### Breadcrumb

Verwendung:

- Vorgang/CaseLink/Unterlage/Dokument-Beziehungen ohne starren Dateibaum.
- Beispiel: Autounfall 2026 / Krankenhaus / Arztbrief.

Regeln:

- Breadcrumb nur, wenn Hierarchie wirklich hilft.
- Mobile kann kuerzen, aber Kontext muss erreichbar bleiben.

### Command Row

Verwendung:

- kontextnahe Aktionen: Exportieren, Drucken, Oeffnen, Retry.

Regeln:

- keine Hauptaktion ersetzen.
- destruktive Aktionen mit F26 Danger-Regeln.
- bei vielen Aktionen Overflow/Menu planen.

## Responsive Rules

- Desktop ab ausreichend Breite: Sidebar + Main + optional Details.
- Tablet/schmal: Sidebar kompakter oder collapsible, Main bleibt primaer.
- Mobile: Bottom/Top-Navigation oder reduzierte AppBar nach Flutter-Plan.
- Kein Menue darf ueber Content liegen.
- Kein horizontaler Scroll fuer Kernflows.
- Text darf umbrechen, aber Buttons und Rows bleiben stabil.

## Privacy Rules

- Shell-Chrome zeigt keine Dokumenttitel, wenn es nicht der aktive Kontext ist.
- globale technische Meldungen enthalten keine Gesundheits-, Versicherungs-,
  Ausweis- oder OCR-Details.
- Schnellzugriff zeigt kurze, bewusst sichtbare Labels, aber keine sensiblen
  Rohdaten.

## Flutter Handoff

Implementation soll:

- Shell als eigene Presentation-Struktur planen.
- Navigation State getrennt von Domain-State halten.
- Counts aus Use Cases/Repositories ueber Provider beziehen.
- responsive Breakpoints zentral definieren.
- Preview/Detail-Panel austauschbar machen.

## Tests

Mindestens:

- Desktop Shell Screenshot mit Sidebar/Main/Preview.
- Mobile Capture Shell Screenshot.
- Navigation Active/Count State.
- Text Scale fuer lange deutsche Bereichsnamen.
- Privacy-Test fuer Shell-Meldungen.

## Acceptance Criteria

- [ ] Product Shell ist fuer Desktop und Mobile getrennt beschrieben.
- [ ] Hauptbereiche und Counts sind definiert.
- [ ] Tabs, Segments, Breadcrumbs und Command Rows sind abgegrenzt.
- [ ] Responsive Verhalten verhindert Menu-Content-Ueberdeckung.
- [ ] Privacy-Regeln fuer Shell-Chrome sind pruefbar.

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
