---
title: "Konzept F30 - Form Facts, Layouts and Assisted Review"
description: "Mappm Detailkonzept fuer numerische Facts, Betragsfelder, Slider, Stepper, Color Picker, Readonly-Werte, Assisted Review Suggestions, Layouts und Edge States"
tags: [concept, frontend, design-system, forms, facts, assisted-review, layout, validation, flutter]
lastUpdated: "2026-07-15"
version: "1.1"
status: "accepted"
owner: "ui-concept"
---

# Konzept F30 - Form Facts, Layouts and Assisted Review

## Status

Accepted.

F30 ist ein Detailkonzept unter F24. Es beschreibt die Form-Flaechen, die in
Mappm aus Dokumenten strukturierte Facts, Entscheidungen und spaeter
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

Mappm soll nicht nur Dateien ablegen, sondern Ausgaben, Erstattungen,
Gueltigkeiten, Aufgaben und Beziehungen auswertbar machen. Deshalb brauchen
Formulare eine saubere Fact-Sprache.

## Fact Field Principles

- Facts sind typisiert, nicht nur Text.
- Backend/Core Assist schlaegt Facts im Commercial Core automatisch vor; die
  manuelle Eingabe ist Korrektur/Fallback, nicht der normale Erfassungsweg.
- Optional heisst nicht beliebig: Felder koennen fuer Auswertungen wichtig
  sein, aber Review nicht blockieren.
- Automatische Vorschlaege bleiben bis zur aktiven Review-/Automatisierungsreife
  von bestaetigten Werten getrennt.

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
- keine Status- oder Dokumentgrundart-Farben ohne Design-System-Freigabe.

Regeln:

- Mappm nutzt Token-Farben, keinen freien Farbraum.
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

- Dokument-, Case- und Record-Titel (verpflichtender Backend-/Assist-Vorschlag).
- Dokumentgrundart/semantische Variante.
- betroffene Person.
- Betrag.
- Datum.
- Anbieter.
- Tags/Kategorien.
- Relation zu Vorgang/Polizze.
- primaerer Case/Record, weitere Cases/Claims, Workflow/Slot und naechste Aktion.

Regeln:

- Jeder Vorschlag zeigt Quelle/Confidence nur, wenn es hilfreich und sicher ist.
- Nutzer hat mindestens Accept und Edit/Korrigieren oder Pruefen.
- Ablehnen ist verfuegbar, wenn der Vorschlag aus Datenmodell entfernt werden
  muss.
- Vorschlaege duerfen keine Pflichtentscheidung still ersetzen.
- OCR-/AI-Rohdaten bleiben im Detailkontext, nicht in globalen Meldungen.
- Eine Bestaetigung akzeptiert nur sichtbare Folgen, keine versteckten Facts.
- Bereits bestaetigte implizite Fakten werden nicht wiederholt, ausser sie
  widersprechen dem neuen Dokument oder aendern Folgen.
- Niedrige Confidence zeigt weiterhin beste Kandidaten; fuer Case-Routing steht
  der neue Case zuerst und bestehende Auswahl bleibt erreichbar.

## Form Layouts

### Assisted Capture Review

Zweck:

- vorbereiteten Backend-/Assist-Vorschlag pruefen.
- primaeren Case-/Record-Kontext und relevante Folgen bestaetigen/korrigieren.
- Review abschliessen oder spaeter korrigieren.

Muss enthalten:

- Dokument/Scan-Referenz und vorgeschlagener Titel.
- vorgeschlagener primaerer Case oder Record.
- betroffene Person nur, wenn neu, mehrdeutig oder folgenreich.
- wesentliche Unsicherheit, Folgeaktion oder weitere Beziehung.
- klare Hauptaktion nach F26.

Nicht standardmaessig enthalten sind alle extrahierten Facts, technische Rollen,
Workflow-Keys oder ein generisches Metadatenformular. Batch-Review darf sichtbar
gruppierte Ergebnisse gemeinsam bestaetigen, ohne verdeckte Zuordnungen zu
uebernehmen. Konkrete Layouts/Gesten bleiben offen.

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

- Managed-Cloud-/Intelligence-Verarbeitung innerhalb des akzeptierten Trust-Modells.
- Account und autorisierte Geraete.
- Vault-Autoritaet, lokale Verfuegbarkeit, Migration und Recovery.
- Diagnose.

Regeln:

- technische IDs nur im Diagnosekontext.
- keine sensiblen Dokumentdetails.

### Konflikt

Zweck:

- Sync-/Review-Konflikt aufloesen.

Die erlaubten Optionen kommen aus dem akzeptierten Konfliktvertrag. Die UI darf
nicht pauschal `lokal behalten`, `andere Version` oder `mergen` anbieten, wenn
eine dieser Aktionen fuer den konkreten Vault-/Revisionstyp ungueltig ist.

Regeln:

- Konflikte erscheinen im Dashboard nur als Handlungsbedarf.
- Detailseite zeigt Unterschiede.

### Export

Zweck:

- Einzeldokument herunterladen.
- Vorgang als ZIP herunterladen.
- Nutzer entscheidet manuell, wie er weitergibt.

Regeln:

- Account-zu-Account-Sharing ist ein spaeterer eigener, sicherheitsgepruefter
  Produktflow und wird nicht durch den einfachen Export impliziert.
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
| Processing | darf Sekunden/Minuten dauern; App bleibt navigierbar und Zustand ueberlebt Neustart. |
| Partial Batch | erfolgreiche Dokumente bleiben nutzbar, fehlerhafte/outlier bleiben gezielt offen. |

## Flutter Handoff

Implementation soll:

- Facts als typisierte Value Objects und Presentation-Modelle behandeln; Remote
  DTOs bleiben im Data Layer.
- Form-State von Persistenz trennen.
- Suggestions als eigene Modelle mit Status fuehren.
- Edge States im Component-Level testbar machen.
- Layouts responsive komponieren, nicht pro Screen neu stylen.

## Tests

Mindestens:

- Amount Parsing/Formatting.
- Calculated Readonly aus Quellwerten.
- Suggestion Accept/Edit/Reject.
- verpflichtender Backend-/Assist-Titelvorschlag und Schutz bestaetigter Titel.
- Review Gate mit fehlendem primaerem Case-/Record-Kontext oder hartem Konflikt.
- sichtbare-only Bestaetigung und gemischter Batch.
- Export Layout mit mehreren Profilen.
- Edge States: loading, empty, stale, offline, permission, autosave.

## Acceptance Criteria

- [ ] Betrag, Waehrung, Prozent, Unit und berechnete Werte sind getrennt
      geregelt.
- [ ] Assisted Review ist als Nutzerentscheidung dokumentiert.
- [ ] Titel werden fuer Dokument/Case/Record automatisch vorgeschlagen und nicht
      durch leere Pflichtfelder ersetzt.
- [ ] Review, Profile, Aufgabe, Settings, Konflikt und Export haben
      Layoutregeln.
- [ ] Aufgaben/Facts koennen ohne Dokument existieren, aber Relationen nutzen.
- [ ] Edge States sind fuer Flutter pruefbar.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Eigener Scope und
Status bleiben massgeblich. Der gemeinsame Vertrag liefert die verbindlichen
Defaults fuer Ownership, Security/Privacy, Accessibility/Lokalisierung,
Verifikation, Stop Rules und Handoff, soweit dieses Dokument keine strengere
Regel definiert. Ein Widerspruch stoppt die betroffene Phase und wird in diesem
Konzept aufgeloest.
