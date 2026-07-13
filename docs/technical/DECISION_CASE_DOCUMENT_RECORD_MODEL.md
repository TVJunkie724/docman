---
title: "Decision - Case, Document, Record and Facts Model"
description: "Entscheidung zu Vorgängen, Dokumenten, Records/Nachweisen, Versionierung, Workflow-Instanzen und strukturierten Fakten als Mappm-Kernmodell"
tags: [decision, domain-model, cases, documents, records, facts, versioning, workflows, insights]
lastUpdated: "2026-07-14"
status: "accepted-rebaseline"
---

# Decision - Case, Document, Record and Facts Model

## Status

Accepted and rebaselined on 2026-07-14. The normative Case relationship and
workflow-composition rules are defined in
`DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`. Earlier `parentCaseId`
and separate-Subcase descriptions are superseded.

## Entscheidung

DocMan trennt künftig vier fachliche Kernkonzepte:

- **Case / Vorgang**: Prozess, Kontext oder Verlauf.
- **Document / Dokument**: konkrete Datei, Scan oder Unterlage.
- **Record / Unterlage**: langlebiger fachlicher Gegenstand mit aktueller und historischen Versionen. In der UI heisst dieser Bereich "Unterlagen"; im Profilkontext "Persoenliche Unterlagen". "Nachweis" ist eine spezifische Art.
- **DocumentFact / strukturierter Fakt**: geprüfte oder vorgeschlagene Aussage aus einem Dokument.
- **WorkflowDefinition / Vorgangsvorlage**: kuratierte, versionierte Definition
  eines fachlichen Ablaufs für einen bestimmten Gültigkeits- und Rechtsraum.
- **CaseWorkflowInstance / Vorgangsablauf**: an einen Vorgang gebundene Instanz
  einer konkreten Workflow-Version.

Zusätzlich gilt: Diese Objekte leben in einem Vault und tragen Beziehungen zu
verwalteten Personen oder Organisationen gemäß
`DECISION_MANAGED_SUBJECTS_BUSINESS_CONTEXTS.md`.

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

Vorgänge werden über typisierte `CaseLink`-Beziehungen verbunden. Jeder
Vorgang bleibt eine eigenständige `Case`-Entität. `Subvorgang` ist nur die
UI-Rolle eines über `part_of` verbundenen Vorgangs, kein eigener Entitätstyp.

Ein Vorgang kann manuell geführt werden oder eine versionierte
`CaseWorkflowInstance` besitzen. Fachlich relevante Definitionen stammen aus
dem kuratierten Katalog gemäß
`DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`.

### Document / Dokument

Ein Dokument ist die konkrete Datei oder der konkrete Scan.

Jedes Dokument kann versioniert werden, unabhängig vom Dokumenttyp.

Der R4-M2 konkretisiert Dokument-Metadaten und Vorschau in
`DECISION_DOCUMENT_METADATA_PREVIEW.md`. Vorschau ist ein abgeleitetes
Artefakt fuer Review, nicht die Originaldatei.

### Record / Unterlage

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

Profile sind keine Ordner. Ein verwaltetes Profil beschreibt, welche Person
oder Organisation ein Dokument, einen Record, einen Vorgang oder einen Fact
betrifft oder besitzt. Ein Kind oder ein eigenes Unternehmen kann eigene
Unterlagen, Verträge, Vorgänge und Claims haben, ohne einen eigenen Login zu
benötigen. Personen- und Organisationsprofile teilen das Management-Prinzip,
nicht zwingend Felder, Schutzklasse oder Rechtsregeln.

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

  Ablaufzweige:
    - polizeiliche Aufnahme, wenn anwendbar
    - Werkstattreparatur
    - Versicherungsclaims
    - medizinische und rechtliche Folgen pruefen

  moegliche verbundene Vorgaenge:
    - laengerfristige Behandlung, caused_by Autounfall
    - formelles Verfahren, caused_by Autounfall
```

Polizei, Werkstatt, Versicherung oder eine erste Untersuchung werden nicht
allein wegen anderer Akteure, Dokumente oder lokaler Status zu eigenen
Vorgängen. Ein verbundener Vorgang entsteht erst bei einem eigenständig
verständlichen Ziel und Lebenszyklus. Details stehen in
`DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`.

## Vorgangsbeziehungen

Mappm verwendet einen `Case`-Typ und typisierte Beziehungen:

- `part_of`: in der UI als Subvorgang darstellbar und standardmäßig roll-up-fähig.
- `caused_by`: ausgelöst durch einen Vorgang, aber unabhängig fortführbar.
- `follow_up_to`: fachlicher Nachfolger eines vorherigen Vorgangs.
- `related_to`: Zusammenhang ohne Hierarchie.

Dokumente können gleichzeitig in mehreren Vorgängen mit Rollen wie `primary`,
`trigger`, `context`, `evidence`, `submission`, `response`, `decision`,
`payment_proof` oder `source` sichtbar sein. Die Datei wird nie dupliziert.

Mappm unterstützt Top-down- und Bottom-up-Komposition:

- leeren manuellen oder geführten Vorgang anlegen und Inhalte hinzufügen;
- aus ausgewählten Dokumenten/Unterlagen/Aufgaben einen verbundenen Vorgang
  erstellen;
- aus ausgewählten Dokumenten und bestehenden Vorgängen einen neuen
  übergeordneten Vorgang bilden;
- einen Workflow-Zweig später zu einem verbundenen Vorgang hochstufen;
- Beziehungen ohne Datenverlust wieder lösen oder ändern.

Eine bevorzugte Anzeigehierarchie darf Navigation vereinfachen. Sie erzeugt
keine exklusive Ownership und keine kaskadierende Löschung.

## UI-Struktur

Mappm plant zwei gleichwertige zentrale Arbeitsbereiche:

- **Vorgänge** fuer Prozesse, Zusammenhänge, Aufgaben, Status, Timeline und verwandte Vorgänge.
- **Unterlagen** fuer langlebige Records/Nachweise, Versionen, Gültigkeiten und
  zugehörige Dokumentdateien.

Die Draft-Inbox bleibt ein eigener Eingang, weil sie nicht Archiv ist, sondern Review-Arbeit.

Die spätere Outbox ist ebenfalls kein zweites Archiv. Sie beschreibt
vorbereitete oder ausgeführte Ausgaben wie Download, Druck, Mail, lokales ZIP,
Exportpaket, Portal-Link oder Einreichung. Das eigentliche Dokument bleibt im
DMS-Kern.

Empfohlene Navigation:

```text
Eingang
Vorgänge
Unterlagen
Aufgaben
Schnellzugriff
Suche
Einstellungen
```

Ein Dokument oder Record darf in mehreren Kontexten sichtbar sein:

- im Dokumentbereich als Nachweis oder Unterlage.
- in einem Vorgang als Teil eines Prozesses.
- in Auswertungen als Quelle strukturierter Fakten.
- im Profilkontext einer Person im Haushalt.
- im Schnellzugriff, wenn es bewusst als wichtig markiert wurde.

Ein übergeordneter `part_of`-Vorgang zeigt verbundene Vorgänge und deren
relevanten Status. Dokumente bleiben über ihre Links erreichbar und werden in
Roll-ups dedupliziert. Lose `related_to`- oder `caused_by`-Beziehungen verändern
keine Summen oder Abschlusszustände automatisch.

## Statusmodell

DocMan vermeidet ein globales, riesiges Status-Enum für alle Vorgangstypen.

Stattdessen:

- `caseType` beschreibt die Art des Vorgangs.
- `lifecycleStatus` beschreibt grob den Zustand: `draft`, `active`, `waiting`, `review`, `done`, `archived`.
- `workflowStageKey` beschreibt optionale typ-spezifische Phasen.
- `workflowDefinitionId` und `workflowDefinitionVersion` pinnen bei geführten
  Vorgängen die kuratierte Definition.
- `attentionFlags` markieren Dinge wie offene Aufgaben, neue Drafts, Frist bald fällig oder Review nötig.

Dokumente und Records bekommen eigene Status:

- Dokument: `draft`, `review`, `accepted`, `replaced`, `archived`.
- Record-Version: `current`, `superseded`, `expired`, `revoked`, `invalid`, `archived`.

## Konsequenzen

- Legacy-Statusmodell wird nicht übernommen.
- `Vorgang` bleibt der UI-Begriff fuer Cases.
- `Sammlung` wird nicht Kernbegriff; kann später höchstens für lose Sets oder gespeicherte Sichten verwendet werden.
- R4-D3 Suche muss Vorgänge, Dokumente und Records berücksichtigen.
- Der Zielpfad plant `CaseLink` und `DocumentCaseLink` direkt; `parentCaseId`
  bleibt nur historische M2-Traceability.
- Custom Cases und geführte Cases nutzen denselben Domain-Typ und dieselben
  Produktfähigkeiten.
- Kuratierte Länder-/Institutionsworkflows bleiben vom generischen Case-Modell
  getrennt; Sprache allein bestimmt keinen Rechtsraum.
- Laufende geführte Vorgänge wechseln ihre Workflow-Version nie still.
- Haushaltsprofile und spätere Berechtigungen werden als Zielmodell berücksichtigt.
- Schnellzugriff ist eine kuratierte Sicht, kein Ersatz fuer Records und kein externes Berechtigungsmodell.
- Kontextuelle Finanzzusammenfassungen folgen
  `DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md` und erscheinen nur
  bei bestätigten relevanten Fakten.
- Verträge und Abos folgen
  `DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md`.
- R2/R4 müssen vermeiden, Fakten nur in unstrukturierte `metadata`-Maps zu kippen.
- R2/R4 müssen vermeiden, Dokumente dauerhaft als reine Anhänge mit genau einem Parent zu modellieren.
- BusinessCompanion dient als Referenz fuer FileStorage, Databox, Ingestion und Document-Silo-Ideen, aber Mappm uebernimmt ein kleineres, local-first DMS-Kernmodell.

## Nicht entschieden

- welche DocumentFact-Typen im M2 manuell erfassbar sind.
- ob Lernunterlagen und Notizen im M2 sichtbar oder erst später aktiviert werden.
