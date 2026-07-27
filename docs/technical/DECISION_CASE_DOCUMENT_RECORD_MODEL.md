---
title: "Decision - Case, Document, Record and Facts Model"
description: "Entscheidung zu Vorgängen, Dokumenten, Records/Nachweisen, Versionierung, Workflow-Instanzen und strukturierten Fakten als Mappm-Kernmodell"
tags: [decision, domain-model, cases, documents, records, facts, versioning, workflows, insights]
lastUpdated: "2026-07-24"
status: "accepted"
owner: "product-concept/data-architect"
---
# Decision - Case, Document, Record and Facts Model

## Status

Angenommen und am 15. Juli 2026 auf die aktuelle Produktbaseline gebracht.
Normative Case-Beziehungen und Workflow-Komposition stehen in
`DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`. Frühere Modelle mit
`parentCaseId` oder eigenem Subcase-Typ sind ersetzt.

## Entscheidung

Mappm trennt vier fachliche Kernkonzepte:

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

Zeitbezogene DocumentFacts und daraus entstehende Ereignisse, Termine,
Fristen, Aufgaben, erwartete Antworten oder Reminder folgen
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`. Ein Dokument besitzt kein
universelles fachliches Hauptdatum; technische Zeitstempel bleiben getrennt.
Mehrere regelbasierte Fristen, Rule-Provenienz, Nutzerbestaetigung und
Reminder-Updates folgen
`DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`.

Der UI-Begriff **Vorgang** bleibt erhalten. Er wird nicht durch **Sammlung** ersetzt. Sammlung klingt zu passiv und beschreibt weder Status, Aufgaben, Timeline noch Prozesskontext gut genug.

Das widerspricht nicht dem schlanken Grundmodell: Ein Vorgang **kann** anfangs
oder dauerhaft nur eine benannte, durchsuchbare Dokumentensammlung sein.
`Vorgang` bleibt der breitere UI-Begriff, weil derselbe Case spaeter optional
Workflow, Aufgaben, Termine, Versicherungsabwicklungen und Beziehungen
aufnehmen kann.

Diese Entscheidung steht unter der DMS-Zielarchitektur aus
`DECISION_DMS_TARGET_ARCHITECTURE.md`: Dokumente sind langfristig eigenständige,
versionierte und sensible Wissensobjekte mit Beziehungen zu Vorgängen,
Records, Profilen, Fakten, Aufgaben, Exporten und Processing-Jobs. Der erste
Commercial-Core-Slice darf
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

Ein Vorgang kann Dokumente, Records, Aufgaben, Ereignisse, Zahlungen und
verwandte Vorgänge verbinden. Im Capture-/Processing-Zustand kann ein Dokument
noch ohne Vorgang existieren; abgeschlossener Review verlangt jedoch einen
primaeren Case- oder Record-Kontext.

Vorgänge werden über typisierte `CaseLink`-Beziehungen verbunden. Jeder
Vorgang bleibt eine eigenständige `Case`-Entität. `Subvorgang` ist nur die
UI-Rolle eines über `part_of` verbundenen Vorgangs, kein eigener Entitätstyp.

Ein Vorgang kann manuell geführt werden oder eine versionierte
`CaseWorkflowInstance` besitzen. Fachlich relevante Definitionen stammen aus
dem kuratierten Katalog gemäß
`DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`.

Es gibt keinen verpflichtenden `caseType` und keine sichtbare Taxonomie, aus
der Nutzer vor dem Anlegen waehlen muessen. Ein optionaler Domain-Template-Key
und eine optionale Workflowdefinition beschreiben Fuehrung und Matching, nicht
eine andere Case-Entitaet.

#### Case-Gueltigkeit und minimale Invarianten

Ein persistierter `Case` ist immer gueltig. Das Domainmodell kennt keinen
Case-Lifecycle-Status `invalid` und keine Dokument-Vollstaendigkeitsbedingung.
Ein Case darf bewusst leer beginnen oder dauerhaft null, ein oder mehrere
Dokumente enthalten.

Minimale Invarianten sind nur stabile Identitaet, Vault-/Ownership-Kontext,
bestaetigter oder im selben Create-Command angenommener Titel, Managed Subject,
Lifecycle-Status sowie Erstellungs-/Aenderungsprovenienz. Workflow, Template,
Dokumente, Tasks, Termine, Ergebnis und erwartete Unterlagen sind
optionale Anreicherungen.

Backend/Core-Assist-Vorschlaege sind vor der bestaetigten Anlage keine Cases.
Ein Create-/Transition-Command, der die minimalen Invarianten verletzt, wird
abgelehnt und erzeugt keinen teilweise oder ungueltig persistierten Case. Ein
spaeterer Konflikt, unbekannter Fakt, fehlendes Dokument oder Review-Bedarf ist
ein gueltiger fachlicher Zustand beziehungsweise eine separate Attention-
Information, kein ungueltiger Case.

### Document / Dokument

Ein Dokument ist die konkrete Datei oder der konkrete Scan.

Jedes Dokument kann versioniert werden, unabhängig vom Dokumenttyp.

Ein innerhalb eines bestehenden bestaetigten `medical_care`-Case
ausdruecklich auf Desktop importierter Dateibaum darf in M1 als ein logisches
Medienpaket-Dokument mit einem dauerhaft gespeicherten ZIP-`FileRecord`
erscheinen. Das fuehrt weder eine neue Top-Level-Entitaet noch einen
medizinischen Dokumenttypenkatalog ein. Relative Dateistruktur und
Paketmanifest gehoeren zur Integritaet dieses Artefakts; einzelne enthaltene
Dateien werden fuer M1 nicht automatisch zu Documents.

Der C2/C3-Slice konkretisiert Dokument-Metadaten und Vorschau in
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

Ein Vertrag oder eine Polizze darf zugleich in einem ruhigen fachlichen
Vertragskontext erscheinen. Ein tatsaechlich begleiteter Abschluss ist ein
endlicher Case, dessen Ergebnis der dauerhafte Record sein kann. Normale
Versionen/Nachtraege erzeugen danach nicht je einen neuen Case. Ein importierter
Bestandsvertrag erhaelt Record plus Kontext, aber keinen erfundenen
historischen Abschluss-Case. Details stehen in
`DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md`.

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

Documents sind technisch eigenstaendige Objekte und waehrend Capture/Processing
auch ohne Links erlaubt. Nach abgeschlossenem Review besitzt jedes akzeptierte
Dokument mindestens einen bestaetigten primaeren Case- oder Record-Kontext.
Es gibt keinen separaten dauerhaften UI-Zustand "eigenstaendiges Dokument".

Wenn weder ein vorhandener/geführter Case noch ein langlebiger Record passt,
schlaegt Backend/Core Assist einen leichten Custom Case vor. Dieser darf anfangs
nur Titel und Managed Subject sowie optional ein Dokument enthalten. Titel,
grobe Metadaten und Case-/Record-Kandidaten duerfen vorgeschlagen werden. Der
Managed Subject bleibt der usergewaehlte Verwaltungskontext. Workflow und
harmlose reversible Aufgaben folgen erst der bestaetigten Case-Familie oder
einer konkreten Nutzeraktion; Beziehungen sind optionale,
bestaetigungspflichtige Vorschlaege. Kleine beziehungsweise mittlere
General-Purpose-Modelle finalisieren keine fachliche Bedeutung.

Ein Dokument darf mit mehreren Kontexten verbunden sein, ohne dass die Datei
dupliziert wird. Dauerhaft soll dies ueber explizite Link-Objekte wie
`DocumentCaseLink`, `DocumentProfileLink` und spaeter `ExportJob` /
`OutboxItem` geschehen. Im Commercial Core kann diese Flexibilität in der UI reduziert
werden, solange das Datenmodell nicht in eine harte Ein-Parent-Struktur
eingesperrt wird.

Profile sind keine Ordner. Ein verwaltetes Profil beschreibt, welche Person
oder Organisation ein Dokument, einen Record, einen Vorgang oder einen Fact
betrifft oder besitzt. Ein Kind oder ein eigenes Unternehmen kann eigene
Unterlagen, Verträge und Vorgänge haben, ohne einen eigenen Login zu
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
Case: Behandlung bei Dr. Mayer
  lifecycleStatus: active / waiting / review / done

  Case: Arztrechnung Dr. Mayer abrechnen
    part_of -> Behandlung bei Dr. Mayer
    lifecycleStatus: active / waiting / review / done

    Document: Arztrechnung
      Facts:
        - obligation amount
        - provider
        - treatment date

    Einreichungsereignisse: Sozialversicherung
      submitted / waiting / settled / rejected

    Einreichungsereignisse: Zusatzversicherung
      notStarted / submitted / waiting / settled / rejected

    getrennte Fristen je bestaetigtem Payer
    bestaetigte Zahlung und Erstattung als Financial Facts
```

Einreichung, Antwort und Erstattung sind provenienztragende Ereignisse und
Financial Facts im Kosten-Case. Eine weitere eigenstaendig ausgestellte
Arztrechnung erzeugt einen weiteren `part_of`-Kosten-Case. Korrektur,
Gutschrift, Zahlungsbeleg und Payer-Antwort zur gleichen Rechnung bleiben im
selben Kosten-Case. Es gibt keine Claim-Entitaet.

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

Der Case ist hilfreich, aber nicht fuer jede einzelne Datei Pflicht. Jede
akzeptierte Datei braucht dennoch einen primaeren Kontext; hier kann bereits der
Record `Mathe-Skript Algebra` dieser Kontext sein.

### Autounfall

```text
Case: Autounfall 2026
  Dokumente:
    - Fotos vom Unfallort
    - Polizeibericht
    - Versicherungsschreiben
    - Anwalts-/Gerichtsschreiben

  Ablaufzweige und verknuepfte Cases:
    - polizeiliche Aufnahme, wenn anwendbar
    - Werkstattreparatur
    - Versicherungsabwicklung, die mehrere Rechnungen und Einreichungen
      enthalten kann
    - medizinische und rechtliche Folgen pruefen

  part_of-Vorgaenge:
    - Versicherungsabwicklung mit Kaskoversicherung
    - optionale Schadenkosten, wenn eine Verpflichtung unabhaengig verfolgt wird

  moegliche weitere verbundene Vorgaenge:
    - medizinischer Behandlungsfall, caused_by Autounfall
    - formelles Verfahren, caused_by Autounfall
```

Polizei, Werkstatt, Versicherung oder eine erste Untersuchung werden nicht
allein wegen anderer Akteure, Dokumente oder lokaler Status zu eigenen
Vorgängen. Ein verbundener Vorgang entsteht erst bei einem eigenständig
verständlichen Ziel und Lebenszyklus. Details stehen in
`DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md` und
`DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md`. Ein rein medizinischer Unfall
wird direkt als Medical Care gefuehrt und erhaelt ohne eigenstaendige
nichtmedizinische Regulierung keinen Unfall-Wrapper.

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

Die Capture-Inbox bleibt eine eigene Processing-/Review-/Ausnahmeflaeche. Sie ist
weder Archiv noch fachliche Ownership-Struktur.

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

Mappm vermeidet ein globales, riesiges Status- oder Typ-Enum fuer Vorgaenge.

Alle aufgefuehrten Case-Zustaende sind gueltig. `unknown`, fehlende optionale
Evidenz, `review` oder ein Konflikthinweis sind keine Invaliditaet. Unzulaessige
Transitions werden nicht persistiert; der letzte gueltige Zustand und seine
Historie bleiben bestehen.

Stattdessen:

- `lifecycleStatus` beschreibt generisch den Zustand: `draft`, `active`,
  `waiting`, `review`, `done`, `archived`.
- ein optionaler `domainTemplateKey` referenziert das sichtbare fachliche Ziel
  und Matchingprofil, ohne Case-Konstruktion oder UI-Picker zu steuern.
- `workflowStageKey` beschreibt nur bei gefuehrten Cases die Phase der
  gepinnten Definition.
- `workflowDefinitionId` und `workflowDefinitionVersion` pinnen bei geführten
  Vorgängen die kuratierte Definition.
- `attentionFlags` markieren Dinge wie offene Aufgaben, neue Drafts, Frist bald fällig oder Review nötig.

Dokumente und Records bekommen eigene Status:

- Dokument: `draft`, `review`, `accepted`, `replaced`, `archived`.
- Record-Version: `current`, `superseded`, `expired`, `revoked`, `invalid`, `archived`.

### Abschluss, Archivierung und Wiedereroeffnung

`done` bedeutet, dass der Case nach aktuellem Kenntnisstand mit einem
nachvollziehbaren Ergebnis abgeschlossen wurde. Der Status ist kein
unveraenderlicher Endzustand. Abschlusszeitpunkt, bestaetigtes Ergebnis und
Statushistorie bleiben erhalten.

`archived` ist eine bewusste Ordnungs-/Sichtbarkeitsentscheidung. Archivierte
Cases bleiben suchbar, exportierbar und fuer berechtigtes Matching
grundsaetzlich erreichbar. Archivierung ist weder Loeschung noch eine
fachliche Aussage, dass nie wieder Dokumente eintreffen koennen.

Ein spaeter eintreffendes Dokument wird deshalb auch gegen `done`- und
`archived`-Cases gerankt:

- Bestaetigt es nur den bereits abgeschlossenen Verlauf, darf es nach Review
  verknuepft werden, ohne den Case automatisch wieder zu oeffnen.
- Erzeugt es neue Arbeit, widerspricht es dem Ergebnis oder macht es eine
  weitere Entscheidung erforderlich, schlaegt Mappm eine Wiedereroeffnung vor.
- Ist der neue Verlauf bewusst eigenstaendig, kann die Nutzerin stattdessen
  einen neuen verknuepften Case bestaetigen.

Eine Wiedereroeffnung ist eine protokollierte Lifecycle-Transition zurueck zu
`active`, `waiting` oder `review`; die exakte Zielauswahl folgt der belegten
Arbeit. Sie loescht weder frueheres Abschlussdatum noch Abschlussgrund oder
Historie. In der aktuellen Reifestufe bestaetigt die Nutzerin jede materielle
Wiedereroeffnung. Spaetere Automation benoetigt dasselbe klassenbezogene
Quality-, Abstention-, Undo- und Rollback-Gate wie automatisches Routing.

Schliessen, Archivieren oder Wiedereroeffnen eines Case kaskadiert niemals auf
verknuepfte Cases, Documents, Records oder Tasks. Ein spaeter
eingetroffenes Dokument wird nicht allein wegen seines Datums in einen neuen
Case gezwungen.

Nach standardmaessig sechs Monaten ohne relevante fachliche Aktivitaet darf
Mappm fragen, ob ein Case noch aktiv ist. Das ist ein bestaetigbarer
Review-Vorschlag und niemals ein automatischer Abschluss. Bekannte Termine,
Fristen, erwartete Antworten, Wiederholungen, Abos, periodische Rechnungen,
jaehrliche Kontrollen oder andere plausible Zukunft unterdruecken oder
verschieben die Pruefung. Technischer Sync, Reindexierung oder
Hintergrundverarbeitung zaehlt nicht als fachliche Aktivitaet.

Ein Parent und seine `part_of`-Children besitzen unabhaengige Lifecycles. Der
Parent darf `done` sein, waehrend ein Child aktiv bleibt; UI-Aggregation darf
dies erklaeren, aber keinen gemeinsamen Status erfinden.

## Konsequenzen

- Legacy-Statusmodell wird nicht übernommen.
- `Vorgang` bleibt der UI-Begriff fuer Cases.
- `Sammlung` wird nicht Kernbegriff; kann später höchstens für lose Sets oder gespeicherte Sichten verwendet werden.
- Die Search-Boundary muss Vorgänge, Dokumente und Records berücksichtigen.
- Der Zielpfad plant `CaseLink` und `DocumentCaseLink` direkt; `parentCaseId`
  bleibt nur historische Legacy-Traceability.
- Custom Cases und geführte Cases nutzen denselben Domain-Typ und dieselben
  Produktfähigkeiten; ein leichter Custom Case muss diese Faehigkeiten nicht
  sofort verwenden oder ein ausformuliertes Outcome besitzen.
- Custom/guided sind Verhaltens- und Herkunftszustaende, keine `caseType`-Werte.
- Persistierte Cases sind immer gueltig; es gibt weder einen `invalid`-
  Case-Status noch verpflichtende Dokumenttypen oder Dokumentmengen.
- Dokumente liefern Evidenz fuer Facts und Workflow-Zustaende. Ein Zustand kann
  auch aus ausdruecklicher Nutzerbestaetigung oder spaeter einer autorisierten
  Integration stammen und traegt seine Provenienz.
- Case-Abschluss und Archivierung sind reversibel; spaetere Evidenz bleibt
  matchbar, ohne einen Statuswechsel still zu erzwingen.
- Backend/Core Assist schlaegt fuer jedes neue Dokument, jeden neuen Case und
  jeden neuen Record einen editierbaren Titel vor. Einzige akzeptierte
  M1-Ausnahme ist das case-lokale medizinische Desktop-Medienpaket: Dort
  vergibt der Nutzer den Titel bewusst manuell.
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
- Foundation- und Capture-Slices müssen vermeiden, Fakten nur in
  unstrukturierte `metadata`-Maps zu kippen.
- Foundation- und Capture-Slices müssen vermeiden, Dokumente dauerhaft als
  reine Anhänge mit genau einem Parent zu modellieren.
- BusinessCompanion dient als Referenz fuer FileStorage, Databox, Ingestion und
  Document-Silo-Ideen, aber Mappm uebernimmt ein kleineres provider-faehiges
  Local-/Cloud-Vault-DMS-Kernmodell.

## Stop Rules

Stop, wenn:

- ein Case wegen null, fehlender oder zusaetzlicher Dokumente als ungueltig
  markiert wird;
- ein Dokumenttyp, Workflow, Task, Termin oder Ergebnis zur allgemeinen
  Case-Gueltigkeit vorausgesetzt wird;
- ein Assist-Vorschlag vor Bestaetigung als teilweise angelegter Domain-Case
  persistiert wird;
- ein unzulaessiger Zustandswechsel den letzten gueltigen Zustand
  ueberschreibt;
- `invalid` als Case-Lifecycle-Status eingefuehrt wird.

## Nicht entschieden

- welche DocumentFact-Typen im ersten aktivierten Facts-Slice manuell
  erfassbar sind.
- ob Lernunterlagen und Notizen im Commercial Core sichtbar oder erst später
  aktiviert werden.
