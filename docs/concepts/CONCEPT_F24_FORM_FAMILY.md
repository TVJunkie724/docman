---
title: "Konzept F24 - Form Family"
description: "Draft-Konzept fuer die noch auszuarbeitende Mappm Form Family, inklusive Feldfamilien, Validierung, Review, Suggestions und Accessibility"
tags: [concept, frontend, design-system, forms, validation, review, accessibility, draft]
lastUpdated: "2026-07-12"
version: "0.6"
status: "draft"
---

# Konzept F24 - Form Family

## Status

Draft.

Die aktuelle Mock-Seite `component-forms.html` ist als Form-Family-Workbench
ausgearbeitet. F24 bleibt trotzdem `draft`, bis die Form Family visuell
reviewt, gegen echte Flutter-Zielkomponenten geplant und in einem
UI-Architekturplan freigegeben wurde.

Einzelne Detailkonzepte unterhalb von F24 duerfen bereits `accepted` sein,
wenn ihr Slice vollstaendig beschrieben und gegen den Mock abgeglichen wurde.
Diese akzeptierten Detailkonzepte sind fuer ihren Scope build-relevant, auch
solange F24 als Umbrella noch `draft` bleibt.

## Zweck

Mappm braucht eine ausgereifte Form Family, weil Dokumentreview, Profilpflege,
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

Interaktive Review-Quelle:
`docs/design-system/Mock/pages/component-form-interactions.html`.

Der Mock zeigt aktuell:

- Field Anatomy.
- Required Policy.
- Field Catalog.
- Control Catalog fuer Text, Long Text, Amount/Currency, URL, Search/Typeahead
  und Secrets.
- Picker Catalog fuer Dropdown, Combobox, Multi Select, Multi Select Dropdown,
  Person Picker und Relation Picker.
- Date and Time Pickers fuer Date, Date Range, Time, Time Range, Recurrence und
  Reminder Offset.
- File, Scan and Media Inputs fuer File Picker, Dropzone, Scan Mode, Image
  Quality, Upload Queue und Berechtigungen.
- Selection, Boolean and Action Controls fuer Radio Buttons, Checkbox Buttons,
  Switches, Segmented Controls, Command Rows und Disclosure.
- Numeric, Range and Color Controls fuer Stepper, Slider, Unit Inputs,
  berechnete Readonly-Werte, Thresholds und tokenbasierte Color Picker.
- Validation States.
- Assisted Review Suggestions.
- Form Layouts fuer Draft Review, Profile, Tasks, Settings, Konflikte und Export.
- Mobile Capture Minimal Form.
- Quality Gates.
- Interaktive Varianten fuer Dropdown, Combobox, Multi Select Dropdown,
  Date Picker, Date Range Picker, Time Picker, File Picker, Sensitive Reveal
  und Mobile Bottom Sheets.

Das ist eine belastbare visuelle Grundlage, aber noch kein Flutter-
Implementierungsplan.

## Beziehung zu F14

`CONCEPT_F14_FORM_FIELD_CATALOG.md` definiert fachliche Feldfamilien.

F24 muss daraus die visuelle und interaktive Form Family ableiten:

- Field anatomy.
- Label/Helper/Error/Hint.
- Input types.
- Selection controls.
- Date, Amount, Percentage.
- Date Range, Time und Time Range.
- Person/Profile picker.
- Document type picker.
- Relation picker fuer Dokumente, Vorgange und Profile.
- File Picker, Scan Mode und Upload Queue.
- Tags.
- Review suggestion fields.
- Sensitive fields.
- Readonly technical fields.

Detailkonzepte:

- `CONCEPT_F27_FORM_FIELD_ANATOMY_VALIDATION.md` definiert Field Anatomy,
  Required Policy, Validation States, Review Gates und privacy-safe Form
  Feedback.
- `CONCEPT_F28_FORM_PICKERS_AND_SELECTION_CONTROLS.md` definiert Dropdowns,
  Comboboxes, Multi-Select, Person-/Relation-Picker, Radio-/Checkbox-Buttons,
  Switches, Segments, Command Rows und Disclosure.
- `CONCEPT_F29_FORM_DATE_TIME_FILE_SCAN_CONTROLS.md` definiert Date/Time,
  Recurrence, Reminder, File Picker, Scan Mode, Upload Queue und Permissions.
- `CONCEPT_F30_FORM_FACTS_LAYOUTS_AND_ASSISTED_REVIEW.md` definiert
  numerische Facts, Assisted Review, Layouts und Enterprise Edge States.

Tag-Farbregel:

- normale Tags nutzen neutrale Surface/Line-Farben.
- ausgewaehlte oder aktive Tags nutzen Petrol Mist/Petrol.
- Warn-/Review-nahe Tags duerfen Amber nutzen.
- Coral/Rose bleibt fuer Capture, Brand-Akzent und wichtige Aktionen, nicht fuer
  normale Tags.

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

Im Mock festgelegt:

- Required Marker textlich sichtbar.
- Helper, Error, Success und Review-Texte als eigene Zeilen.
- Sensitive, Readonly, Disabled, Focused, Warning und Success States.
- Choice Cards fuer Picker-nahe Auswahlen.
- Suggestion Cards mit Accept/Edit/Reject.

Offen fuer den UI-Architekturplan:

- Fehlerposition bei dichten Desktop-Layouts.
- Mobile-Sheet-Verhalten fuer komplexe Picker.
- konkrete Flutter Widget-Namen, Provider und Test-Harness.

## Subkonzept F24.1a - Control Catalog

Die Form Family muss mindestens folgende Grundkontrollen besitzen:

| Control | Einsatz |
|---|---|
| Single Line Text | Titel, Aktenzeichen, kurze Metadaten. |
| Long Text | Notizen, Korrekturhinweise, interne Kommentare. |
| Amount/Currency | Rechnungen, Erstattungen, laufende Kosten. |
| Unit Input | MB, Tage, Stunden, Prozent, Seitenzahl. |
| Email/URL | Account- oder externe App-/Portal-Links. |
| Search/Typeahead | Anbieter, Versicherungen, bestehende Unterlagen. |
| Secret/Sensitive | Pairing Code, Versicherungsnummern, geschuetzte Werte. |

Regel:

Controls duerfen fachliche Bedeutung nicht nur ueber Farbe zeigen. Label,
Helper, Value und Fehlertext muessen auch ohne Farbe verstaendlich sein.

## Subkonzept F24.1b - Picker Catalog

Picker sind eine eigene Familie, nicht nur dekorierte Textfelder.

Pflicht-Picker:

- Dropdown fuer kleine, stabile Optionslisten.
- Combobox fuer Freitext plus Vorschlaege.
- Multi Select fuer sichtbare Mehrfachwerte.
- Multi Select Dropdown fuer viele Mehrfachwerte.
- Person/Profile Picker als Pflichtfeld im Review.
- Relation Picker fuer Dokumente, Vorgange, Untervorgaenge, Profile und
  Policen.

Picker brauchen:

- Suchbarkeit bei langen Listen.
- leeren Zustand.
- kein Ergebnis Zustand.
- Ladezustand bei spaeteren Remote-/Sync-Quellen.
- Konflikt-/Deleted-Referenz-Zustand.
- Tastaturbedienung.
- Mobile Bottom-Sheet oder Fullscreen-Variante fuer komplexe Auswahl.
- neutrale Leading Marker oder echte Icons; keine Buchstaben-Initialen als
  Platzhalter-Icons.

Interaktionsentscheidung:

| Kontext | Standard |
|---|---|
| Desktop Formular | feldnahes Popover. |
| Desktop lange Liste | searchable Popover oder groesseres Picker Panel. |
| Desktop Date Range | breiteres Popover mit Start/Ende-Zusammenfassung. |
| Mobile Formular | Bottom Sheet oder Fullscreen Sheet. |
| Mobile komplexe Liste | searchable Fullscreen Sheet. |
| Inline Picker | nur fuer Kalender-, Planungs- oder Auswertungsflaechen. |

Diese Entscheidung ist im Interaktionsmock visuell pruefbar.

## Subkonzept F24.1c - Date, Time and Schedule Controls

Zeitbezogene Felder sind fuer Mappm zentral:

- Dokumentdatum.
- Faelligkeit.
- Vertragslaufzeit.
- Gueltigkeit offizieller Nachweise.
- Erinnerungen.
- Termine.
- wiederkehrende Kosten und Aufgaben.

Die Form Family braucht:

- Date Picker.
- Date Range Picker.
- Time Picker.
- Time Range Picker.
- Recurrence Picker.
- Reminder Offset Picker.

Regeln:

- Exakte Werte muessen textlich editierbar/korrigierbar bleiben.
- Wiederkehrende Regeln muessen als lesbarer Satz zusammengefasst werden.
- Zeitzonen duerfen technische Details nicht in globale UI-Meldungen leaken.
- Date/Time in normalen Formularen oeffnet einen Picker statt dauerhaft inline
  Platz zu belegen.
- Inline-Kalender sind fuer Fokusflaechen erlaubt, z. B. Terminplanung,
  Auswertungszeitraeume oder Kalenderansichten.

## Subkonzept F24.1d - File, Scan and Media Inputs

Dokumentaufnahme ist kein normales Textfeld.

Die Form Family braucht:

- File Picker.
- Dropzone fuer Desktop Import.
- Mobile Scan Mode Auswahl.
- Datei-/Medienliste mit Ersetzen/Entfernen.
- Bilddatei vs PDF Entscheidung.
- Mehrseitiger Scan Zustand.
- Upload Queue Zustand.
- Berechtigungs- und Retry-Zustand.

Regel:

Dokumente sind sensible Daten. Datei- und Scan-Controls duerfen Dateinamen,
Preview, OCR-Text oder Dokumentdetails nicht in globale Meldungen, technische
Logs oder Shell-Chrome tragen.

## Subkonzept F24.1e - Selection and Boolean Controls

Auswahlmuster muessen nach Bedeutung getrennt bleiben:

- Radio Buttons fuer genau eine Wahl.
- Checkbox Buttons fuer mehrere gleichwertige Optionen.
- Switches fuer stabile Ein/Aus Einstellungen.
- Segmented Controls fuer kurzfristige Moduswechsel.
- Command Rows fuer Formularaktionen.
- Disclosure fuer optionale Details.

Regeln:

- Switches nicht fuer irreversible oder fachlich schwere Entscheidungen.
- Segmented Controls nicht als Seiten-Navigation verwenden.
- Destruktive Aktionen getrennt von Primaeraktionen platzieren.

## Subkonzept F24.1f - Numeric, Range and Color Controls

Numerische Controls brauchen klare Grenzen:

- Amount/Currency fuer Geld.
- Unit Input fuer technische oder zeitliche Einheiten.
- Stepper fuer kleine ganze Zahlen.
- Slider nur fuer ungefaehre Werte.
- Readonly Calculated fuer abgeleitete Werte.
- Threshold Controls fuer Erinnerungen und Warnungen.
- Color Picker nur fuer erlaubte Token, nicht fuer freie Produktfarben.

Regel:

Exakte fachliche Werte duerfen nicht nur ueber Slider gesetzt werden.
Finanzwerte, Fristen und Erstattungen brauchen praezise Eingabe und lesbare
Formatierung.

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
| loading | Optionen oder Vorschlaege werden geladen. |
| empty | keine Werte oder keine Suchtreffer. |
| permission blocked | Kamera, Datei oder Secure Storage nicht erlaubt. |
| offline queued | Eingabe ist lokal gespeichert, Sync/Upload wartet. |
| stale reference | verknuepftes Ziel wurde geloescht oder ist nicht verfuegbar. |

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

Im Mock angelegt:

- Draft Review Form.
- Profil bearbeiten.
- Task/Reminder erstellen.
- Settings.
- Export-Dialog.
- Conflict Resolution.
- Mobile Capture Minimal Form.

In spaeteren konkreten UI-Architekturplaenen zu vertiefen:

- Vorgang erstellen/bearbeiten als eigener Screen.
- Dokument-Metadaten im Zusammenspiel mit Preview.
- vollstaendige Profilverwaltung mit Login-/Verwaltungsgrenze.
- Settings-Unterseiten fuer Mappm Account, Vault, Assist, Storage/Cache,
  Export/Migration/Detached Recovery und Diagnose.
- Export-Dialog im Zusammenspiel mit lokaler Datei-/ZIP-Erzeugung.

## Subkonzept F24.5 - Quality Gates

Vor Implementierung muss die Form Family beantworten:

- Wie sehen lange deutsche Labels aus?
- Wie verhalten sich Fehler bei kleiner Breite?
- Wie funktioniert Tastaturbedienung?
- Wie sind Picker testbar?
- Wie werden Dropdown, Combobox, Multi Select und Multi Select Dropdown
  unterschieden?
- Wie verhalten sich Date/Time Picker auf Desktop und Mobile?
- Wie funktionieren File Picker, Dropzone und Mobile Scan in Local und Cloud Vault inklusive Offline-/Pending-State?
- Welche Selection Controls sind fuer Modus, Auswahl, Setting und Aktion
  erlaubt?
- Welche Numeric Controls duerfen exakte Werte setzen und welche nur ungefaehre?
- Wo sind Color Picker erlaubt, und welche Token duerfen gewaehlt werden?
- Welche Felder duerfen sensible Werte maskieren?
- Welche Felder sind Pflicht fuer Review-Abschluss?
- Welche Felder bleiben optional bis Assisted Review?

## Definition of Done

F24 wird erst auf `accepted` gesetzt, wenn:

- Form Anatomy visuell reviewt und akzeptiert ist.
- Control, Picker, Date/Time, File/Scan, Selection, Numeric und Color Families
  visuell reviewt und akzeptiert sind.
- die interaktiven Picker-Varianten fuer Desktop Popover, Mobile Sheet und
  Inline-Fokusflaechen reviewt und entschieden sind.
- mindestens Draft Review, Dokument-Metadaten, Profil, Settings und Task Form
  beschrieben sind.
- alle Validation States visuell und fachlich definiert sind.
- Desktop und Mobile Varianten vorhanden sind.
- Tests und Accessibility-Gates beschrieben sind.
- ein UI-Architekturplan konkrete Flutter-Komponenten, Riverpod-State-Grenzen
  und Teststrategie daraus ableitet.

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
