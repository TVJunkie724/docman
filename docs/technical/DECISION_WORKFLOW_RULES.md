---
title: "Decision - Workflow Rules"
description: "Entscheidung zu Mappm-Workflows: kuratierte Führung und nachvollziehbare Vorschläge statt harter Status-Käfige"
tags: [decision, product, workflow, cases, tasks, internationalization]
lastUpdated: "2026-07-12"
status: "accepted"
---

# Decision - Workflow Rules

## Status

Accepted.

## Entscheidung

Mappm-Workflows führen Nutzerinnen durch typische nächste Schritte, sind aber
keine harten Status-Käfige. Fachlich relevante Abläufe stammen aus dem
kurierten, versionierten Workflow-Katalog gemäß
`DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`.

Die generische Vorgangs-Engine ist von Länder-, Institutions- und
Sprachvarianten getrennt. Ein LLM darf eine veröffentlichte Definition
auswählen und ihre Anwendung vorschlagen, aber keine fachlich verbindliche
Ablauflogik erfinden.

Workflows dürfen:

- wahrscheinliche nächste Schritte vorschlagen.
- Aufgaben erzeugen oder empfehlen.
- fehlende Dokumente oder Metadaten sichtbar machen.
- Review-Zustände markieren.
- fachlich unsichere Situationen erklären.
- passende veröffentlichte Länder-/Institutionsvarianten vorschlagen.
- Subvorgänge und typisierte Beziehungen vorschlagen.

Workflows dürfen nicht:

- harmlose manuelle Korrekturen blockieren.
- Statusänderungen nur wegen einer starren Maschine verhindern.
- KI-/OCR-Vorschläge still übernehmen.
- Dokumente oder Vorgänge still löschen oder überschreiben.
- Rechtsraum, Fristen, Ansprüche oder Einreichungspflichten frei generieren.
- einen laufenden Vorgang still auf eine andere Workflow-Version migrieren.

## Harte Regeln

Harte Verbote sind nur dort erlaubt, wo Datenintegrität, Sicherheit oder Nachvollziehbarkeit gefährdet wären.

Beispiele:

- Ein Dokument darf nicht einer nicht existierenden `caseId` zugeordnet bleiben.
- Ein Cloud-Upload darf nicht als erfolgreich gelten, bevor Mappm Cloud ihn
  bestätigt; ein Local-Import erst nach atomarer lokaler Persistenz.
- Ein Secret darf nicht in normalem Local Storage landen.

## Konsequenzen

- M2-Workflows sind leichtgewichtig.
- Status und Aufgaben helfen beim Sortieren, ersetzen aber nicht Nutzerentscheidung.
- Konflikte und unsichere Automationen landen in Review.
- Spätere Intelligence erzeugt Vorschläge, keine stillen Entscheidungen.
- Nicht unterstützte Länder-/Anbieterkombinationen fallen auf einen klar
  gekennzeichneten manuellen Vorgang zurück.
- Fachliche Vorgaben sind versionierter Produktinhalt, nicht Widget- oder
  Controller-Logik.
