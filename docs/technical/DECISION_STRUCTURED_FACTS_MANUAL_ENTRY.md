---
title: "Decision - Structured Facts Manual Entry"
description: "Entscheidung zu ersten manuell erfassbaren Facts, Fact-Gruppen je Dokumenttyp und leichter Nachweisart fuer persoenliche Records"
tags: [decision, facts, claims, insights, records, document-types, finance]
lastUpdated: "2026-06-10"
status: "accepted"
---

# Decision - Structured Facts Manual Entry

## Status

Accepted.

R8-D1 ist entschieden. Erste manuelle Facts werden nicht global fuer jedes
Dokument erzwungen, sondern als optionale Fact-Gruppen je Dokumenttyp,
Record-Kontext und Workflow angeboten.

## Entscheidung

Ordna startet mit Fact-Gruppen statt Pflichtfeld-Maschine.

Der Dokumenttyp steuert, welche Facts sinnvoll vorgeschlagen oder manuell
angeboten werden. Er erzwingt aber keine harten Pflichtfelder und keine
versteckten Workflows.

Grundregel:

- Facts sind strukturierte Aussagen aus Dokumenten, Records oder Vorgängen.
- Facts koennen manuell gepflegt oder spaeter durch Assisted Review
  vorgeschlagen werden.
- Fachlich relevante Facts werden bewusst bestaetigt.
- Nicht jedes Dokument braucht alle Facts.
- Nutzerinnen duerfen Fact-Gruppen ignorieren, ergaenzen oder korrigieren.

## Erste Fact-Gruppen

| Fact-Gruppe | Zweck | Typische Felder |
|---|---|---|
| `financial_entry` | Ausgaben, Kosten, Praemien, Rueckzahlungen, Gutschriften | Betrag, Waehrung, Datum, Anbieter, Kategorie, bezahlt/offen |
| `deadline` | Fristen und Faelligkeiten | Datum, Grund, Status, Reminder-Quelle |
| `claim` | Erstattungen, Einreichungen, Reklamationen, Garantieansprueche | Claim-Typ, Status, eingereicht am, Entscheidung, Erstattungsbetrag, Erstattungsquote |
| `contract_term` | Vertrage, Laufzeiten, Kuendigungen | Start, Ende, Kuendigungsfrist, Vertragspartner, Kosten |
| `coverage` | Versicherungsdeckung und Polizzenbezug | Versicherer, Polizze, versicherte Person, Gueltigkeit, Deckungshinweis |
| `identity_validity` | Ausweis-/Nachweis-Gueltigkeit | Nummer/Identifier, ausgestellt am, gueltig bis, ausstellende Stelle |
| `profile_fact` | Personenbezogene Fakten mit optionalem Nachweis | Label, Werttyp, Wert, Schutzklasse, Quelle/Nachweis |
| `asset_or_warranty` | Kaufbeleg, Garantie, Seriennummern | Kaufdatum, Haendler, Betrag, Garantieende, Seriennummer |
| `submission_or_decision` | Behoerden-, Schul- oder Versicherungsstatus | eingereicht am, Status, Entscheidung, Frist, naechster Schritt |

## Dokumenttyp zu Fact-Gruppen

| Dokumenttyp | Sinnvolle erste Fact-Gruppen |
|---|---|
| `invoice` | `financial_entry`, `deadline`, optional `claim` |
| `health` | `financial_entry`, `claim`, `deadline`, optional `profile_fact` |
| `insurance_policy` | `coverage`, `contract_term`, `deadline`, `financial_entry` fuer Praemien |
| `contract` | `contract_term`, `deadline`, `financial_entry` fuer laufende Kosten |
| `authority` | `submission_or_decision`, `deadline`, optional `financial_entry` |
| `identity_record` | `identity_validity`, `profile_fact` |
| `education` | `profile_fact`, `deadline`, optional `submission_or_decision` |
| `purchase_warranty` | `asset_or_warranty`, `financial_entry`, `deadline` |
| `evidence_photo` | Kontext, Datum, Ort, Vorgang; normalerweise keine Finanzfacts |
| `note_other` | keine Standard-Fact-Gruppe, Nutzerin kann manuell ergaenzen |

Diese Zuordnung ist ein Vorschlag fuer UI und Assisted Review, keine harte
Validierung.

## Persoenliche Nachweise und Record Kind

`identity_record` bleibt der Top-Level-Dokumenttyp fuer Ausweise und
persoenliche Nachweise. Der Typ wird nicht in viele harte Dokumenttypen
aufgespalten.

Stattdessen gibt es optional `recordKind`:

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

## Haushalts-Finanzfakten, nicht Buchhaltung

R8 baut keine doppelte Buchhaltung und kein Steuerprodukt.

Ziel sind Haushalts-Finanz- und Dokumentenfakten:

- Wie viel haben wir in einem Zeitraum bei einem Anbieter ausgegeben?
- Wie hoch waren Arztkosten?
- Was wurde von SV oder Zusatzversicherung erstattet?
- Welche Versicherungspraemien fallen an?
- Welche Claims sind offen, erstattet oder abgelehnt?

Bankimport, Kontenrahmen, Steuerlogik und vollstaendige Buchhaltung bleiben
ausserhalb von R8.

Facts und Financial Entries duerfen auch ohne Dokument existieren. Dokumente
sind Nachweise, aber keine Voraussetzung fuer Auswertungen. Ein manueller
Eintrag kann spaeter mit einem Dokument, einer Unterlage, einem Vorgang oder
einem Claim verknuepft werden.

## Konsequenzen

- R8-D1 ist entschieden: erste Facts sind dokumenttyp- und workflowabhaengige
  Fact-Gruppen.
- Dokumenttypen schlagen Fact-Gruppen vor, erzwingen sie aber nicht.
- `identity_record` bleibt top-level schlank und nutzt optional `recordKind`.
- Financial Entries und Claims werden als Haushaltsauswertung vorbereitet, nicht
  als Buchhaltung.
- R8-D3 baut erste Insights auf Claims & Erstattungen, Anbieter-/Kategorie-
  Ausgaben und laufende Kosten & Fristen auf.

## Nicht entschieden

- exakte UI fuer Fact-Gruppen.
- ob Nutzerinnen eigene Fact-Gruppen definieren duerfen.
- genaue Datenbanktabellen fuer Facts, Claims und Financial Entries.
- welche Facts spaeter automatisch aus OCR/AI vorgeschlagen werden.
