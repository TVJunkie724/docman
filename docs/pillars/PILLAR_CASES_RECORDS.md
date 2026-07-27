---
title: "Produkt-Säule - Vorgänge, Unterlagen and Documents"
description: "Produktbereich fuer eigenstaendige Vorgaenge, typisierte Beziehungen, Unterlagen/Records, Dokumente, Versionierung und verwaltete Profile"
tags: [pillar, cases, case-links, documents, records, versioning, managed-subjects]
lastUpdated: "2026-07-24"
version: "0.5"
status: "accepted-direction"
owner: "product-concept"
---

# Produkt-Säule - Vorgänge, Unterlagen and Documents

## Zweck

Diese Saeule ist die fachliche Hauptstruktur von Mappm.

Sie bildet den Kern der DMS-Zielarchitektur aus
`docs/technical/DECISION_DMS_TARGET_ARCHITECTURE.md`: Dokumente sind nicht nur
Anhänge an Vorgängen, sondern eigenständige Objekte mit Dateien, Versionen,
Records, Profilbezug, Fakten, Aufgaben, Suche, Export- und
Processing-Beziehungen.

Mappm unterscheidet:

- `Case` / Vorgang: Kontext, Prozess oder Ereignis.
- `Document`: Datei, Scan, Beleg oder konkrete Quelle.
- `Record`: langlebiger Nachweis oder Unterlage mit Versionen.
- `DocumentFact`: strukturierte Aussage aus einem Dokument.
- `CaseWorkflowInstance`: an eine konkrete kuratierte Workflow-Version
  gebundener Vorgangsablauf.
- `CaseLink`: typisierte Beziehung zwischen eigenständigen Vorgängen; ein
  Subvorgang ist die UI-Rolle eines `part_of`-Links.

Der Dokument-/Record-Review ist in
`docs/technical/DECISION_DOCUMENT_METADATA_PREVIEW.md` konkretisiert:
generische Metadaten, optionale Fakten und Vorschau als Review-Evidenz.

Die akzeptierten Taxonomie-Achsen und der noch offene vollstaendige
Dokumentgrundarten-/Variantenkatalog stehen in
`docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md`.

## Grundsatz

Ein Dokument ist technisch nie nur Anhang/Eigentum eines Vorgangs. Nach
abgeschlossenem Capture Review besitzt es aber einen bestaetigten primaeren
Case- oder Record-Kontext und kann weitere Links tragen.

Viele Dokumente gehören zu einem Prozess, andere sind langlebige Nachweise:

- Unfall mit Fotos, Polizeibericht, Werkstatt, Arztbrief und Versicherung.
- Arztbesuch mit Rechnung, SV-Einreichung, Zusatzversicherung und Apotheke.
- Geburtsurkunde, Meldezettel, Staatsbürgerschaftsnachweis oder Zeugnis.
- Versicherungspolizze mit späteren Versicherungsabwicklungs-Cases.

Langfristig darf ein Dokument in mehreren fachlichen Kontexten sichtbar sein,
ohne dass die Datei kopiert wird. Beziehungen tragen die Bedeutung:

- `DocumentCaseLink` fuer Vorgänge und Ablaufkontext.
- `DocumentProfileLink` fuer Personen im Haushalt.
- `DocumentFact` fuer auswertbare Inhalte.
- `ExportJob` / `OutboxItem` fuer Ausgaben und Übergaben.
- `ProcessingJob` fuer OCR, Klassifikation, Suche und AI-Vorschläge.

## Vorgänge

Vorgänge bleiben der zentrale UI-Begriff fuer zusammenhängende Dokumente und
Abläufe. Im einfachsten Fall ist ein Vorgang nur eine benannte, durchsuchbare
Dokumentensammlung. Workflow, Tasks und Abschlussziel sind optionale
Anreicherungen; Nutzer erhalten keinen Katalog mit dutzenden Case-Typen.

Jeder persistierte Case ist gueltig. Null, ein oder mehrere Dokumente sind
zulaessig; kein Dokumenttyp und keine Dokumentkombination ist eine allgemeine
Gueltigkeitsvoraussetzung. Fehlende Evidenz, unbekannte Facts und Review-Bedarf
sind gueltige Zustaende, kein `invalid`-Case.

Die vollstaendige Liste und der jeweilige Status moeglicher Fachvorlagen stehen
ausschliesslich in
`docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`. Diese Saeule
definiert keine parallelen Case-Arten oder Kandidaten. Sie beschreibt nur die
gemeinsamen Case-/Record-Faehigkeiten und Implementierungsgrenzen.

## Vorgangsbeziehungen und Ablaufzweige

Alle Vorgänge sind eigenständige `Case`-Objekte. `part_of`, `caused_by`,
`follow_up_to` und `related_to` beschreiben ihren Zusammenhang. Schritte,
Aufgaben, Ereignisse, Einreichungen und bedingte Ablaufzweige bleiben im selben
Vorgang, solange sie demselben Nutzerziel und Gesamtergebnis dienen.

Polizei, Werkstatt, Versicherer oder Krankenhaus sind in einem Unfall nicht
automatisch eigene Vorgänge. Ein formelles Verfahren oder eine längerfristige
Behandlung kann bei eigenständigem Ziel als normaler verknüpfter Vorgang
entstehen. Normative Regeln stehen in
`docs/technical/DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`.

`follow_up_to` bildet Folgeketten/-verzweigungen ohne Parent-Ownership. Fuer
Medizin sind Care-Anker, genau eine `part_of`-Kostenabrechnung je
eigenstaendig ausgestellter Rechnung/Honorarnote und wiederholbare
Payer-Einreichungsereignisse mit null, einem oder mehreren Dokumentlinks in
`docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md` akzeptiert.
Korrektur, Gutschrift, Zahlungsbeleg und Payer-Antwort derselben Rechnung
bleiben im Cost-Case; eine weitere eigenstaendige Rechnung erzeugt einen
weiteren Cost-Case. Kein Dokument ist Pflicht. Payer-Fristen und Finanz-Facts
bleiben getrennt; der Medical-Zuschnitt ist akzeptiert. Care wird bewusst
geschlossen und darf `done` sein, waehrend Cost-Children aktiv bleiben; ein
Cost-Abschluss bleibt auch nach terminalen begonnenen Payer-Spuren
bestaetigungsgebunden. OQ-014 blockiert nur noch Unfall/Schaden.
Behandlungsbewilligungen bleiben Dokumente/Facts/Schritte im Care-Case. Der
seltene Desktop-Medienarchiv-Import ist nur innerhalb eines bestehenden
bestaetigten Care-Case verfuegbar; sein Ergebnis bleibt ein
Document-/File-Artefakt und kein eigener Case. Reha, Nachsorge und spaetere
Evidenz werden dokumentweise gegen bestehende und neue Care-Kandidaten gerankt.
Ein neuer verknuepfter Medical Case entsteht bestaetigt aus einem
Ankerdokument oder ausdruecklicher Absicht; M1 bietet keine freie
Mehrfachabspaltung. Wiederkehr ist optionale Planung statt Case-Typ. Besondere
vertragliche Leistungen werden im Medical Core fuer M1 nicht spezialisiert und
Mappm berechnet keine Deckung oder erwartete Leistung. OQ-012 ist geschlossen.

## Geführte Vorgänge

Vorgänge können manuell bleiben oder auf einer gepinnten, kuratierten
Workflow-Version basieren. Die Case-Engine kennt generische Zustände,
Relationen, Aufgaben, erwartete Dokumente und Ergebnisse. Länder-, Regions- und
Institutionslogik kommt aus dem versionierten Workflow-Katalog und nicht aus
Flutter-Widgets.

Intelligence darf bestehende Vorgänge und anwendbare veröffentlichte
Definitionen vorschlagen. Sie darf keine fachlich verbindlichen Abläufe,
Fristen oder Ansprüche erfinden. Normative Details stehen in
`docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`.

Custom Cases duerfen mit vorgeschlagenem Titel, Managed Subject und optional
einem Dokument nahezu leer beginnen. Aufgaben, Termine, Workflow und Outcome sind
keine Pflichtattribute. Der Managed Subject stammt aus dem usergewaehlten
Verwaltungskontext. Backend/Core Assist schlaegt einen konservativen Titel,
grobe Metadaten und Case-/Record-Kandidaten vor. Workflow-Uebernahme folgt der
bestaetigten Case-Familie; weitere Dokumente und Beziehungen sind optionale,
bestaetigungspflichtige Ranking-Ergebnisse. Die aktive
Review-/Automatisierungsreife bestimmt die Finalisierung.

## Records

Records sind langlebige Unterlagen oder Nachweise.

Beispiele:

- Geburtsurkunde.
- Staatsbürgerschaftsnachweis.
- Meldezettel.
- Ausweis.
- Zeugnis.
- Versicherungspolizze.
- Garantie.
- Vertrag.
- wichtige Lernunterlage.
- wichtige Notiz.

Vertraege und Polizzen koennen einen endlichen Abschluss-Case als Historie und
einen dauerhaften Record als Ergebnis besitzen. Normale Updates bleiben danach
im ruhigen Vertragskontext. Ein importierter Bestandsvertrag erhaelt keinen
erfundenen Abschluss-Case. Details stehen in
`docs/technical/DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md`.

Records können versioniert werden. Eine neue Version kann durch einen Vorgang ausgelöst werden, muss aber nicht.

## Statusmodell

Mappm vermeidet einen globalen riesigen Status-Enum.

Zielrichtung, deren konkreter Katalog durch R0.6 freigegeben werden muss:

- eine generische `Case`-Entitaet ohne Pflicht-Typ oder Pflichtworkflow.
- optionaler `domainTemplateKey` fuer das sichtbare fachliche Ziel.
- optionale gepinnte `workflowDefinitionId/version` fuer gefuehrte Cases; die
  Definition referenziert intern ein wiederverwendbares Workflow-Muster.
- `lifecycleStatus`: `draft`, `active`, `waiting`, `review`, `done`, `archived`.
- `workflowStageKey` nur fuer Cases mit gepinnter Workflowdefinition.
- `attentionFlags` fuer Dinge wie `overdue`, `missingDocument`, `needsReview`.
- separate Dokument- und Record-Version-Status.

## Commercial-Core-Scope

- Vorgang anlegen, bearbeiten, schließen.
- abgeschlossenen oder archivierten Vorgang bei spaeterer Evidenz
  nachvollziehbar wiedereroeffnen oder bewusst geschlossen lassen.
- jedes akzeptierte Dokument einem primaeren Case oder Record zuordnen.
- leere manuelle oder geführte Vorgänge erstellen.
- aus ausgewählten Dokumenten einen verbundenen Vorgang bilden.
- aus ausgewählten Dokumenten und Vorgängen einen neuen übergeordneten Vorgang
  bilden.
- Fuer medizinische Subvorgaenge in M1 gilt enger: ein neuer Case beginnt aus
  genau einem Ankerdokument oder ausdruecklicher Absicht; weitere Dokumente
  werden einzeln vorgeschlagen und zugeordnet.
- Managed-Subject-Bezug vorbereiten; aus bestätigtem Case/Record ableiten und
  nur bei Unsicherheit oder materieller Abweichung separat bestätigen.
- leichte Custom Cases als Capture-Fallback und Records/Nachweise produktiv
  vorbereiten.
- Datenmodell nicht auf genau einen harten Dokument- oder Case-Parent verengen.

## Abgrenzung

- Eingang und Scans liegen in `PILLAR_CAPTURE_INBOX.md`.
- Aufgaben, Fristen und Schnellzugriff liegen in `PILLAR_TASKS_REMINDERS_QUICK_ACCESS.md`.
- strukturierte Auswertungen liegen in `PILLAR_SEARCH_FACTS_INSIGHTS.md`.
- externe Einreichlinks liegen in `PILLAR_EXPORT_SHARING_EXTERNAL_ACTIONS.md`.
- Cloud Authority, Sync und Dateiübertragung liegen in `PILLAR_CLOUD_IDENTITY_SYNC.md`.
- OCR, Klassifikation und AI-Vorschläge liegen in `PILLAR_INTELLIGENCE_AUTOMATION.md`.
- Definition, Review und Lifecycle des Workflow-Katalogs liegen in
  `PILLAR_TEMPLATES_WORKFLOWS.md`.

## Offene Folgefragen

- Welche Golden Workflows und Custom-Case-Einstiege sind in Commercial 1.0
  sichtbar?
- Welche globalen Dokumentgrundarten/Varianten und Rollen brauchen die acht
  vorgeschlagenen Workflow-Muster und sichtbaren Fachvorlagen?
- WF-01/WF-02: Welche Austria-first Golden Workflows und welche fachlichen
  Review-/Haftungsowner werden freigegeben?
- WF-03: Welche Rechtsraeume und Reihenfolge umfasst die geplante
  deutschsprachige Expansion nach Oesterreich?

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
