---
title: "Konzept F14 - Form Field Catalog"
description: "Fachlicher Feldkatalog fuer schlanke Mappm-Formulare, Capture Review, Vault Lifecycle und korrigierbare Assist-Vorschlaege"
tags: [concept, forms, ui, fields, review, documents, cases, assist]
lastUpdated: "2026-07-20"
version: "4.1"
status: "accepted"
owner: "ui-concept"
---

# Konzept F14 - Form Field Catalog

## Status und Zweck

Akzeptiert. F14 definiert, welche fachlichen Feldfamilien Mappm benoetigt. Es
autorisiert weder ein grosses Metadatenformular noch konkrete Widgets. F24 und
F27-F30 besitzen Anatomie, Controls und Interaktionsdetails.

## Produktprinzip

Formulare sind Korrektur-, Entscheidungs- und Ausnahmeflaechen. Beim normalen
Dokumenteingang schlagen Backend/Core Assist Titel, Dokumenttaxonomie, Fakten,
Managed Subject sowie Case-/Record-Kontext vor. Die UI zeigt nur Informationen,
die fuer die aktuelle Entscheidung notwendig, unsicher oder folgenreich sind.

- Implizit unveraenderte Fakten bleiben verborgen oder progressiv erreichbar.
- Ein Case besitzt keinen verpflichtenden sichtbaren `caseType`.
- Der vollstaendige Dokumentkatalog erscheint nicht als Pflicht-Picker.
- Vorschlaege werden bis zur freigegebenen Automationsreife bestaetigt oder
  schnell korrigiert.
- Ein Custom Case ist ein normaler Case und darf nahezu leer beginnen; sein
  Titel wird vorgeschlagen.

## Feldfamilien

| Familie | Beispiele | Regel |
|---|---|---|
| Text | vorgeschlagener Titel, kurze Notiz | Freitext nur bei echtem Bedarf |
| Mehrzeilig | Beschreibung, bewusster Kommentar | nie fuer strukturierbare Kerndaten |
| Datum/Zeit | Ausstellung, Leistung, Frist, Gueltigkeit, Termin | konkrete Semantik, Genauigkeit und Zeitzone statt universellem Dokumentdatum |
| Betrag/Waehrung | Rechnung, Erstattung | getrennte strukturierte Werte |
| Zahl/Einheit | Quote, Menge, Kilometer | nur fachlich erlaubte Einheiten |
| Auswahl | kleine kontextrelevante Alternativen | kein grosser Katalog im Standardflow |
| Managed Subject | Person, Haushalt, eigene Organisation | kein External-Party-Freitext-Ersatz |
| External Party | Arzt, Anbieter, Behoerde | auffindbares Kontakt-/Absenderprofil |
| Relation | Case, Record, Claim, Dokument, Polizze | typisierte Beziehung statt Dateikopie |
| Datei/Scan | Desktop Picker/Drag-and-drop; Mobile Scan/Foto/Galerie/Datei | Original und logische Dokumentgrenze; keine Desktop-Webcam-Scans |
| Review | Vorschlag bestaetigen/korrigieren/verwerfen | sichtbare Konsequenz begrenzen |
| Workflow/Claim | Einreichung, Antwort, Erstattung | aus Vorlage/Verlauf, nicht als globale Liste |
| Task/Agenda | Aufgabe, Frist, Termin, erwartete Antwort, Reminder | getrennte Semantik und Lebenszyklen statt eines gemeinsamen Datumsfelds |
| Vault/Account | Modus, Migration, Entitlement, Recovery | nur im passenden Lifecycle-Flow |

Zeitfelder folgen
`docs/technical/DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`. Controls zeigen
die konkrete Bedeutung; sie duerfen mehrere Zeit-Facts eines Dokuments nicht
in ein einzelnes Hauptdatum flatten.

## Form- und Review-Flaechen

Mappm benoetigt unter anderem:

- kompakte Capture-/Processing-Review.
- Case-/Record-Erstellung und gezielte Bearbeitung.
- Korrektur von Titel, Taxonomie, Managed Subject, External Party, Fakten und
  Beziehungen.
- Task-, Termin- und Reminder-Pflege.
- Profil-/Organisation-/Kontaktpflege.
- Search-/Filter-Eingaben.
- Account, Device, Vault, Assist, Migration, Export und Detached Recovery.

Ein Feld ist nur sichtbar, wenn es:

1. eine aktuelle User-Entscheidung erfordert;
2. eine relevante Unsicherheit oder Inkonsistenz aufloest;
3. eine folgenreiche Aktion erklaert oder bestaetigt; oder
4. vom Nutzer bewusst zur Detailbearbeitung geoeffnet wurde.

## Dokumenttaxonomie

Grundart, semantische Variante, Rolle und Workflow-Slot sind getrennte Achsen
gemaess `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md`. Rollen/Slots werden
nur erhoben, wenn sie Suche, Workflow, Aufgabe, Claim oder Matching verbessern.
Sie muessen zum jeweiligen Workflow passen und duerfen nicht als universelle
Pflichtliste erscheinen.

## Validierung

Validierung unterscheidet:

- technisch fehlendes/ungueltiges Artefakt.
- fachlich notwendige sichtbare Bestaetigung.
- Plausibilitaetswarnung.
- Konflikt mit bestaetigten Daten.
- optionalen Verbesserungsvorschlag.

Ein optionales Fact wird nicht allein deshalb zum Gate, weil es fuer eine
spaetere Auswertung nuetzlich waere. F5 definiert Failure-Kategorien; F27
definiert Feld- und Gate-Verhalten.

## Sicherheit, Accessibility und Localization

- Sensible IDs und Gesundheits-/Finanzwerte werden kontextgerecht maskiert.
- Feldinhalte erscheinen nicht in globalen Meldungen, Logs oder Screenshots.
- Labels bleiben sichtbar, deutsch und lokalisierbar.
- Fehler, Review und Pflicht werden semantisch und nicht nur farblich markiert.
- Lange Texte und Textscale `2.0` duerfen Controls oder Aktionen nicht
  verdecken.

## Tests und Verifikation

- Jede Formphase beweist minimale Standardinteraktion und progressives Detail.
- Vorschlag, Bestaetigung, Korrektur, Verwerfen und spaetere Ruecknahme werden
  fuer relevante Felder getestet.
- Niedrige Confidence zeigt weiterhin beste Kandidaten und eine einfache neue
  Case-Option.
- Sensible Werte leaken nicht in Feedback oder Diagnose.
- Keyboard, Semantics, Fokus, Textscale und Mobile/ Desktop werden geprueft.

## Stop Rules

Stop, wenn:

- Capture vor dem Scan Profil, Typ, Titel oder Case zwingend abfragt.
- ein grosser Case- oder Dokumenttypkatalog Standardinteraktion wird.
- implizite Fakten ohne Entscheidungswert die Review ueberladen.
- UI eine neue Backend-, Taxonomie-, Workflow- oder Legal-Policy erfindet.
- ein Folgenvorschlag ohne sichtbare Bestaetigung final wird.

## Handoff

Konkrete Formphasen gehen nach Konzeptreview an `ui-architect`; Fehlerverhalten
an `frontend-error-handling`; Tests an `frontend-test-coverage`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die betroffene Phase stoppt.
