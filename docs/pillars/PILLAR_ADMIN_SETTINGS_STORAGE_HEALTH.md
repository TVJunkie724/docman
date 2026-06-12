---
title: "Plattform-Säule - Admin, Settings and Storage Health"
description: "Plattformbereich fuer Setup, Einstellungen, Speicherzustand, lokale Administration, Backup-Status und Wartung"
tags: [pillar, platform, admin, settings, storage, health]
lastUpdated: "2026-06-12"
version: "0.2"
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

R11-D1 ergaenzt: Backup- und Restore-Zustaende muessen in Admin/Settings
sichtbar werden. Ein Backup-Fehler ist ein Betriebszustand, kein stiller
Hintergrundfehler.

## M2-Scope

M2:

- minimale Einstellungen für lokale App und Home-Hub-Verbindung.
- sichtbarer Pairing-/Upload-Status.
- Speicherort und sichere Basisinformationen vorbereiten.

spaetere Milestones:

- Speicherprüfung.
- Backup-/Restore-Status inklusive letztem erfolgreichen Backup, Restore-Test
  und Fehlerzustand.
- Geräteverwaltung.
- Health Checks.
- Diagnosepaket.
- Migration-/Repair-Flows.

## Grenzen

Admin-Flows dürfen keine sensiblen Daten unnötig offenlegen.

Diagnose muss redigiert sein und darf keine Secrets enthalten.
