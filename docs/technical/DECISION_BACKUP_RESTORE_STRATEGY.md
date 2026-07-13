---
title: "Decision - Backup and Restore Strategy"
description: "Entscheidung zur minimalen Backup-/Restore-Strategie vor echtem Haushaltsbetrieb von Mappm"
tags: [decision, backup, restore, resilience, home-hub, local-first]
lastUpdated: "2026-07-12"
status: "accepted"
---

# Decision - Backup and Restore Strategy

## Status

Accepted with Vault-mode rebaseline on 2026-07-12.

The invariant "sync is not backup" remains binding. Home-Hub backup references
below are superseded. Local Vaults require encrypted export/restore; Cloud
Vaults require managed backup/restore plus free export and verified
Cloud-to-Local migration.

R11-D1 ist entschieden. Mappm braucht vor echtem Haushaltsbetrieb ein
verlaessliches Backup-/Restore-Minimum. Sync ist nicht das Sicherheitsnetz.

## Entscheidung

Vor echtem Haushaltsbetrieb braucht Mappm mindestens:

- lokales Backup fuer strukturierte Metadaten und Dokumentdateien.
- Home Hub als Backup-Ziel, nicht nur als Sync-Ziel.
- manuellen "Backup jetzt erstellen"-Flow.
- automatische regelmaessige Backups.
- sichtbaren Backup-Status.
- sichtbare Backup-Fehler.
- Restore-Test als Pflichtbestandteil der Backup-Readiness.

Ein Backup gilt erst als vertrauenswuerdig, wenn Mappm es testweise
wiederherstellen und die wichtigsten Integritaetspruefungen bestehen kann.

## Sync Ist Kein Backup

Sync und Backup haben unterschiedliche Produktrollen.

| Funktion | Zweck |
|---|---|
| Sync | aktuellen Zustand zwischen Geraeten replizieren |
| Backup | gegen Datenverlust, defekte Migrationen, versehentliches Loeschen, Geraeteverlust und kaputte Sync-Zustaende schuetzen |

Multi-Geraete-Sync darf deshalb nie das einzige Sicherheitsnetz sein.

## Minimale Produktanforderungen

Die App muss anzeigen koennen:

- wann das letzte erfolgreiche Backup gelaufen ist.
- ob das aktuelle Geraet gesichert ist.
- ob der Home Hub erreichbar und als Backup-Ziel nutzbar ist.
- ob Backup oder Restore Fehler haben.
- ob ein Restore-Test erfolgreich war.

Die App darf Backup-Fehler nicht still verschlucken.

## Scope Des Backups

Ein vollwertiges Backup umfasst:

- lokale strukturierte Daten.
- Dokumentdateien und technische Artefakte, die fuer Wiederherstellung relevant
  sind.
- Dateihashes und Integritaetsmetadaten.
- Versionen, Tombstones und Loeschinformationen, sobald sie Teil des
  Datenmodells sind.
- notwendige App-Konfiguration ohne Secrets im Klartext.

Secrets, Tokens und Recovery-Schluessel duerfen nicht unkontrolliert in normale
Backups wandern. Sie brauchen eine eigene Security-/Recovery-Regel.

## Home Hub Rolle

Der Home Hub ist fuer den ersten produktiven Haushaltsbetrieb:

- Sync Coordinator.
- Backup-Ziel.
- Restore-Quelle.
- Storage-Health-Pruefpunkt.

Der Home Hub ersetzt aber nicht die lokale App-Arbeitsbasis. Desktop und Mobile
muessen weiterhin offline nutzbar bleiben.

## Konsequenzen

- R11-D1 ist entschieden.
- Backup/Restore wird als Produktfunktion geplant, nicht als Nebeneffekt von
  Sync.
- R11 braucht eigene Phasen fuer Backup-Erzeugung, Home-Hub-Backup, Restore,
  Integritaetspruefung und UI-Status.
- Admin-/Storage-Health muss Backup- und Restore-Zustaende anzeigen koennen.
- Loeschung, Tombstones, Versionierung und Migrationen muessen mit Backup und
  Restore zusammengedacht werden.

## Nicht entschieden

- konkretes Backup-Dateiformat.
- konkrete Verschluesselungsstrategie fuer Backups.
- Backup-Retention-Regeln.
- ob Backups spaeter versioniert, inkrementell oder dedupliziert werden.
- UX-Details fuer Recovery nach Geraeteverlust.
