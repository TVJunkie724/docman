---
title: "Draft Decision - Local Database"
description: "Vorläufige Entscheidungsvorlage zur lokalen Datenbank für DocMan"
tags: [decision, draft, local-storage, database, mobile, desktop]
lastUpdated: "2026-04-27"
status: "draft"
---

# Draft Decision - Local Database

## Status

Draft.

## Kontext

F10 legt fest, dass DocMan eine strukturierte lokale Datenbank braucht. Der aktuelle Spike verwendet Isar, aber Isar ist noch nicht als Zieltechnologie akzeptiert.

## Anforderungen

- Desktop und Mobile.
- strukturierte lokale Queries.
- persistente Draft-Inbox.
- persistente Mobile Upload Queue.
- Migrationen ohne Datenverlust.
- reaktive Datenflüsse für Riverpod.
- testbare Repository-Implementierungen.
- Sync-Metadaten und Tombstones später möglich.

## Kandidaten

- Isar weiterführen.
- SQLite-basierter Stack.
- anderer local-first-freundlicher Storage.

## Noch zu entscheiden

- Bleibt Isar Zieltechnologie?
- Wie wichtig ist langfristige Migration/Tooling-Stabilität gegenüber Spike-Kontinuität?
- Welche lokale DB passt am besten zu späterem Sync?

