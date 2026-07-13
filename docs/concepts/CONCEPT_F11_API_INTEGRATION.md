---
title: "Konzept F11 - API Integration"
description: "Mappm-API-Konzept fuer Account, Core Assist, Managed Cloud, capture, Vault migration, identity, entitlements and backend-agnostic client boundaries"
tags: [concept, foundation, api, account, assist, cloud, capture, migration, identity, entitlements]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F11 - API Integration

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Normative Cloud Contract Model

This section supersedes customer Home-Hub/self-hosted assumptions later in this
file. OpenAPI is the source of truth for Mappm Cloud HTTP contracts; Microcks
owns contract scenarios; the Local Development Cloud and managed environments
must conform to the same accepted contract versions.

Contract families include identity/device/offline entitlement for every normal
mode, Core Assist job submission/status/cancel/delete, Vault/entitlement, capture,
metadata/payload transfer, migration inventory/checkpoint/verification,
export/delete, sync/conflict and later Advanced-Assist processing. Local Vault
Assist contracts never imply durable Cloud document storage. Frontend describes required
client states but Contract/Backend owners decide DTOs, endpoints, mapping,
persistence and policy architecture.

Dieses Konzept ersetzt den importierten F11-Inhalt aus dem alten Projekt.

## Legacy Detail Baseline (non-normative)

The remaining imported detail is retained only for migration context and useful
feature-specific examples. It must not authorize Home Hub, Tailscale, customer
self-hosting, universal local-first authority, old milestone scope or QR server
pairing. Where it differs, the rebaseline above,
`DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`,
`DECISION_COMMERCIAL_CORE_SCOPE.md` and F36 are authoritative. Before this
concept is used for implementation, its affected detail must be rewritten into
the phase's approved implementation contract.

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

## M2 API-Scope

Der M2 braucht nur einen kleinen API-Schnitt:

- Home-Hub Health Check.
- Geräte-Pairing oder Login-Grundlage.
- Mobile Capture Upload.
- Upload-Status.
- Draft-Inbox-Anlage auf dem Home Hub.
- optionale Übermittlung einer `caseId`.
- einfache Liste offener Vorgänge für Mobile, wenn verfügbar.

Nicht im M2:

- vollständiger Multi-Geräte-Sync.
- vollständige mobile Vorgangsverwaltung.
- OCR-/LLM-Pipeline-API.
- komplexes Rollenmodell.
- öffentliche Sharing-API oder externe App-Freigabe.

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

OpenAPI ist Contract Source of Truth fuer HTTP-APIs. Das bedeutet nicht automatisch, dass Client-Code generiert werden muss. Ob der M2-Client handgeschrieben oder generiert wird, bleibt eine Implementierungsentscheidung.

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

Die Upload-Transport-Implementierung ist austauschbar. Der M2 darf
API-proxied Upload nutzen. Das Enterprise-Ziel ist presigned/resumable Upload
ueber den Home Hub als Kontrollinstanz. Details stehen in
`docs/technical/DECISION_MOBILE_CAPTURE_UPLOAD_STRATEGY.md`.

Der fachliche Home-Hub-Capture-Vertrag ist separat entschieden in
`docs/technical/DECISION_HOME_HUB_CAPTURE_CONTRACT.md`. Fuer den R4-M2 gilt
ein OpenAPI/Microcks-faehiger 3-Schritt-Flow:
`initiateCaptureUpload -> uploadCaptureBytes -> confirmCaptureUpload`.

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

So kann der M2 klein starten und später wachsen, ohne UI und Domain umzubauen.

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

- Wird der M2-API-Client handgeschrieben oder aus OpenAPI generiert?
- Wie sieht Pairing konkret aus?
- Welche Upload-Größen sind realistisch?
- Brauchen Uploads Chunking schon im M2?

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
