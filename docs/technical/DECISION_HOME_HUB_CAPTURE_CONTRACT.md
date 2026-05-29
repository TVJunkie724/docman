---
title: "Decision - Home Hub Capture Contract"
description: "Entscheidung zum fachlichen API-Vertrag fuer Mobile-Capture-Uploads an den Home Hub und Draft-Inbox-Handoff"
tags: [decision, home-hub, mobile-capture, openapi, microcks, upload, draft-inbox]
lastUpdated: "2026-05-14"
status: "accepted"
---

# Decision - Home Hub Capture Contract

## Status

Accepted.

## Entscheidung

Der R4-M2 verwendet fuer Mobile Capture einen fachlichen 3-Schritt-Vertrag:

```text
1. initiateCaptureUpload
2. uploadCaptureBytes
3. confirmCaptureUpload
```

Der M2-Transport darf API-proxied sein. Der Vertrag bleibt aber so modelliert,
dass presigned/resumable Uploads spaeter hinter demselben fachlichen Vertrag
moeglich bleiben.

OpenAPI ist die Contract Source of Truth. Microcks muss die relevanten
Erfolgs-, Fehler- und Retry-Szenarien vor echter Home-Hub-Implementation
simulieren koennen.

## Contract Flow

### 1. initiateCaptureUpload

Mobile teilt dem Home Hub mit, dass ein Scan-Paket hochgeladen werden soll.

M2-Felder:

- `deviceId`
- `idempotencyKey`
- `profileId?`
- `caseId?`
- `pageCount`
- `totalSizeBytes`
- `contentType`
- `sha256`
- `captureSource`
- `createdAt`
- `artifactManifest`

Der Home Hub prueft:

- Device Token und Pairing.
- Upload-Policy aus `DECISION_UPLOAD_LIMITS_RETRY_RESUME_CLEANUP.md`.
- Idempotency.
- optionalen Profil-/Vorgangskontext.

### 2. uploadCaptureBytes

Mobile laedt die Bytes des Upload-Pakets hoch.

Im M2 ist das ein API-proxied Upload an den Home Hub. Storage-Details,
Buckets, presigned URLs oder MinIO-Schluessel leaken nicht in Domain oder UI.

### 3. confirmCaptureUpload

Mobile bestaetigt, dass die Bytes uebertragen wurden.

Der Home Hub prueft:

- Auth/Device Token.
- Upload Session.
- Groesse.
- MIME-Type.
- SHA-256.
- Vollstaendigkeit des Artefakt-Manifests.
- Idempotency.
- optionalen `caseId`/`profileId`.

Erst nach erfolgreichem Confirm erzeugt oder bestaetigt der Home Hub einen
Draft-Inbox-Eintrag.

## Invalid Context Fallback

Ein ungueltiger oder inzwischen geloeschter `caseId` darf den Upload nicht
zerstoeren.

Wenn der Datei-Upload valide ist, aber der Kontext nicht mehr passt, landet das
Dokument in der Draft-Inbox mit Review-Hinweis. Der Nutzer kann es spaeter am
Desktop neu zuordnen.

## Response Model

Antworten liefern mindestens:

- `uploadSessionId`
- `status`
- `inboxItemId?`
- `requiresReview`
- `acceptedContext`
- `retryAfter?`
- `errorCode?`
- `errorCategory?`

Statuswerte muessen zu den Queue- und Upload-Zustaenden aus
`DECISION_UPLOAD_LIMITS_RETRY_RESUME_CLEANUP.md` passen.

## Error Semantics

Fehler sind maschinenlesbar. Mobile muss unterscheiden koennen:

- Retry spaeter.
- Re-Pairing erforderlich.
- Upload splitten oder reduzieren.
- finaler Validierungsfehler.
- Review am Desktop erforderlich.

M2-Fehlerklassen:

- `auth_required`
- `device_revoked`
- `payload_too_large`
- `unsupported_media_type`
- `validation_failed`
- `checksum_mismatch`
- `session_expired`
- `context_invalid_review_required`
- `conflict`
- `rate_limited`
- `server_retryable`
- `unexpected`

## Microcks Scenarios

R4.6 muss mindestens diese Szenarien modellieren:

- initiate success.
- upload bytes success.
- confirm success with Draft-Inbox item.
- idempotent repeated confirm.
- invalid case/profile context with review fallback.
- payload too large.
- unsupported media type.
- validation failure.
- checksum mismatch.
- expired session.
- revoked/expired device token.
- rate limited with `retryAfter`.
- retryable server failure.

Alle Beispiele muessen synthetisch sein und duerfen keine echten Dokumentnamen,
Haushaltsdaten, Tokens oder Dateiinhalte enthalten.

## Security and Privacy

- Keine Tokens, presigned URLs, Dokumentinhalte, OCR-Texte oder sensitiven
  Dateinamen in Logs, Specs oder Mock Examples.
- Idempotency Keys duerfen in Diagnose nur gehasht erscheinen.
- Storage-Keys sind technische Adapterdaten, keine Domain- oder UI-Daten.
- Der Contract darf spaetere verschluesselte Payloads nicht verhindern.

## Konsequenzen

- R4.6 kann den OpenAPI/Microcks-Spec konkret erstellen.
- R4.7 kann den API-proxied Upload gegen denselben fachlichen Vertrag bauen.
- F11 API Integration verweist auf diesen Capture-Vertrag.
- R4-D15 ist entschieden, ohne die konkrete ASP.NET-Core-Implementation vorwegzunehmen.

## Nicht entschieden

- exakte URL-Pfade und Operation-IDs.
- konkrete Ablage der OpenAPI-Datei.
- ob der M2-Client handgeschrieben oder aus OpenAPI generiert wird.
- welche presigned/resumable Variante spaeter zuerst umgesetzt wird.
