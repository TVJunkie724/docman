---
title: "Plattform-Säule - Admin, Settings and Storage Health"
description: "Plattformbereich fuer Setup, Einstellungen, Speicherzustand, lokale Administration, Backup-Status und Wartung"
tags: [pillar, platform, admin, settings, storage, health]
lastUpdated: "2026-07-15"
version: "0.3"
status: "proposed"
owner: "product-concept/ui-concept"
---

# Plattform-Säule - Admin, Settings and Storage Health

## Zweck

Mappm braucht eine kontrollierbare Betriebsoberflaeche:

- App-Setup.
- aktiver Vault-Modus, Mappm Account/Gerät und Entitlement in jedem normalen
  Modus sowie Detached-Recovery-Status.
- Core/Advanced-Assist-Kontingent, Verarbeitung, Opt-out und manuelle
  Degradation getrennt von Vault-Speicher/Backup.
- autorisierte Geraete und Sessions.
- lokale Verfuegbarkeit, Cache und Speicherbedarf.
- Backup-Status.
- Diagnose.
- lokale Wartung.

R11-D1 ergaenzt: Backup- und Restore-Zustaende muessen in Admin/Settings
sichtbar werden. Ein Backup-Fehler ist ein Betriebszustand, kein stiller
Hintergrundfehler.

## Commercial-Core-Scope

C1-C4:

- Einstellungen für Local/Cloud Vault, Cache, Export, Migration und Diagnose.
- sichtbarer Device-/Session-/Upload-/Processing-Status, wenn Handlungsbedarf
  besteht.
- Speicherort und sichere Basisinformationen vorbereiten.

Spaetere Slices:

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

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
