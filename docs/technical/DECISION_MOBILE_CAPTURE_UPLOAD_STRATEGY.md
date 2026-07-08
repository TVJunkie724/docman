---
title: "Decision - Mobile Capture Upload Strategy"
description: "Entscheidung fuer einen austauschbaren Upload-Strategy-Port mit API-proxied M2 und presigned/resumable Enterprise-Zielbild"
tags: [decision, mobile-capture, upload, home-hub, api, minio, s3, strategy, provider]
lastUpdated: "2026-05-11"
status: "accepted"
---

# Decision - Mobile Capture Upload Strategy

## Status

Accepted.

## Entscheidung

Mappm trennt den fachlichen Upload-Vertrag vom konkreten Upload-Transport.

Der M2 darf mit **API-proxied Upload** starten. Das Enterprise-Zielbild bleibt
**presigned, content-addressed und resumable Upload** ueber den Home Hub als
Kontrollinstanz.

Beide Varianten implementieren denselben fachlichen Port:

```text
Application / Domain-facing contract
  -> CaptureUploadRepository / CaptureUploadPort

Data strategies
  -> ApiProxiedCaptureUploadStrategy
  -> PresignedStorageCaptureUploadStrategy
  -> FakeCaptureUploadStrategy

Riverpod
  -> captureUploadStrategyProvider wires the active implementation
```

Der Begriff `provider` beschreibt die Verdrahtung. Der fachliche Schutz kommt
vom Port/Interface und den stabilen Upload-Session-Begriffen.

## Stabiler Upload-Vertrag

Unabhaengig vom Transport gilt dieses Zielmuster:

```text
1. initiateUpload(metadata, artifacts, size, contentType, checksum?, idempotencyKey)
2. upload bytes or parts to returned upload target
3. confirmUpload(uploadSessionId, checksum, artifactManifest)
4. Home Hub validates and creates/updates FileRecord, DocumentVersion and InboxItem
```

Der Home Hub bleibt immer Autoritaet fuer:

- Pairing/Auth und Device Token.
- Upload Session.
- erlaubte MIME-Typen und Groessen.
- Profil-/Vorgangs-/Draft-Kontext.
- Idempotency.
- Quota und Policy.
- Hash-/Checksum-Verifikation.
- finalen FileRecord-/DocumentVersion-/Inbox-Zustand.

Object Storage ist nur Byte-Speicher, nicht Produktlogik.

## M2-Transport: API-proxied

Im M2 ist API-proxied Upload erlaubt und bevorzugt, wenn er die Umsetzung
vereinfacht.

```text
Mobile
  -> Home Hub API initiateUpload
  -> Home Hub API upload bytes
  -> Home Hub API confirmUpload
  -> Draft-Inbox
```

Vorteile fuer den M2:

- einfacher mit Pairing/Auth zu sichern.
- einfacher zu debuggen.
- einfacher in OpenAPI/Microcks zu modellieren.
- keine fruehe presigned-MinIO-/S3-Komplexitaet im Mobile Slice.
- keine direkte Storage-Integration auf Mobile noetig.

Der M2 darf Uploads als ganze Datei retryen. Chunking/Multipart ist kein
M2-Muss, solange klare Groessenlimits und Fehlerzustaende existieren.

## Enterprise-Ziel: Presigned und resumable

Das langfristige Zielbild:

```text
Mobile
  -> Home Hub API initiateUpload(metadata, artifacts, checksum, size)
  -> Home Hub prueft Auth, Policy, Quota und Kontext
  -> Home Hub erzeugt kurzlebige Upload-Ziele
  -> Mobile laedt Bytes oder Parts direkt in Object Storage
  -> Mobile ruft confirmUpload(checksum, parts, artifactManifest)
  -> Home Hub validiert Hash, Size, Content-Type und Vollstaendigkeit
  -> Home Hub erstellt FileRecord, DocumentVersion und InboxItem
  -> Worker erzeugt Preview, OCR, Index und Cleanup async
```

Enterprise-Anforderungen:

- kurzlebige Upload-Tickets oder presigned URLs.
- verpflichtende Checksums/Hashes.
- Idempotency Keys gegen doppelte Uploads.
- Upload Session Status: `created`, `uploading`, `uploaded`, `verified`,
  `failed`, `expired`.
- Artefakt-Manifest fuer `sourceImages`, `pdfRendition`, `preview` und spaeter
  OCR-/Text-Artefakte.
- klare Groessenlimits und Quotas.
- Cleanup fuer abgebrochene Uploads.
- Audit Events ohne Dokumentinhalte, sensible Dateinamen, Tokens oder URLs.
- optionale Content-/MIME-/Malware-Validation vorbereiten.
- client-side-encryption-/E2EE-faehiges Modell vorbereiten.
- resumable oder multipart Uploads fuer groessere Scans spaetere Milestones.

## Artefakt-Manifest

Mobile Capture darf mehr als eine Datei erzeugen.

Der Upload-Vertrag muss deshalb ein Artefakt-Manifest vorbereiten:

```text
CaptureUploadManifest
  -> pdfRendition?
  -> sourceImages[]
  -> preview?
  -> metadata
  -> scanQuality
  -> pageCount
  -> createdAt
```

Im M2 kann das Manifest minimal sein. Es muss aber spaeter Rohseiten,
PDF-Rendition, Previews und OCR-/Processing-Ergebnisse aufnehmen koennen, ohne
den Upload-Port neu zu erfinden.

## Fehler, Retry und Idempotency

Die konkreten M2-Grenzen fuer Upload-Limits, Retry, Resume-Verzicht und
Cleanup sind in `DECISION_UPLOAD_LIMITS_RETRY_RESUME_CLEANUP.md`
entschieden. Diese Strategieentscheidung bleibt fuer den Transport-Schnitt
zustaendig.

M2:

- Retry ganzer Uploads.
- Upload Session bleibt lokal queued.
- Idempotency Key verhindert doppelte Drafts bei erneutem Confirm.
- 413, 422, 401/403, 409 und 5xx werden nach F5 gemappt.

spaetere Milestones:

- resumable/multipart Upload.
- Parts mit Checksums.
- Session-Recovery nach App-Neustart.
- serverseitiges Cleanup abgelaufener Sessions.

## Security und Privacy

Dateien und viele Metadaten sind sensibel.

Regeln:

- keine Upload-Tickets, presigned URLs, Tokens, Hash-Inputs mit sensiblen
  Kontextdaten oder Dokumentinhalte in Logs.
- technische Storage Keys sind keine Berechtigung.
- Upload Tickets sind kurzlebig.
- Confirm prueft Checksum/Size/Content-Type.
- Home Hub gibt keine Storage-Interna an Domain/UI weiter.
- spaetere verschluesselte Payloads muessen moeglich bleiben.

## Contract- und Teststrategie

OpenAPI/Microcks modellieren die fachliche Upload-Session, nicht nur den
aktuellen Transport.

Mindestszenarien:

- initiate success.
- upload success.
- confirm success.
- idempotent retry.
- invalid/expired session.
- auth failure.
- validation failure.
- payload too large.
- checksum mismatch.
- server retryable failure.

Flutter App-Tests verwenden `FakeCaptureUploadStrategy`. Sie sprechen nicht mit
Microcks und nicht mit MinIO.

## Konsequenzen

- R4-D13 ist entschieden: Upload-Transport ist austauschbar per Strategy/Port
  und Riverpod Provider.
- M2 startet pragmatisch mit API-proxied Upload, falls das schneller und
  sicherer fuer den ersten Slice ist.
- OpenAPI muss den Enterprise-Zielvertrag vorbereiten.
- MinIO/S3 bleibt Data-/Server-Adapter, nicht Domain- oder UI-Begriff.
- Der spaetere Wechsel auf presigned/resumable Upload darf Domain, UI und
  Draft-Inbox-Flow nicht umbauen.

## Nicht entschieden

- konkrete Endpoint-Namen.
- ob presigned Upload zuerst single-object oder multipart umgesetzt wird.
- konkrete Verschluesselungsstrategie fuer remote Payloads.
