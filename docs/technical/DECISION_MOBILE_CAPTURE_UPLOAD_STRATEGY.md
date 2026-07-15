---
title: "Decision - Mobile Capture Upload Strategy"
description: "Transportunabhaengiger Capture-Upload-Port fuer Mappm Cloud mit durablem Retry und spaeterem resumable Transport"
tags: [decision, mobile-capture, upload, cloud, api, s3, strategy, provider]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "data-architect/contract-api"
---

# Decision - Mobile Capture Upload Strategy

## Entscheidung

Mappm trennt den fachlichen Capture-Upload-Port vom Transport. Domain und UI
kennen Upload Session, Artefaktmanifest, Fortschritt, Bestaetigung, Retry und
Failure, aber weder HTTP-Form, Presigned URL noch Object-Storage-SDK.

```text
Domain/Application
  -> CaptureUploadPort

Data Adapter
  -> API-proxied Strategy
  -> Presigned/resumable Strategy
  -> Fake Strategy
```

Der konkrete C2-Ersttransport wird mit dem akzeptierten OpenAPI-Slice
entschieden. API-proxied Upload ist fuer kleine Artefakte zulaessig; der Vertrag
und lokale Queue-State muessen einen spaeteren Wechsel zu
presigned/resumable/multipart erlauben, ohne Domain oder Review-Flow umzubauen.

## Vault-Grenze

- Cloud Vault uebertraegt Capture-Artefakte an die verwaltete Mappm Cloud und
  bleibt serverautoritativ.
- Local Vault sichert Capture auf demselben Geraet autoritativ. Eine explizite
  Assist-Uebertragung ist ein Processing-Auftrag und kein Backup, Sync oder
  dauerhafter Cloud-Vault-Upload.
- Es gibt keinen impliziten Transfer an einen Desktop oder Customer Home Hub.

## Stabiler fachlicher Vertrag

```text
initiate(operation, manifest, policy facts)
  -> negotiated upload session
transfer(bytes oder parts)
  -> transport progress/checkpoints
confirm(session, manifest, checksums)
  -> durable artifact acceptance and queued processing
```

Erforderliche Eigenschaften:

- stabile Operation-/Session-IDs und Idempotency Keys.
- Checksum, Groesse, MIME und Manifest-Verifikation.
- per Dokument/Artefakt Fortschritt und Teilfehler.
- Restart-faehige lokale Queue.
- explizite Expiry-, Retry-, Cancel- und Cleanup-Semantik.
- Quota-/Entitlement-/Policy-Pruefung auf Serverseite.
- keine fachliche Case-/Record-Finalisierung beim Confirm.

## Artefaktmodell

Ein logisches Dokument kann Originalseiten und abgeleitete Renditions besitzen.
Das Manifest muss Quelle, Seitenreihenfolge und Ableitungsstatus unterscheiden.
Preview, PDF-Rendition und OCR-Ergebnis duerfen Originale nicht ersetzen.

Mobile schliesst eine Scan-Einheit pro logischem Dokument ab. Mehrere Dokumente
in einer technischen Session erhalten getrennte Upload-/Processing-Identitaet,
auch wenn ein Transport mehrere Artefakte buendelt.

## Transportentwicklung

### Kleiner erster Slice

API-proxied ist nur zulaessig, wenn akzeptierte Limits, Timeout-/Retry-Verhalten,
Idempotenz, Memory-/Streaming-Verhalten und Produktionsbenchmarks den aktivierten
Plattformen genuegen.

### Resumable Ziel

Presigned/resumable oder multipart wird aktiviert, sobald Groesse, Mobilnetz,
SLO oder Kosten es rechtfertigen. Uploadtickets sind kurzlebig, eng an Account,
Device, Vault und Operation gebunden. Parts und Gesamtobjekt werden verifiziert,
bevor Processing startet.

Der Wechsel ist ein Data-/Contract-Adapterwechsel, keine neue Domainsemantik.

## Retry, Idempotenz und Cleanup

- Retry wiederholt nie ungeschuetzt eine bereits bestaetigte Operation.
- Wiederholtes Confirm liefert denselben fachlichen Zustand.
- App-Neustart setzt an durablem Checkpoint fort oder startet kontrolliert mit
  demselben Idempotency Key neu.
- Abgebrochene/abgelaufene Sessions werden nach definierter serverseitiger
  Retention bereinigt.
- Lokale Originale werden erst nach bestaetigter Uebernahme und anwendbarer
  Lifecycle-Policy aufraeumbar.

Exakte Limits und Retention gehoeren in den Contract-/Policy-Slice, nicht als
unbelegte Konstanten in die Flutter-App.

## Security und Privacy

- Keine Uploadtickets, Presigned URLs, Tokens, Storage Keys, Dokumentinhalte,
  OCR-Texte oder sensitive Dateinamen in Logs/Telemetry.
- Storage Key ist keine Berechtigung.
- Server validiert Content-Type, Groesse, Manifest und Checksum.
- Malware-/Content-Validation wird pro aktivierter Plattform/Policy bewertet.
- Verschluesselungs- und Key-Grenzen duerfen durch Transportwahl nicht verbaut
  werden.

## Tests und Verifikation

- Fake-Port fuer App-/Notifier-/Widget-Tests.
- Microcks fuer Initiate/Confirm/Failure-Contract.
- Adaptertests fuer Stream, Timeout, Cancel, Restart und Idempotency Replay.
- Integration gegen Local Development Cloud mit synthetischen Artefakten.
- Produktionsnahe Mobile-Netz-/Groessenbenchmarks vor Transportfreigabe.
- Privacy-Test fuer Logs, URLs und Diagnosepakete.

## Stop Rules

Stop, wenn:

- UI oder Domain HTTP-/S3-Details kennt.
- C2 pauschal Whole-file Retry ohne gemessene Limits und SLO freigibt.
- Confirm Routing finalisiert oder Originale vorzeitig loescht.
- ein Transportwechsel Domain-/Review-Code umbauen muss.
- Local-Vault-Assist als Cloud-Backup dargestellt wird.

## Handoff

Lokale Queue/Persistenz geht an `data-architect`; OpenAPI/Policy an
`contract-api`; Backendtransport in ein getrenntes Backend-Issue;
Qualitaetsnachweise an `quality-readiness`.
