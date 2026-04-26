---
title: "Konzept F5 - Error Handling"
description: "DocMan-spezifisches Fehlerkonzept für Result/Failure, Offline-Betrieb, lokale Persistenz, Upload Queue, Home Hub und Nutzer-Feedback"
tags: [concept, foundation, error-handling, failure, offline, upload-queue, home-hub]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F5 - Error Handling

## Status

Accepted.

Dieses Konzept ersetzt den importierten F5-Inhalt aus dem alten Projekt.

## Zweck

F5 definiert, wie DocMan Fehler fachlich, technisch und in der UI behandelt.

DocMan verwaltet private Dokumente. Fehler dürfen deshalb nicht zu Datenverlust, stillen Überschreibungen oder unklaren Zuständen führen.

## Grundsatz

Fehler werden klassifiziert, nicht nur angezeigt.

DocMan unterscheidet:

- Fehler, die Nutzerinnen sofort beheben können.
- Fehler, die automatisch wiederholt werden dürfen.
- Fehler, die nur Review brauchen.
- Fehler, die lokale Nutzung nicht blockieren.
- Fehler, die Datenintegrität gefährden.

## Failure-Kategorien

| Failure | Bedeutung | Beispiele |
|---|---|---|
| ValidationFailure | Eingabe oder Zustand fachlich ungültig | fehlender Titel, ungültiges Datum |
| LocalStorageFailure | lokale DB oder Dateiablage fehlgeschlagen | Datei nicht lesbar, DB-Migration kaputt |
| SecureStorageFailure | Geheimnis nicht lesbar/schreibbar | Keychain nicht verfügbar |
| NetworkFailure | Backend nicht erreichbar | Home Hub offline, Timeout |
| AuthFailure | Pairing/Login/Session ungültig | Gerät nicht freigegeben |
| UploadFailure | Mobile/Datei-Upload fehlgeschlagen | Retry möglich, Datei zu groß |
| ConflictFailure | Änderung braucht Nutzerentscheidung | caseId ungültig, Sync-Konflikt |
| PermissionFailure | Aktion nicht erlaubt | später Familienrechte |
| ParseFailure | Datei/Antwort nicht verarbeitbar | kaputtes PDF, ungültiges JSON |
| UnexpectedFailure | nicht klassifizierter Fehler | Programmierfehler, unbekannte Exception |

## Result statt rohe Exceptions

Domain und Application sollten planbare Fehler als Result/Failure modellieren.

Exceptions bleiben für:

- unerwartete technische Fehler.
- SDK-/IO-Grenzen innerhalb Data.
- Bugs.

Data fängt SDK-Exceptions und wandelt sie in DocMan-Failures oder App-Exceptions. Presentation zeigt keine rohen Exception-Texte.

## Offline-Regeln

Offline ist in DocMan kein Fehlerzustand an sich.

Offline bedeutet:

- lokale Kernflows bleiben nutzbar.
- Uploads werden queued.
- Home-Hub-Status wird sichtbar.
- Sync-/Upload-Aktionen können retryable scheitern.

UI-Text soll nicht dramatisieren. Ein fehlender Home Hub ist für lokale Arbeit ein Status, kein Absturz.

## Upload-Fehler

Mobile Uploads müssen robust sein.

Fehlerfälle:

- Home Hub nicht erreichbar.
- Auth/Pairing ungültig.
- Datei nicht mehr lokal verfügbar.
- Upload abgebrochen.
- Server nimmt Datei nicht an.
- gewählte `caseId` ist nicht gültig.

Regeln:

- Retrybare Fehler bleiben in der Queue.
- Nicht retrybare Fehler brauchen Nutzeraktion.
- Ungültige Vorgangszuordnung fällt in Draft-Inbox zurück.
- Erfolgreicher Upload darf bei Retry nicht dupliziert werden.
- Lokale Originaldatei wird nicht gelöscht, bevor der Upload sicher bestätigt ist.

## Draft-Inbox-Fehler

Drafts dürfen nicht verloren gehen.

Wenn Zuordnung, Metadaten oder Home-Hub-Verarbeitung scheitern, bleibt das Dokument als Draft sichtbar.

Draft-Fehler sollen erklärbar sein:

- "Vorgang nicht mehr verfügbar"
- "Datei kann nicht gelesen werden"
- "Upload wartet auf Verbindung"
- "Prüfung erforderlich"

## UI-Feedback

UI-Feedback folgt Schwere und Handlungsbedarf.

| Situation | UI |
|---|---|
| lokale Liste leer | Empty State |
| lokale Daten laden | Loading State |
| Home Hub offline | dezenter Status / Banner |
| Upload wartet | Queue-Indikator |
| Upload fehlgeschlagen, retrybar | Retry-Aktion |
| Nutzer muss entscheiden | Review State |
| Datenintegrität gefährdet | blockierender Dialog oder klare Fehlerseite |

Keine UI zeigt technische Stacktraces im Produktpfad.

## Logging-Grenze

F5 definiert die Fehlerklassifikation. F7 definiert Logging im Detail.

Schon jetzt gilt:

- keine sensiblen Dokumentinhalte in Logs.
- keine Tokens oder Pairing Secrets in Logs.
- Dateinamen können sensibel sein und werden bewusst behandelt.
- technische Details dürfen in Diagnose-Logs, aber nicht in normale Nutzertexte.

## Riverpod-Integration

Provider-State muss Failure klar transportieren.

AsyncValue reicht für simple Loads. Für Workflows wie Upload Queue, Draft Review oder Sync reicht ein einzelnes AsyncValue oft nicht. Diese Features brauchen eigene State-Objekte mit:

- aktuellem Datenstand.
- laufender Aktion.
- letztem Failure.
- Retry-Information.
- Review-/Conflict-Status.

## Definition of Done für F5

F5 gilt als umgesetzt, wenn:

- Failure-Kategorien existieren.
- Data SDK-Fehler nicht ungefiltert in UI leaken.
- Offline und Home-Hub-unreachable als Status modelliert sind.
- Upload Queue Fehler und Retry kennt.
- Drafts bei Fehlern erhalten bleiben.
- UI zwischen retry, review und fatal unterscheidet.

## Offene Folgefragen

- Welches konkrete Result-/Failure-Package oder eigener Typ wird genutzt?
- Wie werden Failures serialisiert, falls Queue-Fehler persistent bleiben?
- Welche Fehlertexte brauchen Lokalisierung?
- Welche Failures werden später an Home-Hub-Diagnose gemeldet?

