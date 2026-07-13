---
title: "Plattform-Säule - Admin, Settings and Storage Health"
description: "Plattformbereich fuer Setup, Einstellungen, Speicherzustand, lokale Administration, Backup-Status und Wartung"
tags: [pillar, platform, admin, settings, storage, health]
lastUpdated: "2026-07-12"
version: "0.2"
status: "proposed"
---

# Plattform-Säule - Admin, Settings and Storage Health

## Zweck

DocMan braucht eine kontrollierbare Betriebsoberfläche:

- App-Setup.
- aktiver Vault-Modus, Mappm Account/Gerät und Entitlement in jedem normalen
  Modus sowie Detached-Recovery-Status.
- Core/Advanced-Assist-Kontingent, Verarbeitung, Opt-out und manuelle
  Degradation getrennt von Vault-Speicher/Backup.
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

- Einstellungen für Local/Cloud Vault, Cache, Export, Migration und Diagnose.
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

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
