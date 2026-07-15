---
title: "Mappm DATA-00 Data Lifecycle Umbrella"
description: "Data-Lifecycle-Vertrag fuer Vault-Autoritaet, Cache, Verarbeitung, Sync, Backup, Export und Loeschung"
tags: [data, lifecycle, vault, sync, backup, deletion, playbook]
lastUpdated: "2026-07-15"
status: "accepted-direction"
owner: "data-architect"
---

# Mappm DATA-00 Data Lifecycle Umbrella

## Zweck

Mappm unterscheidet vor jeder Datenimplementierung zwischen Vault-Autoritaet,
lokalem Cache/Pending Work, Backup/Export und zeitlich begrenzter
Service-Verarbeitung. Der Data Layer bleibt ueber Provider austauschbar.

## Lifecycle Areas

| Bereich | Richtung | Status |
|---|---|---|
| Vault-Autoritaet und Cache | Local Vault ist lokal autoritativ; beim Cloud Vault sind lokaler Cache und Pending Work nicht autoritativ; Fakes bilden beide Modi ab | accepted-direction |
| Service-Verarbeitung | Core Assist darf Daten nach freigegebenem Zweck verarbeiten, wird dadurch aber nicht automatisch zur Vault-Autoritaet oder zum Backup | accepted-direction |
| Provider-Migration und Exit | Export sowie verifizierte Local-to-Cloud- und Cloud-to-Local-Ablaeufe | active-planned |
| Subscription Lifecycle | Grace/Read-only, Retention und Loeschung bleiben getrennte Zustaende | active-planned |
| Provider Boundary | Repositories haengen an Domain Ports; Adapter bleiben austauschbar | accepted |
| Sync/Sharing/Cloud Backup | Cloud-Autoritaet, Zugriff, Konflikt-, Recovery- und Retention-Regeln werden vor Umsetzung definiert | planned |
| Cache Policy | Retention, Invalidierung, Kapazitaet, Offline-Verhalten und Verschluesselung sind plattformspezifisch | planned |
| Backup/Restore | Owner, Verschluesselung, Restore-Test und sichtbarer Recovery-Pfad sind Pflicht | planned |
| Export/Loeschung | Exit, Portabilitaet, DSGVO-Rechte und verifizierte Loeschung werden vor Produktion geplant | planned |
| Migration | Schema-/Dateimigrationen benoetigen Tests, Inventar, Checksums und Rollback/Repair | planned |

## Artefaktindex

| Artefakt | Verantwortung |
|---|---|
| `DATA-01_CLASSIFICATION_CATALOG.md` | Datenklassen, Sensitivitaet, Zweck, Owner und erlaubte Verarbeitung |
| `DATA-02_RETENTION_DELETION.md` | Retention, Loeschung, Purge, Grace und Recovery Windows |
| `DATA-03_EXPORT_PORTABILITY.md` | Export, Portabilitaet, DSAR und Cloud-to-Local-Abgrenzung |
| `DATA-04_RESIDENCY_TRANSFERS.md` | Regionen, Subprocessors und internationale Transfers |
| `DATA-05_BACKUP_RESTORE.md` | Backup, Restore, RPO/RTO, Keys und Drill-Evidenz |
| `DATA-06_AUDIT_LOGS_LEGAL_HOLD.md` | Audit, Tamper Evidence, Retention und Legal Hold |

## Regeln

- UI-Phasen duerfen Fake Repositories und synthetischen Demo-Content nutzen.
- Fake Repositories werden explizit verdrahtet und gelangen nicht in
  Production-Service-Wiring.
- Frontend-Phasen duerfen Backend-Bedarf beschreiben. API Contracts,
  Persistence, Mapping und Policy Architecture bleiben Backend-/API-owned.
- Datenklassifikation, Zweck, Authority, Retention und Loeschung muessen vor
  Persistence, Sync, Export oder Assist-Verarbeitung feststehen.
- Sync ist kein Backup; Cache ist keine zweite Autoritaet; Assist-Verarbeitung
  ist keine stillschweigende Cloud-Vault-Migration.

## Stop Rules

- Stop, wenn eine Phase ihre Vault-Autoritaet und Cache-/Pending-Grenze nicht
  benennen kann.
- Stop, wenn Dokument, Fact, Preview, OCR-Text, Index oder Model Output ohne
  Lifecycle- und Loeschregel gespeichert wird.
- Stop, wenn Sync, Backup oder Sharing ohne Conflict-, Access-, Revocation- und
  Recovery-Verhalten geplant wird.
- Stop, wenn VC-02, VC-04, VC-06, VC-07 oder VC-08 fuer den betroffenen Scope
  offen ist.
