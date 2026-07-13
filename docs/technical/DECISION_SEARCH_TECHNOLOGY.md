---
title: "Decision - Search Technology and Search Boundary"
description: "Entscheidung zur Search-Boundary für Local/Cloud Vaults, SQLite/Drift/FTS5 und spätere Managed-/AI-Search-Adapter"
tags: [decision, search, sqlite, drift, fts5, local-first, meilisearch, typesense, qdrant]
lastUpdated: "2026-07-12"
status: "accepted-rebaseline"
---

# Decision - Search Technology and Search Boundary

## 2026 Vault Rebaseline

The SearchRepository boundary remains accepted. A Local Vault may use
Drift/FTS5 as authority. In a Cloud Vault, local indexes are cache-derived and
must not claim completeness while offline unless the active cache policy can
prove it. Managed search is a Cloud backend adapter; `HomeHubSearchRepository`
and customer self-hosted search references below are historical names.

## Status

Accepted.

## Entscheidung

DocMan führt Suche als eigene austauschbare Domain-Boundary ein.

Der M2 nutzt lokal:

- SQLite + Drift für strukturierte Abfragen und Filter.
- SQLite FTS5 für gepflegte textuelle Metadaten.

Der M2 nutzt nicht:

- separaten Suchserver.
- OCR-Volltextsuche.
- semantische oder Vektor-Suche.
- Home-Hub-Search als Voraussetzung.

## Begründung

DocMan ist local-first. Suche muss daher ohne Netzwerk funktionieren und darf nicht von einem Backend abhängig sein.

SQLite + Drift ist bereits die Zielrichtung für strukturierte lokale Daten. SQLite FTS5 ergänzt diese Richtung, ohne eine zweite Betriebsplattform einzuführen.

FTS5 ist keine Wegwerf-Lösung. Es bleibt langfristig der lokale Suchindex für:

- gepflegte Metadaten.
- Vorgänge.
- Dokumente.
- Records/Nachweise.
- Tasks.
- später OCR-Text, wenn dieser lokal geprüft und gespeichert wird.

## Search Boundary

Die App darf nicht direkt an eine konkrete Suchtechnologie gekoppelt werden.

Zielbild:

```text
Domain
  SearchRepository / SearchService
    search(query, filters)
    indexDocumentMetadata(...)
    removeFromIndex(...)
    rebuildIndex()

Data
  LocalSqliteSearchRepository
    Drift structured queries
    SQLite indexes
    SQLite FTS5 metadata index

Later
  HomeHubSearchRepository
  RemoteSearchAdapter
  SemanticSearchAdapter
```

Riverpod stellt die konkrete Implementierung bereit. Das ist Dependency Injection. Die austauschbaren Suchimplementierungen folgen dem Strategy Pattern.

## M2-Suchumfang

Such- und Filterfelder:

- Vorgangstitel.
- Subvorgangstitel.
- Dokumenttitel.
- Record-/Nachweistitel.
- Dokumenttyp.
- Profil.
- Datum.
- Anbieter/Gegenpartei.
- Status.
- Tags/Keywords.
- Aufgabenstatus und Fälligkeit.

Späterer Milestone:

- OCR-Volltext.
- semantische Suche.
- Vektor-Suche.
- externe Server-Suche.
- komplexe Query-Sprache.

## Spätere Suchstufen

### R8/R9 lokal erweitert

- OCR erzeugt Text.
- OCR-Text wird lokal geprüft oder reviewbar markiert.
- FTS5 kann OCR-Text lokal indexieren.
- `sqlite-vec` oder ähnliche lokale Vektor-Erweiterungen können als Forschungsoption geprüft werden, wenn lokale semantische Suche gebraucht wird.

### Home Hub / Self-Hosted Search

Wenn Suche über mehrere Geräte, große OCR-Bestände oder bessere Typo-/Ranking-Funktionen wichtig werden, kann ein optionaler Home-Hub-Search-Adapter ergänzt werden.

Kandidaten:

- Meilisearch.
- Typesense.
- PostgreSQL FTS/pgvector, falls der Home Hub ohnehin PostgreSQL nutzt.
- Qdrant für RAG-/AI-heavy Retrieval.

OpenSearch/Elasticsearch bleibt nur eine spätere Enterprise-Option, falls wirklich sehr komplexe Suche nötig wird.

## Datenschutz

Der Suchindex ist sensibel.

Das gilt für:

- Metadaten.
- OCR-Text.
- Tags.
- Gegenparteien.
- finanzielle Fakten.
- medizinische Begriffe.

Suchindex-Daten dürfen nicht als harmlose technische Daten behandelt werden.

Regeln:

- Keine Suchbegriffe oder Treffer mit sensiblen Details in Logs.
- Keine unverschlüsselte externe Suche ohne explizite Sync-/Privacy-Entscheidung.
- Suchindex muss lösch- und rebuildbar sein.
- Spätere Remote-Search muss dieselben Trust Boundaries wie Sync erfüllen.

## Konsequenzen

- `R4-D3` ist entschieden.
- `PILLAR_SEARCH_FACTS_INSIGHTS.md` muss lokale FTS5-Suche als M2-Technologie nennen.
- `CONCEPT_F10_LOCAL_STORAGE.md` muss FTS5 und Search-Boundary vorbereiten.
- Issue #36 ist der primäre M2-Umsetzungstracker für strukturierte Suche und Filter.

## Nicht entschieden

- Ob Home Hub später Meilisearch oder Typesense nutzt.
- Ob lokale semantische Suche mit `sqlite-vec` umgesetzt wird.
- Welche OCR-Engine zuerst kommt.
- Ob Remote-Search im privaten Home-Hub-Setup verschlüsselt oder indexseitig besonders isoliert wird.
