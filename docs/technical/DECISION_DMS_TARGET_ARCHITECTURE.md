---
title: "Decision - DMS Target Architecture"
description: "Langfristiges Zielbild fuer Ordna als vollwertiges Dokumentenmanagementsystem statt nur Dokumentanhaenge an Vorgängen"
tags: [decision, dms, documents, records, cases, capture, inbox, outbox, intelligence, sync]
lastUpdated: "2026-05-08"
status: "accepted"
---

# Decision - DMS Target Architecture

## Status

Accepted.

## Entscheidung

Ordna wird langfristig als vollwertiges privates Dokumentenmanagementsystem geplant.

Der Kern ist nicht:

```text
Vorgang -> Dokumentanhaenge
```

Sondern:

```text
Dokumente, Dateien, Versionen, Records, Vorgänge, Personen, Fakten,
Aufgaben, externe Aktionen, Sync und Intelligence bilden ein verbundenes DMS.
```

Der MVP darf davon nur einen kleinen Slice bauen. Das Datenmodell, die API-Grenzen,
die Suchgrenze und die Speichergrenzen duerfen aber nicht so geschnitten werden,
dass Dokumente dauerhaft an genau einen Vorgang oder an eine Ordnerstruktur
gebunden sind.

## Referenzanalyse

BusinessCompanion zeigt ein wichtiges Muster:

- FileStorage trennt Datei-Bytes von Metadaten.
- FileMetadata enthaelt Uploadstatus, Hash, Versionierung, Retention,
  Legal-Hold, Virus-Scan, Ingestion-Status und Linked Entities.
- Databox ist eine user-facing Inbox fuer erzeugte oder gelieferte Artefakte.
- Ingestion verarbeitet Dokumente asynchron: Crawl, Match, Import, Embed,
  Lifecycle, Cleanup.
- Document Silos bilden grobe Zugriffsräume fuer Dokumente.

Diese Bausteine sind fuer Ordna wertvoll, aber die konkrete BusinessCompanion-
Architektur wird nicht kopiert. Ordna bleibt local-first, haushaltszentriert und
kleiner geschnitten. Insbesondere wird kein ERP-artiges `ParentEntityType` /
`ParentEntityId` als dauerhaftes Kernmodell uebernommen.

## Zielmodell

Ordna trennt langfristig folgende Objekte:

| Objekt | Zweck |
|---|---|
| `DocumentRecord` | Logisches Dokument, Beleg oder Unterlage, z. B. "Arztrechnung Mai 2026" |
| `FileRecord` | Konkrete gespeicherte Datei, Scan, Bild oder PDF mit Hash, MIME-Type und Storage-Key |
| `DocumentVersion` | Version eines Dokuments oder Records, inklusive aktueller und historischer Datei |
| `Record` | Langlebiger fachlicher Nachweis, z. B. Geburtsurkunde, Meldezettel, Polizze |
| `Case` | Vorgang, Prozess, Verlauf oder Kontext |
| `CaseLink` | Beziehung zwischen Vorgängen, z. B. Subvorgang, Folge, Ursache, Claim-Kontext |
| `DocumentCaseLink` | Beziehung zwischen Dokument und Vorgang mit Rolle, z. B. `primary`, `context`, `evidence`, `source` |
| `DocumentProfileLink` | Personen-/Profilbezug fuer Dokumente, Records, Facts und Vorgänge |
| `DocumentFact` | Strukturierte, such- und auswertbare Aussage aus Dokumenten oder manueller Erfassung |
| `Task` / `Reminder` | Handlungsbedarf, Frist, Zahlung, Einreichung, Termin oder Wiedervorlage |
| `InboxItem` | Capture-/Review-Arbeitseinheit, nicht der eigentliche Speicherort |
| `ExportJob` / `OutboxItem` | Vorbereitete Ausgabe, Download, Druck, Mail, Share oder Einreichpaket |
| `ProcessingJob` | OCR, Scan-Nachbearbeitung, Klassifikation, Matching, Indexing oder AI-Vorschlag |

## Zentrale Modellregeln

### Dokumente sind eigenständige Objekte

Ein Dokument darf ohne Vorgang existieren.

Beispiele:

- Geburtsurkunde.
- Staatsbuergerschaftsnachweis.
- Meldezettel.
- Versicherungspolizze.
- Zeugnis.
- Garantie.
- wichtige Lernunterlage.

Ein Vorgang kann erklären, warum ein Dokument entstanden ist oder warum eine
neue Version existiert. Der Vorgang besitzt das Dokument aber nicht exklusiv.

### Dateien werden nicht dupliziert

Mehrfachzuordnung darf nicht zu Datei-Duplikaten führen.

Ein Scan kann sichtbar sein:

- im Dokumentbereich.
- in einem Vorgang.
- in einem Subvorgang.
- im Profil eines Kindes.
- in einer Versicherungs-/Claim-Auswertung.
- im Schnellzugriff.
- in einem Exportpaket.

Technisch wird das über Beziehungen modelliert, nicht über Kopien.

### Inbox und Outbox sind Arbeitsflächen

Die Inbox ist kein Archiv und keine Besitzstruktur.

Sie beschreibt:

- neuer Capture.
- Draft.
- Review nötig.
- erledigt, aber kurzfristig korrigierbar.
- wieder geöffnet.

Die Outbox ist ebenfalls kein zweites Archiv. Sie beschreibt vorbereitete oder
ausgeführte Ausgaben:

- Datei öffnen oder herunterladen.
- drucken.
- per Mail übergeben.
- Exportpaket erzeugen.
- externe Website oder App öffnen.
- spätere sichere Freigabe vorbereiten.

Die eigentlichen Dokumente bleiben im DMS-Kern.

### Vorgänge bilden Zusammenhänge, nicht Ordner

`Case` / "Vorgang" bleibt der Begriff fuer Prozesse, Lebensereignisse,
Status, Aufgaben und Timeline.

Ein großer Vorgang wie ein Autounfall kann Subvorgänge haben:

- Unfallhauptvorgang.
- Polizei.
- Werkstatt.
- Versicherung.
- Krankenhaus / Arzt.
- Anwalt / Gericht.

Dokumente liegen nicht doppelt im Haupt- und Subvorgang. Der Hauptvorgang zeigt
Subvorgänge und kann später kontextuell Dokumente aus Subvorgängen einblenden.

### Haushalts- und Personenbezug ist kein Ordnersystem

Profile beschreiben, wen ein Dokument oder Vorgang betrifft, nicht wo es
physisch liegt.

Ein Dokument kann mehrere Profile betreffen:

- Kind als Patient.
- Elternteil als zahlende oder verwaltende Person.
- gemeinsamer Haushalt als Versicherungsnehmer.

Partner- und Kinderzugriff werden später über Haushaltsrechte und Profile
modelliert, nicht über Dokumentkopien.

### Fakten sind eigene, prüfbare Daten

Strukturierte Fakten werden nicht als beliebige `metadata`-Map versteckt.

Beispiele:

- Betrag.
- Fälligkeit.
- Behandlungsdatum.
- Aussteller.
- Versicherungsstatus.
- Erstattungsbetrag.
- Erstattungsprozentsatz.
- Vertragsbeginn.
- Ablaufdatum.
- Kündigungsfrist.
- Garantieende.

OCR/AI darf Facts später vorschlagen. Fachlich relevante Facts bleiben
reviewbar und nachvollziehbar.

## Zielarchitektur nach Verantwortungen

```text
Capture
  -> InboxItem
      -> Review
          -> DocumentRecord
              -> FileRecord / DocumentVersion
              -> DocumentCaseLink
              -> DocumentProfileLink
              -> DocumentFact
              -> Task / Reminder
              -> Search Index
              -> ProcessingJob
              -> ExportJob / OutboxItem
```

## Storage- und Sync-Konsequenzen

Ordna speichert strukturierte Metadaten lokal in SQLite/Drift. Dateien liegen
separat im Dateispeicher und werden über stabile IDs referenziert.

Langfristig muss das Modell folgende Betriebsformen tragen:

- Single-device local-first.
- Desktop plus Mobile Capture.
- Home Hub im privaten Netz.
- Multi-Geräte-Sync im Haushalt.
- Self-hosted cloudartiger Betrieb.
- spätere verschlüsselte Remote-Dateiablage.
- Backup/Restore mit Integritätsprüfung.

Deshalb braucht das Modell:

- stabile sync-faehige IDs.
- `createdAt`, `updatedAt`, `deletedAt` oder Tombstones.
- Hashes fuer Datei-Integritaet und Dubletten.
- klare Trennung von Secrets, Nutzdaten und Logs.
- Storage-Abstraktion fuer lokale Dateien, Home-Hub-Dateien und spaeter S3-kompatible Stores.
- keine harte Annahme, dass ein Server dauerhaft Klartext-Owner aller Dokumente ist.

Die konkrete Storage-Leitplanke steht in
`DECISION_FILE_STORAGE_AND_DOCKER_STACK.md`: App-local verwendet lokalen
Dateispeicher hinter einem Storage-Port; der Home-Hub-/Server-Stack plant
MinIO/S3-kompatiblen Storage als austauschbaren Adapter.

## Processing- und Intelligence-Konsequenzen

OCR, Scan-Nachbearbeitung, Klassifikation, Matching, Embeddings und lokale LLMs
werden als asynchrone Processing-Jobs geplant.

Zielbild:

```text
FileRecord accepted
  -> OCR / text extraction
  -> document type suggestion
  -> profile/case/record suggestion
  -> fact suggestion
  -> search indexing
  -> user review
  -> accepted suggestions become domain data
```

Fehler in dieser Pipeline duerfen Dokumentverwaltung nicht blockieren.
Processing-Ergebnisse haben Status, Fehlerquelle, Zeitpunkt und Review-Zustand.

## Search- und Analytics-Konsequenzen

Suche muss langfristig mehrere Ebenen abdecken:

- Dokumenttitel und Metadaten.
- Vorgänge, Subvorgänge und Timeline.
- Records und Versionen.
- Profile und Haushaltsbezug.
- strukturierte Facts.
- Beträge, Händler, Versicherungen, Fristen und Gültigkeiten.
- OCR-Text.
- später semantische Suche und RAG.

Der MVP darf SQLite/Drift/FTS5 nutzen. Die Domain-Grenze bleibt aber so
geschnitten, dass spätere Indexer wie Meilisearch, Typesense, PostgreSQL FTS,
Qdrant oder andere Provider ergänzt werden können.

## Abgrenzung zum MVP

Der MVP baut nur den kleinsten nutzbaren Schnitt:

- Desktop-Import.
- Mobile Capture in die Draft-Inbox.
- ein aktives Profil.
- Vorgänge mit MVP-light-Subvorgängen.
- einfache Dokumentannahme.
- lokale Suche.
- Aufgaben/Reminder-Daten.
- Schnellzugriff.

Der MVP darf vereinfachen:

- ein primärer Vorgang je Dokument.
- keine vollständigen `DocumentCaseLink`-Rollen in der UI.
- keine automatische OCR-/AI-Übernahme.
- keine vollständige Outbox.
- kein vollständiger Haushaltsrechte-Editor.

Der MVP darf aber nicht verbauen:

- flexible Mehrfachbeziehungen.
- Versionierung.
- strukturierte Facts.
- Personen-/Profilbezug.
- spätere Sync-/Backup-Fähigkeit.
- spätere Processing-Jobs.
- spätere Exportpakete.

## Konsequenzen fuer Planung

- R4 bleibt ein MVP-Slice, aber nicht die DMS-Endarchitektur.
- R5/R6 müssen Haushaltsprofile, Rechte und Sync auf dem DMS-Kern aufbauen.
- R8 ist nicht nur "Insights", sondern die Phase, in der strukturierte Facts,
  Claims, Finanzdaten und Auswertungen den DMS-Kern erweitern.
- R9 Intelligence darf nur Vorschläge liefern, die in DMS-Objekte übernommen
  oder verworfen werden können.
- BusinessCompanion-Technologien werden separat bewertet. Das Modell entscheidet
  zuerst, Technologien danach.

## Nicht entschieden

- finaler deutscher UI-Begriff fuer `Record`.
- konkrete OCR-/Scan-Technologie.
- konkrete Suchtechnologie nach FTS5.
- konkrete Verschlüsselungsstrategie fuer Multi-Geräte-Sync und remote Dateien.
