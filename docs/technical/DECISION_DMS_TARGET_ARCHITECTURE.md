---
title: "Decision - DMS Target Architecture"
description: "Langfristiges Zielbild fuer Mappm als vollwertiges Dokumentenmanagementsystem statt nur Dokumentanhaenge an Vorgängen"
tags: [decision, dms, documents, records, cases, capture, inbox, outbox, intelligence, sync]
lastUpdated: "2026-07-14"
status: "accepted-rebaseline"
---

# Decision - DMS Target Architecture

## 2026 Vault Rebaseline

The domain model remains accepted independently of storage mode. Every domain
object belongs to one Vault. Local and Cloud repository providers implement the
same domain meaning with different authority/cache rules. Home Hub and
self-hosted deployment references below are superseded by managed Mappm Cloud
and Local Development Cloud.

## Status

Accepted.

## Entscheidung

Mappm wird langfristig als vollwertiges privates Dokumentenmanagementsystem geplant.

Der Kern ist nicht:

```text
Vorgang -> Dokumentanhaenge
```

Sondern:

```text
Dokumente, Dateien, Versionen, Records, Vorgänge, Personen, Fakten,
Aufgaben, externe Aktionen, Sync und Intelligence bilden ein verbundenes DMS.
```

Der M2 darf davon nur einen kleinen Slice bauen. Das Datenmodell, die API-Grenzen,
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

Diese Bausteine sind fuer Mappm wertvoll, aber die konkrete BusinessCompanion-
Architektur wird nicht kopiert. Mappm bleibt local-first, haushaltszentriert und
kleiner geschnitten. Insbesondere wird kein ERP-artiges `ParentEntityType` /
`ParentEntityId` als dauerhaftes Kernmodell uebernommen.

## Zielmodell

Mappm trennt langfristig folgende Objekte:

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
| `ExportJob` / `OutboxItem` | Vorbereitete Ausgabe, Download, Druck, Mail, lokales ZIP oder Einreichpaket |
| `ProcessingJob` | OCR, Scan-Nachbearbeitung, Klassifikation, Matching, Indexing oder AI-Vorschlag |
| `WorkflowDefinition` | Kuratierte, versionierte Vorgangsvorlage mit Rechtsraum, Gültigkeit, Quellen, Schritten und Review-Regeln |
| `CaseWorkflowInstance` | An einen Vorgang gebundene Instanz einer unveränderlich referenzierten Workflow-Version |

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
- erledigt, aber als einer der letzten 10 verarbeiteten Eingänge kurzfristig korrigierbar.
- wieder geöffnet.

Die Outbox ist ebenfalls kein zweites Archiv. Sie beschreibt vorbereitete oder
ausgeführte Ausgaben:

- Datei öffnen oder herunterladen.
- drucken.
- lokal exportieren oder per Mail uebergeben.
- Exportpaket erzeugen.
- externe Website oder App öffnen.
- manuelle Uebergabe ausserhalb von DocMan vorbereiten.

Die eigentlichen Dokumente bleiben im DMS-Kern.

### Vorgänge bilden Zusammenhänge, nicht Ordner

`Case` / "Vorgang" bleibt der Begriff fuer Prozesse, Lebensereignisse,
Status, Aufgaben und Timeline.

Ein großer Vorgang wie ein Autounfall enthält zunächst Schritte, Ereignisse,
Tasks, Claims und bedingte Ablaufzweige. Polizei, Werkstatt, Versicherer oder
Krankenhaus sind nicht automatisch eigene Vorgänge. Eine längerfristige
Behandlung oder ein formelles Verfahren kann bei eigenständigem Ziel als
normaler Case verbunden werden.

Alle Case-Beziehungen werden über typisierte `CaseLink`-Referenzen modelliert.
`Subvorgang` bezeichnet nur die UI-Rolle eines `part_of`-Links; es gibt keinen
eigenen Subcase-Entitätstyp. Ein Dokument darf über `DocumentCaseLink`
gleichzeitig Auslöser, Nachweis, Einreichung, Antwort, Entscheidung oder
Zahlungsbeleg in mehreren Vorgängen sein. Eine primäre Zuordnung dient nur der
Navigation und bedeutet keine exklusive fachliche Eigentümerschaft.

### Workflows sind versionierter Produktinhalt

Die Vorgangs-Engine bleibt generisch. Länder-, Regions- und
Institutionsvarianten werden als kuratierte `WorkflowDefinition`-Versionen
modelliert und nicht in Screens oder plattformspezifischen Controllern
festgeschrieben. Eine `CaseWorkflowInstance` pinnt die verwendete Version, damit
laufende und abgeschlossene Vorgänge historisch erklärbar bleiben.

Sprache und Rechtsraum sind getrennte Dimensionen. Wenn keine geprüfte Variante
anwendbar ist, bleibt ein manueller Vorgang mit Dokumenten, Relationen, Aufgaben
und Timeline möglich. Das vollständige Governance-Modell steht in
`DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`.

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

Mappm speichert strukturierte Metadaten lokal in SQLite/Drift. Dateien liegen
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
  -> actor/profile/case/record suggestion
  -> applicable published workflow suggestion
  -> fact suggestion
  -> search indexing
  -> user review
  -> accepted suggestions become domain data
```

Fehler in dieser Pipeline duerfen Dokumentverwaltung nicht blockieren.
Processing-Ergebnisse haben Status, Fehlerquelle, Zeitpunkt und Review-Zustand.
Intelligence darf nur veröffentlichte Workflow-Definitionen vorschlagen; sie ist
nicht Autorität für Rechtsraum, Frist, Anspruch oder Ablauf.

## Search- und Analytics-Konsequenzen

Suche muss langfristig mehrere Ebenen abdecken:

- Dokumenttitel und Metadaten.
- Vorgänge, typisierte Beziehungen, Workflow-Zweige und Timeline.
- Records und Versionen.
- Profile und Haushaltsbezug.
- strukturierte Facts.
- Beträge, Händler, Versicherungen, Fristen und Gültigkeiten.
- OCR-Text.
- später semantische Suche und RAG.

Der M2 darf SQLite/Drift/FTS5 nutzen. Die Domain-Grenze bleibt aber so
geschnitten, dass spätere Indexer wie Meilisearch, Typesense, PostgreSQL FTS,
Qdrant oder andere Provider ergänzt werden können.

## Abgrenzung zum M2

Der M2 baut nur den kleinsten nutzbaren Schnitt:

- Desktop-Import.
- Mobile Capture in die Draft-Inbox.
- betroffene Person / Haushaltsprofil als Pflichtzuordnung je Dokument-Draft.
- Vorgänge mit typisierten Beziehungen, manueller Erstellung und
  Bottom-up-Komposition.
- einfache Dokumentannahme.
- lokale Suche.
- Aufgaben/Reminder-Daten.
- Schnellzugriff.

Der M2 darf vereinfachen:

- ein primärer Vorgang je Dokument.
- keine vollständigen `DocumentCaseLink`-Rollen in der UI.
- keine automatische OCR-/AI-Übernahme.
- keine vollständige Outbox.
- kein vollständiger Haushaltsrechte-Editor.

Der M2 darf aber nicht verbauen:

- flexible Mehrfachbeziehungen.
- Versionierung.
- strukturierte Facts.
- Personen-/Profilbezug.
- spätere Sync-/Backup-Fähigkeit.
- spätere Processing-Jobs.
- spätere Exportpakete.
- kuratierte, versionierte und internationalisierbare Workflow-Definitionen.

## Konsequenzen fuer Planung

- R4 bleibt ein M2-Slice, aber nicht die DMS-Endarchitektur.
- R5/R6 müssen Haushaltsprofile, Rechte und Sync auf dem DMS-Kern aufbauen.
- R8 ist nicht nur "Insights", sondern die Phase, in der strukturierte Facts,
  Claims, Finanzdaten und Auswertungen den DMS-Kern erweitern.
- R9 Intelligence darf nur Vorschläge liefern, die in DMS-Objekte übernommen
  oder verworfen werden können.
- Workflow-Katalog und Länderpakete werden als eigenes fachliches Produkt- und
  Compliance-Asset geplant, nicht als LLM-Prompt oder UI-Konfiguration.
- BusinessCompanion-Technologien werden separat bewertet. Das Modell entscheidet
  zuerst, Technologien danach.

## Nicht entschieden

- finaler deutscher UI-Begriff fuer `Record`.
- konkrete OCR-/Scan-Technologie.
- konkrete Suchtechnologie nach FTS5.
- konkrete Verschlüsselungsstrategie fuer Multi-Geräte-Sync und remote Dateien.
