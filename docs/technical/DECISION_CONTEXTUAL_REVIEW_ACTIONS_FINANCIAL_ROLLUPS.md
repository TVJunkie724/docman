---
title: "Entscheidung - Kontextuelle Aktionen und Haushaltsfinanzen"
description: "Schlanke Review-Aktionen sowie provenienztragende Verpflichtungen, Zahlungen, Erstattungen und deduplizierte Haushaltsfinanz-Zusammenfassungen"
tags: [decision, product, assisted-review, actions, household-finance, financial-facts, rollup, ux]
lastUpdated: "2026-07-24"
status: "accepted"
owner: "product-concept"
---

# Entscheidung - Kontextuelle Aktionen und Haushaltsfinanzen

## Status und Produktgrenze

Die Grundrichtung wurde am 14. Juli 2026 akzeptiert und am 23. Juli 2026 um
das ausdrueckliche Haushaltsfinanz-Modell erweitert.

Mappm bietet eine einfache private Uebersicht ueber Verpflichtungen,
tatsaechliche Auszahlungen, Erstattungen/sonstige Zahlungseingaenge und den
bestaetigten Nettoaufwand. Das ist bewusst mehr als eine unverbundene
Betragsanzeige, aber keine doppelte, steuerliche oder betriebliche Buchhaltung.

Der sichtbare Produktbegriff soll **Haushaltsfinanzen**,
**Zahlungsuebersicht** oder **Kostenuebersicht** sein. In Oesterreich wird die
formale Bezeichnung **Einnahmen-Ausgaben-Rechnung** nicht fuer dieses private
Produktmuster verwendet.

## Kontextuelle Review-Aktionen

Assisted Review schlaegt nur die wenigen Aktionen vor, die fuer das konkrete
Dokument relevant sind. Es zeigt keine universelle Wand aus Checkboxen.
Typische Aktionen sind:

- verwaltete Person, Haushalt oder Organisation zuordnen;
- bestehenden Case verknuepfen oder einen manuellen/gefuerten Case anlegen;
- bestehenden Record verknuepfen oder eine Record-Version anlegen/aktualisieren;
- Vertrag oder Abo verknuepfen und eine Dokumentrolle setzen;
- normale Versicherungsabwicklung verknuepfen/anlegen oder ein Submission
  Event im aktuellen Case erfassen;
- Zahlung als offen/bezahlt markieren und eine Faelligkeit vormerken;
- fuer Steuerpruefung vormerken und Zeitraum/Subjekt waehlen;
- als geschaeftsrelevant markieren;
- Garantie-/Asset-Kontext zuordnen;
- Aufgabe oder Reminder anlegen;
- zu Quick Access hinzufuegen;
- kontrollierten Export beziehungsweise Handoff vorbereiten.

Die UI zeigt zwei oder drei priorisierte Aktionen und legt den Rest in eine
zurueckhaltende sekundaere Aktionsebene. Vorschlaege zeigen ihre Evidenz und
lassen sich leicht bestaetigen, bearbeiten, ablehnen und rueckgaengig machen.

## Matching und Automation

```text
capture
  -> grobe Dokumentart/Domain und einfache Kandidaten extrahieren
  -> sichtbaren User-/Managed-Subject-Kontext beibehalten
  -> Case/Record best-effort ranken
  -> Nutzer bestaetigt Routing, Gesamtbetrag und Offen/Bezahlt
  -> bestaetigte Facts/Regeln leiten reversible Aktionen ab
```

An explicit capture context or prior user-confirmed rule may preselect a match.
Low-risk automation may become provisional auto-routing only when the applicable
Assist decision permits it. Der usergewaehlte Managed-Subject-Kontext bleibt
autoritativ. Jurisdiction, tax/legal classification and external actions
remain intentionally confirmed.

No broad event is inferred from a single ambiguous document. All automatic
routes have undo and history.

## Finanzielle Grundbegriffe

Status und Betrag werden nicht vermischt. Ein Status wie `paid` setzt keinen
Betrag, und ein erkannter Rechnungsbetrag beweist keine Zahlung.

Mappm benoetigt mindestens folgende getrennte Bedeutungen:

| Bedeutung | Beispiel | Wirkung |
|---|---:|---|
| bestaetigte Verpflichtung/Rechnungsbetrag | 180 EUR | zeigt, welcher Betrag geschuldet beziehungsweise abgerechnet wurde |
| offener Betrag | 180 EUR | noch nicht bestaetigt bezahlt oder storniert |
| tatsaechliche Auszahlung | 0 EUR oder 180 EUR | nur provenienztragend bestaetigte Zahlung |
| bestaetigter Zahlungseingang/Erstattung | 65 EUR | nur tatsaechlich bestaetigter Eingang |
| aktuell bestaetigter Netto-Cashflow | Auszahlung minus Eingaenge | zeigt reale bisherige Belastung, keine Prognose |
| finaler Nettoaufwand | nach bewusstem Abschluss | erst bei abgeschlossenem finanziellen Verlauf als final bezeichnen |

Die exakten Domain-Namen bleiben dem Data-/Contract-Entwurf vorbehalten. Die
fachlichen Bedeutungen duerfen dort nicht zusammengelegt werden.

## Ereignis- und Provenienzmodell

Finanzielle Werte entstehen aus bestaetigten, einzeln nachvollziehbaren
Ereignissen/Facts, beispielsweise:

- Rechnung oder Verpflichtung erfasst beziehungsweise korrigiert;
- Zahlung ganz oder teilweise bestaetigt;
- Zahlung storniert oder rueckgebucht;
- Gutschrift bestaetigt;
- Erstattung oder anderer Zahlungseingang bestaetigt;
- Betrag einem oder mehreren Kontexten zugeordnet;
- Nutzerkorrektur mit Historie.

Quelle kann ein bestaetigtes Dokument, eine ausdrueckliche Nutzerangabe oder
spaeter eine autorisierte Integration sein. OCR/LLM darf fuer eine Rechnung
genau einen wahrscheinlichen haushaltsrelevanten Gesamtbetrag vorschlagen,
nicht Netto, USt, Rabatte oder Positionen als sichtbare Finanzalternativen.
Offen/Bezahlt kommt aus einer Userangabe oder bestaetigten kontextuellen
Aktion. Kein Modell finalisiert Zahlung, Erstattung oder finanzielle Bedeutung.

`open`, `partially_paid`, `paid`, `corrected` oder `cancelled` sind abgeleitete
Zustaende aus diesen Facts/Ereignissen. Sie sind keine zweite Quelle, die
Betraege mutiert.

## Beispiel medizinische Rechnung

### Noch nicht bezahlt

```text
Rechnungsbetrag / Verpflichtung     180 EUR
offen                               180 EUR
tatsaechlich bezahlt                  0 EUR
bestaetigte Erstattungen              0 EUR
aktueller Netto-Cashflow               0 EUR
```

Die Nutzerin hat noch nichts ausgegeben. Mappm zeigt trotzdem die offene
Verpflichtung.

### Bezahlt

```text
Rechnungsbetrag / Verpflichtung     180 EUR
offen                                 0 EUR
tatsaechlich bezahlt                180 EUR
bestaetigte Erstattungen              0 EUR
aktueller bestaetigter Nettoaufwand 180 EUR
```

### Mit zwei Erstattungen

```text
tatsaechlich bezahlt                180 EUR
Erstattung Sozialversicherung        65 EUR
Erstattung Zusatzversicherung        90 EUR
aktueller bestaetigter Nettoaufwand  25 EUR
```

Mappm berechnet diesen Wert nur aus bestaetigten Zahlungsereignissen. Es
prognostiziert keine Deckung, erwartete Erstattung oder spaetere
Steuerwirkung.

## Kontextuelle Finanzanzeigen

Jeder Case darf bestaetigte `FinancialEntry`-Facts referenzieren. Die UI zeigt
eine finanzielle Zusammenfassung aber nur, wenn relevante Daten existieren.

| Daten | Sichtbare Behandlung |
|---|---|
| keine bestaetigten Finanzwerte | keine leere Finanzsektion |
| ein bestaetigter Betrag | eine ruhige Betragszeile |
| mehrere vergleichbare Periodenwerte | optionales kleines Diagramm |
| medizinische Kostenabrechnung | Verpflichtung, offene Zahlung, bestaetigte Auszahlungen, Erstattungen und aktueller Nettoaufwand |
| Erstattungs-Case | Rechnung, bestaetigte Erstattungen und aktuell bestaetigter Eigenanteil |
| Unfall-/Schaden-Case | bestaetigte Verpflichtungen, Zahlungen und zugeordnete Erstattungen aus `part_of`-Schadenkostenabrechnungen; nie vermutete Deckung oder erwartete Auszahlung |
| Steuer-Sammelcase | Anzahl vorgemerkter/bestaetigter Belege und sinnvolle bestaetigte Summe |
| Custom Case/Projekt | einfache Summe; Kategorie-/Providerdetail nur, wenn das Produktmuster es verlangt |

Ein Case ohne Finanzdaten zeigt keine leere Finanzsektion. Ein Case mit
Rechnungen in eigenen `part_of`-Kosten-Cases darf deren bestaetigte Werte
dedupliziert zusammenfassen.

## Deduplizierter Roll-up

Bei einem `part_of`-CaseLink werden geeignete bestaetigte Finanzwerte
standardmaessig in den Parent aggregiert. `caused_by`, `follow_up_to` und
`related_to` aggregieren nicht automatisch.

Der Roll-up arbeitet auf stabilen `FinancialEntry`-IDs, nicht auf
Dokument-Links. Dieselbe Rechnung wird trotz Verknuepfung mit Parent, Child,
Steuer-Sammelcase und Vertrag pro anwendbarer Zusammenfassung nur einmal
gezaehlt. Vorgeschlagene oder unbestaetigte Betraege veraendern Summen nicht
stillschweigend.

Eine Versicherungsabwicklung darf mehrere Rechnungen und optionale
`damage_cost_settlement`-Cases betreffen. Versicherungsentscheidungen und
Zahlungen werden vor einem Roll-up provenienztragend den betroffenen
Verpflichtungen zugeordnet. Derselbe bestaetigte Betrag darf nicht einmal pro
verknuepftem Kosten-Case wiederholt werden.

Abschluss oder Entknuepfung eines Case loescht keine Finanz-Facts. Die UI kann
die Herkunft eines aggregierten Betrags zeigen, ohne einen
buchhaltungsartigen Drill-down zu erzwingen.

Ein und dieselbe Rechnung darf zusaetzlich einem Steuer-Sammelcase, einem
Vertragskontext oder mehreren fachlichen Sichten zugeordnet sein. Sie wird
dadurch in einer Haushalts-/Periodensumme nicht mehrfach gezaehlt. Der Roll-up
arbeitet auf stabilen Finanz-Fact-/Entry-Identitaeten, nicht auf der Anzahl von
Dokument- oder Case-Links.

## Haushalts- und Periodensicht

Mappm darf bestaetigte Werte schlank nach Haushalt/Managed Subject, Zeitraum
und grober Kategorie zusammenfassen:

- offene Verpflichtungen;
- tatsaechliche Auszahlungen;
- bestaetigte Erstattungen und sonstige Zahlungseingaenge;
- bestaetigter Netto-Cashflow;
- abgeschlossenes Ergebnis, wenn der jeweilige Verlauf bewusst abgeschlossen
  wurde.

Diese Sicht ist kein konfigurierbares Finanzdashboard. Sie fuehrt kein Konto,
keine Soll-/Haben-Buchung, keine Umsatzsteuerlogik, keine Gewinnermittlung und
keine steuerliche Absetzbarkeit.

## Schlanke Visualisierung

- Kein Diagramm fuer nur einen Wert.
- Kein leerer Diagramm-Platzhalter.
- Ein kleines Liniendiagramm nur fuer eine sinnvolle Wertefolge.
- Desktop-Hover, Mobile-Tap und Tastaturfokus zeigen den exakten Punktwert.
- Screenreader erhalten eine gleichwertige knappe Wertefolge/Zusammenfassung.
- Keine Prognosen, Buchhaltungs-KPIs, dichten Legenden oder konfigurierbaren
  Dashboards.
- Rechnungssummen als Rechnungsverlauf bezeichnen, solange keine fixe
  Preisaenderung bestaetigt ist.

## Verifikation

Synthetische Fixtures decken mindestens ab:

- offene Rechnung mit Auszahlung 0;
- Teilzahlung und spaetere Restzahlung;
- Korrekturrechnung, Gutschrift, Storno und Rueckbuchung;
- eine und mehrere bestaetigte Erstattungen;
- aktueller versus finaler Nettoaufwand;
- derselbe Finanz-Fact in Medical-, Tax- und Vertragskontext ohne
  Doppelzaehlung;
- `part_of`-Roll-up und lose `related_to`-/`caused_by`-Links;
- OCR-Vorschlag ohne Wirkung auf bestaetigte Summen;
- Case-Abschluss ohne Loeschung der Finanzhistorie;
- keine leere Finanzsektion und kein Chart fuer nur einen Wert.

## Stop Rules

Stop, wenn:

- jede moegliche Aktion immer sichtbar ist;
- ein Assist-Vorschlag sensible Zuordnung oder Jurisdiktion still finalisiert;
- eine Finanzsektion ohne Daten erscheint;
- derselbe `FinancialEntry` ueber mehrere Links doppelt gezaehlt werden kann;
- eine Versicherungszahlung ueber mehrere Beziehungen oder optionale Damage
  Cost Settlements dupliziert wird;
- lose verbundene Cases Parent-Summen still veraendern;
- vorgeschlagene OCR-/AI-Betraege in bestaetigte Summen eingehen;
- `paid` oder ein anderer Status Betraege ohne provenienztragendes Ereignis
  veraendert;
- eine offene, noch unbezahlte Rechnung als tatsaechliche Ausgabe gezaehlt
  wird;
- erwartete Erstattungen oder Deckungsberechnungen in bestaetigte Summen
  eingehen;
- derselbe Finanz-Fact ueber Medical-, Tax-, Vertrags- oder andere Links
  mehrfach gezaehlt wird;
- Mappm seine private Haushalts-/Zahlungsuebersicht als formale
  Einnahmen-Ausgaben-Rechnung bezeichnet;
- Visualisierungen Mappm in Buchhaltungs- oder Business-Intelligence-Software
  verwandeln.
