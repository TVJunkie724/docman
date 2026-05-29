---
title: "Decision - Document Type Catalog"
description: "Entscheidung zum lockeren Dokumenttyp-Katalog ohne harte typenspezifische Pflichtfelder oder Workflows"
tags: [decision, document-types, metadata, draft-inbox, forms, milestones]
lastUpdated: "2026-05-29"
status: "accepted"
---

# Decision - Document Type Catalog

## Status

Accepted.

## Entscheidung

R4/M2 verwendet einen lockeren Dokumenttyp-Katalog.

Dokumenttypen helfen beim:

- Anzeigen.
- Filtern.
- Suchen.
- Sortieren.
- spaeteren Vorschlagen von Metadaten, Facts und Workflows.

Sie erzwingen in M2 keine dokumenttypspezifischen Pflichtfelder, keine
komplexen Formulare und keine Statusmaschinen.

## M2-Katalog

| Key | UI-Name | Beispiele |
|---|---|---|
| `invoice` | Rechnung | Arzt-, Handwerker-, Online- oder Haushaltsrechnung |
| `contract` | Vertrag | Mietvertrag, Dienstvertrag, Abo, Vereinbarung |
| `insurance_policy` | Versicherung / Polizze | Polizze, Deckungsblatt, Versicherungsinfo |
| `health` | Arzt / Gesundheit | Arztbrief, Befund, Rezept, Überweisung |
| `authority` | Behörde / Amt | Bescheid, Antrag, Meldeunterlage, Finanzamt |
| `identity_record` | Ausweis / Nachweis | Ausweis, Geburtsurkunde, Meldezettel, Staatsbürgerschaft |
| `education` | Schule / Ausbildung | Zeugnis, Kursunterlage, Schulbrief, Zertifikat |
| `purchase_warranty` | Garantie / Kaufbeleg | Garantie, Rechnung als Kaufbeleg, Seriennummernbeleg |
| `evidence_photo` | Foto / Beweis | Unfallfoto, Schadensfoto, Zustand vorher/nachher |
| `note_other` | Notiz / Sonstiges | unklarer Eingang, freie Notiz, nicht klassifiziert |

Der Katalog darf spaeter erweitert werden. Bestehende Keys duerfen nicht leicht
umbenannt werden, weil sie fuer Filter, Migration und Sync relevant werden.

## M2-Verhalten

In M2 steuert der Dokumenttyp nur:

- Icon/Farbe/Label.
- Filter und Suche.
- optionale Metadatenvorschlaege.
- spaetere Workflow-/Fact-Vorbereitung.

In M2 steuert der Dokumenttyp nicht:

- Pflichtfelder.
- automatische Statuswechsel.
- automatische Aufgaben.
- automatische Claims.
- automatische OCR/KI-Klassifikation.
- harte Validierung, die Draft Review blockiert.

## Sonstiges ist erlaubt

`note_other` / "Notiz / Sonstiges" ist ein gueltiger M2-Typ.

Das ist bewusst so: Der Nutzer soll ein Dokument schnell ablegen koennen, auch
wenn der genaue Typ unklar ist. Spaetere Review, Suche oder KI kann eine bessere
Klassifikation vorschlagen.

## Spätere Milestones

In spaeteren Milestones koennen spezialisierte Typen oder Subtypen entstehen:

- Arztrechnung mit SV-/Zusatzversicherungs-Claim.
- Vertrag mit Kuendigungsfrist.
- Versicherungspolizze mit Ablaufdatum und Reminder.
- Rechnung mit Zahlung/Faelligkeit.
- Garantie mit Garantieende.
- Behördendokument mit Fristen oder Einreichstatus.
- Schul-/Kinderunterlagen mit Profil-/Jahreskontext.

Solche Erweiterungen muessen als Facts, Claims, Tasks oder Workflow-Regeln
modelliert werden, nicht als versteckte Sonderlogik im Dokumenttyp-Feld.

## Beziehung zu Metadaten

`DECISION_DOCUMENT_METADATA_PREVIEW.md` bleibt fuehrend fuer Pflicht- und
optionale Metadaten.

Der Dokumenttyp darf optionale Felder nahelegen, aber nicht erzwingen.

Beispiele:

- `invoice` legt Betrag und Faelligkeit nahe.
- `contract` legt Vertragspartner und Kuendigungsfrist spaeter nahe.
- `insurance_policy` legt Versicherer und Gueltigkeit spaeter nahe.
- `identity_record` legt Gueltigkeit und Profilbezug spaeter nahe.

## Konsequenzen

- Draft Review bekommt einen ueberschaubaren Typ-Auswahldialog.
- Suche/Filter koennen Dokumenttyp sofort nutzen.
- R4 bleibt schnell und offen.
- R8/R9 koennen Facts, Claims und KI-Vorschlaege auf dem Katalog aufbauen.
- F14 Form Field Catalog hat seine offene Dokumenttypfrage beantwortet.

## Nicht entschieden

- exakte Icons/Farben.
- ob spaeter eigene Subtypen statt Tags genutzt werden.
- ob Nutzer eigene Dokumenttypen definieren duerfen.
- wann Typen in spezialisierte Workflows uebergehen.
