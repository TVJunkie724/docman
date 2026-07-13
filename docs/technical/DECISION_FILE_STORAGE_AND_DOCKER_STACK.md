---
title: "Decision - File Storage Strategy and Local Docker Stack"
description: "Entscheidung zur austauschbaren Dateiablage, lokalem File Store, Home-Hub-Storage, MinIO/S3-Kompatibilität und Docker/Compose-Entwicklungsstack"
tags: [decision, storage, files, docker, compose, minio, s3, home-hub, local-first]
lastUpdated: "2026-07-12"
status: "accepted"
---

# Decision - File Storage Strategy and Local Docker Stack

## Status

Accepted with product-scope rebaseline on 2026-07-12.

The storage-port separation remains binding. `HomeHubFileStore` and customer
self-hosting references below are historical names: use Local Vault File Store,
Cloud Vault Object Store and Fake Store. Docker/Compose is the Local Development
Cloud and is not a supported customer deployment.

## Entscheidung

Mappm trennt Dateiablage konsequent vom Domain-Modell.

Die App arbeitet fachlich gegen einen austauschbaren Datei-Storage-Port. Lokaler
Dateispeicher, Home-Hub-Dateispeicher, MinIO/S3-kompatibler Speicher und
Test-Fakes sind Implementierungen derselben fachlichen Grenze.

```text
Domain
  -> DocumentFileStore / FileStorageRepository interface

Data adapters
  -> LocalFileStore
  -> HomeHubFileStore
  -> S3CompatibleFileStore / MinioFileStore
  -> FakeFileStore

Riverpod
  -> fileStoreProvider wires the active implementation
```

MinIO wird als sinnvolle Zieltechnologie fuer den Home-Hub-/Server-Stack
akzeptiert, aber nicht als Voraussetzung fuer den lokalen Desktop-Kern.

## Begriffe

### Storage-Port

Der Storage-Port ist ein Domain-/Application-Vertrag fuer Dateioperationen.

Er kapselt:

- Datei speichern.
- Datei lesen.
- Datei öffnen oder lokalen Zugriff vorbereiten.
- Hash/Checksum berechnen und prüfen.
- Thumbnail/Preview referenzieren.
- Datei tombstonen oder löschen.
- Upload-Ticket erzeugen.
- Upload bestätigen.
- Storage-Health prüfen.

### Provider/Strategy

Technisch ist das eine Strategy-/Adapter-Grenze. In der Flutter-App wird die
konkrete Implementierung über Riverpod Provider injiziert.

Der Begriff `provider` beschreibt also die Verdrahtung. Der fachliche Schutz
kommt vom Interface/Port.

## App-local Storage

Der Desktop-/Mobile-Kern bleibt local-first.

App-local bedeutet:

- strukturierte Metadaten in SQLite/Drift.
- Originaldateien, Scans, PDFs und Previews im lokalen App-Dateispeicher.
- stabile `FileRecord`-IDs in der Datenbank.
- Hashes, MIME-Type, Größe und Storage-Referenz als Metadaten.
- keine Docker-Abhängigkeit fuer einfache lokale App-Nutzung.

Der lokale File Store ist die erste Implementierung des Storage-Ports.

## Home Hub und Docker/Compose

Parallel zum App-local Kern wird ein lokaler Docker-/Compose-Stack als
Home-Hub-/Integration-Ziel geplant.

Der erste sinnvolle Stack:

```text
mappm-homehub-api
postgres
minio
microcks
```

Die Backend-Technologie fuer `mappm-homehub-api` ist in
`DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md` entschieden: ASP.NET Core fuer die API
und spaetere .NET Worker/Hosted Services fuer einfache Hintergrundjobs.

spaetere Milestones oder bei konkretem Bedarf:

```text
ocr-worker
llm-gateway
search-service
mailhog / smtp test
grafana / loki / prometheus
backup / restore tooling
```

Der Docker-Stack ist Entwicklungs-, Test- und spätere Self-Hosted-Betriebsbasis.
Er ist nicht Voraussetzung fuer die lokale Desktop-App.

## MinIO / S3-kompatibler Storage

MinIO ist fuer Mappm sinnvoll, weil:

- Dokumente große Binärdaten sind.
- Datei-Bytes nicht in PostgreSQL oder SQLite gehören.
- S3-kompatible APIs eine langfristig portable Storage-Grenze ergeben.
- Self-hosted Betrieb auf NAS oder Heimserver gut zu Docker/Compose passt.
- Upload-Flows mit `initiate -> upload -> confirm checksum` sauber modellierbar sind.
- spätere Backups, Migrationen und alternative S3-kompatible Stores einfacher werden.

MinIO darf aber nicht in Domain oder UI leaken.

Nicht erlaubt:

- `MinioClient` in Domain, Presentation oder Riverpod Feature-State.
- S3-Bucket-/Object-Key-Logik als Produktmodell.
- MinIO als Pflicht, damit App-local Workflows funktionieren.

Erlaubt:

- `MinioFileStore` als Data-Adapter.
- `storageKey`, `bucket`, `etag` oder ähnliche technische Details in Data-Modellen
  oder Storage-Metadaten, soweit sie nicht in Domain-Entscheidungen leaken.
- S3-kompatible Upload-/Download-Tickets an der Home-Hub-API-Grenze.

## Upload-Vertrag

Für Home-Hub-/Server-Uploads wird dieser Ablauf als Zielmuster akzeptiert:

```text
1. initiateUpload(metadata, size, contentType, checksum?)
2. client uploads bytes to returned target
3. confirmUpload(fileId, checksum)
4. Home Hub creates/updates InboxItem or FileRecord status
```

Der M2 darf diesen Flow für Microcks/OpenAPI modellieren, bevor der echte
Home Hub vollständig implementiert ist.

Die konkrete Upload-Transport-Strategie ist separat entschieden:
`DECISION_MOBILE_CAPTURE_UPLOAD_STRATEGY.md`. Der M2 darf API-proxied Upload
nutzen. Das Enterprise-Ziel bleibt presigned/resumable Upload gegen
S3-kompatiblen Storage. Beide Varianten bleiben hinter demselben
Upload-Strategy-/Storage-Port austauschbar.

## Security und Privacy

Dateien sind sensible Nutzdaten.

Deshalb gilt:

- keine Dokumentinhalte, Dateinamen mit sensiblen Details, Tokens oder
  presigned URLs in Logs.
- Upload-Tickets sind kurzlebig.
- Storage-Referenzen sind technische Daten, keine Berechtigung.
- spätere verschlüsselte Payloads müssen möglich bleiben.
- Secure Storage bleibt fuer Secrets und Schlüssel zuständig.

## Teststrategie

Die Storage-Grenze bekommt mehrere Testebenen:

- `FakeFileStore` fuer schnelle Domain-/UI-Tests.
- lokaler temp-directory File Store fuer Data-/Integrationstests.
- Microcks fuer Home-Hub-Upload-Verträge.
- später Docker/Compose mit MinIO fuer echte Storage-Integration.

Keine Tests verwenden private Dokumente oder echte Haushaltsdaten.

## Konsequenzen

- F10 Local Storage muss lokale Dateien als erste Storage-Strategie beschreiben.
- R3 Contract-/Mock-Setup soll MinIO nicht voraussetzen, aber den späteren
  Home-Hub-Upload-Flow contract-testbar machen.
- R4 Desktop/Mobile darf lokal ohne Docker funktionieren.
- R6 Home Hub sollte MinIO/S3-kompatiblen Storage im Compose-Zielbild einplanen.
- BusinessCompanions FileStorage/Databox-Ideen sind Referenz, nicht Kopiervorlage.

## Nicht entschieden

- konkrete Namen der Domain-Interfaces.
- konkrete lokale App-Verzeichnisse je Plattform.
- konkrete MinIO-Bucket-Struktur.
- Verschlüsselungsstrategie fuer lokale und remote Datei-Payloads.
