---
title: "Konzept F11 - API Integration"
description: "DocMan-spezifisches API-Konzept für Home Hub, Capture Gateway, späteres Sync Backend, Repository-Grenzen und backend-agnostische App-Schnittstellen"
tags: [concept, foundation, api, home-hub, capture-gateway, sync, self-hosted]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F11 - API Integration

## Status

Accepted.

Dieses Konzept ersetzt den importierten F11-Inhalt aus dem alten Projekt.

## Zweck

F11 definiert, wie die DocMan App mit dem self-hosted Home Hub und späterem Sync Backend spricht.

Es entscheidet keine endgültige Backend-Technologie. Es definiert die App-Grenzen, damit PocketBase, Tailscale oder konkrete Frameworks nicht in Domain oder UI leaken.

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
- OpenAPI-Generator als Pflicht.
- Cloud-SaaS-Annahmen.

OpenAPI kann später sinnvoll sein, ist aber keine aktuelle Produktentscheidung.

## Capture Upload

Ein Capture Upload braucht fachlich:

- lokale Upload-ID.
- Datei.
- MIME-Type.
- Größe.
- Hash, sobald verfügbar.
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

## Capabilities

Die App sollte den Home Hub nach Fähigkeiten fragen können.

Beispiele:

- captureUploadSupported.
- pairingSupported.
- caseLookupSupported.
- syncSupported.
- ocrPipelineSupported.
- maxUploadSize.

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
- Remote DTOs nicht in Domain leaken.
- API-Fehler in F5-Failures gemappt werden.
- Tailscale/PocketBase nicht in Produktlogik erscheinen.
- spätere Sync-/Intelligence-Clients strukturell anschließbar sind.

## Offene Folgefragen

- Wird die MVP-API handgeschrieben oder über OpenAPI generiert?
- Welche Backend-Sprache implementiert den Home Hub?
- Wie sieht Pairing konkret aus?
- Welche Upload-Größen sind realistisch?
- Brauchen Uploads Chunking schon im MVP?

