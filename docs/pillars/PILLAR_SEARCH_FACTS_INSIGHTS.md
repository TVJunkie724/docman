---
title: "Produkt-Säule - Search, Facts and Insights"
description: "Produktbereich fuer strukturierte Suche, Dokumentfakten, Claims, Finanzdaten, Gültigkeiten und Auswertungen"
tags: [pillar, search, facts, insights, analytics, claims, finance]
lastUpdated: "2026-07-14"
version: "0.4"
status: "accepted"
---

# Produkt-Säule - Search, Facts and Insights

## Zweck

Diese Säule sorgt dafür, dass DocMan nicht bei Dateiablage stehen bleibt.

DocMan soll später beantworten können:

- Was habe ich im letzten Jahr bei einem Anbieter ausgegeben?
- Wie viel haben Arztbesuche gekostet?
- Wie viel wurde von Sozialversicherung oder Zusatzversicherung erstattet?
- Welche Ansprüche sind offen, eingereicht, abgelehnt oder bezahlt?
- Welche Verträge kosten wie viel?
- Welche Fristen, Nachweise oder Versionen laufen ab?

## Suche

M2-nahe Suche beginnt strukturiert und lokal.

Die Produktoberfläche beginnt mit einem globalen, ruhigen Suchfeld und
ergebniszentrierten Treffern. Sie ist kein Chat, Messenger oder KI-
Gesprächsverlauf. Spätere natürliche Sprache darf die Query unterstützen, muss
aber Treffer, Filter, Match-Gründe und direkte Aktionen liefern.

Die akzeptierte Technologieentscheidung steht in `docs/technical/DECISION_SEARCH_TECHNOLOGY.md`.

M2-Technologie:

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
- Betrag, falls manuell gepflegt.
- Status.
- Tags.
- Record-/Nachweisart.
- Aufgabenstatus und Fälligkeit.

OCR-Volltext, semantische Suche und KI-gestützte Suche sind spätere Ausbaustufen.

Spätere Kandidaten:

- FTS5 auch für geprüften lokalen OCR-Text.
- optional `sqlite-vec` für lokale semantische Suche.
- optionaler verwalteter Search-Service hinter dem akzeptierten Cloud-/Privacy-Contract.
- Qdrant nur, wenn AI/RAG-Retrieval zentral wird.

## Facts

Facts sind strukturierte Aussagen aus Dokumenten.

Typen:

- `financial_entry`.
- `claim`.
- `deadline`.
- `contract_term`.
- `coverage`.
- `asset`.
- `submission`.
- `decision`.
- `identity_validity`.
- `task_suggestion`.

Facts können manuell gepflegt oder später vorgeschlagen werden. Fachlich relevante Facts werden nicht still übernommen.

## Claims

Claims modellieren Ansprüche gegen Dritte:

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
Auswertungsfläche.

- Ausgaben pro Anbieter, Zeitraum, Kategorie und Profil.
- Arztkosten brutto/netto.
- Versicherungsprämien und erhaltene Leistungen.
- offene und abgelehnte Claims.
- auslaufende Verträge und Nachweise.

Kontextregeln:

- ein Betrag: eine ruhige Summenzeile, kein Diagramm.
- mehrere vergleichbare Perioden: optional ein kleines Diagramm.
- `part_of`: bestätigte Financial Entries rollen dedupliziert zum Parent hoch.
- `caused_by`, `follow_up_to`, `related_to`: kein automatischer Finanz-Roll-up.
- Erstattung: Rechnung, Erstattungen und Eigenanteil statt generischer Umsatz.
- Abo: Rechnungsverlauf statt Accounting-Dashboard.
- Steuer-Unterlagensammlung: Kandidaten/bestätigte Belege ohne
  Absetzbarkeitsclaim.

R8-D3 priorisiert drei erste Auswertungsarten:

- Claims & Erstattungen.
- Ausgaben nach Anbieter/Kategorie.
- Laufende Kosten & Fristen.

Der erste Vertical ist Gesundheit & Versicherung. Dazu zaehlen nicht nur
Arztrechnungen, sondern auch Apothekenrechnungen, Therapien, SV-Claims,
Zusatzversicherungs-Claims, Versicherungsprämien und Eigenanteile.

Facts und Financial Entries duerfen manuell ohne Dokument erfasst werden.
Dokumente und Unterlagen erhoehen die Nachweisqualitaet, sind aber keine
Voraussetzung fuer Auswertungen.

## M2-Scope

Schlanker M2-Slice:

- lokale strukturierte Suche.
- einfache Filter nach Vorgang, Dokument, Profil, Status und Datum.
- FTS5-Metadatensuche über gepflegte Textfelder.
- Beträge, Fälligkeiten und Anbieter so erfassen, dass spätere Facts nicht blockiert werden.

Späterer Milestone:

- OCR-Volltext.
- semantische Suche.
- eigener Suchserver.
- automatische Fact-Extraktion.
- große Dashboards.
- Bankimport.
- Buchhaltung, Steuerberechnung oder verbindliche Steuerberatung.

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

- Welche Ranking-/Sortierregeln braucht die M2-Suche zuerst?
- Welcher kontextuelle Insight wird nach Claims/Erstattungen, laufenden
  Kosten/Fristen und bestätigten Case-Zusammenfassungen zuerst aktiviert?

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
