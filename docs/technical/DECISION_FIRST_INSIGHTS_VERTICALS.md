---
title: "Decision - First Insights Verticals"
description: "Entscheidung zu ersten Haushalts-Finanz- und Claim-Auswertungen auf Basis von Facts, Claims, Unterlagen, Vorgängen und manuellen Eintraegen"
tags: [decision, insights, facts, claims, finance, household, health, insurance]
lastUpdated: "2026-06-10"
status: "accepted"
---

# Decision - First Insights Verticals

## Status

Accepted.

R8-D3 ist entschieden. Die ersten Auswertungen sind Haushalts-Finanz- und
Claim-Insights, keine Buchhaltung.

## Entscheidung

Ordna startet mit drei Auswertungsarten:

1. Claims & Erstattungen.
2. Ausgaben nach Anbieter/Kategorie.
3. Laufende Kosten & Fristen.

Der erste fachliche Vertical ist **Gesundheit & Versicherung**, weil dort
Arztrechnungen, Apothekenrechnungen, SV, Zusatzversicherung, Praemien,
Erstattungen und Eigenanteile zusammenkommen.

## Facts ohne Dokument

Eine Information darf auch ohne Dokument existieren.

Dokumente sind Nachweise, aber keine Voraussetzung fuer eine auswertbare
Information. Nutzerinnen muessen laufende Kosten, Prämien, Fristen oder
manuelle Ausgaben erfassen koennen, auch wenn das passende Dokument noch nicht
hochgeladen wurde.

Ein Fact oder Financial Entry kann optional verknuepft sein mit:

- Profil.
- Unterlage / Record.
- Vorgang.
- Dokument.
- Claim.

Beispiel:

```text
FinancialEntry
  kind: recurring_cost
  title: Zusatzversicherung Kind A
  amount: 42 EUR
  interval: monthly
  profileId: Kind A
  recordId: optional
  evidenceDocumentId: optional
  source: manual | manual_with_evidence | suggested | imported
```

Der Eintrag ist auswertbar, auch wenn `recordId` oder `evidenceDocumentId`
noch fehlen. Die Nachweisqualitaet wird sichtbar:

- manuell erfasst.
- mit Dokument verknuepft.
- aus Dokument vorgeschlagen.
- bestaetigt.
- veraltet / zu pruefen.

## Auswertung 1: Claims & Erstattungen

Ziel:

```text
Was haben wir eingereicht, was wurde erstattet, was ist offen?
```

Typische Dokumente/Facts:

- Arztrechnung.
- Apothekenrechnung.
- Therapie.
- Heilbehelf.
- Krankenhaus- oder Privatleistung.
- Garantie/Reklamation spaeter.

Typische Felder:

- Bruttobetrag.
- eingereicht bei SV: ja/nein, Datum.
- SV-Status: offen, erstattet, abgelehnt, teilweise.
- SV-Erstattungsbetrag.
- Zusatzversicherung einzureichen/eingereicht/erstattet/abgelehnt.
- Zusatzversicherungs-Erstattungsbetrag.
- Eigenanteil.
- betroffene Person.
- Versicherung/Polizze.
- verknuepfte Dokumente, Unterlagen und Vorgänge.

Apothekenrechnungen gehoeren hier ausdrücklich dazu, wenn sie bei SV oder
Zusatzversicherung eingereicht werden koennen.

## Auswertung 2: Ausgaben nach Anbieter/Kategorie

Ziel:

```text
Wofuer geben wir wie viel aus?
```

Typische Sichten:

- Summe pro Anbieter.
- Summe pro Kategorie.
- Zeitraum.
- Profil / Haushalt.
- Vorgang.
- Dokumentlinks als Nachweis.

Beispiele:

- Amazon.
- Apotheke.
- Arzt.
- Schule.
- Versicherung.
- Auto.
- Haushalt.

Ein Eintrag kann gleichzeitig in Claims & Erstattungen und in Anbieter-
Ausgaben sichtbar sein. Eine Apothekenrechnung ist z. B. Ausgabe bei einer
Apotheke und gleichzeitig potenzieller Claim.

## Auswertung 3: Laufende Kosten & Fristen

Ziel:

```text
Welche laufenden Kosten und Fristen haben wir?
```

Typische Sichten:

- monatliche/jährliche Praemien.
- Versicherungen.
- Abos.
- Miet-/Dienstvertraege.
- Mitgliedschaften.
- naechste Faelligkeit.
- Kuendigungsfrist.
- automatische Verlaengerung.
- verknuepfte Unterlage, z. B. Polizze oder Vertrag.

Versicherungen zaehlen hier zur Vertrags-/Praemienseite:

```text
Unterlage: Zusatzversicherung Kind A
  -> laufende Kosten: 42 EUR / Monat
  -> Frist: Kuendigung bis 30.09.
  -> Claims:
       - Arztrechnung Mai
       - Apothekenrechnung Juni
```

## Keine Buchhaltung

R8 baut:

- Haushalts-Finanzuebersicht.
- Claim-/Erstattungsuebersicht.
- laufende Kosten und Fristen.
- nachweisbare Facts mit Dokument-/Record-Links.

R8 baut nicht:

- doppelte Buchfuehrung.
- Bankimport.
- Kontenrahmen.
- Steuerlogik.
- vollstaendiges Accounting.

## Konsequenzen

- R8-D3 ist entschieden: erste Insights sind Claims & Erstattungen, Anbieter-/
  Kategorie-Ausgaben und laufende Kosten & Fristen.
- Gesundheit & Versicherung ist der erste konkrete Vertical.
- Facts/Financial Entries sind auswertbar, auch wenn sie nur manuell erfasst
  und noch nicht mit Dokumenten belegt sind.
- Dokumente und Unterlagen erhoehen Nachweisqualitaet, sind aber keine
  Voraussetzung fuer Auswertungen.
- Vorgänge geben Kontext, Unterlagen geben Dauerbezug, Documents geben Evidenz.

## Nicht entschieden

- exakte Dashboard-UI.
- konkrete Diagramme.
- ob und wann Bankimport kommt.
- ob Nutzerinnen eigene Auswertungskategorien definieren duerfen.
