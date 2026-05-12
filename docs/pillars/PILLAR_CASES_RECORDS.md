---
title: "Produkt-Säule - Vorgänge, Dokumente and Records"
description: "Produktbereich fuer Vorgänge, Subvorgänge, Dokumente, Records/Nachweise, Versionierung, Profile und Zusammenhänge"
tags: [pillar, cases, documents, records, versioning, profiles]
lastUpdated: "2026-05-08"
version: "0.2"
status: "proposed"
---

# Produkt-Säule - Vorgänge, Dokumente and Records

## Zweck

Diese Säule ist die fachliche Hauptstruktur von DocMan/Ordna.

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

Subvorgänge sind Teil des MVP-light.

Beispiele:

- Hauptvorgang `Autounfall`
- Subvorgang `Polizei`
- Subvorgang `Werkstatt`
- Subvorgang `Versicherung`
- Subvorgang `Krankenhaus / Arzt`

Dokumente werden nicht dupliziert. Ein Dokument hat eine primäre Zuordnung; flexible Mehrfachrollen können später über `DocumentCaseLink` ergänzt werden.

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

## MVP-Scope

MVP-light:

- Vorgang anlegen, bearbeiten, schließen.
- Dokumente einem Vorgang zuordnen.
- leere Subvorgänge erstellen.
- aus ausgewählten Dokumenten einen Subvorgang bilden.
- ein aktives Profil vorbereiten.
- Dokumente ohne Vorgang erlauben.
- Records/Nachweise konzeptionell vorbereiten.
- Datenmodell nicht auf genau einen harten Dokument-Parent verengen.

Nicht MVP:

- volle flexible Mehrfachzuordnung mit Rollen.
- komplexe Workflow-Engines.
- automatische Statusübergänge.
- vollständige Haushaltsrechte.
- vollständige Export-/Outbox-Historie.
- automatische OCR-/AI-Übernahme.

## Abgrenzung

- Eingang und Scans liegen in `PILLAR_CAPTURE_INBOX.md`.
- Aufgaben, Fristen und Schnellzugriff liegen in `PILLAR_TASKS_REMINDERS_QUICK_ACCESS.md`.
- strukturierte Auswertungen liegen in `PILLAR_SEARCH_FACTS_INSIGHTS.md`.
- externe Einreichlinks liegen in `PILLAR_EXPORT_SHARING_EXTERNAL_ACTIONS.md`.
- Home-Hub-Sync und Datei-Replikation liegen in `PILLAR_HOME_HUB_SYNC.md`.
- OCR, Klassifikation und AI-Vorschläge liegen in `PILLAR_INTELLIGENCE_AUTOMATION.md`.

## Offene Folgefragen

- Wie heißt `Record` final in der deutschen UI?
- Welche Vorgangstypen sind im MVP fest sichtbar?
- Welche Dokumentrollen brauchen wir zuerst nach dem MVP?
