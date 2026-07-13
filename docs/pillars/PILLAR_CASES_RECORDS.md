---
title: "Produkt-Säule - Vorgänge, Dokumente and Records"
description: "Produktbereich fuer Vorgänge, Subvorgänge, Dokumente, Records/Nachweise, Versionierung, Profile und Zusammenhänge"
tags: [pillar, cases, documents, records, versioning, profiles]
lastUpdated: "2026-07-12"
version: "0.3"
status: "accepted-direction"
---

# Produkt-Säule - Vorgänge, Dokumente and Records

## Zweck

Diese Säule ist die fachliche Hauptstruktur von DocMan/Mappm.

Sie bildet den Kern der DMS-Zielarchitektur aus
`docs/technical/DECISION_DMS_TARGET_ARCHITECTURE.md`: Dokumente sind nicht nur
Anhänge an Vorgängen, sondern eigenständige Objekte mit Dateien, Versionen,
Records, Profilbezug, Fakten, Aufgaben, Suche, Export- und
Processing-Beziehungen.

DocMan unterscheidet:

- `Case` / Vorgang: Kontext, Prozess oder Ereignis.
- `Document`: Datei, Scan, Beleg oder konkrete Quelle.
- `Record`: langlebiger Nachweis oder Unterlage mit Versionen.
- `DocumentFact`: strukturierte Aussage aus einem Dokument.
- `CaseWorkflowInstance`: an eine konkrete kuratierte Workflow-Version
  gebundener Vorgangsablauf.

Der R4-M2 fuer Dokumente und Records ist in
`docs/technical/DECISION_DOCUMENT_METADATA_PREVIEW.md` konkretisiert:
generische Pflichtmetadaten, optionale einfache Felder und Vorschau als
Review-Pflicht.

Der M2-Dokumenttyp-Katalog steht in
`docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md`. Typen sind im M2
lockere Klassifikation, keine harten Workflow-Container.

## Grundsatz

Ein Dokument darf nicht nur als Anhang an einen Vorgang existieren.

Viele Dokumente gehören zu einem Prozess, andere sind langlebige Nachweise:

- Unfall mit Fotos, Polizeibericht, Werkstatt, Arztbrief und Versicherung.
- Arztbesuch mit Rechnung, SV-Einreichung, Zusatzversicherung und Apotheke.
- Geburtsurkunde, Meldezettel, Staatsbürgerschaftsnachweis oder Zeugnis.
- Versicherungspolizze mit späteren Claims.

Langfristig darf ein Dokument in mehreren fachlichen Kontexten sichtbar sein,
ohne dass die Datei kopiert wird. Beziehungen tragen die Bedeutung:

- `DocumentCaseLink` fuer Vorgänge und Subvorgänge.
- `DocumentProfileLink` fuer Personen im Haushalt.
- `DocumentFact` fuer auswertbare Inhalte.
- `ExportJob` / `OutboxItem` fuer Ausgaben und Übergaben.
- `ProcessingJob` fuer OCR, Klassifikation, Suche und AI-Vorschläge.

## Vorgänge

Vorgänge bleiben der zentrale UI-Begriff fuer zusammenhängende Abläufe.

Typische Vorgänge:

- Arztbesuch.
- Unfall.
- Versicherungsschaden.
- Behördenantrag.
- Umzug.
- Namensänderung.
- Garantie/Reklamation.
- Schulangelegenheit.
- Reise.

## Subvorgänge

Subvorgänge sind Teil des schlanken M2-Slice.

Beispiele:

- Hauptvorgang `Autounfall`
- Subvorgang `Polizei`
- Subvorgang `Werkstatt`
- Subvorgang `Versicherung`
- Subvorgang `Krankenhaus / Arzt`

Dokumente werden nicht dupliziert. Eine primäre Zuordnung dient anfangs der
Navigation; flexible Mehrfachrollen werden über `DocumentCaseLink` ergänzt.
Unabhängige verwandte Vorgänge werden referenziert und nicht künstlich zu
Subvorgängen gemacht.

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

Records können versioniert werden. Eine neue Version kann durch einen Vorgang ausgelöst werden, muss aber nicht.

## Statusmodell

DocMan vermeidet einen globalen riesigen Status-Enum.

Empfohlen:

- `caseType`.
- `lifecycleStatus`: `draft`, `active`, `waiting`, `review`, `done`, `archived`.
- `workflowStageKey` je Vorgangstyp.
- `attentionFlags` fuer Dinge wie `overdue`, `missingDocument`, `needsReview`.
- separate Dokument- und Record-Version-Status.

## M2-Scope

Schlanker M2-Slice:

- Vorgang anlegen, bearbeiten, schließen.
- Dokumente einem Vorgang zuordnen.
- leere Subvorgänge erstellen.
- aus ausgewählten Dokumenten einen Subvorgang bilden.
- betroffene Person / Haushaltsprofil als Pflichtzuordnung vorbereiten.
- Dokumente ohne Vorgang erlauben.
- Records/Nachweise konzeptionell vorbereiten.
- Datenmodell nicht auf genau einen harten Dokument-Parent verengen.

Späterer Milestone:

- volle flexible Mehrfachzuordnung mit Rollen.
- generische Workflow-Instanzen und kuratierte Länder-/Institutionspakete.
- automatische Statusübergänge.
- vollständige Haushaltsrechte.
- vollständige Export-/Outbox-Historie.
- automatische OCR-/AI-Übernahme.

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

- Wie heißt `Record` final in der deutschen UI?
- Welche Vorgangstypen sind im M2 fest sichtbar?
- Welche Dokumentrollen brauchen wir zuerst nach dem M2?
- WF-01/WF-02: Welche Startmärkte/Golden Workflows und welche fachlichen
  Review-/Haftungsowner werden freigegeben?

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
