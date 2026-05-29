---
title: "Decision - Case, Document, Record and Facts Model"
description: "Entscheidung zu Vorgängen, Dokumenten, Records/Nachweisen, Versionierung und strukturierten Fakten als DocMan-Kernmodell"
tags: [decision, domain-model, cases, documents, records, facts, versioning, insights]
lastUpdated: "2026-05-08"
status: "accepted"
---

# Decision - Case, Document, Record and Facts Model

## Status

Accepted.

## Entscheidung

DocMan trennt künftig vier fachliche Kernkonzepte:

- **Case / Vorgang**: Prozess, Kontext oder Verlauf.
- **Document / Dokument**: konkrete Datei, Scan oder Unterlage.
- **Record / Nachweis / Unterlage**: langlebiger fachlicher Gegenstand mit aktueller und historischen Versionen.
- **DocumentFact / strukturierter Fakt**: geprüfte oder vorgeschlagene Aussage aus einem Dokument.

Zusätzlich gilt: Diese Objekte leben in einem Haushaltskontext und koennen Profil-/Personenbezug tragen.

Der UI-Begriff **Vorgang** bleibt erhalten. Er wird nicht durch **Sammlung** ersetzt. Sammlung klingt zu passiv und beschreibt weder Status, Aufgaben, Timeline noch Prozesskontext gut genug.

Diese Entscheidung steht unter der DMS-Zielarchitektur aus
`DECISION_DMS_TARGET_ARCHITECTURE.md`: Dokumente sind langfristig eigenständige,
versionierte und sensible Wissensobjekte mit Beziehungen zu Vorgängen,
Records, Profilen, Fakten, Aufgaben, Exporten und Processing-Jobs. Der M2 darf
eine primäre Vorgangszuordnung nutzen, aber das Zielmodell bleibt
beziehungsbasiert und nicht ordner- oder parent-basiert.

## Begriffe

### Case / Vorgang

Ein Vorgang beschreibt Zusammenhang, Verlauf und Arbeit.

Beispiele:

- Arztrechnung mit Zahlung und Erstattung.
- Namensänderung.
- Umzug.
- Bestellung mit Garantie oder Reklamation.
- Versicherungsschaden.
- Vertragsabschluss oder Kündigung.
- Kurs oder Schulveranstaltung.

Ein Vorgang kann Dokumente, Records, Aufgaben, Ereignisse, Zahlungen, Claims und verwandte Vorgänge verbinden. Ein Vorgang muss aber nicht für jedes einzelne Dokument existieren.

Vorgänge können hierarchisch oder relational verbunden sein. Ein großer Lebensvorgang wie ein Autounfall darf als Hauptvorgang sichtbar bleiben und kleinere Teilstränge als Subvorgänge führen.

### Document / Dokument

Ein Dokument ist die konkrete Datei oder der konkrete Scan.

Jedes Dokument kann versioniert werden, unabhängig vom Dokumenttyp.

Der R4-M2 konkretisiert Dokument-Metadaten und Vorschau in
`DECISION_DOCUMENT_METADATA_PREVIEW.md`. Vorschau ist ein abgeleitetes
Artefakt fuer Review, nicht die Originaldatei.

### Record / Nachweis / Unterlage

Ein Record ist ein langlebiger fachlicher Gegenstand, den man wiederfinden, aktuell halten und historisch nachvollziehen möchte.

Beispiele:

- Geburtsurkunde.
- Staatsbürgerschaftsnachweis.
- Meldezettel.
- Ausweis.
- Zeugnis.
- Zertifikat.
- Vertrag.
- Polizze.
- Garantie.
- Lernunterlage.
- wichtige Notiz.

Ein Record hat eine aktuelle Version und kann alte Versionen behalten. Eine alte Version kann `superseded`, `expired`, `revoked`, `invalid` oder `archived` sein.

### DocumentFact / strukturierter Fakt

Ein Fact ist eine auswertbare Aussage, die aus einem Dokument stammt oder manuell erfasst wurde.

Beispiele:

- Betrag.
- Fälligkeit.
- Erstattung.
- Vertragspartner.
- Kündigungsfrist.
- Versicherungsdeckung.
- Gültigkeit.
- Einreichstatus.
- Entscheidung einer Behörde.
- Garantieende.

Facts dürfen später aus OCR/LLM vorgeschlagen werden, werden aber nicht still übernommen, wenn sie fachlich relevant sind.

## Modellregel

```text
Case
  erklaert Kontext, Verlauf und Zusammenhang

Record
  beschreibt langlebige Unterlage/Nachweis

Document / DocumentRecord
  beschreibt das logische Dokument

FileRecord
  beschreibt die konkrete gespeicherte Datei, Scan-Quelle oder PDF

DocumentVersion
  verbindet logisches Dokument oder Record mit einer konkreten Datei-Version

DocumentFact
  macht Inhalte auswertbar, suchbar und reviewbar
```

Cases sind optionaler Kontext. Records sind optionales Langzeitobjekt. Documents sind immer erlaubt.

Ein Dokument darf mit mehreren Kontexten verbunden sein, ohne dass die Datei
dupliziert wird. Dauerhaft soll dies ueber explizite Link-Objekte wie
`DocumentCaseLink`, `DocumentProfileLink` und spaeter `ExportJob` /
`OutboxItem` geschehen. Im M2 kann diese Flexibilität in der UI reduziert
werden, solange das Datenmodell nicht in eine harte Ein-Parent-Struktur
eingesperrt wird.

Profile sind keine Ordner. Ein Profil beschreibt, welche Person ein Dokument, ein Record, ein Vorgang oder ein Fact betrifft oder verwaltet. Ein Kind kann also eigene Nachweise, Versicherungen, Arztvorgänge und Claims haben, ohne ein eigenes Login zu benötigen.

## Beispiele

### Namensänderung

```text
Case: Namensaenderung 2025
  Dokumente:
    - Antrag
    - Bescheid
    - neue Geburtsurkunde
    - neuer Staatsbuergerschaftsnachweis

Record: Geburtsurkunde
  currentVersion: neue Geburtsurkunde
  previousVersion: alte Geburtsurkunde
  old status: superseded
```

Der Vorgang erklärt, warum mehrere Records neue Versionen bekommen haben.

### Arzt und Versicherung

```text
Case: Behandlung / Arztrechnung
  lifecycleStatus: active / waiting / review / done
  workflowStage: reimbursement_in_progress

Document: Arztrechnung
  Facts:
    - expense amount
    - provider
    - treatment date

Claim: Sozialversicherung
  status: submitted / paid / rejected
  reimbursed amount
  reimbursed percent

Claim: Zusatzversicherung
  status: notSubmitted / submitted / paid / rejected
```

Erstattungen sind nicht nur Status. Sie sind eigene Claims und Financial Facts.

### Lernunterlage

```text
Record: Mathe-Skript Algebra
  versions:
    - Original
    - korrigierte Version
    - Version mit eigenen Notizen

Case: Kurs Algebra 1
  verbindet Skripten, Aufgaben, Prüfungsinfos und Notizen
```

Der Case ist hilfreich, aber nicht für jede einzelne Datei Pflicht.

### Autounfall

```text
Case: Autounfall 2026
  Dokumente:
    - Fotos vom Unfallort
    - Polizeibericht
    - Versicherungsschreiben
    - Anwalts-/Gerichtsschreiben

  Subvorgänge:
    - Werkstattreparatur
    - Versicherungsschaden
    - Krankenhausbesuch nach Unfall
    - Rechtsstreit
```

Der Hauptvorgang bleibt der Gesamtzusammenhang. Subvorgänge entstehen, wenn ein Teilstrang eigene Dokumente, Aufgaben, Fristen, Claims oder Status bekommt.

## Vorgangsbeziehungen

DocMan plant zwei Beziehungsarten:

- einfacher `parentCaseId` fuer M2-Subvorgänge.
- später flexible `CaseLink`-Beziehungen fuer `related`, `caused_by`, `follow_up`, `medical_follow_up`, `legal_follow_up`, `insurance_claim_for` oder ähnliche Relationen.

Schlanker M2-Slice:

- In einem Vorgang kann ein leerer Subvorgang erstellt werden.
- Aus markierten Dokumenten eines Vorgangs kann ein neuer Subvorgang erzeugt werden.
- Der Subvorgang erhält `parentCaseId` auf den Hauptvorgang.
- Die ausgewählten Dokumente werden dem Subvorgang als primärer Vorgang zugeordnet.
- Der Hauptvorgang zeigt den Subvorgang mit Dokumentanzahl und Status.
- Dokumentdateien werden nicht dupliziert.

Zielmodell nach dem M2:

- Dokumente gleichzeitig in mehreren Vorgängen mit Rollen anzeigen.
- `DocumentCaseLink` mit Rollen wie `primary`, `context`, `evidence`, `source`.
- Profil-/Personenbezug ueber `DocumentProfileLink`.
- Export-/Ausgangshistorie ueber `ExportJob` oder `OutboxItem`.
- Hauptvorgang-Dokumentliste mischt Subvorgang-Dokumente kontextuell ein.
- komplexe Deduplizierung in Suche und Export.

Das hält den M2 verständlich: Ein Dokument hat zuerst eine primäre Vorgangszuordnung. Große Vorgänge können trotzdem früh sauber strukturiert werden. Die spätere Vollausbaustufe bleibt ein DMS-Beziehungsmodell, kein Anhangmodell.

## UI-Struktur

DocMan plant zwei zentrale Arbeitsbereiche:

- **Vorgänge** fuer Prozesse, Zusammenhänge, Aufgaben, Status, Timeline und verwandte Vorgänge.
- **Dokumente** fuer Unterlagen, Nachweise, Records, Versionen und direkte Dokumentensuche.

Die Draft-Inbox bleibt ein eigener Eingang, weil sie nicht Archiv ist, sondern Review-Arbeit.

Die spätere Outbox ist ebenfalls kein zweites Archiv. Sie beschreibt
vorbereitete oder ausgeführte Ausgaben wie Download, Druck, Mail, Share,
Exportpaket, Portal-Link oder Einreichung. Das eigentliche Dokument bleibt im
DMS-Kern.

Empfohlene Navigation:

```text
Eingang
Vorgänge
Dokumente
Aufgaben
Schnellzugriff
Suche
Auswertungen (später)
Einstellungen
```

Ein Dokument oder Record darf in mehreren Kontexten sichtbar sein:

- im Dokumentbereich als Nachweis oder Unterlage.
- in einem Vorgang als Teil eines Prozesses.
- in Auswertungen als Quelle strukturierter Fakten.
- im Profilkontext einer Person im Haushalt.
- im Schnellzugriff, wenn es bewusst als wichtig markiert wurde.

Im M2 gilt dabei eine vereinfachte Anzeige: Subvorgang-Dokumente sind über den Subvorgang erreichbar. Der Hauptvorgang zeigt Subvorgänge prominent, muss aber noch nicht jedes Subvorgang-Dokument zusätzlich in der Hauptliste spiegeln.

## Statusmodell

DocMan vermeidet ein globales, riesiges Status-Enum für alle Vorgangstypen.

Stattdessen:

- `caseType` beschreibt die Art des Vorgangs.
- `lifecycleStatus` beschreibt grob den Zustand: `draft`, `active`, `waiting`, `review`, `done`, `archived`.
- `workflowStageKey` beschreibt optionale typ-spezifische Phasen.
- `attentionFlags` markieren Dinge wie offene Aufgaben, neue Drafts, Frist bald fällig oder Review nötig.

Dokumente und Records bekommen eigene Status:

- Dokument: `draft`, `review`, `accepted`, `replaced`, `archived`.
- Record-Version: `current`, `superseded`, `expired`, `revoked`, `invalid`, `archived`.

## Konsequenzen

- Legacy-Statusmodell wird nicht übernommen.
- `Vorgang` bleibt der UI-Begriff fuer Cases.
- `Sammlung` wird nicht Kernbegriff; kann später höchstens für lose Sets oder gespeicherte Sichten verwendet werden.
- R4-D3 Suche muss Vorgänge, Dokumente und Records berücksichtigen.
- R4 plant Subvorgänge als schlanke M2-Funktion.
- Flexible Dokument-Mehrfachverlinkung mit Rollen bleibt spaetere Milestones.
- Haushaltsprofile und spätere Berechtigungen werden als Zielmodell berücksichtigt.
- Schnellzugriff ist eine kuratierte Sicht, kein Ersatz fuer Records und kein externes Berechtigungsmodell.
- Structured Facts und Auswertungen werden als eigene spätere Phase geplant.
- R2/R4 müssen vermeiden, Fakten nur in unstrukturierte `metadata`-Maps zu kippen.
- R2/R4 müssen vermeiden, Dokumente dauerhaft als reine Anhänge mit genau einem Parent zu modellieren.
- BusinessCompanion dient als Referenz fuer FileStorage, Databox, Ingestion und Document-Silo-Ideen, aber Ordna uebernimmt ein kleineres, local-first DMS-Kernmodell.

## Nicht entschieden

- finaler englischer Codebegriff fuer `Record`.
- ob die deutsche UI langfristig `Nachweise`, `Unterlagen` oder beides verwendet.
- welche DocumentFact-Typen im M2 manuell erfassbar sind.
- ob Lernunterlagen und Notizen im M2 sichtbar oder erst später aktiviert werden.
