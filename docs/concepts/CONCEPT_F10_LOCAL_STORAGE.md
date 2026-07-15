---
title: "Konzept F10 - Client Storage, Vault Authority and Cache"
description: "Verbindliches Client-Storage-Modell fuer Local Vault, Cloud Cache, Pending Operations, Capture und Provider-Migration"
tags: [concept, foundation, local-storage, vault, cloud-cache, persistence, migration, drift]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted"
owner: "data-architect"
---

# Konzept F10 - Client Storage, Vault Authority and Cache

## Status und Source of Truth

Akzeptiert. F10 konkretisiert
`docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` und
`docs/technical/DECISION_LOCAL_DATABASE.md` fuer die Flutter-App. Es ersetzt
fruehere universelle Local-first-, Home-Hub-, MinIO- und Self-Hosting-Annahmen.

## Zweck

F10 definiert, welche Daten der Client speichert, wann sie autoritativ oder nur
lokal verfuegbar sind und wie Dateien, strukturierte Daten, Secrets, Caches und
ausstehende Operationen getrennt werden.

## Normatives Vault-Modell

| Aspekt | Local Vault | Cloud Vault |
|---|---|---|
| Autoritaet | lokale Metadaten- und Dateispeicher | Mappm Cloud |
| strukturierter Client-Speicher | vollstaendiger Arbeitsbestand | policy-begrenzter Cache, Index und Pending State |
| Dateien am Client | vollstaendige autoritative Payloads | ausgewaehlter Cache sowie ausstehende Uploads/Downloads |
| Offline-Schreibvorgang | nach lokaler Transaktion autoritativ | durable Pending Operation bis Cloud-Bestaetigung |
| Backup/Recovery | separater verschluesselter Export/Restore | Managed Restore plus Export und verifizierte Local-Migration |

Cache-Praesenz macht den Client nicht autoritativ. Cache-Bereinigung ist keine
Vault-Loeschung. Assist-Verarbeitung ist weder Cloud-Vault-Speicherung noch
Backup.

## Speicherbausteine

```text
Domain Ports
  -> StructuredDataRepository
      -> Drift / SQLite
  -> DocumentFileStore
      -> Local authoritative files oder Cloud cache/pending files
  -> SecretStore
      -> Platform Secure Storage
  -> Cloud Repository Adapter
      -> Mappm Cloud API
```

- SQLite mit Drift ist der strukturierte Client-Speicher.
- Originale, Scans, PDFs, Previews und andere grosse Binaerdaten liegen hinter
  einem File-Store-Port, nicht als grosse SQLite-BLOBs.
- Tokens, Schluessel und Recovery-Geheimnisse liegen ausschliesslich im Secure
  Storage gemaess F12.
- Domain und Presentation kennen keine Pfade, Drift-Tabellen, S3-/HTTP-SDKs oder
  Cache-Implementierungen.
- Previews, Thumbnails, OCR-Indizes und andere Ableitungen sind reproduzierbar
  und separat von Originalen gekennzeichnet.

## Datenklassen

| Klasse | Beispiele | Schutz/Retention |
|---|---|---|
| Domain-Daten | Cases, Records, Documents, Profiles, Tasks, Events, Claims, Links | Vault-Lifecycle |
| Capture-Daten | Sessions, Seitenmanifeste, logische Dokumente, Originalstatus | bis sichere Uebernahme plus Policy |
| Processing-Daten | Jobs, Stufenstatus, Vorschlaege, Confidence, Provenance | sensibel, versioniert |
| Pending Operations | Upload, Aenderung, Loeschung, Konfliktbasis | bis bestaetigt/aufgeloest |
| Cache/Index | Cloud-Metadaten, Payload-Cache, FTS/OCR-Index | policy-begrenzt, neu aufbaubar soweit abgeleitet |
| Migration | Inventar, Checkpoints, Checksums, Verifikation | bis Abschluss und Recovery-Frist |
| UI-Praeferenzen | Filter, Sortierung, Layout | nicht fachlich autoritativ |
| Secrets | Session, Device Trust, lokale Schluessel | nur Secure Storage |
| Diagnose | redigierte Codes, Operation IDs | kurze definierte Retention |

OCR-Text, extrahierte Fakten, Titelvorschlaege, Suchindizes und
Modellergebnisse gelten als sensible Produktdaten, nicht als harmlose
technische Metadaten.

## Strukturierte Persistenz

Das konkrete Schema wird in einem Data-Architecture-Plan entschieden. Es muss
mindestens folgende Faehigkeiten tragen:

- stabile IDs, Zeitstempel und Revisionen.
- Vault-/Profilzuordnung ohne stille Defaults.
- Documents mit Seiten/Artefakten und primaerem Case- oder Record-Kontext nach
  akzeptierter Review.
- mehrere zusaetzliche Case-/Record-Links ohne Dokumentduplikation.
- `CaseLink` mit `part_of`, `caused_by`, `follow_up_to` und `related_to`; kein
  eigener Subcase-Typ und kein zwingender Baum.
- Records, Claims, Tasks, Termine und Workflow-Fortschritt als getrennte
  fachliche Konzepte.
- Pending Operations, Konfliktbasis, Tombstones und Idempotency Keys.
- versionierte Vorschlaege, Provenance sowie bestaetigte/korrigierte Werte.
- Cache- und lokale Verfuegbarkeit unabhaengig von Cloud-Autoritaet.

Flexible Provider-Rohdaten duerfen kontrolliert in JSON-Feldern liegen. Stabile
Produktwahrheiten werden explizit modelliert und nicht in unversionierten
Payloads versteckt.

## Capture-Persistenz

Ein Scan umfasst genau ein logisches Dokument mit einer oder mehreren Seiten.
Mehrere Dokumente duerfen in einer technischen Session nacheinander erfasst
werden; jedes Dokument besitzt eigenen Job-, Retry- und Review-State.

Vor Verlassen des Capture-Flows muss das Original lokal durable sein oder eine
vom Cloud-Vertrag bestaetigte durable Uebernahme besitzen. Persistiert werden:

- Capture Session, Seiten-/Dateimanifest und Hash.
- logische Dokumentgrenze und Artefaktstatus.
- Upload-/Processing-Checkpoint pro Dokument.
- vorgeschlagener Titel, Typ, Fakten und Kontexte mit Provenance.
- optionaler New-Case-/Case-Intent als Matching-Signal.
- User-Bestaetigungen, Korrekturen und erhaltene akzeptierte Historie.
- Teilfehler und Wiederanlauf nach App-Neustart.

Solange Capture oder Review pending ist, darf ein Dokument noch keinen
akzeptierten Primaerkontext haben. Nach Abschluss besitzt jedes Dokument einen
primaeren Case oder Record. Ein leichter Custom Case ist dabei ein normaler
Case, kein separates Datenmodell und kein zweitklassiger Ablageort.

## Datei- und Integritaetsregeln

- Originale werden nie still veraendert oder durch Previews ersetzt.
- Jede Payload hat eine stabile Referenz, Groesse, MIME-Erkennung und Hash.
- Hashes unterstuetzen Integritaet und Duplikatwarnung, sind aber nicht pauschal
  ein Unique Constraint.
- Loeschen, Cache-Bereinigen, Exportieren und Vault-Migration sind getrennte
  Operationen mit getrenntem Scope.
- Eine lokale Originaldatei wird erst gemaess akzeptierter Policy entfernt,
  nachdem Zieluebernahme und Verifikation bestaetigt sind.
- Fehlende oder korrupte Dateien erzeugen einen sichtbaren Integrity-/Recovery-
  Zustand; Metadaten duerfen keinen erfolgreichen Besitz vortaeuschen.

## Cloud Cache und Pending Operations

Cloud-Vault-Clients speichern nur die gemaess Policy noetigen Daten. Offline-
Aenderungen enthalten Basisrevision, stabile Operation-ID und Idempotency Key.
Sie bleiben bis zu Cloud-Accept, Conflict oder expliziter Aufloesung erhalten.

Ein Cache Miss offline liefert einen eindeutigen Nicht-verfuegbar-Zustand. Die
App erfindet keinen Inhalt und verwechselt Metadaten-Cache nicht mit lokal
verfuegbarem Original.

## Provider-Migration

Local-to-Cloud und Cloud-to-Local verwenden:

- reproduzierbares Quellinventar.
- durable Checkpoints und resumable Transfer.
- Counts, Bytes, Hashes und Revision-Reconciliation.
- kurze explizite Finalisierungsphase ohne konkurrierende Writes.
- atomaren Autoritaetswechsel erst nach vollstaendiger Verifikation.
- inaktive Read-only-Quelle als Recovery-/Exit-Snapshot gemaess Policy.

Ein Abbruch vor Aktivierung belaesst die Quelle autoritativ. Ein Crash darf nie
zwei schreibende Autoritaeten erzeugen.

## Suche

Strukturierte Filter und lokaler Textindex liegen hinter einem
Domain-Search-Port. FTS-/OCR-Indizes sind sensibel und pro Vault isoliert.
Semantische oder Cloud-Suche darf spaeter als Adapter ergaenzt werden, ohne das
Domain-Modell oder die Vault-Autoritaet zu aendern.

## Sicherheit, Datenschutz und Plattform

- Verschluesselung, Schluesselzugriff und Plattform-Backup-Ausschluesse folgen
  F12 und der Security-Entscheidung.
- Daten verschiedener Vaults und verwalteter Profile werden logisch und wo
  erforderlich kryptographisch isoliert.
- Betriebssystem-Backups duerfen keine unkontrollierte zweite Vault-Kopie
  erzeugen.
- Logs, Crash Reports und Tests enthalten keine privaten Pfade, Inhalte,
  Dateinamen, OCR-Texte oder Secrets.
- Desktop und Mobile verwenden dieselben Domain-Ports; Adapter duerfen
  plattformspezifisch sein.

## Tests und Verifikation

- Drift-Migrations- und Repository-Tests inklusive Rollback/Fehlerpfad.
- File-Store-Tests fuer Atomizitaet, Hash, fehlende Dateien und Quellenerhalt.
- Local-/Cloud-Matrix fuer Autoritaet, Cache, Pending und Offline.
- Restart-, Idempotenz-, Konflikt- und Tombstone-Tests.
- Capture-/Processing-Tests mit Teilfehler und bestaetigten Werten.
- Migrationsnachweis mit Inventar, Checksums und genau einer Autoritaet.
- Privacy-Tests fuer Backup-Ausschluss, Logs und synthetische Fixtures.

## Stop Rules

Stop, wenn:

- Cache und Autoritaet gleichgesetzt werden.
- Secrets oder grosse Originale unkontrolliert in SQLite landen.
- ein Dokument nach akzeptierter Review ohne primaeren Case/Record verbleibt.
- ein separater Subcase- oder Custom-Case-Datentyp eingefuehrt wird.
- Quellendaten vor verifizierter Zielaktivierung geloescht werden.
- ein Schema API-DTOs oder Provider-SDK-Typen in Domain/Presentation leakt.
- Retention, Verschluesselung oder Migration fuer sensible Daten ungeklaert ist.

## Handoff

Schema, Repositories und Migration gehen an `data-architect`; Umsetzung an
`foundation-builder`; Cloud-Vertraege an `contract-api`; Tests und Gates an
`quality-readiness`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die betroffene Phase stoppt.
