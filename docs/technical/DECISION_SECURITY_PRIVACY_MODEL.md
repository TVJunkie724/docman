---
title: "Draft Decision - Security and Privacy Model"
description: "Vorläufige Entscheidungsvorlage für Verschlüsselung, Backup, Recovery, Export, Löschung und Threat Model"
tags: [decision, draft, security, privacy, encryption, backup]
lastUpdated: "2026-04-27"
status: "draft"
---

# Draft Decision - Security and Privacy Model

## Status

Draft.

## Kontext

DocMan speichert private Dokumente. F9/F10/F12 definieren erste Grenzen, aber ein vollständiges Security-/Privacy-Modell fehlt noch.

## Themen

- lokale DB-Verschlüsselung.
- Dateiablage-Verschlüsselung.
- Home-Hub Storage at rest.
- Backup und Restore.
- Export.
- Löschung.
- Geräteverlust.
- Key Recovery.
- Diagnose-Logs.
- Threat Model für Haushalt/Home Server.

## MVP-Minimum

- keine Secrets in normalem Storage.
- keine Dokumentinhalte in Logs.
- Pairing Secrets in Secure Storage.
- lokale Upload-Dateien gehen nicht verloren.
- Home-Hub-Verbindung ist privat erreichbar.

## Noch zu entscheiden

- Verschlüsseln wir lokale Dateien im MVP?
- Verschlüsseln wir Home-Hub-Dateien at rest im MVP?
- Wie funktioniert Backup/Restore?
- Was passiert bei Geräteverlust?

