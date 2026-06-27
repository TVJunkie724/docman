---
title: "Konzept F30 - Form Facts, Layouts and Assisted Review"
description: "Ordna Detailkonzept fuer numerische Facts, Betragsfelder, Slider, Stepper, Color Picker, Readonly-Werte, Assisted Review Suggestions, Layouts und Edge States"
tags: [concept, frontend, design-system, forms, facts, assisted-review, layout, validation, flutter]
lastUpdated: "2026-06-22"
version: "1.0"
status: "accepted"
---

# Konzept F30 - Form Facts, Layouts and Assisted Review

## Status

Accepted.

F30 ist ein Detailkonzept unter F24. Es beschreibt die Form-Flaechen, die in
Ordna aus Dokumenten strukturierte Facts, Entscheidungen und spaeter
OCR/AI-Vorschlaege machen.

## Quellen

| Quelle | Rolle |
|---|---|
| `docs/design-system/Mock/pages/component-forms.html` | Numeric-, Suggestion-, Layout- und Edge-State-Katalog. |
| F14 | Form Field Catalog. |
| F24 | Form Family Umbrella. |
| F27 | Field Anatomy and Validation. |
| F28 | Selection Controls. |
| F29 | Date/File/Scan Controls. |

## Zweck

Ordna soll nicht nur Dateien ablegen, sondern Ausgaben, Erstattungen,
Gueltigkeiten, Aufgaben und Beziehungen auswertbar machen. Deshalb brauchen
Formulare eine saubere Fact-Sprache.

## Fact Field Principles

- Facts sind typisiert, nicht nur Text.
- Fact-Felder koennen manuell gesetzt, spaeter automatisch vorgeschlagen und
  danach vom Nutzer bestaetigt werden.
- Optional heisst nicht beliebig: Felder koennen fuer Auswertungen wichtig
  sein, aber Review nicht blockieren.
- Automatische Vorschlaege bleiben Entscheidungen.

## Amount / Currency

Verwendung:

- Rechnungssumme.
- Erstattungsbetrag.
- laufende Kosten.
- Versicherungsbeitrag.
- Ausgabenaggregation.

Regeln:

- Betrag und Waehrung sind getrennte strukturierte Werte.
- Anzeige fuer deutschsprachige UI: `128,40 EUR`.
- Eingabe darf Dezimaltrennzeichen tolerant behandeln.
- Negative Betraege nur, wenn fachlich erlaubt.
- Erstattung und Zahlung sind getrennte Facts.

## Number Stepper

Verwendung:

- Seitenanzahl.
- Prozent-/Anzahlwerte in engem Bereich.
- Wiederholungen, wenn Presets nicht reichen.

Regeln:

- Stepper ist fuer kleine kontrollierte Werte, nicht fuer freie Geldbetraege.
- Min/Max sichtbar oder ableitbar.
- Buttons bleiben touchbar.

## Slider

Verwendung:

- Qualitaets-/Confidence-Schwellen.
- seltene Settings, bei denen Exaktheit weniger wichtig ist.

Regeln:

- Slider nie fuer Geld, Fristen oder Pflichtfacts.
- Aktueller Wert ist textlich sichtbar.
- Slider darf nicht einzige Eingabe fuer exakte Werte sein.

## Color Picker

Verwendung:

- spaetere nutzerdefinierte Labels/Listen, falls wirklich benoetigt.
- keine Status- oder Dokumenttyp-Farben ohne Design-System-Freigabe.

Regeln:

- Ordna nutzt Token-Farben, keinen freien Farbraum.
- Color Picker ist fuer produktive Kernflows nicht vorgesehen.
- Wenn gebraucht, dann Auswahl aus genehmigten Token-Swatches.

## Unit Input

Verwendung:

- Prozent.
- Kilometer.
- Mengen/Einheiten in Spezialfaellen.

Regeln:

- Einheit ist sichtbar.
- Einheit ist nicht Teil des freien Texts.
- Domain prueft, ob Einheit fuer den Facttyp erlaubt ist.

## Calculated Readonly

Verwendung:

- offene Erstattung.
- berechnete Quote.
- Summe aus Dokumenten.
- Sync/Checksum/technische Werte im Diagnosekontext.

Regeln:

- Readonly ist sichtbar anders als Disabled.
- Warum ein Wert readonly ist, muss erklaerbar sein.
- Nutzer darf berechnete Werte nicht direkt editieren, sondern die Quellen.

## Threshold

Verwendung:

- Reminder-Schwelle.
- Confidence/Review-Schwelle.
- Validierungsgrenze.

Regeln:

- Thresholds sind Settings, nicht Dokumentfacts.
- Standardwerte muessen dokumentiert sein.
- Veraenderung braucht klare Auswirkung.

## Assisted Review Suggestions

Vorschlagstypen:

- Dokumenttyp.
- betroffene Person.
- Betrag.
- Datum.
- Anbieter.
- Tags/Kategorien.
- Relation zu Vorgang/Polizze.

Regeln:

- Jeder Vorschlag zeigt Quelle/Confidence nur, wenn es hilfreich und sicher ist.
- Nutzer hat mindestens Accept und Edit/Korrigieren oder Pruefen.
- Ablehnen ist verfuegbar, wenn der Vorschlag aus Datenmodell entfernt werden
  muss.
- Vorschlaege duerden keine Pflichtentscheidung still ersetzen.
- OCR-/AI-Rohdaten bleiben im Detailkontext, nicht in globalen Meldungen.

## Form Layouts

### Draft Review

Zweck:

- Eingangsdokument pruefen.
- Pflichtfelder setzen.
- Review abschliessen oder spaeter korrigieren.

Muss enthalten:

- Dokument/Scan-Referenz.
- betroffene Person.
- Dokumenttyp.
- optional Vorgang/Relation.
- klare Hauptaktion nach F26.

### Profile

Zweck:

- Personen-/Haushaltsdaten pflegen.
- offizielle Dokumente verlinken.
- verwaltetes Profil und Login-Zustand unterscheiden.

Regeln:

- Adresse muss nicht besonders versteckt werden, aber sensible IDs schon.
- Versicherungsinfos koennen mehrere staatliche/private Versicherungen
  enthalten.

### Aufgabe

Zweck:

- Todo, Frist, Anruf, Termin, Zahlung.
- Reminder und betroffene Person/Vorgang verbinden.

Regeln:

- Aufgabe kann ohne Dokument existieren.
- Wenn Dokument/Vorgang vorhanden ist, Relation setzen.

### Settings

Zweck:

- Home Hub.
- Pairing.
- Storage.
- Diagnose.

Regeln:

- technische IDs nur im Diagnosekontext.
- keine sensiblen Dokumentdetails.

### Konflikt

Zweck:

- Sync-/Review-Konflikt aufloesen.

Optionen:

- lokal behalten.
- andere Version.
- manuell mergen.

Regeln:

- Konflikte erscheinen im Dashboard nur als Handlungsbedarf.
- Detailseite zeigt Unterschiede.

### Export

Zweck:

- Einzeldokument herunterladen.
- Vorgang als ZIP herunterladen.
- Nutzer entscheidet manuell, wie er weitergibt.

Regeln:

- Kein externes Sharing im geplanten Flow.
- Einzeldokument ist kein ZIP.
- Export zeigt, ob mehrere Profile betroffen sind.

## Enterprise Edge States

| State | Pflichtverhalten |
|---|---|
| Loading Options | Feld bleibt stabil, zeigt Ladezustand. |
| Empty / No Results | klarer Text plus optional Neu-anlegen/Suche loeschen. |
| Stale Reference | altes Ziel sichtbar, korrigierbar. |
| Offline Draft | lokal gespeichert, Sync wartet. |
| Permission Blocked | naechste Aktion sichtbar. |
| Autosave | ruhig bestaetigen, keine Snackbar-Flut. |

## Flutter Handoff

Implementation soll:

- Facts als typisierte Value Objects/DTOs behandeln.
- Form-State von Persistenz trennen.
- Suggestions als eigene Modelle mit Status fuehren.
- Edge States im Component-Level testbar machen.
- Layouts responsive komponieren, nicht pro Screen neu stylen.

## Tests

Mindestens:

- Amount Parsing/Formatting.
- Calculated Readonly aus Quellwerten.
- Suggestion Accept/Edit/Reject.
- Draft Review Gate mit fehlender Person.
- Export Layout mit mehreren Profilen.
- Edge States: loading, empty, stale, offline, permission, autosave.

## Acceptance Criteria

- [ ] Betrag, Waehrung, Prozent, Unit und berechnete Werte sind getrennt
      geregelt.
- [ ] Assisted Review ist als Nutzerentscheidung dokumentiert.
- [ ] Draft, Profile, Aufgabe, Settings, Konflikt und Export haben Layoutregeln.
- [ ] Aufgaben/Facts koennen ohne Dokument existieren, aber Relationen nutzen.
- [ ] Edge States sind fuer Flutter pruefbar.
