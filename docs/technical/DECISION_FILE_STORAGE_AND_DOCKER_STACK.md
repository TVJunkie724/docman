---
title: "Decision - File Storage Strategy and Local Development Cloud Stack"
description: "Austauschbare Dateiablage fuer Local/Cloud Vault und containerisierter Local-Development-Stack"
tags: [decision, storage, files, docker, compose, s3, cloud, local-development]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "data-architect/backend"
---

# Decision - File Storage Strategy and Local Development Cloud Stack

## Entscheidung

Mappm trennt Dateiablage konsequent vom Domain-Modell. Fachliche Logik arbeitet
gegen einen File-Store-Port; konkrete Pfade, S3-Clients, Buckets und Upload-
Transporte bleiben Data-/Backend-Adapter.

```text
Domain Port
  -> DocumentFileStore

Data Adapter
  -> LocalVaultFileStore
  -> CloudVaultCacheAndPendingFileStore
  -> MappmCloudObjectStoreAdapter
  -> FakeFileStore
```

Die Local Development Cloud nutzt Container/Compose fuer den verwalteten
Backendstack mit synthetischen Daten. Sie ist keine kundenseitige
Self-Hosting-/NAS-Loesung.

## Local Vault

- Originaldateien liegen lokal autoritativ im App-/Vault-Dateispeicher.
- SQLite speichert Referenzen, Hashes, MIME, Groesse, Status und Beziehungen,
  nicht grosse Original-BLOBs.
- Previews/OCR-Indizes sind abgeleitet und als solche markiert.
- Betriebssystem-Backup und Filesystem-Exposure folgen der akzeptierten
  Security-/Backup-Policy.

## Cloud Vault

- Mappm Cloud ist Payload-Autoritaet.
- Clients halten policy-begrenzten Cache sowie ausstehende Uploads/Downloads.
- S3-kompatibler Object Storage ist der bevorzugte Backendadapter; konkreter
  Anbieter und Produkt sind austauschbar.
- Object Storage entscheidet keine Domain-, Rechte-, Retention- oder
  Lifecycle-Policy.

## Integritaet und Lifecycle

- Originale werden nie still veraendert.
- Hash/Checksum, Groesse, MIME und Manifest werden bei Transfer verifiziert.
- Cache Cleanup, User Delete, Vault Delete, Upload Cancel und Retention Cleanup
  sind getrennte Operationen.
- Quellendaten werden vor verifizierter Migration/Zielaktivierung nicht
  geloescht.
- Fehlende/korrupte Payload erzeugt einen sichtbaren Integrity-/Recovery-State.

## Local Development Cloud

Der lokale Stack repraesentiert API, PostgreSQL, S3-kompatiblen Storage,
Microcks und Workergrenzen der Managed Cloud. Er:

- verwendet ausschliesslich synthetische Daten und eigene Secrets.
- fuehrt akzeptierte Contracts und Migrationen aus.
- ist reproduzierbar ueber projektlokale Operations-Scripts.
- uebernimmt nie Production Accounts, Keys, Dokumente oder Telemetry.
- erscheint nicht in Production UI oder Produktdokumentation als
  Deploymentoption.

## Upload-Grenze

Capture verwendet den transportunabhaengigen Port aus
`docs/technical/DECISION_MOBILE_CAPTURE_UPLOAD_STRATEGY.md`. Presigned URLs,
Multipart/Resume und API-proxied Transfer sind Adapterdetails. Domain/UI sehen
nur Session, Fortschritt, Bestaetigung und Fehler.

## Security und Tests

- Keine Pfade, Storage Keys, URLs, Inhalte oder Secrets in Logs/Telemetry.
- Uploadziele sind kurzlebig und eng autorisiert.
- File-Store-Verzeichnisse und Caches sind pro Vault isoliert.
- Tests pruefen Atomizitaet, Crash/Restart, Hash, fehlende Datei, Cleanup-Race,
  Migration und Tenant-/Vault-Isolation.
- Fakes und Local Development Cloud verwenden synthetische Artefakte.

## Stop Rules

Stop, wenn Storage-SDKs in Domain/UI leaken, Object Storage als
Berechtigungssystem dient, Local Development Cloud als Kundenprodukt erscheint
oder Originale vor bestaetigter Lifecycle-Bedingung geloescht werden.
