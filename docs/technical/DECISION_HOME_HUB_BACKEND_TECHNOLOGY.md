---
title: "Decision - Mappm Cloud Backend Technology and Local Development Cloud"
description: "Entscheidung fuer ASP.NET Core, PostgreSQL, S3-kompatiblen Storage und eine lokale Development Cloud"
tags: [decision, backend, managed-cloud, aspnet-core, postgresql, openapi, docker, workers]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "backend/contract-api"
---

# Decision - Mappm Cloud Backend Technology and Local Development Cloud

## Status

Akzeptiert und am 2026-07-12 auf den neuen Produktscope rebaselined.

ASP.NET Core, PostgreSQL, S3-kompatibler Storage, OpenAPI/Microcks und
Worker-Grenzen sind die technische Richtung. Der lokale Stack ist die Local
Development Cloud; der unterstuetzte Kundendienst ist Managed Mappm Cloud.

Capture Confirm persistiert Originalartefakte und queued asynchrone
Verarbeitung; es finalisiert keine Case-/Record-Zuordnung. Worker verantworten
OCR, Titelvorschlag, Dokumentgrenzpruefung, Index und Matching-Vorschlaege. Der
aktuelle Reifegrad verlangt User-Bestaetigung des Routings.

## Entscheidung

Mappm verwendet fuer den verwalteten Mappm-Cloud-Stack und die kompatible Local
Development Cloud **ASP.NET Core** als primaere Backend-Technologie.

Mappm Cloud traegt Account/Device Sessions, Entitlements und Core Assist fuer
jeden normalen Produktmodus. Bei aktiviertem Cloud Vault ist sie zusaetzlich
Storage-, Sync-, Backup- und Multi-Device-Autoritaet. Local Vault bleibt lokal
autoritativ und auf demselben Geraet offline arbeitsfaehig; Cloud-Vault-Clients
verwenden einen begrenzten Offline-Cache/Pending State.

Der akzeptierte Zielstack ist:

```text
mappm-cloud-api          ASP.NET Core API
postgres                Server-Metadaten, Sync-Journal, Jobs, Audit
object-storage          S3-kompatibler Datei-Storage
microcks                OpenAPI Mock und Contract Verification
mappm-cloud-worker       .NET Worker / Hosted Services fuer Core Assist und Jobs
```

Nach belastbarer Anforderung kann derselbe Stack erweitert werden:

```text
ocr-worker               optional spezialisierter Python/OCR worker
llm-gateway              optional Ollama/vLLM gateway
search-service           optional Meilisearch/Typesense/Postgres FTS adapter
observability            optional Loki/Grafana/Prometheus/Tempo
```

## Geltungsbereich

Diese Entscheidung betrifft:

- Mappm-Cloud API und Local Development Cloud.
- Mobile-Capture Upload Boundary.
- Account-, Session-, Device- und Entitlement-API.
- Core-Assist-Processing, OCR, Titel, Indexing und Matching-Proposals.
- Cloud-Vault Sync, Storage, Backup, Migration, Job- und Admin-Endpoints, wenn
  der Cloud-Vault-Slice aktiviert ist.

Sie betrifft nicht:

- Flutter App-local Persistenz.
- lokale SQLite/Drift-Implementierung.
- Local-Vault-Offline-Autoritaet und begrenzte Cloud-Vault-Offline-Faehigkeit.
- spezialisierte Python-/Provider-Worker hinter dem stabilen Processing-Port.
- API-Contract Source of Truth. Diese bleibt OpenAPI/Microcks.

## Managed-Cloud-Rolle

C1/C2/C4 verwenden dieselbe verwaltete Plattform hinter getrennten Ports:

- Account/Device/Entitlement und Core Assist sind normale Servicegrenzen.
- Cloud Vault koordiniert Authority, Replikation, Sync-Revisions, Tombstones,
  Uploads, Backup/Restore und Migration.
- Local Vault verwendet Cloud nur fuer Account/Entitlement und explizite
  Assist-Jobs; daraus entsteht keine stille Cloud-Dokumentablage.
- Sync-, Storage-, Upload-, Processing- und Job-Ports halten Flutter Domain/UI
  unabhaengig von ASP.NET Core, PostgreSQL, S3 und konkreten AI Providern.
- Offline-Verhalten folgt dem aktiven Vault-Modus und darf nicht durch einen
  generischen `connected`-Schalter ersetzt werden.

Startpfad:

```text
Mobile Capture
  -> lokale Queue
  -> Mappm Cloud Capture
  -> durable Capture Session
  -> Processing / Proposals / cross-platform Review

Desktop/Mobile Local DB
  -> Sync Port
  -> Mappm Cloud Sync Coordinator (Cloud Vault only)
  -> Remote metadata copy / sync journal / backup metadata
```

Provider-/Betriebserweiterung:

```text
Mappm Cloud Worker
  -> OCR jobs
  -> managed/specialized LLM provider jobs
  -> indexing / reprocessing
  -> backup / restore
  -> operations dashboard
```

## Warum ASP.NET Core

ASP.NET Core passt fuer Mappm besonders gut, weil:

- Minimal APIs und Web APIs sauber fuer kleine, modulare HTTP-Schnittstellen
  funktionieren.
- OpenAPI-Unterstuetzung direkt im ASP.NET-Core-Stack vorhanden ist.
- Health Checks und Hosted Services/Worker Services offizielle Plattformbausteine sind.
- .NET gut zu langlebigen Managed Services, Containern und typisierter
  Konfiguration passt.
- PostgreSQL-Anbindung ueber Npgsql/EF Core etabliert ist.
- BusinessCompanion bereits wertvolle Muster fuer ASP.NET Core, Worker,
  Health, OpenAPI und Docker zeigt, ohne dass Mappm dessen Microservice-Breite
  kopieren muss.
- spaetere Workerslices im selben Oekosystem bleiben koennen, waehrend
  OCR/LLM-Spezialteile als Python-Sidecars getrennt bleiben duerfen.

## Vergleich der Alternativen

| Option | Bewertung fuer Mappm |
|---|---|
| ASP.NET Core | Beste Gesamtpassung fuer Mappm Cloud, OpenAPI, Worker, Health, PostgreSQL, Docker und langfristige Wartbarkeit |
| FastAPI | Sehr gut fuer Python-nahe OCR/AI APIs, aber als Hauptbackend wuerde es Domain/API/Worker enger an Python binden als noetig |
| NestJS | Solides TypeScript-Backend mit OpenAPI-Modul, aber fuer Mappm weniger naheliegend als .NET, weil Flutter/Dart nicht vom TS-Stack profitiert |
| Go | Sehr robust und klein, aber fuer unsere fachliche Domain, OpenAPI-Komfort, Migrations-/Worker-Produktivitaet und spaetere Entwicklerergonomie weniger passend |
| PocketBase | Kein Zielbackend; kann historischer Spike bleiben, aber nicht Domain- oder Sync-Kern |

## Architekturform

Mappm startet nicht mit vielen Microservices.

Empfohlen:

```text
Mappm.Cloud.Api
  -> Health / Capabilities
  -> Account / Device Sessions / Entitlements
  -> Capture Upload
  -> Capture Session / Processing Handoff
  -> Admin / Storage Health
  -> Vault / Sync / Migration endpoints

Mappm.Cloud.Worker
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

- Accounts, Vault-Mitgliedschaften und autorisierte Geraete.
- Device Sessions/Trust und Entitlements, soweit nicht ausschliesslich
  secret-/tokenbasiert.
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

Das erste Mappm-Cloud-Deployable verwendet keine
RabbitMQ-/MassTransit-Pflicht.

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
- `DECISION_BACKEND_CONTRACT_FIRST_ARCHITECTURE.md` konkretisiert diese Grenze:
  UI und Domain haengen nicht direkt an ASP.NET Core, sondern an Domain-Ports,
  Data Adapter und OpenAPI-Vertraege.
- API-DTOs duerfen nicht direkt Flutter-Domain-Entities werden.
- Backend-SDKs, EF-Typen, MinIO-Typen und ASP.NET-spezifische Typen duerfen
  nicht in Flutter Domain oder UI leaken.

## Security und Privacy

ASP.NET Core ist nur die Implementierung. Die Security-Grenzen bleiben
produktfachlich:

- Dokumente und viele Metadaten sind sensibel.
- Session-/Device-Tokens, presigned URLs und Secrets werden nicht geloggt.
- Admin-/Health-Endpunkte duerfen keine Dokumentinhalte ausgeben.
- Managed-Cloud-Verarbeitung darf nicht pauschal voraussetzen, dass Betreiber
  Dokumentinhalte ausserhalb des akzeptierten Trust-/Key-Modells lesen duerfen.
- OCR/LLM-Klartextverarbeitung bleibt eine explizite Trust Boundary.
- Backup und Sync duerfen keine stillen Fremd-Cloud-Abhaengigkeiten einfuehren.

## Aktualitätsgate

Vor dem ersten Backend-Implementation-Contract werden unterstützte .NET-/ASP.NET-
Core-, EF-Core-/Npgsql-, PostgreSQL-, S3-Adapter- und Container-Versionen aus
den offiziellen Herstellerquellen neu geprüft, gepinnt und mit Supportende,
Lizenz sowie Upgradepfad dokumentiert. Diese Architekturentscheidung ersetzt
keinen aktuellen Dependency-/Security-Review.

## Konsequenzen

- Die Backend-Technologie ist fuer die Planung entschieden: ASP.NET Core,
  PostgreSQL, S3-kompatibler Storage und OpenAPI/Microcks.
- `DECISION_BACKEND_ROLE.md` ist historisch ersetzt;
  `DECISION_BACKEND_CONTRACT_FIRST_ARCHITECTURE.md` definiert die aktuelle
  Rollen- und Ownership-Grenze.
- C1 Contract-/Mock-Setup kann OpenAPI/Microcks ohne echten ASP.NET-Server
  starten.
- C2 Mobile Capture kann gegen Microcks und danach gegen ASP.NET Core Mappm Cloud
  getestet werden.
- C1/C4 Account, Cloud Vault, Sync und Migration verwenden denselben Stack mit
  getrennten Contract-/Backend-/Frontend-Issues.
- Core Assist ist C2/C3-Scope und keine spaetere optionale Backend-Erweiterung;
  Advanced Assist und breitere Automation bleiben spaeter.

## Nicht entschieden

- genaue .NET-Version zum Implementationszeitpunkt.
- Minimal API vs Controller pro Endpoint-Slice.
- EF Core Migrationsstrategie im Detail.
- konkretes Sync-Protokoll und Konfliktprotokoll.
- genaue Upload-Endpoint-Namen und Multipart-Grenzwerte nach
  `DECISION_MOBILE_CAPTURE_UPLOAD_STRATEGY.md`.
- konkrete Projekt-/Solution-Struktur.
- konkrete Auth-Libraries fuer spaetere Cloud Identity Provider.
