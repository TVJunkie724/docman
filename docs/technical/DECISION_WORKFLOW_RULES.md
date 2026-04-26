---
title: "Decision - Workflow Rules"
description: "Entscheidung zu DocMan-Workflows: Führung und Vorschläge statt harter Status-Käfige"
tags: [decision, product, workflow, cases, tasks]
lastUpdated: "2026-04-27"
status: "accepted"
---

# Decision - Workflow Rules

## Status

Accepted.

## Entscheidung

DocMan-Workflows führen Nutzerinnen durch typische nächste Schritte, sind aber im MVP keine harten Status-Käfige.

Workflows dürfen:

- wahrscheinliche nächste Schritte vorschlagen.
- Aufgaben erzeugen oder empfehlen.
- fehlende Dokumente oder Metadaten sichtbar machen.
- Review-Zustände markieren.
- fachlich unsichere Situationen erklären.

Workflows dürfen nicht:

- harmlose manuelle Korrekturen blockieren.
- Statusänderungen nur wegen einer starren Maschine verhindern.
- KI-/OCR-Vorschläge still übernehmen.
- Dokumente oder Vorgänge still löschen oder überschreiben.

## Harte Regeln

Harte Verbote sind nur dort erlaubt, wo Datenintegrität, Sicherheit oder Nachvollziehbarkeit gefährdet wären.

Beispiele:

- Ein Dokument darf nicht einer nicht existierenden `caseId` zugeordnet bleiben.
- Ein Upload darf nicht als erfolgreich gelten, wenn der Home Hub ihn nicht bestätigt hat.
- Ein Secret darf nicht in normalem Local Storage landen.

## Konsequenzen

- MVP-Workflows sind leichtgewichtig.
- Status und Aufgaben helfen beim Sortieren, ersetzen aber nicht Nutzerentscheidung.
- Konflikte und unsichere Automationen landen in Review.
- Spätere Intelligence erzeugt Vorschläge, keine stillen Entscheidungen.

