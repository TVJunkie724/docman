---
title: "Decision - Local Database"
description: "Entscheidung zur lokalen Datenbankstrategie fuer DocMan"
tags: [decision, accepted, local-storage, database, mobile, desktop, drift, sqlite]
lastUpdated: "2026-04-30"
status: "accepted"
---

# Decision - Local Database

## Status

Accepted.

DocMan verwendet fuer strukturierte lokale Daten **SQLite mit Drift**.

## Entscheidung

SQLite + Drift ist die Zieltechnologie fuer lokale strukturierte Daten in Desktop- und Mobile-App.

Die Entscheidung gilt fuer:

- Case-/Vorgangs-Metadaten.
- Dokument-Metadaten.
- Profile und Haushaltskontext im MVP-Umfang.
- Draft Inbox.
- Mobile Upload Queue.
- Sync-Metadaten und spaetere Tombstones.
- OCR-/LLM-Ergebnisstatus und Review-Zustaende, sobald diese spaeter eingefuehrt werden.

Drift ist dabei eine **Data-Layer-Implementierung**, kein Domain- oder UI-Konzept.

```text
Presentation
  -> Riverpod providers / feature state
      -> Domain repository interfaces
          -> Data repositories
              -> Drift / SQLite
```

## Begruendung

DocMan ist keine reine Objektablage. Das Produkt verwaltet langlebige Beziehungen und Zustaende:

- Vorgaenge mit Dokumenten, Aufgaben und Ereignissen.
- Dokumente mit Profilen, Drafts, Upload-Jobs und spaeter OCR-Ergebnissen.
- lokale IDs, optionale Remote-IDs, Sync-Status, Konflikte und Tombstones.
- Review-Zustaende fuer Vorschlaege und automatische Erkennung.

Diese Struktur ist relational und migrationslastig. SQLite + Drift passt deshalb besser als ein objektorientierter NoSQL-Kern.

Wichtige Gruende:

- SQLite laeuft stabil auf Mobile und Desktop.
- Drift bietet type-safe Queries, reaktive Streams, Migrationen und gute Testbarkeit.
- Relationale Tabellen machen Sync-, Queue- und Review-Zustaende explizit.
- SQLite ist langfristig exportierbar, inspectable und fuer private Dokumentdaten vertrauenswuerdig.
- Drift laesst sich sauber hinter Repository-Interfaces verstecken.

## Abgrenzung

### Nicht in SQLite

Originaldateien, Scans, PDFs, Vorschaubilder und grosse Binardaten liegen nicht als grosse BLOBs in SQLite.

Sie liegen im App-Dateispeicher. SQLite speichert nur Metadaten, lokale Datei-Referenzen, Hashes, Status und Zuordnungen.

### Nicht in SQLite

Secrets, Pairing-Tokens, Session-Tokens und andere Zugangsdaten liegen nicht in SQLite.

Sie liegen in Secure Storage gemaess `docs/concepts/CONCEPT_F12_SECURE_STORAGE.md`.

### Optional flexibel

Flexible oder wenig stabile Nebendaten duerfen als JSON-Spalten modelliert werden, wenn sie nicht sinnvoll normalisiert werden koennen.

Beispiele:

- rohe OCR-/Extraktionsdetails.
- provider-spezifische Analyse-Metadaten.
- temporaere Import- oder Klassifikationsdetails.

Stabile Produktdaten werden bevorzugt als explizite Tabellen modelliert.

## Architekturgrenze

Die Austauschbarkeit entsteht durch zwei Ebenen:

- **Strategy Boundary:** Domain definiert Repository-Interfaces; Drift ist nur eine konkrete Strategie.
- **Provider Wiring:** Riverpod stellt im Produktmodus Drift-Repositories und in Tests/Fakes alternative Implementierungen bereit.

Erlaubt:

- `DriftDocumentRepository` implementiert `DocumentRepository`.
- `FakeDocumentRepository` implementiert dasselbe Interface fuer Tests und Mocks.
- Provider Overrides ersetzen Datenquellen in Tests.

Nicht erlaubt:

- Drift-Tabellen oder Drift-DAOs in Presentation.
- Drift-Typen in Domain-Entities oder Repository-Interfaces.
- direkte Datenbankzugriffe aus Riverpod Feature-State-Providern.

## Sync-Vorbereitung

Das erste Schema muss nicht vollen Sync implementieren. Es muss Sync aber vorbereiten.

Zielmetadaten fuer sync-faehige Tabellen:

- stabile lokale ID.
- optionale Remote-ID.
- `createdAt`.
- `updatedAt`.
- optional `deletedAt` fuer Tombstones.
- lokaler Sync-/Upload-Status.
- optionale Version oder Revision fuer spaetere Konfliktbehandlung.

Delete-Verhalten:

- Produktdaten, die spaeter synchronisiert werden koennen, werden nicht blind physisch geloescht.
- Fuer Sync-relevante Daten wird ein Tombstone-/Soft-Delete-Konzept vorgesehen.
- Lokale temporaere Daten duerfen physisch geloescht werden, wenn sie nicht sync-relevant sind.

## Suche

MVP:

- strukturierte Queries ueber Titel, Datum, Sender, Tags, Profil, Case/Vorgang und Status.

Spaeter:

- SQLite FTS fuer OCR-/Volltextsuche pruefen.
- Ein externer Suchindex bleibt optional und darf nicht Voraussetzung fuer lokale Nutzung werden.

## Migration aus dem Spike

Der aktuelle Isar-basierte Code ist Spike-/Legacy-Code.

Konsequenzen:

- Isar wird nicht weiter als Zielarchitektur ausgebaut.
- Bestehende Isar-Pfade werden in R2 isoliert, ersetzt oder kontrolliert migriert.
- PocketBase-Modelle bestimmen nicht das lokale Datenmodell.
- R2 plant die konkrete Migration, bevor Produktfeatures darauf aufgebaut werden.

## Konsequenzen fuer R2

R2 muss:

- Drift als lokale Persistenzstrategie einplanen.
- Domain-Repository-Interfaces vor Drift-Typen schuetzen.
- lokale Dateiablage separat modellieren.
- Secure Storage separat halten.
- Draft Inbox und Mobile Upload Queue persistierbar machen.
- Migrationen und Tests als Foundation-Arbeit einplanen.

## Akzeptanz

Die Entscheidung ist akzeptiert, wenn:

- `docs/technical/TECHNICAL_FOUNDATION_PLAN.md` R2 gegen diese Entscheidung plant.
- Issue #1 geschlossen ist.
- R2 keine erneute Grundsatzentscheidung zwischen Isar, Drift und NoSQL braucht.

## Offene Folgefragen

- Wie minimal darf das erste Drift-Schema sein?
- Welche Tabellen gehoeren in R2, welche erst in R3?
- Wird FTS bereits in R3 vorbereitet oder erst nach OCR-Text?
- Wie genau wird der bestehende Isar-Spike aus dem Code entfernt oder isoliert?
