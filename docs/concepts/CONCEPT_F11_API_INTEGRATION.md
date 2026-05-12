---
title: "Konzept F11 - API Integration"
description: "DocMan-spezifisches API-Konzept für Home Hub, Capture Gateway, späteres Sync Backend, Repository-Grenzen und backend-agnostische App-Schnittstellen"
tags: [concept, foundation, api, home-hub, capture-gateway, sync, self-hosted]
lastUpdated: "2026-05-11"
version: "3.3"
status: "accepted"
---

# Konzept F11 - API Integration

## Status

Accepted.

Dieses Konzept ersetzt den importierten F11-Inhalt aus dem alten Projekt.

## Zweck

F11 definiert, wie die DocMan App mit dem self-hosted Home Hub und späterem Sync Backend spricht.

Die Home-Hub-Zieltechnologie ist inzwischen separat entschieden:
ASP.NET Core + PostgreSQL + MinIO/S3-kompatibler Storage + Microcks. F11
definiert weiterhin die App-Grenzen, damit PocketBase, Tailscale,
ASP.NET-spezifische Typen, Datenbank-SDKs oder Storage-SDKs nicht in Domain oder
UI leaken.

API-Vertraege fuer Home Hub, Capture und spaeter Sync werden als OpenAPI-Spezifikationen gefuehrt. Microcks ist der geplante Contract-Mock- und Verification-Runner. Details stehen in `docs/technical/DECISION_API_CONTRACT_MOCKS.md`.

## Grundsatz

Die App spricht fachlich mit einem DocMan Backend, nicht mit Tailscale, PocketBase oder einem bestimmten SDK.

```text
DocMan App
  -> HomeHubClient / SyncClient
      -> HTTP/API Transport
          -> self-hosted DocMan Server Stack
```

## MVP API-Scope

Der MVP braucht nur einen kleinen API-Schnitt:

- Home-Hub Health Check.
- Geräte-Pairing oder Login-Grundlage.
- Mobile Capture Upload.
- Upload-Status.
- Draft-Inbox-Anlage auf dem Home Hub.
- optionale Übermittlung einer `caseId`.
- einfache Liste offener Vorgänge für Mobile, wenn verfügbar.

Nicht im MVP:

- vollständiger Multi-Geräte-Sync.
- vollständige mobile Vorgangsverwaltung.
- OCR-/LLM-Pipeline-API.
- komplexes Rollenmodell.
- öffentliche Sharing-API.

## API-Grenzen

| Client | Rolle |
|---|---|
| HomeHubClient | Health, Capabilities, Pairing, Capture Upload |
| CaptureGatewayClient | Upload-spezifische Operationen, falls getrennt |
| SyncClient | späterer vollständiger Sync |
| IntelligenceClient | spätere OCR-/LLM-Job-Schnittstelle |

Diese Clients sind Data-/Infrastructure-Details. Domain spricht über Repository-Verträge.

## Repository-Regel

Presentation und Domain dürfen keine API-Clients kennen.

```text
Presentation / Riverpod
  -> Repository Contract
      -> Data Repository
          -> API Client
```

Remote DTOs werden in Data gemappt. DTOs sind keine Domain-Entities.

## Backend-Agnostik

F11 verbietet harte Abhängigkeiten auf:

- PocketBase RecordModel oder SDK-Typen.
- Tailscale-Begriffe.
- konkrete Server-Frameworks.
- Cloud-SaaS-Annahmen.

OpenAPI ist Contract Source of Truth fuer HTTP-APIs. Das bedeutet nicht automatisch, dass Client-Code generiert werden muss. Ob der MVP-Client handgeschrieben oder generiert wird, bleibt eine Implementierungsentscheidung.

## Capture Upload

Ein Capture Upload braucht fachlich:

- lokale Upload-ID.
- Datei oder Artefakt-Manifest.
- MIME-Type.
- Größe.
- Hash, sobald verfügbar.
- Idempotency Key.
- Erfassungszeitpunkt.
- optionales Profil.
- optionale `caseId`.
- optionale Notiz.

Antwort des Home Hub sollte mindestens liefern:

- remote Upload-ID oder Draft-ID.
- Status.
- ob die Zuordnung akzeptiert wurde.
- ob Review erforderlich ist.
- Fehlerklassifikation nach F5.

Die Upload-Transport-Implementierung ist austauschbar. Der MVP darf
API-proxied Upload nutzen. Das Enterprise-Ziel ist presigned/resumable Upload
ueber den Home Hub als Kontrollinstanz. Details stehen in
`docs/technical/DECISION_MOBILE_CAPTURE_UPLOAD_STRATEGY.md`.

## Capabilities

Die App sollte den Home Hub nach Fähigkeiten fragen können.

Beispiele:

- captureUploadSupported.
- pairingSupported.
- caseLookupSupported.
- syncSupported.
- ocrPipelineSupported.
- maxUploadSize.
- uploadTransport.
- resumableUploadSupported.

So kann der MVP klein starten und später wachsen, ohne UI und Domain umzubauen.

## Auth und Security

F11 definiert nicht die sichere Speicherung. Das gehört zu F12.

F11 erwartet aber:

- keine Tokens in Logs.
- Auth-/Pairing-Header nur in API-Infrastruktur.
- Session-/Gerätefehler werden als F5-Failures gemappt.
- API-Clients können mit und ohne Auth/Pairing initialisiert werden, soweit für Setup nötig.

## Error Mapping

API-Fehler werden nach F5 gemappt:

- Timeout/Unreachable -> NetworkFailure.
- 401/403 -> AuthFailure oder PermissionFailure.
- 409 -> ConflictFailure.
- 413 -> UploadFailure Datei zu groß.
- 422 -> ValidationFailure.
- 5xx -> retryable UploadFailure oder NetworkFailure.
- ungültige Antwort -> ParseFailure.

## Transport

Der frühe Zieltransport ist normales HTTP(S) im privaten Netz.

Tailscale kann die Erreichbarkeit herstellen, ist aber unterhalb der App-Grenze.

Die App konfiguriert:

- Backend URL.
- Pairing/Auth-Zustand.
- Capabilities.
- Timeouts.

## Spätere Sync API

Vollständiger Sync wird nicht in F11 final entschieden.

F11 hält nur fest, dass spätere Sync-Schnittstellen brauchen:

- Änderungsjournal.
- seit-Version/seit-Zeitpunkt-Abfrage.
- Tombstones.
- Konfliktinformationen.
- Dateireferenz oder Dateiübertragung.
- Geräte-ID.

## Definition of Done für F11

F11 gilt als umgesetzt, wenn:

- App-API-Zugriffe hinter Data-Repositories liegen.
- Home-Hub-Health und Capture Upload konzeptionell klar sind.
- API-Vertraege fuer Home Hub/Capture als OpenAPI-Spezifikationen geplant sind.
- Microcks-Szenarien fuer Erfolg, Auth, Validation, Retry und Serverfehler vorgesehen sind.
- Remote DTOs nicht in Domain leaken.
- API-Fehler in F5-Failures gemappt werden.
- Tailscale/PocketBase nicht in Produktlogik erscheinen.
- spätere Sync-/Intelligence-Clients strukturell anschließbar sind.

## Offene Folgefragen

- Wird der MVP-API-Client handgeschrieben oder aus OpenAPI generiert?
- Wie sieht Pairing konkret aus?
- Welche Upload-Größen sind realistisch?
- Brauchen Uploads Chunking schon im MVP?
