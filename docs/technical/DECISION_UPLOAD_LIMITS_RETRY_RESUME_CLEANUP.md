---
title: "Decision - Upload Limits, Retry, Resume and Cleanup"
description: "Entscheidung zu M2-Grenzen fuer Mobile-Capture-Uploads, Retry, Idempotency, Resume-Verzicht und spaeterem Enterprise-Zielbild"
tags: [decision, mobile-capture, upload, retry, idempotency, cleanup, home-hub, observability]
lastUpdated: "2026-05-14"
status: "accepted"
---

# Decision - Upload Limits, Retry, Resume and Cleanup

## Status

Accepted.

## Entscheidung

R4 Mobile Capture startet mit einem bewusst einfachen, aber robusten Upload-Modell:

- Mobile Capture speichert Scans zuerst lokal in einer persistenten Upload Queue.
- Der M2 laedt Upload-Pakete als ganze Uploads zum Home Hub.
- Der M2 baut kein Chunking, kein Multipart und kein echtes Resume.
- Fehlgeschlagene Uploads bleiben lokal erhalten und werden erneut versucht.
- Jeder Upload bekommt einen stabilen Idempotency Key.
- Home Hub erzeugt bei wiederholtem Confirm desselben Uploads keinen doppelten Draft.
- Erfolgreiche Uploads werden erst nach bestaetigtem Home-Hub-Zustand lokal aufraeumbar.

Das Enterprise-Zielbild bleibt resumable/multipart Upload mit serverseitigem Cleanup, Quotas, Metriken und Integritaetspruefung.

## Begruendung

Mobile Capture soll im M2 verlaesslich sein, ohne dass die erste Umsetzung ein komplexes Cloud-Storage-Protokoll wird.

Die wahrscheinlichsten M2-Scans sind Rechnungen, Arztbriefe, Bescheide, Formulare und kurze Dokumentenstapel. Dafuer reichen ganze Uploads mit sinnvollen Grenzen, sauberer Queue und Idempotency. Chunking und Resume loesen echte spaetere Probleme, wuerden aber den M2 deutlich vergroessern.

## M2 Upload Limits

Startwerte fuer R4:

| Limit | Wert | Verhalten |
|---|---:|---|
| Maximale Seiten pro Scan-Upload | 25 Seiten | Mobile blockiert oder fordert Split in mehrere Uploads |
| Maximale Upload-Paketgroesse | 50 MB | Home Hub antwortet `413 payload_too_large`; Mobile zeigt klare Fehlermeldung |
| Soft-Warnung | ab 30 MB oder 15 Seiten | Mobile warnt, erlaubt Upload aber weiter |
| Erlaubte Nutzerartefakte | PDF | bevorzugtes Artefakt fuer Draft-Inbox und Desktop Review |
| Erlaubte technische Artefakte | JPEG/PNG Source Images, Preview | nur im Manifest, nicht als UI-Pflicht |
| Checksum | SHA-256 pro Upload-Paket | Confirm prueft Hash vor Draft-Erzeugung |

Die Werte sind Produkt-Startwerte. Der native Scanner-Spike darf sie anpassen, wenn echte Scanqualitaet oder Dateigroessen zeigen, dass die Grenzen zu streng oder zu locker sind. Eine Anpassung braucht dann eine kleine Decision-Aenderung, nicht stillen Code-Drift.

## Queue States

Mobile Queue Items verwenden mindestens diese fachlichen Zustaende:

```text
queued
uploading
uploadedPendingConfirm
completed
failedRetryable
failedFinal
cancelled
```

Regeln:

- `queued`: Scan liegt lokal vor und wartet auf Upload.
- `uploading`: ein Upload-Versuch laeuft.
- `uploadedPendingConfirm`: Bytes wurden uebertragen, Home-Hub-Confirm fehlt noch.
- `completed`: Home Hub hat Draft/Inbox-Zustand bestaetigt.
- `failedRetryable`: Netzwerk, Timeout, `429` oder `5xx`.
- `failedFinal`: Auth widerrufen, zu gross, ungueltiger Typ, kaputtes Manifest oder Policy-Fehler.
- `cancelled`: Nutzer hat den lokalen Queue-Eintrag bewusst verworfen.

Ein Upload darf erst als erledigt gelten, wenn der Home Hub den finalen Zustand bestaetigt hat.

## Retry

M2 Retry-Regeln:

- Retry ganzer Uploads, kein Fortsetzen in der Mitte.
- Automatischer Retry nur fuer retrybare Fehler.
- Manueller Retry bleibt immer moeglich, solange lokale Artefakte vorhanden sind.
- Backoff-Start: ca. 1 Minute, dann 5 Minuten, 15 Minuten, 1 Stunde.
- Nach mehreren Fehlschlaegen bleibt der Eintrag sichtbar und erklaerbar, statt still zu verschwinden.

Retrybare Fehler:

- Home Hub nicht erreichbar.
- Timeout.
- temporare DNS-/Netzwerkfehler.
- `429 too_many_requests`.
- `500`, `502`, `503`, `504`.

Nicht-retrybare Fehler:

- `401` / `403` ohne erneutes Pairing.
- `413 payload_too_large`.
- `415 unsupported_media_type`.
- `422 validation_failed`.
- `409 conflict` mit nicht idempotent aufloesbarem Kontext.
- Checksum mismatch nach erneuter lokaler Hash-Pruefung.

## Idempotency

Jeder Upload bekommt beim Queue-Eintrag einen stabilen `idempotencyKey`.

Der Key bleibt gleich fuer:

- erneutes `initiateUpload`.
- erneutes Hochladen nach Netzwerkfehler.
- erneutes `confirmUpload`.
- App-Neustart.

Der Home Hub muss denselben Key pro Geraet/Home-Hub-Kontext wiedererkennen und denselben Upload-/Inbox-Zustand zurueckgeben, statt einen zweiten Draft zu erzeugen.

## Resume

M2:

- kein echtes Resume.
- kein Chunking.
- kein Multipart.
- keine Teil-Pruefsummen.

spaetere Milestones / Enterprise:

- resumable oder multipart Uploads.
- Part Checksums.
- Session Recovery nach App-Neustart.
- presigned Upload Targets oder S3-kompatible Multipart-Flows hinter demselben Upload-Port.
- grosse Dokumentenstapel und schlechte mobile Netze besser unterstuetzen.

## Cleanup

Mobile:

- Erfolgreich bestaetigte Upload-Artefakte duerfen nach einer lokalen Aufbewahrungsfrist entfernt werden.
- Startwert: 7 Tage lokale Retention fuer erfolgreich bestaetigte Rohartefakte.
- Queue Receipts und minimaler Status duerfen laenger bleiben, solange sie keine sensiblen Inhalte enthalten.
- Fehlgeschlagene oder unbestaetigte Uploads werden nicht automatisch geloescht.
- Nutzer kann fehlgeschlagene Uploads bewusst verwerfen.

Home Hub M2:

- darf abgebrochene Upload-Sessions als `expired` markieren.
- erzeugt keinen Inbox-Draft ohne erfolgreichen Confirm.
- muss abgelaufene Sessions in der Diagnose sichtbar machen koennen.

Home Hub spaetere Milestones:

- serverseitiger Cleanup-Job fuer abgelaufene Sessions.
- Quotas fuer Geraet, Haushalt und Zeitraum.
- Storage Health fuer verwaiste Upload-Artefakte.
- Metriken zu Upload-Erfolg, Fehlerklasse, Dauer und Groesse.

## API Contract Implications

OpenAPI/Microcks muessen folgende Szenarien abbilden:

- successful upload with confirm.
- idempotent retry after repeated confirm.
- retryable network/server failure.
- expired session.
- payload too large.
- unsupported content type.
- checksum mismatch.
- revoked/expired device token.
- invalid case/profile context falls back to Draft-Inbox review.

Antworten muessen maschinenlesbare Fehlercodes enthalten, damit Mobile zwischen Retry, Re-Pairing, Split/Reduce und finalem Fehler unterscheiden kann.

## Observability and Privacy

Erlaubt in Logs und Diagnose:

- Upload ID.
- Idempotency-Key-Hash, nicht der rohe Key.
- Geraete-ID oder Device Alias, soweit nicht personenbezogen.
- Groesse, Seitenzahl, MIME-Typ.
- Fehlerklasse.
- Retry Count.
- Zeitstempel und Dauer.

Nicht erlaubt:

- Dokumentinhalt.
- Dateinamen mit sensiblen Informationen.
- Tokens.
- presigned URLs.
- Roh-Idempotency-Keys.
- OCR-Text oder Preview-Inhalte.

## Konsequenzen

- R4.5 kann als konkrete Implementierungsphase geplant werden.
- F17 Mobile Capture muss Upload-Limits nicht mehr als offene Frage fuehren.
- `DECISION_MOBILE_CAPTURE_UPLOAD_STRATEGY.md` bleibt die Transport-Entscheidung; dieses Dokument konkretisiert Limits, Retry, Resume und Cleanup.
- Der M2 bleibt klein genug, verhindert aber Datenverlust und doppelte Drafts.

## Nicht entschieden

- exakte Endpoint-Namen.
- konkrete UI-Texte fuer Upload-Fehler.
- ob die 7-Tage-Retention spaeter nutzerkonfigurierbar wird.
- wann genau presigned/resumable Uploads in R6/R11 umgesetzt werden.
