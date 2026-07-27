---
title: "Decision - Structured Facts Manual Entry"
description: "Entscheidung zu ersten manuell erfassbaren Facts und Fact-Gruppen aus Dokumentgrundart, Domain, Record-Kontext und Workflow"
tags: [decision, facts, submissions, insights, records, document-types, finance]
lastUpdated: "2026-07-25"
status: "accepted-rebaseline"
owner: "product-concept/domain"
---
# Decision - Structured Facts Manual Entry

## Status

Accepted and rebaselined to the normalized document taxonomy on 2026-07-15.

R8-D1 ist entschieden. Erste manuelle Facts werden nicht global fuer jedes
Dokument erzwungen, sondern als optionale Fact-Gruppen aus Dokumentgrundart,
semantischer Variante, Domain, Record-Kontext und Workflow angeboten.

## Entscheidung

Mappm startet mit Fact-Gruppen statt Pflichtfeld-Maschine.

Alle Zeitwerte innerhalb dieser Fact-Gruppen folgen
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`. Die kurzen Feldbezeichnungen in
den folgenden Tabellen sind keine Erlaubnis fuer ein universelles
`documentDate`: Ausstellungs-, Leistungs-, Einreichungs-, Entscheidungs-,
Faelligkeits-, Gueltigkeits- und Systemzeit bleiben semantisch getrennt und
provenienzgebunden.

Keine einzelne Dokumentklassifikation steuert Facts allein. Die UI darf
Fact-Gruppen aus userbestaetigter Grundart, Variante, Domain,
Record-/Case-Kontext und optionaler Workflowdefinition anbieten. Backend/Core
Assist liefert auf kleinen beziehungsweise mittleren General-Purpose-Modellen
nur grobe Kandidaten und darf die wenigen produktdefinierten,
typabhaengigen Reviewfelder semantisch vorausfuellen. Fuer Datumsfelder bleiben
Top-Kandidat, weitere erkannte Werte, `Kein Datum` und manuelle Eingabe
sichtbar korrigierbar. Assist bestimmt weder die betroffene Person noch
Workflow-Zustand, aktive Frist oder Beziehung; vor der gebuendelten
Nutzerbestaetigung entfaltet auch eine vorgeschlagene Datumsbedeutung keine
Wirkung. Es entstehen weder harte Pflichtfelder noch versteckte Workflows.

Grundregel:

- Facts sind strukturierte Aussagen aus Dokumenten, Records oder Vorgängen.
- Facts koennen manuell gepflegt oder spaeter durch Assisted Review
  vorgeschlagen werden.
- Fachlich relevante Facts werden bewusst bestaetigt.
- Eine eindeutig benannte kontextuelle Nutzeraktion ist bereits die
  Bestaetigung ihrer ausdruecklichen Bedeutung; harmlose reversible Folgen
  brauchen keine zweite Bestaetigung.
- Nicht jedes Dokument braucht alle Facts.
- Nutzerinnen duerfen Fact-Gruppen ignorieren, ergaenzen oder korrigieren.

## Erste Fact-Gruppen

| Fact-Gruppe | Zweck | Typische Felder |
|---|---|---|
| `financial_entry` | Ausgaben, Kosten, Praemien, Rueckzahlungen, Gutschriften | genau ein fuer den Haushalt relevanter Gesamtbetrag je Verpflichtung, Waehrung, bestaetigte Zeitbedeutung, Anbieter, Kategorie, bezahlt/offen |
| `deadline` | Fristen und Faelligkeiten | Datum, Grund, Status, Reminder-Quelle |
| `contract_term` | Vertrage, Abos, Laufzeiten, Abrechnung und Kuendigungen | Start, Ende, Status, Vertragspartner, Abrechnungsperiode monatlich/quartalsweise/jaehrlich/custom, Mindestlaufzeit, Verlaengerung, Kuendigungsfrist, naechster Kuendigungstermin, bestaetigter wiederkehrender Betrag |
| `coverage` | dokumentierte Versicherungsangabe und Polizzenbezug | Versicherer, Polizze, versicherte Person, Gueltigkeit, wortgetreuer/bestaetigter Hinweis; keine Deckungs-, Anspruchs- oder Leistungsberechnung |
| `identity_validity` | Ausweis-/Nachweis-Gueltigkeit | Nummer/Identifier, ausgestellt am, gueltig bis, ausstellende Stelle |
| `profile_fact` | Personenbezogene Fakten mit optionalem Nachweis | Label, Werttyp, Wert, Schutzklasse, Quelle/Nachweis |
| `asset_or_warranty` | Kaufbeleg, Garantie, Seriennummern | Kaufdatum, Haendler, Betrag, Garantieende, Seriennummer |
| `submission_or_decision` | Behoerden-, Schul-, Payer- oder Versicherungsverlauf | externe Stelle, Referenz, eingereicht/nachgereicht am, Status, Entscheidung, bestaetigter Erstattungsbetrag, Frist, naechster Schritt; wiederholbare Ereignisse statt Claim-Objekt |

## Taxonomie-/Kontextkombination zu Fact-Gruppen

| Signal/Kontext | Sinnvolle erste Fact-Gruppen |
|---|---|
| `invoice_or_charge` | `financial_entry`; `deadline` nur nach bestaetigter Faelligkeitszuordnung oder gepruefter Regel; `submission_or_decision` nur aus bestaetigtem Case/Workflow/Payer-Kontext |
| `credit_or_adjustment` oder `payment_record` | bestaetigte Korrektur/Zahlung an vorhandenen `financial_entry` anbinden, nicht blind neue Ausgabe erzeugen |
| `contract_or_policy` + Contract/Policy Record | `contract_term`, `deadline`, bei Polizze `coverage`; laufende Kosten aus bestaetigten Rechnungen/Facts |
| `credential_or_certificate`/`registry_extract` + Record kind | `identity_validity` oder passende Record-/Profile-Facts |
| `application_or_filing`/`decision_or_order` + Case/Workflow | `submission_or_decision`, `deadline`, optional bestaetigte Zahlung/Leistung |
| `report_or_assessment` + Medical Domain | nur freigegebene sensible Medical Facts/Termine; keine Diagnosebehauptung aus schwacher Evidenz |
| `report_or_assessment` + Asset/Service Domain | `asset_or_warranty`, Zustand, Service-/Pruefdatum, naechste bestaetigte Faelligkeit |
| `offer_or_quote` | Betrag als Angebot/Schaetzung, nicht als bezahlte Ausgabe |
| Bild/Foto mit Rolle `evidence` | Kontext, Datum/Ort nur soweit extrahiert/bestaetigt; normalerweise keine Finanzfacts |
| unbekannte Grundart | keine Standard-Fact-Gruppe; relevante Vorschlaege koennen einzeln bestaetigt werden |

Diese Zuordnung ist ein Vorschlag fuer UI und Assisted Review, keine harte
Validierung und kein Versprechen, dass das Modell die Signal-/Kontextkombination
selbst erkennt. Nicht erkannte oder nicht bestaetigte Kombinationen bleiben
voll nutzbar ueber generischen Dokumenttyp, Volltext, Userkontext und manuelle
Facts.

## Persoenliche Nachweise und Record Kind

Ausweise und persoenliche Nachweise verwenden Dokumentgrundarten wie
`credential_or_certificate` oder `registry_extract`. Die konkrete langlebige
Bedeutung wird durch `recordKind` beschrieben:

```text
recordKind:
  birth_certificate
  residence_registration
  citizenship_certificate
  passport
  identity_card
  driving_license
  marriage_certificate
  name_change_record
  other
```

`recordKind` hilft bei:

- Anzeige.
- Suche/Filter.
- passenden Fact-Vorschlaegen.
- Gueltigkeit/Versionierung.
- Quick Access.

`recordKind` erzwingt keine Pflichtfelder.

Beispiele:

- Geburtsurkunde: Name, Geburtsdatum, Geburtsort, Eltern optional.
- Meldezettel: Adresse, Meldebeginn, betroffene Person.
- Reisepass: Passnummer, ausgestellt am, gueltig bis.
- Fuehrerschein: Fuehrerscheinnummer, Klassen optional, ausgestellt am,
  gueltig bis.

## Haushalts-/Business-Finanzfakten, nicht Buchhaltung

R8 baut keine doppelte Buchhaltung und keine Steuerberechnung. Eine getrennt
freigegebene, länderspezifische Steuer-Unterlagensammlung darf bestätigte Facts
und Belege nach `DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md` nutzen.

Ziel sind Haushalts-Finanz- und Dokumentenfakten:

- Wie viel haben wir in einem Zeitraum bei einem Anbieter ausgegeben?
- Wie hoch waren Arztkosten?
- Was wurde von SV oder Zusatzversicherung erstattet?
- Welche Versicherungspraemien fallen an?
- Welche Einreichungs-/Erstattungsablaeufe warten, sind entschieden oder
  abgeschlossen?

Bankimport, Kontenrahmen, verbindliche Steuerlogik und vollständige Buchhaltung
bleiben außerhalb von R8.

Eine Steuer-Vormerkung ist eine kontextuelle Klassifikation/Beziehung zu einem
freigegebenen Tax-Collection-Case, kein `financial_entry`-Wahrheitswert und
keine Aussage ueber Absetzbarkeit. Sie traegt Rechtsraum, Managed Subject,
Regime, Periode und Review-Status und bleibt bis zur Bestaetigung ein Kandidat.

Facts und Financial Entries duerfen auch ohne Dokument existieren. Dokumente
sind Nachweise, aber keine Voraussetzung fuer Auswertungen. Ein manueller
Eintrag kann spaeter mit einem Dokument, einer Unterlage, einem Vorgang oder
einem Versicherungsabwicklungs- oder anderen passenden Case verknuepft werden.

## Konsequenzen

- R8-D1 ist entschieden: erste Facts sind von normalisierten
  bestaetigten Taxonomie-/Domain-/Record-/Workflow-Signalen abhaengige
  Fact-Gruppen.
- Grundart/Variante allein erzwingt keine Fact-Gruppe oder Pflichtfelder.
- Identitaets-/Statusnachweise nutzen semantische Dokumentgrundarten plus
  spezifischen `recordKind` statt des alten Mischtyps `identity_record`.
- Financial Entries und Submission/Decision Events werden als
  Haushaltsauswertung vorbereitet, nicht als Buchhaltung.
- R8-D3 baut erste Insights auf Einreichungen & Erstattungen, Anbieter-/Kategorie-
  Ausgaben und laufende Kosten & Fristen auf.

## Nicht entschieden

- exakte UI fuer Fact-Gruppen.
- ob Nutzerinnen eigene Fact-Gruppen definieren duerfen.
- genaue Datenbanktabellen fuer Facts, Submission Events und Financial Entries;
  eine Claim-Tabelle ist ausgeschlossen.
- welche Facts spaeter automatisch aus OCR/AI vorgeschlagen werden.

Die grundlegende Zeitsemantik, Genauigkeit, Provenienz und Trennung von
Zeit-Fact, Ereignis, Termin, Frist, Aufgabe und Reminder ist dagegen in
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md` entschieden.
