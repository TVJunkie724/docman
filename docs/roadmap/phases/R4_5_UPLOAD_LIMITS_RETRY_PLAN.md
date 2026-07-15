---
title: "R4.5 Phase Contract - Upload Policy, Retry, Resume and Cleanup"
description: "Implementation Contract für robuste Capture-Uploads ohne historische Hardcodes"
tags: [roadmap, phase, capture, upload, retry, idempotency, cleanup, contracts]
lastUpdated: "2026-07-15"
status: "planned-not-approved"
owner: "contract-api/operations"
---
# R4.5 Phase Contract - Upload Policy, Retry, Resume and Cleanup

## Status und Freigabe

Planungsbereit, nicht zur Implementierung freigegeben. Vor Start müssen C0/C1-
Trust-, Vault-, Account-, Provider- und Contract-Gates sowie die aktuelle
Upload-Policy akzeptiert sein.

## Ziel

Capture-Artefakte werden auf Mobile und Desktop dauerhaft, idempotent,
restart-fest und ohne Datenverlust an den für den aktiven Vault gültigen
Speicher-/Processing-Pfad übergeben. Konkrete Limits werden nicht aus früheren
Prototypannahmen übernommen, sondern datiert gemessen und versioniert.

## Scope

- versionierte, serverautoritative Upload-Policy;
- Client-Preflight ohne doppelte Hardcodes;
- persistente Queue und fachlich getrennte Upload-/Processing-Zustände;
- Initiate, Transfer, Integrity Verify und Confirm;
- Idempotency, Retry und bei Bedarf Resume/Multipart;
- Entitlement, Quota, Session-Expiry und Reauth;
- sichere Cancel-, Retention- und Cleanup-Regeln;
- privacy-sichere Status-, Accessibility- und Supportinformationen;
- OpenAPI-/Microcks-Szenarien sowie Backend-/Client-Verifikation.

## Out of Scope

- konkrete final sichtbare Capture-/Review-UI;
- OCR-, Matching- oder Workflow-Logik;
- Customer Home Hub, Pairing oder Self-hosting;
- feste Datei-/Seitenwerte ohne Mess- und Operationsnachweis;
- automatische Löschung fachlicher Dokumente;
- Auswahl der Backend-Persistence durch das Frontend.

## Subphasen

| Slice | Deliverable | Owner/Handoff |
|---|---|---|
| R4.5.1 Policy and Evidence | MIME-, Größen-, Seiten-, Zeit-, Quota-, Integrity- und Retention-Policy mit Datum, Owner, Environment und Messwerten | Product + Backend/Ops + Security |
| R4.5.2 Contract | OpenAPI, stabile Failure Codes, Retryability, Idempotency und synthetische Microcks-Beispiele | Contract/API |
| R4.5.3 Durable Queue | restart-feste lokale Zustände, Pending Operations, Checkpoints und Vault-Semantik | Data + Frontend Foundation |
| R4.5.4 Transfer Strategy | API/streaming/presigned/multipart hinter einem Port gemäß gemessener Schwellen | Backend/API + Client Adapter |
| R4.5.5 Cleanup Lifecycle | Cancel, Expiry, lokale/remote Retention, Race Protection und Audit | Backend/Ops + Data Lifecycle |
| R4.5.6 UX/Error Contract | progressive Statusanzeige, Aktionen, A11y, redigierte Diagnose | UI Concept + Error Handling |
| R4.5.7 Verification | Boundary-, Retry-, Restart-, Integrity-, Quota-, Race-, Security- und Contract-Tests | QA/Quality Readiness |

Frontend und Backend erhalten getrennte Implementation Issues. Das Frontend
darf benötigte Fähigkeiten und Fehlerzustände beschreiben; Backend/API besitzt
DTOs, Endpunkte, Mapping, Persistence, Policies und Operationswerte.

## Zustandsanforderung

Der freigegebene Contract unterscheidet mindestens:

```text
capturedDurable
waitingForEligibilityOrConnection
initiating
transferring
transferredPendingVerification
confirmedQueuedForProcessing
failedRetryable
failedUserAction
cancelledPendingCleanup
expired
```

Namen dürfen sich im Contract ändern; folgende Semantik nicht: gesendete Bytes
sind keine dauerhafte Bestätigung, Processing ist ein getrennter Zustand und
Retry erzeugt keine zweite fachliche Operation.

## Daten-, Security- und Privacy-Regeln

- Originale bleiben bis zur nachgewiesenen sicheren Übergabe und gemäß
  Vault-Lifecycle erhalten.
- Local Vault und Cloud Vault behalten ihre unterschiedliche Authority.
- Upload-Tickets, Tokens, URLs, Dateinamen und Inhalte erscheinen nicht in
  normalen Logs, Telemetrie oder Benachrichtigungen.
- Clientvalidierung ist UX, Servervalidierung bleibt autoritativ.
- Cleanup unterscheidet Original, Pending Upload, bestätigte Payload,
  abgeleitete Artefakte und fachliche Löschung.
- Quota, Rate Limit, Auth, Authorization, Validation und Provider-Ausfall sind
  getrennte Failures mit klarer Nutzer-/Supportaktion.

## Pflichtverifikation

- direkt unter, auf und über jeder Policygrenze;
- Offline, App-Kill, Prozessneustart, Ticket-Expiry und verlorene Response;
- mehrfaches Initiate/Confirm mit derselben Idempotency;
- Partial Batch, Checksum-/Manifest-/Part-Fehler;
- Entitlement, Quota, Rate Limit, Reauth und fehlende Berechtigung;
- Cleanup-Races mit Retry, Confirm, Processing und Nutzerlöschung;
- synthetische Mobilnetz-, Speicher- und Worst-Case-Benchmarks;
- Client gegen Microcks und Server gegen denselben OpenAPI-Vertrag;
- Redaction-Nachweis für Logs, Telemetrie und Supportpaket.

## Akzeptanzkriterien

- Policy und SLO besitzen Datum, Owner, Environment und Begründung.
- Flutter und Backend verwenden denselben versionierten Contract statt
  duplizierter Grenzwerte.
- Restart und Retry verlieren nichts und erzeugen keine Dubletten.
- UI kann jeden handlungsrelevanten Zustand verständlich und barrierearm
  darstellen.
- Cleanup ist idempotent, auditierbar und gegen aktive Transaktionen geschützt.
- alle Pflichtverifikationen sind grün und als Evidence verlinkt.

## Stop Rules

Stop, wenn historische Grenzwerte ungeprüft übernommen werden, Client und
Server abweichende Policies besitzen, `bytes sent` als Abschluss gilt, ein
Original durch Cleanup/Retry verloren gehen kann, Whole-upload-Retry trotz
negativer Messwerte erzwungen wird oder Security-/Operations-Owner fehlen.

## Handoff

Maßgeblich ist
`docs/technical/DECISION_UPLOAD_LIMITS_RETRY_RESUME_CLEANUP.md`. Nach
Freigabe gehen Contract/API, Backend/Ops, Data/Queue und Frontend/UX in
getrennte Issues mit gegenseitigen Links und gemeinsamer Verification Matrix.
