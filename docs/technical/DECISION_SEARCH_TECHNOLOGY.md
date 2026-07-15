---
title: "Decision - Search Technology and Search Boundary"
description: "Search-Boundary für Local und Cloud Vault, strukturierte Filter, FTS5 und spätere semantische Adapter"
tags: [decision, search, sqlite, drift, fts5, local-vault, cloud-vault]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "data-architect/product"
---
# Decision - Search Technology and Search Boundary

## Status

Angenommen. Suche ist eine austauschbare Domain-Boundary und folgt der
Authority des aktiven Vaults.

## Entscheidung

```text
Domain
  SearchRepository
    search(query, filters)
    index(...)
    remove(...)
    rebuild()

Data
  LocalSqliteSearchRepository
  MappmCloudSearchRepository
  spätere semantische Adapter
```

Ein Local Vault verwendet Drift für strukturierte Abfragen und SQLite FTS5 für
lokal verfügbare, freigegebene Textdaten. Ein Cloud Vault darf Managed Search
verwenden und hält nur einen policy-begrenzten lokalen Cache/Index. Offline
kennzeichnet die UI dessen belegbare Reichweite und behauptet keine
Vollständigkeit, die der Cache nicht garantieren kann.

## Product Experience

Die primäre Interaktion ist ein ruhiges globales Suchfeld. Nutzerinnen müssen
weder einen Ablageort noch eine Taxonomie kennen. Ergebnisse dürfen Cases,
Records, Dokumente, verwaltete Personen und Organisationen, externe Akteure,
Claims, Aufgaben und bestätigte Facts umfassen.

Mappm plant keinen Chat, Messenger oder KI-Gesprächsverlauf als primäre
Dokumentinteraktion. Natürliche oder semantische Queries dürfen später im
Suchfeld helfen, liefern aber weiterhin nachvollziehbare Treffer, Filter,
Match-Gründe und direkte Aktionen.

## Indexierbarer Scope

Der strukturierte und textuelle Scope kann umfassen:

- Titel von Cases, Records und Dokumenten;
- typisierte Case-Beziehungen;
- Dokumenttyp, Datum, Status und Tags;
- Managed Subjects, externe Akteure und Rollen;
- Aufgabenstatus und Fälligkeit;
- bestätigte Facts sowie lokal verfügbare OCR-Texte.

Core Assist erzeugt in C2/C3 die notwendigen Titel, Metadaten und OCR-
Grundlagen. Unbestätigte Vorschläge müssen im Suchmodell als solche erkennbar
bleiben und dürfen nicht wie verifizierte Fakten gerankt werden.

## Technische Regeln

- Presentation und Domain kennen keine konkrete Suchengine.
- Der lokale Index ist rebuildbar und keine Daten-Authority.
- Managed Search ist ein Mappm-Cloud-Backend-Adapter hinter Authorization-,
  Privacy-, Tenant- und Löschverträgen.
- Welche Server- oder Vektortechnologie verwendet wird, bleibt eine spätere
  Implementierungsentscheidung anhand gemessener Anforderungen.
- Local Development Cloud verwendet dieselben Contracts ausschließlich mit
  synthetischen Daten.

## Datenschutz und Qualität

Suchindex, Queries und Treffer können hochsensibel sein. Deshalb gelten:

- keine Suchbegriffe, OCR-Inhalte, privaten Titel oder Treffer in normalen
  Logs, Telemetrie oder Benachrichtigungen;
- lösch- und rebuildbare Indizes;
- identische Authorization- und Tenant-Grenzen wie für die Quelldaten;
- Ranking-, Filter-, Offline-, Empty-, Fehler- und Berechtigungstests;
- sichtbare Provenienz, wenn ein Treffer aus Vorschlägen oder
  nicht-vollständigem Offline-Cache stammt.

Semantische oder Vektorsuche wird erst nach eigenem Privacy-, Quality- und
Kosten-Gate freigegeben.
