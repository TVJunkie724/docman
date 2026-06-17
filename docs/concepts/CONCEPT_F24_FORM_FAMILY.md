---
title: "Konzept F24 - Form Family"
description: "Draft-Konzept fuer die noch auszuarbeitende Ordna Form Family, inklusive Feldfamilien, Validierung, Review, Suggestions und Accessibility"
tags: [concept, frontend, design-system, forms, validation, review, accessibility, draft]
lastUpdated: "2026-06-17"
version: "0.1"
status: "draft"
---

# Konzept F24 - Form Family

## Status

Draft.

Die aktuelle Mock-Seite `component-forms.html` ist bewusst noch zu knapp. F24
ist daher kein freigegebenes Implementierungskonzept, sondern der saubere
Arbeitsrahmen fuer die naechste Design-System-Vertiefung.

## Zweck

Ordna braucht eine ausgereifte Form Family, weil Dokumentreview, Profilpflege,
Vorgangsbearbeitung, Faktenkorrektur, Tasks, Settings und spaetere OCR-/AI-
Vorschlaege alle ueber Formulare laufen.

Forms duerfen nicht als Sammlung einzelner Inputs entstehen. Sie brauchen:

- klare Feldfamilien.
- Pflicht-/Optional-Logik.
- Validation- und Review-Zustaende.
- Suggestions und menschliche Bestaetigung.
- Privacy- und Redaction-Regeln.
- Desktop- und Mobile-Verhalten.
- Tests fuer lange deutsche Labels und Fehlermeldungen.

## Aktuelle Quelle

Quelle: `docs/design-system/Mock/pages/component-forms.html`.

Der Mock zeigt aktuell nur:

- Pflichtfeldidee.
- betroffene Person als Pflichtfeld.
- Dokumenttyp.
- einfache Feldzustaende.

Das ist nicht genug fuer Production Readiness.

## Beziehung zu F14

`CONCEPT_F14_FORM_FIELD_CATALOG.md` definiert fachliche Feldfamilien.

F24 muss daraus die visuelle und interaktive Form Family ableiten:

- Field anatomy.
- Label/Helper/Error/Hint.
- Input types.
- Selection controls.
- Date, Amount, Percentage.
- Person/Profile picker.
- Document type picker.
- Tags.
- Review suggestion fields.
- Sensitive fields.
- Readonly technical fields.

## Subkonzept F24.1 - Field Anatomy

Jedes Feld braucht:

- Label.
- optionalen Required Marker.
- Control.
- Helper Text.
- Error Text.
- Review/Suggestion Zustand, falls relevant.
- Privacy/Sensitive Marker, falls relevant.
- Accessibility Label und Semantik.

Offen:

- genaue Required-Markierung.
- Fehlerposition bei dichten Desktop-Layouts.
- Mobile-Sheet-Verhalten fuer komplexe Picker.

## Subkonzept F24.2 - Validation States

Form States:

| State | Bedeutung |
|---|---|
| default | Eingabebereit. |
| focused | Tastatur-/Pointer-Fokus sichtbar. |
| dirty | geaendert, noch nicht gespeichert. |
| saving | persistiert gerade. |
| saved | bestaetigt. |
| required missing | blockiert Abschluss. |
| format invalid | Wert passt nicht zum Feldtyp. |
| review needed | Vorschlag muss bestaetigt/korrigiert werden. |
| conflict | widerspruechliche Daten oder Sync-Konflikt. |
| readonly | nicht direkt editierbar. |
| sensitive | Anzeige/Export/Logging besonders schuetzen. |

## Subkonzept F24.3 - Review and Suggestions

Spaetere Assisted Review braucht Vorschlagsfelder:

- vorgeschlagener Wert.
- Quelle oder Hinweis.
- Confidence nur, wenn verstaendlich nutzbar.
- akzeptieren.
- korrigieren.
- ablehnen.

Regel:

Keine fachlich relevante automatische Uebernahme ohne menschliche Bestaetigung.

## Subkonzept F24.4 - Form Layouts

Zu planen:

- Draft Review Form.
- Vorgang erstellen/bearbeiten.
- Dokument-Metadaten.
- Profil bearbeiten.
- Task/Reminder erstellen.
- Settings.
- Export-Dialog.
- Conflict Resolution.
- Mobile Capture Minimal Form.

## Subkonzept F24.5 - Quality Gates

Vor Implementierung muss die Form Family beantworten:

- Wie sehen lange deutsche Labels aus?
- Wie verhalten sich Fehler bei kleiner Breite?
- Wie funktioniert Tastaturbedienung?
- Wie sind Picker testbar?
- Welche Felder duerfen sensible Werte maskieren?
- Welche Felder sind Pflicht fuer Review-Abschluss?
- Welche Felder bleiben optional bis Assisted Review?

## Definition of Done

F24 wird erst auf `accepted` gesetzt, wenn:

- Form Anatomy visuell finalisiert ist.
- mindestens Draft Review, Dokument-Metadaten, Profil, Settings und Task Form
  beschrieben sind.
- alle Validation States visuell und fachlich definiert sind.
- Desktop und Mobile Varianten vorhanden sind.
- Tests und Accessibility-Gates beschrieben sind.

