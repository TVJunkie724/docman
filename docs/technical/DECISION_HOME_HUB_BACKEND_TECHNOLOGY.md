---
title: "Decision - Home Hub Backend Technology"
description: "Entscheidung fuer ASP.NET Core, PostgreSQL und einen modularen Home-Hub-Server-Stack fuer Ordna"
tags: [decision, backend, home-hub, aspnet-core, postgresql, openapi, docker, workers]
lastUpdated: "2026-06-05"
status: "accepted"
---

# Decision - Home Hub Backend Technology

## Status

Accepted.

## Entscheidung

Ordna verwendet fuer den Home Hub und den spaeteren selbst gehosteten
Server-Stack **ASP.NET Core** als primaere Backend-Technologie.

Der Home Hub ist fuer R6 und spaetere Milestones Sync Coordinator,
Backup-Server, Upload-Ziel und Erweiterungsplattform. Er ist nicht die
Voraussetzung fuer normale Desktop- oder Mobile-Nutzung: die Apps bleiben
local-first und muessen offline arbeitsfaehig bleiben.

Der akzeptierte Zielstack fuer die erste echte Home-Hub-Implementierung ist:

```text
ordna-homehub-api        ASP.NET Core API
postgres                Server-Metadaten, Sync-Journal, Jobs, Audit
minio                   S3-kompatibler Datei-Storage
microcks                OpenAPI Mock und Contract Verification
```

spaetere Milestones kann derselbe Stack erweitert werden:

```text
ordna-homehub-worker     .NET Worker / Hosted Services
ocr-worker               optional Python/OCR worker
llm-gateway              optional Ollama/vLLM gateway
search-service           optional Meilisearch/Typesense/Postgres FTS adapter
observability            optional Loki/Grafana/Prometheus/Tempo
```

## Geltungsbereich

Diese Entscheidung betrifft:

- Home-Hub API.
- Mobile-Capture Upload Boundary.
- Pairing und Device-Token API.
- spaeteren Sync-Server.
- serverseitige Storage-, Backup-, Job- und Admin-Endpoints.
- spaetere Worker fuer OCR, Indexing und Intelligence-Orchestration.

Sie betrifft nicht:

- Flutter App-local Persistenz.
- lokale SQLite/Drift-Implementierung.
- App-Offline-Faehigkeit als Produktgrundsatz.
- Python-basierte OCR/AI-Worker, falls diese spaeter sinnvoll sind.
- API-Contract Source of Truth. Diese bleibt OpenAPI/Microcks.

## Home-Hub-Rolle im Sync

R6-D1 ist akzeptiert:

- Home Hub traegt den ersten echten Sync- und Backup-Server.
- Desktop und Mobile bleiben local-first.
- Home Hub koordiniert Replikation, Remote-Kopien, Sync-Revisions,
  Tombstones, Uploads und spaetere Jobs.
- Home Hub wird spaeter um OCR, LLM, Search, Reprocessing, Operations und
  Backup/Restore erweitert.
- Home Hub ist eine austauschbare Backend-Implementierung hinter generischen
  Sync-, Storage-, Upload- und Job-Ports.

Der Home Hub ist damit kein Server-first-Modell. Wenn der Home Hub nicht
erreichbar ist, duerfen Kernfunktionen wie lokale Dokumentverwaltung,
Draft-Review, Suche ueber lokale strukturierte Daten und mobile Capture-Queue
nicht unbrauchbar werden.

Startpfad:

```text
Mobile Capture
  -> lokale Queue
  -> Home Hub Upload / Remote Backup
  -> Desktop Draft Inbox Handoff

Desktop/Mobile Local DB
  -> Sync Port
  -> Home Hub Sync Coordinator
  -> Remote metadata copy / sync journal / backup metadata
```

Spaetere Erweiterung:

```text
Home Hub
  -> OCR jobs
  -> local/self-hosted LLM jobs
  -> indexing / reprocessing
  -> backup / restore
  -> operations dashboard
```

## Warum ASP.NET Core

ASP.NET Core passt fuer Ordna besonders gut, weil:

- Minimal APIs und Web APIs sauber fuer kleine, modulare HTTP-Schnittstellen
  funktionieren.
- OpenAPI-Unterstuetzung direkt im ASP.NET-Core-Stack vorhanden ist.
- Health Checks und Hosted Services/Worker Services offizielle Plattformbausteine sind.
- .NET gut zu langlebigen Self-hosted Services, Docker und typed configuration passt.
- PostgreSQL-Anbindung ueber Npgsql/EF Core etabliert ist.
- BusinessCompanion bereits wertvolle Muster fuer ASP.NET Core, Worker,
  Health, OpenAPI und Docker zeigt, ohne dass Ordna dessen Microservice-Breite
  kopieren muss.
- spaetere Workerslices im selben Oekosystem bleiben koennen, waehrend
  OCR/LLM-Spezialteile als Python-Sidecars getrennt bleiben duerfen.

## Vergleich der Alternativen

| Option | Bewertung fuer Ordna |
|---|---|
| ASP.NET Core | Beste Gesamtpassung fuer Home Hub, OpenAPI, Worker, Health, PostgreSQL, Docker und langfristige Wartbarkeit |
| FastAPI | Sehr gut fuer Python-nahe OCR/AI APIs, aber als Hauptbackend wuerde es Domain/API/Worker enger an Python binden als noetig |
| NestJS | Solides TypeScript-Backend mit OpenAPI-Modul, aber fuer Ordna weniger naheliegend als .NET, weil Flutter/Dart nicht vom TS-Stack profitiert |
| Go | Sehr robust und klein, aber fuer unsere fachliche Domain, OpenAPI-Komfort, Migrations-/Worker-Produktivitaet und spaetere Entwicklerergonomie weniger passend |
| PocketBase | Kein Zielbackend; kann historischer Spike bleiben, aber nicht Domain- oder Sync-Kern |

## Architekturform

Ordna startet nicht mit vielen Microservices.

Empfohlen:

```text
Ordna.HomeHub.Api
  -> Health / Capabilities
  -> Pairing / Device Tokens
  -> Capture Upload
  -> Draft Inbox Handoff
  -> Admin / Storage Health
  -> later Sync endpoints

Ordna.HomeHub.Worker
  -> outbox/job polling
  -> cleanup
  -> indexing handoff
  -> OCR/AI job orchestration
```

Die erste Implementierung darf API und einfache Background Services in einem
Deployable halten. Ein separater Worker wird eingefuehrt, sobald Jobs,
Retries, OCR/Indexing oder Cleanup eine klare Laufzeitgrenze brauchen.

## Datenzugriff

Serverseitig wird PostgreSQL als Ziel-Metadatenspeicher verwendet.

Geplante Inhalte:

- Haushalte und Geraete.
- Pairing Sessions und Device Tokens, soweit nicht secret-only.
- Capture Upload Sessions.
- File metadata.
- Sync Journal und Tombstones.
- Backup metadata und Restore-Punkte.
- Job-/Outbox-Tabelle.
- Audit-/Admin-Ereignisse.
- Storage Health und Backup-Metadaten.

Entity Framework Core mit Npgsql ist der bevorzugte erste Datenzugriffspfad,
solange keine konkrete Anforderung dagegen spricht. Kritische Hotpaths duerfen
spaeter mit Dapper oder SQL gezielt optimiert werden, ohne das Domain-Modell zu
ändern.

## Job- und Queue-Strategie

Der erste Home Hub verwendet keine RabbitMQ-/MassTransit-Pflicht.

Akzeptierte Startstrategie:

- PostgreSQL-backed Job-/Outbox-Tabelle.
- .NET Hosted Service oder Worker Service pollt Jobs.
- Retry, Failure Reason, Attempt Count und NextAttemptAt sind explizite Felder.

Ein Broker wie RabbitMQ, NATS oder Redis Queue wird erst eingefuehrt, wenn:

- Job-Durchsatz oder Fan-out es noetig macht.
- mehrere Worker-Typen entkoppelt skaliert werden muessen.
- konkrete Betriebsmetriken die Komplexitaet rechtfertigen.

## API- und Contract-Regeln

- OpenAPI bleibt Contract Source of Truth.
- Microcks bleibt Mock-/Verification-Runner.
- ASP.NET Core muss die OpenAPI-Vertraege erfuellen, nicht umgekehrt.
- API-DTOs duerfen nicht direkt Flutter-Domain-Entities werden.
- Backend-SDKs, EF-Typen, MinIO-Typen und ASP.NET-spezifische Typen duerfen
  nicht in Flutter Domain oder UI leaken.

## Security und Privacy

ASP.NET Core ist nur die Implementierung. Die Security-Grenzen bleiben
produktfachlich:

- Dokumente und viele Metadaten sind sensibel.
- Pairing Tokens, Device Tokens, presigned URLs und Secrets werden nicht geloggt.
- Admin-/Health-Endpunkte duerfen keine Dokumentinhalte ausgeben.
- spaetere Cloud- oder Self-hosted-cloudartige Varianten duerfen nicht
  voraussetzen, dass ein Betreiber alle Dokumentinhalte lesen kann.
- OCR/LLM-Klartextverarbeitung bleibt eine explizite Trust Boundary.
- Backup und Sync duerfen keine stillen Fremd-Cloud-Abhaengigkeiten einfuehren.

## Quellencheck

Stand 2026-05-08:

- Microsoft dokumentiert aktuelle ASP.NET-Core-OpenAPI-Unterstuetzung.
- Microsoft dokumentiert Hosted Services/Worker Services fuer Background Tasks.
- Microsoft dokumentiert ASP.NET-Core-Health-Checks.
- Npgsql dokumentiert .NET-/EF-Core-Unterstuetzung fuer PostgreSQL.
- FastAPI und NestJS haben ebenfalls OpenAPI-Unterstuetzung, bleiben aber
  Alternativen statt Zielstack.

## Konsequenzen

- R0-D4/R6-D1 Backend-Technologie ist fuer die Planung entschieden:
  ASP.NET Core + PostgreSQL + MinIO/S3-kompatibler Storage + Microcks.
- `DECISION_BACKEND_ROLE.md` bleibt als breiter Backend-Rollenentwurf bestehen,
  verweist aber auf diese konkrete Technologieentscheidung.
- R3 Contract-/Mock-Setup kann OpenAPI/Microcks ohne echten ASP.NET Server starten.
- R4 Mobile Capture kann gegen Microcks und spaeter gegen ASP.NET Core Home Hub
  getestet werden.
- R6 Sync/Auth plant den ersten echten Home-Hub-Server in diesem Stack.
- R6-D1 ist entschieden: Home Hub ist Sync Coordinator, Backup Server und
  spaetere LLM/OCR-Erweiterungsplattform, waehrend Desktop und Mobile offline
  nutzbar bleiben.

## Nicht entschieden

- genaue .NET-Version zum Implementationszeitpunkt.
- Minimal API vs Controller pro Endpoint-Slice.
- EF Core Migrationsstrategie im Detail.
- konkretes Sync-Protokoll und Konfliktprotokoll.
- genaue Upload-Endpoint-Namen und Multipart-Grenzwerte nach
  `DECISION_MOBILE_CAPTURE_UPLOAD_STRATEGY.md`.
- konkrete Projekt-/Solution-Struktur.
- konkrete Auth-Libraries fuer spaetere Cloud Identity Provider.
