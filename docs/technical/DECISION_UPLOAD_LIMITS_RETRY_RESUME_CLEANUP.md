---
title: "Decision - Upload Limits, Retry, Resume and Cleanup"
description: "Verbindliche Prinzipien und Entscheidungsgrenze fuer Capture-Limits, Idempotenz, Resume, Quota und Cleanup"
tags: [decision, mobile-capture, upload, retry, idempotency, cleanup, cloud]
lastUpdated: "2026-07-15"
status: "accepted-principles-policy-required"
owner: "contract-api/operations"
---

# Decision - Upload Limits, Retry, Resume and Cleanup

## Status

Akzeptiert sind die Sicherheits- und Lifecycle-Prinzipien. Konkrete Byte-,
Seiten-, Timeout-, Retention- und Retry-Werte sind **nicht** aus historischen
M2-Annahmen uebernommen. Sie muessen vor C2-Implementierung anhand der
Scannerartefakte, Plattformen, Mobilnetze, Kosten, SLOs und Backendkapazitaet
vertraglich festgelegt und getestet werden.

## Verbindliche Prinzipien

- Uploads sind durable, idempotent und nach App-Neustart nachvollziehbar.
- Ein valides Original geht weder bei Network Failure noch bei Intent-/Matching-
  Fehler verloren.
- Groessen-/Seiten-/Quota-Grenzen sind serverautoritativ und fuer den Client
  vor Initiate soweit moeglich abrufbar.
- Clientvalidierung verbessert UX, ersetzt aber nie Servervalidierung.
- Retry verwendet denselben Idempotency-Kontext und erzeugt keine doppelten
  Capture Sessions, Dokumente oder Processing Jobs.
- Resume/Multipart wird aktiviert, wenn gemessene Dateigroessen, Netzabbrueche
  oder SLOs Whole-upload Retry unvertretbar machen.
- Cleanup unterscheidet lokale Originale, ausstehende Artefakte, bestaetigte
  Cloud-Payloads, abgeleitete Previews und Processing-Artefakte.
- Retention-/Cleanup-Fehler aendern Vault-Autoritaet nicht.

## Erforderliche Policy

Der C2 Contract-/Operations-Slice legt datiert fest:

| Bereich | Erforderliche Entscheidung |
|---|---|
| Payload | erlaubte MIME-Typen, Datei-/Sessiongroesse, Seiten-/Artefaktzahl |
| Transport | API-proxied, streaming, presigned oder multipart je Schwelle |
| Zeit | Session-Expiry, Timeout, Retry-Backoff und maximale automatische Versuche |
| Quota | Plan-/Vault-/Accountgrenzen und Reset-/Grace-Verhalten |
| Integrity | Hashalgorithmus, Manifest- und Part-Verifikation |
| Cleanup | lokale und serverseitige Retention pro Zustand |
| Failure | stabile Codes, Retryability und User-/Supportaktion |
| Observability | redigierte Metrics/SLOs ohne Inhalt oder Dateinamen |

Werte sind Konfiguration/Policy mit Owner, Environment und Versionsstand. Die
Flutter-Domain enthaelt keine duplizierten Hardcodes.

## Queue-State

Der fachliche Zustand unterscheidet mindestens:

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

Processing-/Proposal-State ist separat und beginnt erst nach bestaetigter
Annahme. Ein Upload ist nicht `completed`, nur weil Bytes gesendet wurden.

## Retry und Resume

- Netzwerk-/5xx-/Rate-Limit-Fehler koennen gemaess serverseitiger Retry-
  Information wiederholt werden.
- Auth, Authorization, Quota, Unsupported Media und permanente Validation
  benoetigen User-/Policy-Aktion statt blindem Retry.
- Checksum-Fehler wiederholen nur nach kontrollierter Artefaktpruefung.
- Wiederholtes Initiate/Confirm ist idempotent.
- Resume nutzt durable Checkpoints; ein abgelaufenes Ticket kann mit derselben
  fachlichen Operation neu ausgehandelt werden.

## Cleanup und Quellenerhalt

- Lokale Originale bleiben mindestens bis durablem Confirm und gemaess Vault-
  Lifecycle erhalten.
- Abgebrochene Serverartefakte werden nach definierter Frist geloescht; Retry
  und Support duerfen davor keine zweite unverbundene Kopie erzeugen.
- Abgeleitete Previews/OCR-Indizes koennen neu erzeugt werden, Originale nicht.
- User-Loeschung, Cache-Bereinigung, Upload-Cancel und Vault-Loeschung sind
  unterschiedliche Aktionen.
- Cleanup ist idempotent, auditable und gegen laufende Confirm-/Processing-
  Transaktionen geschuetzt.

## UX- und Accessibility-Grenze

Die UI zeigt keine technischen Grenzwerte ohne Handlungswert. Sie erklaert
konkret, ob erneut versucht, Dokument geteilt/neu gescannt, Speicher
freigemacht, Plan/Quota geprueft oder Support kontaktiert werden soll.
Fortschritt und Fehler sind semantisch, nicht nur farblich, und enthalten keine
sensiblen Dateinamen in globalen Flaechen.

## Tests und Freigabenachweis

- Boundary-Tests direkt unter/auf/ueber jeder Policygrenze.
- Offline, App-Kill, Ticket-Expiry, Timeout und mehrfaches Confirm.
- Idempotency bei verlorener Response.
- Teilartefakt-/Part-Checksum- und Manifestfehler.
- Quota/Entitlement/Rate Limit und Reauth.
- Cleanup-Race mit Retry, Confirm, Processing und User-Loeschung.
- Mobile-Netz- und Speicherbenchmark mit synthetischen Worst-Case-Artefakten.
- Logs/Telemetry/Supportpakete ohne Inhalte, URLs oder sensitive Dateinamen.

## Stop Rules

Stop, wenn:

- historische 50-MB-/Seiten-/Retry-Werte ohne aktuellen Nachweis uebernommen
  werden.
- Client und Server unterschiedliche Hardcodes besitzen.
- `bytes sent` als durable Bestaetigung gilt.
- Cleanup Originale oder aktive Sessions verlieren kann.
- Whole-upload Retry trotz unvertretbarer Messwerte erzwungen wird.
- Policy, SLO, Owner oder Environment vor C2-Contract-Freigabe fehlen.

## Handoff

Policy/OpenAPI geht an `contract-api`; Backend-/Ops-Werte in ein getrenntes
Backend-/Operations-Issue; Queue-Persistenz an `data-architect`; Evidence an
`quality-readiness`.
