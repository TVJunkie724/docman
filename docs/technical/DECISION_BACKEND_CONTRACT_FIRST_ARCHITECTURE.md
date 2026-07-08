---
title: "Draft Decision - Backend Contract-First Architecture"
description: "Vorlaeufige Entscheidung zur contract-first Backend-Architektur: ASP.NET Core Backend, OpenAPI/Microcks-Vertraege und UI-Anbindung ueber Domain-Ports"
tags: [decision, draft, backend, contract-first, openapi, microcks, aspnet-core, flutter, ui-boundary]
lastUpdated: "2026-06-28"
status: "draft"
---

# Draft Decision - Backend Contract-First Architecture

## Status

Draft.

Diese Entscheidung konkretisiert, wie Mappm Backend, Flutter-App und spaetere
UI-/Feature-Slices verbinden soll. Sie ergaenzt:

- `DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md`
- `DECISION_API_CONTRACT_MOCKS.md`
- `DECISION_TRUST_ENCRYPTION_DEPLOYMENT_MODEL.md`

Die Backend-Technologie ASP.NET Core ist bereits akzeptiert. Diese Draft
Decision haelt zusaetzlich fest: Mappm baut nicht server-first und nicht
UI-direkt-gegen-Controller, sondern **contract-first**.

## Vorlaeufige Entscheidung

Mappm verwendet fuer Home Hub, spaeteren Sync, Backup, Sharing und
Processing-Orchestration ein ASP.NET-Core-Backend, aber die stabile Grenze
zwischen App und Backend ist der OpenAPI-Vertrag.

```text
Flutter App
  -> Presentation / Riverpod Feature State
  -> Domain Interfaces
  -> Data Adapters
  -> OpenAPI Client
  -> Backend Contract

Backend
  -> ASP.NET Core API
  -> PostgreSQL metadata / sync journal / jobs / audit
  -> S3-compatible storage, e.g. MinIO
  -> .NET Worker / Hosted Services
  -> optional OCR-/LLM-Sidecars
```

Die UI darf nicht direkt an ASP.NET Core, HTTP-Details, MinIO, EF Core oder
serverseitige DTOs gekoppelt werden. Die Flutter-App spricht fachlich gegen
Domain-Ports und Repository-Interfaces. Der Data Layer entscheidet, ob eine
Operation lokal, ueber Sync, ueber Home Hub oder spaeter ueber Managed Cloud
erfuellt wird.

## Contract-First Regel

API-Slices starten mit dem Vertrag:

```text
1. OpenAPI Contract definieren oder aktualisieren.
2. Synthetische Examples und Fehlerfaelle pflegen.
3. Microcks Mock-/Contract-Szenarien bereitstellen.
4. Flutter API Client gegen den Mock testen.
5. ASP.NET Core Endpoint implementieren.
6. ASP.NET Core gegen denselben Contract verifizieren.
```

ASP.NET Core muss den Vertrag erfuellen. Der Vertrag wird nicht aus zufaelligen
Controller-Implementierungen abgeleitet.

## UI- und Domain-Boundary

Flutter-Presentation und Riverpod Feature State duerfen nur fachliche
Interfaces sehen, zum Beispiel:

```text
DocumentRepository
DraftInboxRepository
CaptureUploadRepository
PairingRepository
SyncStatusRepository
ProcessingJobRepository
KeyManagementRepository
IdentityProviderRepository
```

Data Adapter duerfen diese Interfaces unterschiedlich erfuellen:

```text
Local-only
  -> Drift / local file store / secure storage

Private Home Hub
  -> Drift local replica + OpenAPI client + secure storage

Managed Mappm Cloud
  -> local replica + OpenAPI client + cloud sync/backup/sharing

Tests
  -> fake repositories and synthetic fixtures
```

Damit bleiben UI, Domain und Feature-State stabil, auch wenn der Betriebsmodus
wechselt.

## Backend-Form

Der bevorzugte Start fuer die echte Backend-Implementierung bleibt:

```text
Mappm.HomeHub.Api
  -> health / capabilities
  -> pairing / device tokens
  -> capture upload
  -> draft inbox handoff
  -> admin / storage health
  -> later sync endpoints

Mappm.HomeHub.Worker
  -> cleanup
  -> outbox/job polling
  -> backup tasks
  -> indexing handoff
  -> OCR/AI orchestration
```

API und einfache Background Services duerfen am Anfang in einem Deployable
leben. Ein separater Worker wird eingefuehrt, sobald Jobs, Retries, OCR,
Indexing oder Cleanup eine eigene Laufzeitgrenze brauchen.

## Erste Contract-Reihenfolge

Die erste Contract-Arbeit sollte klein und vertikal bleiben:

```text
contracts/openapi/home-hub-health.yaml
contracts/openapi/home-hub-pairing.yaml
contracts/openapi/mobile-capture-upload.yaml
contracts/openapi/draft-inbox.yaml
```

Spaeter:

```text
contracts/openapi/sync.yaml
contracts/openapi/backup-restore.yaml
contracts/openapi/processing-jobs.yaml
contracts/openapi/sharing.yaml
contracts/openapi/identity-provider.yaml
```

Der erste echte Backend-Slice sollte nicht mit vollem Sync, Account-Plattform,
Sharing oder Intelligence beginnen. Empfohlener erster Slice:

```text
GET  /health
GET  /capabilities
POST /pairing/sessions
POST /devices/pair
POST /capture/uploads/initiate
PUT  /capture/uploads/{uploadId}/content
POST /capture/uploads/{uploadId}/confirm
GET  /capture/uploads/{uploadId}
```

Endpoint-Namen bleiben vorlaeufig und muessen in der OpenAPI-Spezifikation
fachlich finalisiert werden.

## OCR, LLM und Processing

ASP.NET Core orchestriert Processing, aber muss nicht jede Spezialverarbeitung
selbst ausfuehren.

```text
ASP.NET Core
  -> Auth, Policy, Storage, Jobs, Status, Audit, Retry

.NET Worker
  -> Job polling, cleanup, orchestration, state transitions

OCR-/LLM-Sidecars
  -> Tesseract/PaddleOCR/Docling/Ollama/vLLM/etc. as needed
```

Processing bleibt eine Trust Boundary gemaess
`DECISION_TRUST_ENCRYPTION_DEPLOYMENT_MODEL.md`. Klartextverarbeitung ist nicht
identisch mit verschluesseltem Sync/Backup und braucht explizite Freigabe-,
Retention- und Logging-Regeln.

## Security- und Privacy-Regeln

- Keine Secrets in OpenAPI Examples, Microcks Artefakten, Logs oder normaler DB.
- Contract-Beispiele verwenden nur synthetische Daten.
- Dokumentinhalte, OCR-Text, Tokens und hochsensible Metadaten werden nicht
  geloggt.
- API-Fehler sind maschinenlesbar und auf App-Failure-Kategorien mapbar.
- Upload-, Sync- und Processing-Operationen brauchen idempotente oder
  wiederaufnehmbare Zustandsmodelle, sobald Wiederholung realistisch ist.
- Backend-DTOs werden nicht zu Flutter-Domain-Entities.
- Server-Persistenzmodelle werden nicht zu API-Vertraegen.
- MinIO/S3, EF Core, Npgsql und ASP.NET-spezifische Typen leaken nicht in die
  Flutter-Domain.

## Konsequenzen

- UI- und Feature-Arbeit kann gegen Fake-Repositories und Microcks laufen,
  bevor das echte Backend fertig ist.
- Backend-Implementierung und Flutter-App koennen parallel arbeiten, solange
  sie denselben OpenAPI-Vertrag erfuellen.
- Der Data Layer bleibt austauschbar zwischen Local-only, Home Hub, Managed
  Cloud und Tests.
- ASP.NET Core ist die bevorzugte Implementierung, aber nicht die fachliche
  Produktgrenze.
- OpenAPI/Microcks werden frueh zur Integrations- und CI-Grenze.

## Nicht entschieden

- genaue Ablage- und Namenskonvention fuer alle Contract-Dateien.
- Minimal APIs vs Controller pro Backend-Slice.
- Client-Codegenerierung vs handgeschriebener Client fuer die ersten Slices.
- konkrete .NET-Solution-Struktur.
- konkrete Auth-Libraries fuer spaetere Cloud-/Identity-Provider.
- genaue Sync-/Conflict-/Sharing-Protokolle.
