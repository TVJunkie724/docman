---
title: "Decision - Workflow Rules"
description: "Entscheidung zu Mappm-Workflows: kuratierte Führung und nachvollziehbare Vorschläge statt harter Status-Käfige"
tags: [decision, product, workflow, cases, tasks, internationalization]
lastUpdated: "2026-07-24"
status: "accepted"
owner: "product-concept/domain"
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
als Kandidat auswaehlen und ihre Anwendung vorschlagen, aber keine fachlich
verbindliche Ablauflogik erfinden oder ohne Nutzerbestaetigung aktivieren.
Planung und Implementation gehen von kleinen beziehungsweise mittleren
General-Purpose-Modellen aus; die verbindliche Grenze steht in
`DECISION_INTELLIGENCE_SCOPE.md`.

Workflows dürfen:

- wahrscheinliche nächste Schritte vorschlagen.
- nach bestaetigter Case-/Workflow-Auswahl oder konkreter Nutzeraktion
  harmlose reversible Aufgaben erzeugen beziehungsweise weitere empfehlen.
- fehlende Dokumente oder Metadaten sichtbar machen.
- Review-Zustände markieren.
- fachlich unsichere Situationen erklären.
- passende veröffentlichte Länder-/Institutionsvarianten vorschlagen.
- bedingte Ablaufzweige, Submission Events und typisierte Case-Beziehungen
  vorschlagen; keine Claim-Entitaet.

Workflows dürfen nicht:

- harmlose manuelle Korrekturen blockieren.
- Statusänderungen nur wegen einer starren Maschine verhindern.
- KI-/OCR-Vorschläge still übernehmen.
- Dokumente oder Vorgänge still löschen oder überschreiben.
- Rechtsraum, Fristen, Ansprüche oder Einreichungspflichten frei generieren.
- einen laufenden Vorgang still auf eine andere Workflow-Version migrieren.

Regelabgeleitete Fristen und Reminder folgen
`DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`. Eine Workflowdefinition darf
mehrere voneinander unabhaengige Fristen je Institution, Polizze oder
Vertragsspur tragen. Eine daraus abgeleitete naechste kritische Frist ersetzt
keine dieser Einzelregeln.

## Harte Regeln

Harte Verbote sind nur dort erlaubt, wo Datenintegrität, Sicherheit oder Nachvollziehbarkeit gefährdet wären.

Beispiele:

- Ein Dokument darf nicht einer nicht existierenden `caseId` zugeordnet bleiben.
- Ein Cloud-Upload darf nicht als erfolgreich gelten, bevor Mappm Cloud ihn
  bestätigt; ein Local-Import erst nach atomarer lokaler Persistenz.
- Ein Secret darf nicht in normalem Local Storage landen.

## Konsequenzen

- Der Commercial Core startet mit wenigen kompositorischen Workflow-Mustern
  statt einer großen, für Nutzerinnen sichtbaren Typauswahl.
- Status und Aufgaben helfen beim Sortieren, ersetzen aber nicht Nutzerentscheidung.
- unsichere Vorschlaege landen in Review; eine semantische
  Falschprofil-/Falsch-Case-/Falschdokument-Erkennung wird nicht vorausgesetzt.
- In der aktuellen Reifestufe erzeugt Intelligence Vorschläge, keine stillen
  Entscheidungen. Spätere Automatisierung folgt ausschließlich den
  klassenspezifischen Quality Gates der Assisted-Routing-Entscheidung.
- Nicht unterstützte Länder-/Anbieterkombinationen fallen auf einen klar
  gekennzeichneten manuellen Vorgang zurück.
- Fachliche Vorgaben sind versionierter Produktinhalt, nicht Widget- oder
  Controller-Logik.
- Quellen, Reviews, Aenderungserkennung, Ruecknahme und Release-Gates fuer
  laender-/providerabhaengige Regeln folgen
  `../ops/OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md`.
- Ein Workflow bleibt innerhalb eines Case, solange alle Schritte demselben
  Nutzerziel und Gesamtergebnis dienen.
- Ein neuer verbundener Case entsteht erst bei eigenständigem Ziel und
  Lebenszyklus; `Subvorgang` ist nur die UI-Rolle eines `part_of`-Links.
