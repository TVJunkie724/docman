---
title: "Konzept F12 - Secure Storage"
description: "DocMan-spezifisches Secure-Storage-Konzept für Pairing Secrets, Sessions, Geräteidentität, lokale Schlüssel und Abgrenzung zu Local Storage"
tags: [concept, foundation, secure-storage, security, pairing, sessions, home-hub]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F12 - Secure Storage

## Status

Accepted.

Dieses Konzept ersetzt den importierten F12-Inhalt aus dem alten Projekt.

## Zweck

F12 definiert, welche sicherheitskritischen Daten DocMan lokal geschützt speichern muss.

F10 speichert normale lokale App-Daten und Dateien. F12 speichert Geheimnisse.

## Secure-Storage-Daten

| Datum | Zweck | MVP |
|---|---|---|
| Device ID Secret | Gerät stabil identifizieren, ohne es als Klartext-Geheimnis zu behandeln | Ja |
| Pairing Secret | Mobile/Desktop mit Home Hub koppeln | Ja |
| Session Token | authentifizierte Home-Hub-Kommunikation | Falls Login/Pairing umgesetzt |
| Refresh Token | spätere längere Sessions | Später |
| Local Encryption Key | spätere lokale Verschlüsselung sensibler Daten | Prüfen |
| Sync Device Key | spätere Sync-/Signatur-/E2E-Modelle | Später |

Nicht in Secure Storage:

- Cases.
- Documents.
- Drafts.
- Upload Queue Metadaten.
- nicht geheime Settings.
- Dateiinhalte, solange keine Verschlüsselungsentscheidung getroffen ist.

## Grundsatz

Secrets dürfen nicht in:

- normaler lokaler DB.
- Shared Preferences.
- Logs.
- Crash Reports.
- URL Query Parametern.
- UI-State.

App-Code greift nicht direkt auf OS-Keychain/KeyStore zu. Zugriff läuft über ein SecureStorageRepository.

## Plattformziel

DocMan ist Desktop + Mobile.

Secure Storage muss diese Plattformen unterstützen:

- macOS.
- Windows.
- Linux Desktop.
- iOS.
- Android.

Web ist aktuell kein Ziel.

## Repository-Grenze

```text
Feature Provider / Application
  -> SecureStorageRepository Contract
      -> Secure Storage Implementation
          -> OS Keychain / Credential Store / KeyStore
```

Regeln:

- F12 definiert Speicherung, nicht den kompletten Auth-Flow.
- Pairing/Auth-Provider aus F2 nutzen F12.
- F11 API-Clients erhalten Tokens nur über sichere Infrastruktur.
- Tests verwenden In-Memory-Fakes.

## Pairing

Mobile Capture braucht wahrscheinlich Pairing oder Login.

Pairing muss:

- ein Gerät eindeutig freigeben.
- widerrufbar sein.
- ohne Cloud-SaaS funktionieren.
- Home-Hub-Adresse und geheime Kopplung trennen.

F10 darf die nicht geheime Home-Hub-Adresse speichern. F12 speichert das Pairing Secret.

## Session-Verhalten

MVP darf einfach starten:

- gekoppelte Geräte speichern Secret.
- Home Hub akzeptiert Capture Uploads nur von freigegebenen Geräten.
- ungültiges Secret erzeugt AuthFailure nach F5.

Später kann daraus ein vollständiger Session-/Refresh-Flow werden.

## Linux-Fallback

Linux Secure Storage kann je nach Desktop-Umgebung schwieriger sein.

Regel:

- Produktpfad soll sichere Speicherung erwarten.
- Development darf In-Memory-Fallback haben, wenn klar sichtbar.
- Stiller unsicherer Persistenz-Fallback ist nicht erlaubt.

## Verlust und Recovery

Wenn Secure Storage verloren geht:

- lokale App-Daten bleiben erhalten.
- Home-Hub-Verbindung muss neu gekoppelt werden.
- Upload Queue darf nicht gelöscht werden.
- nicht hochgeladene Dateien bleiben lokal sichtbar.

## Definition of Done für F12

F12 gilt als umgesetzt, wenn:

- Secrets nicht in F10 landen.
- SecureStorageRepository existiert.
- Pairing-/Session-Secrets geschützt gespeichert werden.
- Tests ohne OS-Keychain laufen können.
- Fehler in Secure Storage als F5-Failures sichtbar werden.
- Logout/Unpair Secrets löscht, ohne lokale Dokumente zu zerstören.

## Offene Folgefragen

- Welches Flutter-Package wird konkret genutzt?
- Gibt es im MVP Pairing-Code, QR-Code oder Login?
- Welche Secrets müssen zwischen Desktop und Mobile getrennt sein?
- Wird lokale Datei-/DB-Verschlüsselung im MVP geprüft oder verschoben?

