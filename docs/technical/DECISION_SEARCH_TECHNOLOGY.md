---
title: "Decision - Search Technology and Search Boundary"
description: "Entscheidung zur Search-Boundary für Local/Cloud Vaults, SQLite/Drift/FTS5 und spätere Managed-/AI-Search-Adapter"
tags: [decision, search, sqlite, drift, fts5, local-vault, cloud-vault, meilisearch, typesense, qdrant]
lastUpdated: "2026-07-14"
status: "accepted-rebaseline"
---

# Decision - Search Technology and Search Boundary

## 2026 Vault Rebaseline

The SearchRepository boundary remains accepted. A Local Vault may use
Drift/FTS5 as authority. In a Cloud Vault, local indexes are cache-derived and
must not claim completeness while offline unless the active cache policy can
prove it. Managed search is a Mappm Cloud backend adapter. Customer Home Hub
and self-hosted search are superseded product directions.

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
- verwaltete Suche als Voraussetzung fuer Local Vaults.

## Begründung

Suche folgt der Vault-Authority. Ein Local Vault muss ohne Netzwerk suchen
können. Ein Cloud Vault darf verwaltete Suche verwenden und hält einen
policy-begrenzten lokalen Index/Cache; offline zeigt die UI dessen belegbare
Reichweite und behauptet keine Vollständigkeit, die der Cache nicht garantiert.

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
  MappmCloudSearchRepository
  SemanticSearchAdapter
```

Riverpod stellt die konkrete Implementierung bereit. Das ist Dependency Injection. Die austauschbaren Suchimplementierungen folgen dem Strategy Pattern.

## Erster strukturierter Suchumfang

Such- und Filterfelder:

- Vorgangstitel.
- Titel verknüpfter Cases und typisierte Case-Beziehungen.
- Unterlagen/Records einschließlich Vertrag/Abo und Gültigkeit.
- verwaltete Personen und Organisationen sowie externe Akteure.
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

## Product Search Experience

Die primäre Interaktion ist ein ruhiges globales Suchfeld mit ergebniszentrierter
Darstellung. Nutzer suchen über Vorgänge, Unterlagen, Dokumente, verwaltete
Profile, ExternalParty-Kontakte, Claims, Tasks und bestätigte Facts, ohne zuerst
den richtigen Ablageort kennen zu müssen.

Mappm plant keinen Chat, Messenger und keine KI-Chat-Historie als primäre
Dokumentinteraktion. Spätere natürliche oder semantische Query-Unterstützung
darf im Suchfeld helfen, liefert aber weiterhin nachvollziehbare Treffer,
Filter, Match-Gründe und direkte Aktionen statt eines Gesprächsverlaufs.

## Spätere Suchstufen

### R8/R9 lokal erweitert

- OCR erzeugt Text.
- OCR-Text wird lokal geprüft oder reviewbar markiert.
- FTS5 kann OCR-Text lokal indexieren.
- `sqlite-vec` oder ähnliche lokale Vektor-Erweiterungen können als Forschungsoption geprüft werden, wenn lokale semantische Suche gebraucht wird.

### Managed Cloud Search

Wenn Suche über mehrere Geräte, große OCR-Bestände oder bessere
Typo-/Ranking-Funktionen wichtig wird, stellt Mappm Cloud einen verwalteten
Search-Adapter hinter dem akzeptierten Cloud-, Privacy- und Authorization-
Contract bereit. Local Development Cloud darf denselben Vertrag nur mit
synthetischen Daten implementieren.

Kandidaten:

- Meilisearch.
- Typesense.
- PostgreSQL FTS/pgvector im verwalteten Backend.
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

- `R4-D3` ist entschieden und durch die Vault-Rebaseline ergänzt.
- `PILLAR_SEARCH_FACTS_INSIGHTS.md` muss lokale FTS5-Suche fuer Local Vault und
  verwaltete Suche fuer Cloud Vault sauber unterscheiden.
- `CONCEPT_F10_LOCAL_STORAGE.md` muss FTS5 und Search-Boundary vorbereiten.
- Ein Implementierungs-Issue muss den betroffenen Vault-Modus und die offline
  belegbare Ergebnisreichweite explizit nennen.

## Nicht entschieden

- Ob Mappm Cloud PostgreSQL FTS/pgvector, Meilisearch oder Typesense nutzt.
- Ob lokale semantische Suche mit `sqlite-vec` umgesetzt wird.
- Welche OCR-Engine zuerst kommt.
- Welche Verschlüsselungs-, Mandantenisolations- und Autorisierungsregeln der
  verwaltete Suchindex benötigt.
