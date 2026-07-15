---
title: "Konzept F27 - Form Field Anatomy and Validation"
description: "Verbindliche Feldanatomie, minimale Review-Gates, Validierungszustaende und privacy-sicheres Formularfeedback"
tags: [concept, frontend, design-system, forms, validation, review, accessibility]
lastUpdated: "2026-07-15"
version: "2.0"
status: "accepted"
owner: "ui-concept"
---

# Konzept F27 - Form Field Anatomy and Validation

## Status und Scope

Akzeptiert. F27 ist die Source of Truth fuer Feldaufbau, Validierung und
Review-Gates. F28 besitzt Auswahlcontrols, F29 Datum/Datei/Scan und F30 Facts,
Layouts sowie Assisted Review. Das Konzept ist kein Screenplan.

## Leitprinzip

Ein Feld erscheint nicht, weil Mappm einen Wert kennt, sondern weil der Nutzer
ihn verstehen, entscheiden oder korrigieren muss. Pflichtinteraktionen bleiben
selten. Backend/Core Assist fuellt Titel, Taxonomie, Fakten und Kontext als
Vorschlag; Formulare sind kein Ersatz fuer automatische Erkennung.

## Feldanatomie

```text
Labelzeile
  sichtbares Label [optionaler Pflicht-/Statushinweis]
Control oder Read-only-Wert
Supporttext: Helper ODER Review ODER Fehler ODER gezielter Erfolg
```

| Teil | Regel |
|---|---|
| Label | immer sichtbar; Placeholder ist kein Label |
| Status/Pflicht | textlich und semantisch, nie nur Farbe |
| Control | stabile Groesse, kein Layoutsprung zwischen Zustaenden |
| Helper | kurze Format-/Kontexthilfe, keine Prozessanleitung |
| Review | Unsicherheit oder Entscheidung, kein automatischer Fehler |
| Fehler | nahe am Feld, handlungsorientiert und privacy-sicher |
| Erfolg | nur bei echtem Nutzen, keine Bestaetigungsflut |

Nur ein Supporttyp dominiert. Fehler hat Vorrang, danach blockierende Review,
danach Helper. Zusaetzliche Details sind progressiv erreichbar.

## Review-Gates

Die Gate-Policy wird pro Phase/Workflow aus fachlichen Konsequenzen abgeleitet.
Fuer den Capture-Kern gilt:

| Bedingung | Gate |
|---|---|
| Original dauerhaft und lesbar | immer erforderlich |
| logische Dokumentgrenze eindeutig | erforderlich oder explizite Grenzpruefung |
| primaerer Case- oder Record-Kontext | vor akzeptiertem Abschluss erforderlich |
| sichtbare folgenreiche Zuordnung/Aktion | User-Bestaetigung bis Automationsfreigabe |
| harter Integritaets-/Revisionskonflikt | blockiert |
| Titel, Typ, Managed Subject, External Party, Facts | nur sichtbar, wenn unsicher, widerspruechlich oder relevant |
| Tags, Notiz und optionale Facts | kein allgemeines Gate |

Der erforderliche Primaerkontext wird normalerweise durch einen kompakten
Vorschlag bestaetigt, nicht durch einen Case-Typ-Picker oder ein
Metadatenformular. Bei sehr geringer Confidence steht ein neuer leichter
Custom Case mit vorgeschlagenem Titel zuerst; vorhandene Cases bleiben ueber
eine bewusste Auswahl erreichbar.

Ein Dokument darf waehrend Capture/Processing/Review pending ohne akzeptierten
Primaerkontext sein. Nach Review ist ein loser Endzustand nicht erlaubt.

## Feldzustaende

| Zustand | Bedeutung | Verhalten |
|---|---|---|
| neutral | editierbar oder pruefbar | normaler Kontrast |
| focused | aktive Eingabe | sichtbarer Fokus ohne Layoutsprung |
| suggested | AI-/Regelvorschlag | als noch nicht bestaetigt erkennbar |
| confirmed | bewusst bestaetigt | ruhig, weiterhin korrigierbar |
| corrected | Vorschlag geaendert | Provenance erhalten, kein Stigma |
| warning/review | Aufmerksamkeit, nicht zwingend Fehler | klare naechste Aktion |
| error/blocking | ungueltig oder Gate fehlt | blockiert nur betroffene Aktion |
| readonly | Wert kommt aus anderer Quelle/Berechnung | lesbar, Edit-Pfad erklaerbar |
| disabled | aktuell nicht verfuegbar | Grund in der Naehe |
| sensitive | geschuetzter Wert | bewusstes lokales Reveal |
| stale/conflict | Referenz oder Revision veraltet | Review statt stillem Fallback |

## Required- und Progressive-Disclosure-Regeln

- `Pflicht` wird nur gezeigt, wenn der Nutzer den Wert wirklich setzen muss.
- Ein bereits sicher vorgeschlagener Wert benoetigt kein zusaetzliches
  Pflichtfeld; die relevante Gesamtbestaetigung kann genuegen.
- Keine Pflichtfelder liegen in geschlossenem Disclosure.
- Implizite unveraenderte Fakten werden nicht erneut angezeigt.
- Mehr Details duerfen Quelle, Confidence, OCR-Kontext und Alternativen zeigen,
  muessen aber sensible Rohdaten schuetzen.
- Ein optionaler Wert wird nicht durch Analyse-/Reportingwuensche zum Gate.

## Read-only, Disabled und Sensitive

Read-only ist lesbar und visuell nicht mit Disabled zu verwechseln. Wenn der
Wert anderswo editierbar ist, zeigt der Kontext den Weg. Disabled Controls
erklaeren die fehlende Voraussetzung und ersetzen keine Validierung.

Sensible Werte wie Ausweis-, Versicherungs-, Gesundheits- oder Finanzdaten
werden ausserhalb aktiver Bearbeitung kontextgerecht maskiert. Reveal ist
bewusst, lokal und semantisch benannt. Inhalte erscheinen nicht in Shell,
globaler Rueckmeldung, Logs oder allgemeinen Supporttexten.

## Layout

- Mobile: eine Spalte; Labels und Supporttext duerfen umbrechen.
- Desktop: mehrere Spalten nur, wenn Bedeutung, Fokusfolge und Fehlernaehe
  erhalten bleiben.
- Formsektionen ordnen Bedeutung und sind keine dekorativen Cards.
- Keine Cards in Cards fuer normale Formflaechen.
- Controls behalten stabile Abmessungen ueber Loading/Error/Review hinweg.
- Textscale `2.0` und lange deutsche Labels erzeugen keinen horizontalen
  Overflow und verdecken keine Aktion.

## Copy und Fehler

Labels sind kurze deutsche Substantive oder Wortgruppen. Nutzertexte enthalten
keine Implementierungsbegriffe wie Backend, DTO oder Exception. Fehler nennen
die naechste Aktion und keine privaten Dokumentdetails. Globale Zusammenfassung
darf die Anzahl offener Punkte nennen, ersetzt aber nie den Feldhinweis.

## Architekturgrenze

Feldkomponenten erhalten Wert, Zustand, Label, Semantics und Callbacks. Sie
importieren keine Repositories, Drift, HTTP-, Datei- oder Secure-Storage-
Implementierungen. Domain-/Use-Case-Validierung wird als typisierter
Presentation-State uebergeben.

## Accessibility

- sichtbares und programmatisches Label.
- Fehler-/Helper-Zuordnung zum Control.
- logische Fokusreihenfolge und sichtbarer Fokus.
- Semantics fuer suggested, confirmed, corrected, disabled, readonly und
  sensitive.
- Fehlerankuedigung ohne wiederholte Screenreader-Flut.
- Pflicht und Status nie nur farblich.

## Tests und Verifikation

- alle Feldzustaende und Supportprioritaeten.
- Capture-Abschluss blockiert bei fehlendem Original, unklarer Grenze,
  primaerem Kontext oder hartem Konflikt.
- sichere Vorschlaege benoetigen kein zusaetzliches Metadatenformular.
- niedrige Confidence, neuer Case, vorhandene Auswahl und Korrektur.
- sensible Werte in globalen Rueckmeldungen/Logs ausgeschlossen.
- Keyboard, Fokus, Semantics, Textscale und Mobile-/Desktop-Overflow.

## Stop Rules

Stop, wenn:

- Person, Typ, Titel oder Case als pauschale manuelle Capture-Pflichtfelder
  erscheinen.
- ein akzeptiertes Dokument ohne primaeren Case/Record endet.
- versteckte Defaults sichtbare Bestaetigung umgehen.
- Suggested und Confirmed visuell/semantisch ununterscheidbar sind.
- ein Feld Datenzugriff oder fachliche Policy selbst implementiert.
- Pflichtfelder hinter Disclosure oder allein ueber Farbe erkennbar sind.

## Handoff

Konkrete Komponentenplanung geht an `ui-architect`, Fehlerstates an
`frontend-error-handling`, Testmatrix an `frontend-test-coverage`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die betroffene Phase stoppt.
