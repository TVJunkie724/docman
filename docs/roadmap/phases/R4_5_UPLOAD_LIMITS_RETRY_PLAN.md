---
title: "R4.5 Phase Plan - Upload Limits, Retry and Cleanup"
description: "Implementation-faehige Subphasen fuer R4-D14: Mobile-Capture-Upload-Limits, Queue-Retry, Idempotency, Cleanup, Contract-Anforderungen und Observability"
tags: [roadmap, phase-plan, r4, mobile-capture, upload, retry, cleanup, observability]
lastUpdated: "2026-05-14"
status: "proposed"
---

# R4.5 Phase Plan - Upload Limits, Retry and Cleanup

## Zweck

R4.5 macht `R4-D14` implementation-faehig.

Die Entscheidung steht in:

- `docs/technical/DECISION_UPLOAD_LIMITS_RETRY_RESUME_CLEANUP.md`

R4.5 ist kein eigener Produkt-Feature-Block. Es ist die robuste Upload-Basis
zwischen:

- R4.4 Mobile Scan Client.
- R4.6 Home Hub Capture Contract.
- R4.7 API-proxied Upload Slice.
- R4.13 Security/Privacy M2 Gate.
- R4.14 QA/Regression M2 Gate.

## Zielbild

Mobile Capture muss im M2 verhindern, dass Uploads still verloren gehen,
doppelt in der Draft-Inbox landen oder unerklärt haengen bleiben.

Mobile Capture darf im M2 aber bewusst auf komplexes Chunking/Resume
verzichten.

R4.5 liefert deshalb:

- Upload-Policy mit Limits.
- persistente Queue-Zustandsmaschine.
- Retry- und Backoff-Regeln.
- Idempotency-Regeln.
- Cleanup-/Retention-Regeln.
- Contract-Anforderungen fuer Home Hub/Microcks.
- redigierte Diagnose- und Observability-Regeln.
- Tests/Fakes fuer diese Grenzen.

## R4.5 Subphasen

| Subphase | Ziel | Deliverables | Primaere Saeulen |
|---|---|---|---|
| R4.5.1 Upload Policy and Validation | Limits fachlich und technisch greifbar machen | UploadPolicy, erlaubte MIME-Typen, 25 Seiten/50 MB, 30 MB/15 Seiten Warnung, SHA-256 Pflicht | Capture & Inbox, Security/Privacy |
| R4.5.2 Queue State Machine | Upload-Zustaende eindeutig modellieren | queued/uploading/uploadedPendingConfirm/completed/failedRetryable/failedFinal/cancelled, State-Transitions, Persistenzanforderungen | Capture & Inbox, Data Lifecycle |
| R4.5.3 Retry and Idempotency | Wiederholungen ohne doppelte Drafts planen | Backoff-Regeln, Retry-Klassifikation, stabiler idempotencyKey, Re-Pairing-Grenze | Capture & Inbox, Home Hub & Sync |
| R4.5.4 Cleanup and Retention | lokale und serverseitige Aufraeumregeln festlegen | 7-Tage-Retention fuer bestaetigte Rohartefakte, manuelles Verwerfen, expired Sessions, keine stille Loeschung | Data Lifecycle, Admin/Settings |
| R4.5.5 Contract Requirements | R4.6 vorbereiten, ohne OpenAPI hier zu schreiben | benoetigte Fehlercodes, Microcks-Szenarien, Confirm-/Checksum-Regeln, invalid context fallback | Home Hub & Sync, QA |
| R4.5.6 UX and Diagnostics Requirements | Upload-Zustaende erklaerbar machen | Queue-Status, Fehlertexte als Anforderung, redigierte Diagnosefelder, keine sensiblen Logs | Design System/UX, Observability |
| R4.5.7 Test Fixtures and Gates | R4.5 verifizierbar machen | FakeCaptureUploadStrategy-Szenarien, Queue-State-Tests, Policy-Tests, Contract-Szenario-Liste | QA, DX/Governance |

## Dependencies

| Dependency | Warum |
|---|---|
| `DECISION_MOBILE_CAPTURE_UPLOAD_STRATEGY.md` | legt Upload-Port und API-proxied/presigned Zielbild fest |
| `DECISION_UPLOAD_LIMITS_RETRY_RESUME_CLEANUP.md` | legt R4-D14 fachlich fest |
| `CONCEPT_F17_MOBILE_CAPTURE_PLAN.md` | Mobile-Capture-Client-Regeln |
| `CONCEPT_F10_LOCAL_STORAGE.md` | persistente Queue und lokale Artefakte |
| `CONCEPT_F11_API_INTEGRATION.md` | API-/Contract-Grenze |
| `CONCEPT_F12_SECURE_STORAGE.md` | Token/Secret-Trennung |
| `CONCEPT_F18_NOTIFICATIONS_FAILURES_OBSERVABILITY.md` | Failure/Notification/Observability-Basis |
| `DECISION_API_CONTRACT_MOCKS.md` | OpenAPI/Microcks als Contract-Quelle |

## Out of Scope

R4.5 baut nicht:

- echten Home Hub.
- echten OpenAPI-Spec.
- echte Scanner-Bridge.
- echten Upload-Transport.
- presigned Uploads.
- resumable/multipart Uploads.
- Push Notifications.
- Admin-Konsole fuer Storage Health.

Diese Arbeit gehoert in R4.6, R4.7, R6, R7 oder R11.

## Subphase Details

### R4.5.1 Upload Policy and Validation

Implementierungsziel:

- Eine zentrale Upload-Policy verhindert verstreute Magic Numbers.
- Mobile kann vor dem Upload blockieren oder warnen.
- Home Hub kann dieselbe Policy im Contract spiegeln.

Akzeptanzkriterien:

- 25 Seiten und 50 MB sind als Policy-Werte dokumentiert.
- 15 Seiten und 30 MB erzeugen eine Soft-Warnung.
- PDF ist das bevorzugte Nutzerartefakt.
- JPEG/PNG Source Images und Preview sind als technische Artefakte erlaubt.
- SHA-256 ist als M2-Checksum festgelegt.
- Policy-Fehler mappen auf finalen Fehler, nicht auf Endlos-Retry.

### R4.5.2 Queue State Machine

Implementierungsziel:

- Jeder Upload hat einen erklaerbaren Zustand.
- App-Neustart verliert Queue-Eintraege nicht.
- UI, Tests und API verwenden dieselben Begriffe.

Akzeptanzkriterien:

- Alle D32-Zustaende sind modelliert.
- Ungueltige Transitionen sind ausgeschlossen oder kontrolliert abgefangen.
- `completed` ist nur nach Home-Hub-Confirm erreichbar.
- `failedRetryable` bleibt lokal retrybar.
- `failedFinal` bleibt sichtbar und erklaerbar.
- `cancelled` ist eine Nutzerentscheidung.

### R4.5.3 Retry and Idempotency

Implementierungsziel:

- Netzfehler fuehren nicht zu Datenverlust.
- Wiederholte Uploads erzeugen keine doppelten Drafts.

Akzeptanzkriterien:

- Retrybare und nicht-retrybare Fehler sind getrennt.
- Backoff-Regeln sind dokumentiert.
- `idempotencyKey` entsteht beim Queue-Eintrag und bleibt stabil.
- Repeated `initiateUpload` und `confirmUpload` mit demselben Key sind idempotent.
- Widerrufenes Pairing fuehrt zu Re-Pairing-Anforderung statt blindem Retry.

### R4.5.4 Cleanup and Retention

Implementierungsziel:

- Lokale Rohartefakte bleiben lange genug erhalten, um Uploads sicher zu machen.
- Erfolgreiche Uploads muessen nicht dauerhaft Speicher fressen.
- Abgebrochene Uploads verschwinden nicht still.

Akzeptanzkriterien:

- Erfolgreich bestaetigte Rohartefakte haben 7 Tage lokale Retention.
- Unbestaetigte Uploads werden nicht automatisch geloescht.
- Nutzer kann fehlgeschlagene Uploads bewusst verwerfen.
- Queue Receipts duerfen ohne sensible Inhalte laenger bestehen.
- Home-Hub-Sessions duerfen im M2 `expired` werden, erzeugen aber keinen Draft.

### R4.5.5 Contract Requirements

Implementierungsziel:

- R4.6 kann OpenAPI/Microcks ohne erneute Produktdiskussion schreiben.

Akzeptanzkriterien:

- Contract braucht maschinenlesbare Fehlercodes.
- Contract unterscheidet Retry, finalen Fehler, Re-Pairing und Split/Reduce.
- Microcks-Szenarien decken Erfolg, Idempotency, 413, 415, 422, 401/403, 409, 5xx, expired session und checksum mismatch ab.
- Ungueltiger Case/Profile-Kontext faellt in Draft-Inbox Review statt Upload-Verlust.

### R4.5.6 UX and Diagnostics Requirements

Implementierungsziel:

- Nutzer versteht, ob ein Scan wartet, laedt, erledigt ist oder Eingriff braucht.
- Diagnose hilft ohne private Dokumentdaten offenzulegen.

Akzeptanzkriterien:

- Queue-Zustaende haben UI-Anforderungen fuer sichtbaren Status.
- Retrybare Fehler bieten Retry.
- Finale Fehler erklaeren naechsten Schritt.
- Diagnose erlaubt Upload ID, Fehlerklasse, Groesse, Seitenzahl, Dauer und Retry Count.
- Diagnose verbietet Dokumentinhalte, sensible Dateinamen, Tokens, presigned URLs, Roh-Keys, OCR-Text und Preview-Inhalte.

### R4.5.7 Test Fixtures and Gates

Implementierungsziel:

- R4.5 wird nicht nur dokumentiert, sondern spaeter sauber pruefbar.

Akzeptanzkriterien:

- FakeCaptureUploadStrategy braucht Szenarien fuer Erfolg, Netzwerkfehler, Auth-Fehler, zu gross, Checksum mismatch, idempotent retry und invalid context.
- Queue-State-Tests pruefen Persistenz und Transitionen.
- Policy-Tests pruefen Limits und Warnschwellen.
- Contract-Szenario-Liste wird an R4.6 uebergeben.
- Keine Tests verwenden echte private Dokumente.

## Handoff zu R4.6 und R4.7

R4.6 Home Hub Capture Contract uebernimmt aus R4.5:

- Fehlercodes.
- Microcks-Szenarien.
- Confirm-/Checksum-Regeln.
- Idempotency-Anforderungen.
- Invalid-context-fallback.

R4.7 API-proxied Upload Slice uebernimmt aus R4.5:

- Queue States.
- Retry/Backoff.
- lokale Retention.
- UI-/Diagnoseanforderungen.
- Fake-Strategie-Szenarien.

## Definition of Done

R4.5 gilt als planungsseitig abgeschlossen, wenn:

- D32 accepted ist.
- dieser Phasenplan existiert.
- `PHASE_INDEX.md` auf diesen Plan verweist.
- F17 die Upload-Limits nicht mehr als offene Frage fuehrt.
- R4.6 und R4.7 klare Inputs aus R4.5 haben.
