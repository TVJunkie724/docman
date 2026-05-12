---
title: "Plattform-Säule - Admin, Settings and Storage Health"
description: "Plattformbereich fuer Setup, Einstellungen, Speicherzustand, lokale Administration, Backup-Status und Wartung"
tags: [pillar, platform, admin, settings, storage, health]
lastUpdated: "2026-05-06"
version: "0.1"
status: "proposed"
---

# Plattform-Säule - Admin, Settings and Storage Health

## Zweck

DocMan braucht eine kontrollierbare Betriebsoberfläche:

- App-Setup.
- Home-Hub-Verbindung.
- Geräte/Pairing.
- Storage-Orte.
- Backup-Status.
- Diagnose.
- lokale Wartung.

## MVP-Scope

MVP:

- minimale Einstellungen für lokale App und Home-Hub-Verbindung.
- sichtbarer Pairing-/Upload-Status.
- Speicherort und sichere Basisinformationen vorbereiten.

Post-MVP:

- Speicherprüfung.
- Backup-/Restore-Status.
- Geräteverwaltung.
- Health Checks.
- Diagnosepaket.
- Migration-/Repair-Flows.

## Grenzen

Admin-Flows dürfen keine sensiblen Daten unnötig offenlegen.

Diagnose muss redigiert sein und darf keine Secrets enthalten.
