---
title: "Konzept F18 - Notifications, Failures and Observability"
description: "DocMan-spezifisches Querschnittskonzept für typed Failures, sichere Nutzerbenachrichtigungen, Telemetry Events, Audit Events, Correlation IDs und spätere Observability"
tags: [concept, foundation, failures, notifications, observability, audit, telemetry, privacy, production-readiness]
lastUpdated: "2026-05-05"
version: "1.0"
status: "accepted"
---

# Konzept F18 - Notifications, Failures and Observability

## Status

Accepted.

Dieses Konzept ergänzt F5 Error Handling und F7 Logging. F18 ist die Runtime-Readiness-Schicht, die Fehlerklassifikation, Nutzerkommunikation, Diagnose, Audit und spätere Observability verbindet.

## Zweck

DocMan verwaltet sensible Dokumente. Fehler dürfen nicht nur technisch korrekt sein, sondern müssen nachvollziehbar, sicher kommuniziert, diagnostizierbar und auditierbar sein.

F18 definiert:

- wie `Failure`-Ergebnisse in UI-Zustände und Nutzerbenachrichtigungen übersetzt werden.
- welche Ereignisse als Telemetry oder Audit Events modelliert werden.
- wie Correlation IDs / Operation IDs Uploads, Imports, Sync und spätere OCR-Jobs nachvollziehbar machen.
- welche Daten niemals in Notifications, Logs, Telemetry oder Audit Events landen dürfen.
- wie ein späterer Home-Hub-/Self-hosted-Observability-Stack vorbereitet wird, ohne ihn im MVP vorauszusetzen.

## Grundsatz

Nicht jedes Failure ist eine Notification. Nicht jedes Log ist ein Audit Event. Nicht jedes Diagnoseereignis darf sensible Details enthalten.

DocMan trennt fünf Ebenen:

| Ebene | Zweck | Beispiel |
|---|---|---|
| `Failure` | fachlich/technisches Ergebnis an Domain- und Repository-Grenzen | `NetworkFailure`, `ConflictFailure` |
| UI State | Zustand eines Screens oder Workflows | loading, empty, queued, review needed |
| `UserNotification` | sichere, handlungsorientierte Nutzerkommunikation | "Upload wartet auf Verbindung" |
| `TelemetryEvent` | redaktionierte Diagnose für Betrieb und Debugging | upload retry scheduled |
| `AuditEvent` | sicherheits- oder integritätsrelevante Nachvollziehbarkeit | device paired, document deleted |

## Failure-Modell

F5 definiert die Failure-Kategorien. F18 ergänzt, welche Runtime-Informationen ein Failure tragen darf.

Ein Failure darf enthalten:

- Kategorie.
- sichere, technische Ursache als Code.
- Retryability.
- Recovery-Hinweis für App-Schicht.
- optionale Correlation ID / Operation ID.
- redaktionierte Diagnosemetadaten.

Ein Failure darf nicht enthalten:

- Dokumentinhalt.
- OCR-Text.
- Tokens, Pairing Secrets oder Schlüssel.
- vollständige private Dateipfade.
- personenbezogene Details, sofern sie nicht explizit redaktioniert sind.
- rohe Exception-Texte im Nutzerpfad.

## Result-Grenze

Domain, Application und Repository-Grenzen verwenden ein typisiertes `Result<T>`-/`Failure`-Modell.

Exceptions bleiben Implementierungsdetail:

- Data- und SDK-Grenzen fangen technische Exceptions.
- Fehler werden in DocMan-Failures übersetzt.
- UI und Provider erhalten keine rohen Exception-Texte.
- Unerwartete Exceptions werden als redaktionierte `UnexpectedFailure` plus Telemetry erfasst.

## Notification-Modell

`UserNotification` ist die sichere Nutzerkommunikation. Sie wird in der App-/Presentation-Schicht aus Failure, Workflow-Zustand und Nutzerkontext abgeleitet.

Notification-Kanäle:

| Kanal | Zweck |
|---|---|
| Inline | Formular- oder Feldfehler |
| Snackbar / Toast | kurze, nicht persistente Rückmeldung |
| Banner | übergreifender Status wie Home Hub nicht erreichbar |
| Dialog | blockierende Integritäts- oder Sicherheitsentscheidung |
| Notification Center / Activity Feed | persistente Ereignisse wie fehlgeschlagene Uploads |
| Badge / Counter | Warteschlange, Drafts, Review-Bedarf |

Regeln:

- Domain entscheidet nicht über UI-Texte.
- Repositories erzeugen keine Notifications.
- Provider/Use Cases liefern Failure und Kontext.
- UI/App-Schicht mappt auf lokalisierbare, sichere Texte.
- Retry-Aktionen werden explizit modelliert, nicht durch freie Callback-Magie versteckt.

## Retry und Recovery

Jeder relevante Failure-Typ muss ausdrücken, ob er:

- automatisch retryable ist.
- manuell retryable ist.
- Nutzeraktion braucht.
- Review braucht.
- fatal/blockierend ist.

Beispiele:

| Situation | Recovery |
|---|---|
| Home Hub offline | queued, später automatisch retry |
| Pairing abgelaufen | Nutzer muss Gerät neu koppeln |
| Datei fehlt lokal | Review/Fehlerzustand, kein blinder Retry |
| `caseId` ungültig | Fallback in Draft-Inbox |
| Sync-Konflikt | sichtbare Review-Entscheidung |

## Correlation IDs und Operation IDs

DocMan nutzt harmlose technische IDs, um zusammengehörige Schritte nachvollziehbar zu machen.

Verwendung:

- Dokumentimport.
- Mobile Capture Upload.
- Upload Queue Retry.
- Draft-Inbox Übergabe.
- Sync-Operation.
- spätere OCR-/AI-Analyse.

Regeln:

- IDs dürfen nicht aus personenbezogenen Daten, Dateinamen, Dokumentinhalt oder Tokens abgeleitet werden.
- Eine Operation ID darf in Failure, Telemetry und lokalen Diagnoseansichten auftauchen.
- Nutzertexte zeigen Operation IDs nur bei Diagnose-/Support-Kontext, nicht im normalen Flow.

## Telemetry Events

`TelemetryEvent` beschreibt redaktionierte Diagnoseereignisse.

Beispiele:

- app started.
- database opened / migration result.
- capture queued.
- upload started / retry scheduled / completed / failed.
- home hub unreachable.
- pairing expired.
- sync conflict detected.
- unexpected exception redacted.

Telemetry darf enthalten:

- Event-Typ.
- Zeitstempel.
- Severity.
- Correlation ID / Operation ID.
- Failure-Kategorie.
- redaktionierte technische Codes.
- grobe Dauer/Performance.

Telemetry darf nicht enthalten:

- Dokumentinhalt oder OCR-Text.
- vollständige Dateinamen oder private Pfade ohne Redaction.
- Tokens, Secrets, Schlüssel.
- personenbezogene Rohdaten.

## Audit Events

`AuditEvent` ist nicht normales Logging. Audit Events dokumentieren sicherheits-, datenschutz- oder integritätsrelevante Aktionen.

Audit-relevante Ereignisse:

- Gerät gekoppelt.
- Gerät/Token widerrufen.
- Pairing fehlgeschlagen wegen ungültigem/abgelaufenem Secret.
- Dokument importiert.
- Dokument gelöscht.
- Dokument einem Vorgang zugeordnet.
- Vorgang geschlossen/archiviert.
- Sync-Konflikt manuell aufgelöst.
- Export oder Diagnosepaket erzeugt.
- spätere Rollen-/Profil-/Berechtigungsänderung.

Audit Events müssen redaktioniert sein. Sie sollen Nachvollziehbarkeit schaffen, aber keine sensiblen Inhalte replizieren.

## Lokale Diagnose

MVP und frühe R3-Phasen brauchen keinen großen Observability-Stack, aber eine saubere lokale Diagnosegrenze.

Eine spätere Diagnoseansicht darf zeigen:

- App-Version.
- Datenbank-/Schema-Version.
- letzter erfolgreicher Start.
- Home-Hub-Status.
- Upload-Queue-Zustand.
- letzte redaktionierte Failure-Kategorien.
- letzte Operation IDs.
- ob lokale Logs/Telemetry verfügbar sind.

Sie darf nicht zeigen:

- Dokumentinhalte.
- OCR-Rohtexte.
- Secrets/Tokens.
- private vollständige Dateipfade.
- personenbezogene Rohdaten ohne bewusste Redaction.

## Observability-Zielbild

MVP implementiert nur lokale Interfaces und sichere Defaults.

Spätere Home-Hub-/Self-hosted-Ausbaustufe:

- strukturierte Logs.
- Metrics.
- Traces oder trace-ähnliche Operationen.
- Health-/Status-Endpunkte.
- optional OpenTelemetry-kompatible Exportgrenze.
- optional Loki/Grafana/Prometheus oder OpenTelemetry Collector.

OpenTelemetry ist Richtung, nicht MVP-Pflicht. DocMan sollte Events und Operationen aber so modellieren, dass spätere OTel-Anbindung möglich bleibt.

## Metrics-Zielbild

Mögliche spätere Metrics:

- Anzahl queued uploads.
- Anzahl failed uploads.
- Retry Count.
- Draft-Inbox Count.
- Sync conflicts.
- Home Hub reachability.
- Storage migration result.
- OCR job duration / failure rate.

Keine Metric darf sensible Inhalte oder personenbezogene Labels enthalten.

## Verhältnis zu F5, F7 und R3

- F5 definiert Failure-Kategorien und fachliches Fehlerverhalten.
- F7 definiert Logging-Kategorien und Log-Privacy.
- F18 definiert Mapping, Notifications, Telemetry, Audit, Correlation und Observability-Zielbild.
- R3 operationalisiert F18 in Tests, Quality Gates und Production-Readiness-Kriterien.

## Definition of Done für F18

F18 gilt als umgesetzt, wenn:

- ein typed Result-/Failure-Modell existiert.
- Failure zu UI State und UserNotification gemappt werden kann.
- retryable vs. non-retryable modelliert ist.
- Correlation ID / Operation ID für relevante Workflows verfügbar ist.
- TelemetryEvent und AuditEvent konzeptionell getrennt sind.
- Redaction-Regeln technisch und in Reviews prüfbar sind.
- keine sensiblen Inhalte in Notifications, Logs, Telemetry oder Audit Events landen.
- lokale Diagnosegrenzen definiert sind.
- spätere Home-Hub-/OpenTelemetry-Anbindung vorbereitet, aber nicht vorausgesetzt ist.

## Offene Folgefragen

- Wird `Result<T>` selbst implementiert oder über ein Paket modelliert?
- Welche UI-Notification-Komponente wird zuerst gebaut?
- Ab wann gibt es ein persistentes Notification Center / Activity Feed?
- Welche Audit Events sind MVP-pflichtig?
- Wie lange werden lokale Diagnoseereignisse aufbewahrt?
- Wird die spätere Home-Hub-Observability über OpenTelemetry Collector, Loki/Grafana/Prometheus oder eine minimalere Lösung betrieben?
