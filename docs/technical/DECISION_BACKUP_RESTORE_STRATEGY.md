---
title: "Decision - Backup and Restore Strategy"
description: "Vault-spezifische Backup-, Export-, Restore- und Recovery-Strategie vor produktiver Nutzung"
tags: [decision, backup, restore, resilience, vault, cloud, local]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "data-architect/operations/product"
---

# Decision - Backup and Restore Strategy

## Entscheidung

Sync ist kein Backup. Vor produktiver Nutzung benoetigt jeder aktivierte
Vault-Modus einen nachgewiesenen, wiederherstellbaren Exit-/Recovery-Pfad.

| Vault-Modus | Verbindliches Minimum |
|---|---|
| Local Vault | verschluesselter vollstaendiger Export/Backup, Restore und Integritaetspruefung |
| Cloud Vault | managed Backup/Restore, freier Export und verifizierte Cloud-to-Local-Migration |

Backupfaehigkeit wird nicht durch blosse Jobausfuehrung bewiesen. Ein Backup
gilt erst als vertrauenswuerdig, wenn Restore, Counts, Referenzen und Checksums
in einer isolierten Testumgebung erfolgreich geprueft wurden.

## Local Vault

- Backup umfasst strukturierte Daten, Originaldateien, relevante Manifeste und
  die fuer Restore notwendige Version-/Schemainformation.
- Verschluesselung und Key-/Recovery-Handhabung folgen der akzeptierten
  Security-Entscheidung.
- Zielort, Zeit, Umfang, letzter Erfolg und Fehler sind sichtbar.
- Betriebssystem-Backups gelten nur nach ausdruecklicher Security-/Platform-
  Pruefung als zulaessiger Teil der Strategie.
- Detached Recovery und Export bleiben auch ohne aktiven Servicezugang moeglich.

## Cloud Vault

- Managed Backups sind von Live-Storage und normaler Replikation getrennt.
- Restore besitzt definierte RPO/RTO, Retention, Region und Operatorzugriff.
- User-Export und Cloud-to-Local sind keine kostenpflichtig blockierbaren
  Premium-Extras im Kuendigungs-/Grace-Pfad.
- Backup-Retention und User-Loeschung werden rechtlich/technisch abgestimmt und
  transparent kommuniziert.
- Multi-Vault-/Tenant-Restore darf keine fremden Daten exponieren.

## Restore und Migration

- Restore laeuft in einen klaren Zielkontext und ueberschreibt keine aktive
  Autoritaet still.
- Vor Aktivierung werden Inventar, Counts, Checksums und Referenzen geprueft.
- Schema-/App-Versionen besitzen einen dokumentierten Upgradepfad.
- Fehlende oder korrupte Eintraege werden gelistet; Erfolg darf sie nicht
  verbergen.
- Restore-, Rollback- und Disaster-Recovery-Drills werden regelmaessig
  wiederholt und datiert dokumentiert.

## Security, Privacy und Operations

- Backups sind verschluesselt, zugriffskontrolliert, redigiert diagnostizierbar
  und besitzen Retention/Deletion.
- Keine Dokumentnamen oder Inhalte in globalem Backup-Status, Logs oder Alerts.
- Backup-Schluessel und Recovery Secrets liegen nicht im Backup selbst ohne
  akzeptiertes Envelope-/Recovery-Modell.
- Monitoring erkennt ausbleibende/fehlerhafte Backups; Fehler sind sichtbar und
  supportbar.

## Tests und Gates

- automatisierte Backup-/Restore-Integritaetstests mit synthetischen Vaults.
- Crash, unvollstaendiges Backup, falscher Key, Korruption und Schemawechsel.
- Cloud-Tenant-Isolation und lokale Zielplatz-/Speicherfehler.
- Restore Drill vor Closed Beta und vor Commercial 1.0.
- dokumentierte RPO/RTO-/Retention-Abnahme fuer Managed Cloud.

## Stop Rules

Stop, wenn Sync als Backup gilt, Restore nie ausgefuehrt wurde, Exit durch
Kuendigung/Quota blockiert wird, Backup-Schluessel ungeklärt sind oder ein
Restore zwei schreibende Autoritaeten erzeugen kann.
