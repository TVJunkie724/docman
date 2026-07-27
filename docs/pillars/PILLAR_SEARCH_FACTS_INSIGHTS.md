---
title: "Produkt-Säule - Search, Facts and Insights"
description: "Produktbereich fuer strukturierte Suche, Dokumentfakten, Einreichungsereignisse, Finanzdaten, Gültigkeiten und Auswertungen"
tags: [pillar, search, facts, insights, analytics, submissions, finance]
lastUpdated: "2026-07-23"
version: "0.6"
status: "accepted"
owner: "product-concept"
---

# Produkt-Säule - Search, Facts and Insights

## Zweck

Diese Saeule sorgt dafuer, dass Mappm nicht bei Dateiablage stehen bleibt.

Mappm soll spaeter beantworten koennen:

- Was habe ich im letzten Jahr bei einem Anbieter ausgegeben?
- Wie viel haben Arztbesuche gekostet?
- Wie viel wurde von Sozialversicherung oder Zusatzversicherung erstattet?
- Welche Ansprüche sind offen, eingereicht, abgelehnt oder bezahlt?
- Welche Verträge kosten wie viel?
- Welche Fristen, Nachweise oder Versionen laufen ab?

## Suche

Die C3-Suche beginnt strukturiert und Vault-konform.

Die Produktoberfläche beginnt mit einem globalen, ruhigen Suchfeld und
ergebniszentrierten Treffern. Sie ist kein Chat, Messenger oder KI-
Gesprächsverlauf. Spätere natürliche Sprache darf die Query unterstützen, muss
aber Treffer, Filter, Match-Gründe und direkte Aktionen liefern.

Die akzeptierte Technologieentscheidung steht in `docs/technical/DECISION_SEARCH_TECHNOLOGY.md`.

C3-Client-Technologie:

- SQLite + Drift für strukturierte Filter.
- SQLite FTS5 für gepflegte textuelle Metadaten.
- Search-Boundary im Domain-Layer, damit spätere Adapter austauschbar bleiben.

Suchbare Felder:

- Titel.
- Dokumenttyp.
- Vorgang.
- Case-Beziehungen und Workflow-Zweige.
- Profil.
- Datum.
- Anbieter/Gegenpartei.
- ExternalParty-Kontakte einschließlich Name, Adresse, E-Mail, Telefonnummer
  und Alias, soweit bestätigt und für den aktiven Managed Subject sichtbar.
- bestaetigter Betrag.
- Status.
- Tags.
- Record-/Nachweisart.
- Aufgabenstatus und Fälligkeit.

OCR-Volltext-Indexinput und Case-/Record-Matching gehoeren zum C2/C3 Core
Assist. Semantische/natuerliche Suche und breitere AI-Retrieval-Funktionen
bleiben Ausbaustufen. Local Vault und Cloud Vault duerfen unterschiedliche
Suchadapter nutzen, muessen aber dieselben Domain-Ergebnisgrenzen einhalten.

Spätere Kandidaten:

- erweiterte FTS5-/Ranking-Nutzung fuer bestaetigten/provenance-markierten OCR-Text.
- optional `sqlite-vec` für lokale semantische Suche.
- optionaler verwalteter Search-Service hinter dem akzeptierten Cloud-/Privacy-Contract.
- Qdrant nur, wenn AI/RAG-Retrieval zentral wird.

## Facts

Facts sind strukturierte Aussagen aus Dokumenten.

Typen:

- `financial_entry`.
- `deadline`.
- `contract_term`.
- `coverage`.
- `asset`.
- `submission`.
- `decision`.
- `identity_validity`.
- `task_suggestion`.

Core Assist schlaegt relevante Facts im C2/C3-Kern vor. Manuelle Pflege bleibt
Korrektur und Fallback. Fachlich relevante Facts werden nicht still
uebernommen.

## Einreichungen und Erstattungen

Mappm besitzt keine Claim-Entitaet. Ansprueche gegen Dritte werden durch den
passenden Case, wiederholbare Einreichungs-/Nachreichungsereignisse,
Entscheidungs-/Zahlungs-Facts und externe Referenzen abgebildet, zum Beispiel:

- SV-Erstattung.
- Zusatzversicherung.
- Garantie.
- Reklamation.
- Behördeneinreichung.
- Rückerstattung.

Der Arzt-/Versicherungsworkflow ist ein wichtiger erster Vertical, aber das Modell bleibt generisch.

## Insights

Insights entstehen ausschließlich aus bestätigten Facts. Jeder Case kann
Financial Entries referenzieren, aber die UI zeigt keine leere globale
Auswertungsfläche. Die private Haushalts-/Zahlungsuebersicht trennt:

- bestaetigte Verpflichtung und offenen Betrag;
- tatsaechliche Auszahlung;
- bestaetigte Erstattung/sonstigen Zahlungseingang;
- aktuellen bestaetigten Nettoaufwand;
- finalen Nettoaufwand erst nach bewusstem Abschluss.

Eine offene, unbezahlte Rechnung hat Auszahlung `0`. Status mutiert keinen
Betrag; provenance-tragende Finanzereignisse erzeugen Facts und daraus
abgeleitete Zustaende.

- Ausgaben pro Anbieter, Zeitraum, Kategorie und Profil.
- Arztkosten brutto/netto.
- Versicherungsprämien und erhaltene Leistungen.
- offene, entschiedene und abgelehnte Einreichungs-/Erstattungsablaeufe.
- auslaufende Verträge und Nachweise.

Kontextregeln:

- ein Betrag: eine ruhige Summenzeile, kein Diagramm.
- mehrere vergleichbare Perioden: optional ein kleines Diagramm.
- `part_of`: bestätigte Financial Entries rollen dedupliziert zum Parent hoch.
- `caused_by`, `follow_up_to`, `related_to`: kein automatischer Finanz-Roll-up.
- Erstattung: Verpflichtung, tatsaechliche Zahlung, bestaetigte Erstattungen
  und aktueller Nettoaufwand statt generischer Umsatz oder Prognose.
- Abo: Rechnungsverlauf statt Accounting-Dashboard.
- Steuer-Unterlagensammlung: Kandidaten/bestätigte Belege ohne
  Absetzbarkeitsclaim.

R8-D3 priorisiert drei erste Auswertungsarten:

- Einreichungen & Erstattungen.
- Ausgaben nach Anbieter/Kategorie.
- Laufende Kosten & Fristen.

Der erste Vertical ist Gesundheit & Versicherung. Dazu zaehlen nicht nur
Arztrechnungen, sondern auch Apothekenrechnungen, Therapien, SV-
Einreichungen, Zusatzversicherungs-Einreichungen, Versicherungsprämien und
Eigenanteile.

Facts und Financial Entries duerfen manuell ohne Dokument erfasst werden.
Dokumente und Unterlagen erhoehen die Nachweisqualitaet, sind aber keine
Voraussetzung fuer Auswertungen.

## C3-Scope

Schlanker C3-Slice:

- lokale strukturierte Suche.
- einfache Filter nach Vorgang, Dokument, Profil, Status und Datum.
- FTS5-Metadatensuche über gepflegte Textfelder.
- bestaetigte Beträge, Fälligkeiten und Anbieter aus Core Assist korrigierbar
  und suchbar machen.

Späterer Milestone:

- OCR-Volltext.
- semantische Suche.
- eigener Suchserver.
- automatische Fact-Extraktion.
- konfigurierbare oder buchhaltungsartige Dashboards sind kein Produktziel.
- Bankimport.
- Buchhaltung, Steuerberechnung oder verbindliche Steuerberatung.

Der Produktbegriff ist Haushaltsfinanzen/Zahlungs-/Kostenuebersicht, nicht die
in Oesterreich formal besetzte `Einnahmen-Ausgaben-Rechnung`.

## Abgrenzung

- Datenhaltung und lokale Indizes werden durch F10 vorbereitet.
- R4-D3 ist in `DECISION_SEARCH_TECHNOLOGY.md` entschieden.
- Such-UI-Patterns und leere/fehlerhafte Zustände werden durch die Frontend-Konzepte vorgegeben.
- Tasks/Reminder nutzen Facts als Quelle, bleiben aber eigene Produkt-Säule.
- Erste Insights sind in `docs/technical/DECISION_FIRST_INSIGHTS_VERTICALS.md`
  entschieden.
- Finanz-Roll-ups folgen
  `docs/technical/DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md`.
- Länderspezifische Steuer-Unterlagensammlung folgt
  `docs/technical/DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md`.

## Offene Folgefragen

- Welche Ranking-/Sortierregeln braucht die C3-Suche zuerst?
- Welcher kontextuelle Insight wird nach Einreichungen/Erstattungen, laufenden
  Kosten/Fristen und bestätigten Case-Zusammenfassungen zuerst aktiviert?

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
