---
title: "Decision - DMS Target Architecture"
description: "Langfristiges Zielbild fuer Mappm als vollwertiges Dokumentenmanagementsystem statt nur Dokumentanhaenge an Vorgängen"
tags: [decision, dms, documents, records, cases, capture, inbox, outbox, intelligence, sync]
lastUpdated: "2026-07-25"
status: "accepted"
owner: "product-concept/data-architect"
---
# Decision - DMS Target Architecture

## Vault-Baseline 2026

Das Domainmodell gilt unabhängig vom Speichermodus. Jedes Domainobjekt gehört
zu genau einem Vault. Local- und Cloud-Repository-Provider implementieren
dieselbe fachliche Bedeutung mit unterschiedlichen Authority- und Cache-Regeln.
Frühere Home-Hub- oder kundenseitige Self-hosting-Annahmen sind durch Mappm
Cloud und Local Development Cloud ersetzt.

## Status

Angenommen.

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

Der Commercial Core darf davon zunächst nur einen kleinen Slice bauen. Das Datenmodell, die API-Grenzen,
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
Architektur wird nicht kopiert. Mappm bleibt Vault-provider-aware,
haushaltszentriert und kleiner geschnitten: Local Vault ist lokal autoritativ,
Cloud Vault serverautoritativ mit lokalem Cache/Pending State. Insbesondere wird
kein ERP-artiges `ParentEntityType` /
`ParentEntityId` als dauerhaftes Kernmodell uebernommen.

## Zielmodell

Mappm trennt langfristig folgende Objekte:

| Objekt | Zweck |
|---|---|
| `DocumentRecord` | Logisches Dokument, Beleg oder Unterlage, z. B. "Arztrechnung Dr. Mayer"; Datumswerte bleiben separate Facts |
| `FileRecord` | Konkrete gespeicherte Datei, Scan, Bild oder PDF mit Hash, MIME-Type und Storage-Key |
| `DocumentVersion` | Version eines Dokuments oder Records, inklusive aktueller und historischer Datei |
| `Record` | Langlebiger fachlicher Nachweis, z. B. Geburtsurkunde, Meldezettel, Polizze |
| `Case` | Vorgang, Prozess, Verlauf oder Kontext |
| `CaseLink` | Beziehung zwischen Vorgängen, z. B. Subvorgang, Folge, Ursache oder Versicherungsabwicklung |
| `DocumentCaseLink` | Beziehung zwischen Dokument und Vorgang mit Rolle, z. B. `primary`, `context`, `evidence`, `source` |
| `DocumentProfileLink` | Personen-/Profilbezug fuer Dokumente, Records, Facts und Vorgänge |
| `DocumentFact` | Strukturierte, such- und auswertbare Aussage aus Dokumenten oder manueller Erfassung |
| `TemporalFact` | Typisierte Zeitangabe mit Bedeutung, Genauigkeit, Quelle und Bestaetigungsstatus |
| `Event` / `Appointment` / `ExpectedResponse` | bestaetigter Verlaufspunkt, geplanter Termin oder erwartetes externes Ergebnis |
| `Task` / `Deadline` / `Reminder` | Nutzerhandlung, fachliche Frist und bewusst konfigurierte Erinnerung mit getrennten Lebenszyklen |
| `CaptureSession` / `DocumentUnit` / `PageManifest` | Erfassungseinheit, logisch getrenntes Dokument und unveraenderliche Seiten-/Originalzuordnung |
| `ReviewProposal` | Versionierter, korrigierbarer Vorschlag fuer Titel, primaeren Kontext, Subject, Facts und materielle Folgen |
| `ExportJob` / `OutboxItem` | Vorbereitete Ausgabe, Download, Druck, Mail, lokales ZIP oder Einreichpaket |
| `ProcessingJob` | OCR, Scan-Nachbearbeitung, Klassifikation, Matching, Indexing oder AI-Vorschlag |
| `WorkflowDefinition` | Kuratierte, versionierte Vorgangsvorlage mit Rechtsraum, Gültigkeit, Quellen, Schritten und Review-Regeln |
| `CaseWorkflowInstance` | An einen Vorgang gebundene Instanz einer unveränderlich referenzierten Workflow-Version |

## Zentrale Modellregeln

### Dokumente sind eigenständige Objekte

Ein Dokument existiert technisch unabhaengig und darf waehrend Capture/
Processing ohne Case-/Record-Link bestehen. Nach Review besitzt jedes
akzeptierte Dokument einen bestaetigten primaeren Case- oder Record-Kontext.
Wenn nichts passt, dient ein leichter Custom Case als Kontext; es gibt keinen
dauerhaften losen Dokument-UI-Zustand.

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

Ein M1-Medienpaket wird nur durch die case-lokale medizinische Desktop-Aktion
bewusst erzeugt und ist danach ein unveraendertes ZIP-Originalartefakt. Ein am
`FileRecord` gefuehrtes unveraenderliches
Manifest beschreibt mindestens relative Pfade, Dateianzahl, Groessen,
Ausschluesse/Lesefehler und Integritaetswerte. Das Manifest ist ein Value
Object ohne eigene fachliche Identitaet, keine neue Top-Level-Entitaet. Der
case-lokale medizinische Desktop-Archivimport bildet damit eine
ausdrueckliche Ausnahme zur normalen Regel, dass mehrere ausgewaehlte Dateien
getrennte logische Dokumente sind. Enthaltene Programme bleiben inerte
Nutzdaten und werden von Mappm nicht ausgefuehrt.

Ein Scan kann sichtbar sein:

- im Dokumentbereich.
- in einem Vorgang.
- in einem Subvorgang.
- im Profil eines Kindes.
- in einer Versicherungs-/Erstattungsauswertung.
- im Schnellzugriff.
- in einem Exportpaket.

Technisch wird das über Beziehungen modelliert, nicht über Kopien.

### Inbox und Outbox sind Arbeitsflächen

Die Inbox ist kein Archiv und keine Besitzstruktur.

Sie beschreibt:

- lokal gesicherte oder neu erfasste Dokumenteinheit.
- laufende asynchrone Verarbeitung.
- bestaetigungsbereiter Vorschlag oder Review noetig.
- bestaetigt/kuerzlich verarbeitet und nach Produkt-Retention schnell
  korrigierbar oder wieder zu oeffnen.
- wieder geoeffnet, fehlgeschlagen oder blockiert.

Die Outbox ist ebenfalls kein zweites Archiv. Sie beschreibt vorbereitete oder
ausgeführte Ausgaben:

- Datei öffnen oder herunterladen.
- drucken.
- lokal exportieren oder per Mail uebergeben.
- Exportpaket erzeugen.
- externe Website oder App öffnen.
- manuelle Uebergabe ausserhalb von Mappm vorbereiten.

Die eigentlichen Dokumente bleiben im DMS-Kern.

### Vorgänge bilden Zusammenhänge, nicht Ordner

`Case` / "Vorgang" bleibt der Begriff fuer Prozesse, Lebensereignisse,
Status, Aufgaben und Timeline.

Ein großer Vorgang wie ein Autounfall enthält zunächst Schritte, Ereignisse,
Tasks und bedingte Ablaufzweige. Eine eigenstaendig verfolgte
Versicherungsabwicklung ist ein normaler verknuepfter Case; einzelne
Einreichungen/Nachreichungen sind Events. Polizei, Werkstatt, Versicherer oder
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

Backend/Core Assist schlaegt OCR-basierte grobe Kandidaten und konservative
Titel im Commercial Core vor. Beziehungen sind optionale
bestaetigungspflichtige Best-effort-Vorschlaege nach Feasibility-Gate.
Fachlich relevante Facts entstehen aus Nutzerzuordnung, konkreter
kontextueller Aktion oder gepruefter Regel und bleiben provenance-markiert und
nachvollziehbar.

Zeitbezogene Facts und ihre moeglichen Folgen richten sich nach
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`. Ausstellungs-, Empfangs-,
Leistungs-, Ereignis-, Faelligkeits-, Gueltigkeits- und Systemzeit werden
nicht in ein einziges Dokumentdatum zusammengefuehrt. Ein Zeit-Fact wird nicht
allein durch seine Extraktion zu Ereignis, Termin, Aufgabe, Frist oder
Reminder.

## Zielarchitektur nach Verantwortungen

```text
CaptureSession
  -> DocumentUnit -> PageManifest -> FileRecord
      -> ProcessingJob
          -> ReviewProposal
              -> User confirmation/correction
                  -> DocumentRecord / DocumentVersion
                      -> DocumentCaseLink / Record link
                      -> DocumentProfileLink
                      -> DocumentFact
                      -> Task / Reminder
                      -> Search Index
                      -> ExportJob / OutboxItem
```

## Storage- und Sync-Konsequenzen

Mappm speichert beim Local Vault strukturierte Metadaten autoritativ in
SQLite/Drift. Beim Cloud Vault dient der Client-Store als policy-begrenzter
Cache, Index und Pending State; Mappm Cloud ist autoritativ. Dateien liegen in
beiden Modi getrennt von strukturierten Metadaten und werden ueber stabile IDs
referenziert.

Langfristig muss das Modell folgende Betriebsformen tragen:

- Single-device Local Vault.
- Local-Vault Capture und Review auf demselben Geraet.
- Cloud Vault mit Desktop/Mobile-Kontinuitaet und Multi-Geraete-Sync.
- Managed Mappm Cloud fuer Account, Core Assist und optionale Cloud Authority.
- Local Development Cloud mit ausschliesslich synthetischen Daten.
- verschluesselungsfaehige Remote-Dateiablage nach akzeptiertem Trust-Modell.
- Backup/Restore mit Integritätsprüfung.

Deshalb braucht das Modell:

- stabile sync-faehige IDs.
- `createdAt`, `updatedAt`, `deletedAt` oder Tombstones.
- Hashes fuer Datei-Integritaet und Dubletten.
- klare Trennung von Secrets, Nutzdaten und Logs.
- Storage-Abstraktion fuer lokale Dateien, Cloud-Cache/Pending-Artefakte und
  serverseitige S3-kompatible Stores.
- keine harte Annahme, dass ein Server dauerhaft Klartext-Owner aller Dokumente ist.

Die konkrete Storage-Leitplanke steht in
`DECISION_FILE_STORAGE_AND_DOCKER_STACK.md`: Local Vault verwendet lokalen
Dateispeicher hinter einem Storage-Port; Mappm Cloud und Local Development
Cloud verwenden S3-kompatiblen Storage als austauschbaren Adapter.

## Processing- und Intelligence-Konsequenzen

OCR, Scan-Nachbearbeitung, Klassifikation, Matching, Embeddings und lokale LLMs
werden als asynchrone Processing-Jobs geplant.

Zielbild:

```text
FileRecord accepted
  -> OCR / text extraction
  -> coarse document type/domain and issuer candidates
  -> preserve user-selected Managed Subject
  -> Case/Record candidate ranking
  -> optional applicable published-workflow candidate
  -> type-dependent semantic field proposals plus alternatives
  -> search indexing
  -> user review
  -> user-assigned/confirmed meanings become domain data
```

Fehler in dieser Pipeline duerfen Dokumentverwaltung nicht blockieren.
Processing-Ergebnisse haben Status, Fehlerquelle, Zeitpunkt und Review-Zustand.
Intelligence darf nur veroeffentlichte Workflow-Definitionen als Kandidaten
vorschlagen; sie ist nicht Autoritaet fuer Person, Dokumentkohaerenz,
Rechtsraum, Frist, Anspruch, Ablauf oder Beziehung.

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

Der erste Local-Search-Slice darf SQLite/Drift/FTS5 nutzen. Die Domain-Grenze bleibt aber so
geschnitten, dass spätere Indexer wie Meilisearch, Typesense, PostgreSQL FTS,
Qdrant oder andere Provider ergänzt werden können.

## Commercial-Core Capture Slice

Der erste verkaufbare Capture-/Review-Slice baut:

- Desktop-Import.
- globales Mobile Capture mit lokaler dauerhafter Queue und asynchroner
  Verarbeitung.
- Desktop- und Mixed-Batch-Import mit technischer Capture-Session statt
  voreiliger Dokument-/Case-Gruppierung.
- Backend/Core-Assist-Vorschlaege fuer logische Dokumentgrenzen, Titel,
  betroffene Person/Organisation, Dokumenttaxonomie, Case/Record, Rollen/Facts
  und relevante Folgeaktionen.
- kompakte Nutzerbestaetigung aller fachlichen Zuordnungen in der aktuellen
  Reifestufe; implizite unveraenderte Fakten bleiben verborgen.
- Vorgänge mit typisierten Beziehungen, manueller Erstellung und
  Bottom-up-Komposition.
- einfache Dokumentannahme.
- lokale Suche.
- Aufgaben/Reminder-Daten.
- Schnellzugriff.

Der Slice darf vereinfachen:

- ein primärer Vorgang je Dokument.
- keine vollständigen `DocumentCaseLink`-Rollen in der UI.
- keine unbeaufsichtigte automatische Finalisierung der Assist-Vorschlaege.
- keine vollständige Outbox.
- kein vollständiger Haushaltsrechte-Editor.

Der Commercial Core darf aber nicht verbauen:

- flexible Mehrfachbeziehungen.
- Versionierung.
- strukturierte Facts.
- Personen-/Profilbezug.
- spätere Sync-/Backup-Fähigkeit.
- dauerhafte, wiederaufnehmbare Processing-Jobs.
- spätere Exportpakete.
- kuratierte, versionierte und internationalisierbare Workflow-Definitionen.

## Konsequenzen fuer Planung

- C2/C3 bleibt ein Commercial-Core-Slice, aber nicht die DMS-Endarchitektur.
- Spätere Profil-, Rechte- und Sync-Slices bauen auf dem DMS-Kern auf.
- Der aktivierte Facts-/Insights-Slice fuehrt strukturierte Facts,
  Submission Events, Finanzdaten und Auswertungen in den DMS-Kern ein. Eine
  Claim-Entitaet ist ausgeschlossen.
- Intelligence darf nur Vorschläge liefern, die in DMS-Objekte übernommen
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
