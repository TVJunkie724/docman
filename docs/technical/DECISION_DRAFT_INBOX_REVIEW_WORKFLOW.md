---
title: "Decision - Draft Inbox Review Workflow"
description: "Entscheidung zum Desktop-Review-Workflow fuer Draft-Inbox, erledigte Eingänge, Korrekturen und Reopen-Regeln im M2"
tags: [decision, draft-inbox, capture, review, desktop, mvp, correction]
lastUpdated: "2026-07-14"
status: "accepted"
---

# Decision - Draft Inbox Review Workflow

## Status

Accepted.

## Entscheidung

Die Desktop-Inbox ist im M2 eine Arbeitsfläche mit zwei Bereichen:

1. **Entwürfe** fuer neue, ungepruefte oder review-pflichtige Eingänge.
2. **Zuletzt verarbeitet** fuer erledigte Eingänge, die kurzfristig korrigierbar bleiben.

Die Inbox ist kein zweites Archiv. Nach Abschluss des Reviews gehoert das
Dokument fachlich zu Dokument/Record/Vorgang/Profil. Der erledigte Inbox-Eintrag
bleibt nur als Nachlauf- und Korrekturanker sichtbar.

## Sichtbarkeit erledigter Eingänge

Erledigte Eingänge bleiben im M2 als die **letzten 10 verarbeiteten Eingänge**
im Bereich "Zuletzt verarbeitet" sichtbar.

Wenn mehr als 10 Eingänge verarbeitet wurden, verschwindet der älteste erledigte
Eintrag aus der Inbox-Arbeitsfläche. Das Dokument selbst bleibt natuerlich im
DMS-Kern auffindbar:

- im Vorgang.
- im Dokument-/Record-Bereich.
- im Profilkontext.
- ueber Suche.
- ueber Schnellzugriff, falls markiert.

Das Ausblenden eines erledigten Inbox-Eintrags loescht keine Datei und kein
Dokument.

## Entwurfsbereich

Ein Inbox-Eintrag ist im Entwurfsbereich, wenn:

- ein Desktop-Import neu angelegt wurde.
- ein Mobile-Scan angekommen ist.
- Managed Subject, Vorgang/Beziehung, Dokumenttyp oder Titel fehlen.
- der Mobile-Kontext ungueltig wurde.
- Upload/Import eine Review-Warnung erzeugt hat.
- der Nutzer einen erledigten Eingang wieder in Review geoeffnet hat.

## Zuletzt verarbeitet

Ein Inbox-Eintrag ist "zuletzt verarbeitet", wenn:

- der Review abgeschlossen wurde.
- das Dokument angelegt oder aktualisiert wurde.
- die primaere Zuordnung akzeptiert wurde.
- keine blockierende Review-Warnung offen ist.

In diesem Bereich darf der Nutzer schnell korrigieren:

- Titel.
- Profil.
- Vorgang, Record und Case-Beziehung.
- Dokumenttyp.
- kurze Notiz.
- einfache Metadaten, die bereits im Draft Review sichtbar waren.

Groessere fachliche Bearbeitung passiert in der Dokument-, Record- oder
Vorgangsansicht.

Kontextabhängige Review-Aktionen folgen
`DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md`. Die Inbox zeigt nur
wenige wahrscheinliche Aktionen statt einer universellen Optionsliste.

## Falsch zugeordnet

Wenn ein Dokument falsch zugeordnet wurde, darf der Nutzer im Bereich
"Zuletzt verarbeitet" die Zuordnung direkt korrigieren.

Regeln:

- Die Datei wird nicht dupliziert.
- Das Dokument bleibt dasselbe Dokumentobjekt.
- Korrekturen aendern Beziehungen und Metadaten.
- Wenn die Korrektur komplex wird, kann der Eintrag zurueck in Entwuerfe/Review
  gesetzt werden.

## Zurueck in Entwuerfe

"Zurueck in Entwuerfe" ist erlaubt, wenn:

- die Zuordnung unklar ist.
- der falsche Profilkontext gesetzt wurde.
- Metadaten fachlich unsicher sind.
- ein Import-/Upload-Hinweis erneut geprueft werden muss.
- der Nutzer die Ablage bewusst zurueckstellt.

Reopen erzeugt keinen neuen Dateiimport und keinen neuen Upload. Es aendert nur
den Review-Zustand des Inbox-Eintrags.

## Nicht im M2

Nicht Teil dieses M2-Workflows:

- eigene Outbox in der Inbox.
- Export-/Mail-/Druckfunktionen in der Inbox.
- automatische OCR-Klassifikation.
- KI-gestuetzte Massenbearbeitung.
- komplexe Audit-Historie.
- mobile Draft-Review.

Outbox, Export und externe Aktionen bleiben eigene Vorgangs- oder
Dokument-Flows.

## Konsequenzen

- R4.2 Desktop Import + Draft Inbox bekommt einen klaren Review-Workflow.
- Die letzten 10 erledigten Eingänge sind sichtbar und schnell korrigierbar.
- Die Inbox bleibt Arbeitskorb und wird nicht zum zweiten Archiv.
- Falsch zugeordnete Dokumente koennen korrigiert werden, ohne Dateien zu
  duplizieren.
- Spaetere OCR-/AI-Vorschlaege koennen denselben Review/Reopen-Mechanismus
  nutzen.

## Nicht entschieden

- exakte UI-Gestaltung der zwei Inbox-Bereiche.
- ob die Anzahl der zuletzt verarbeiteten Eingänge spaeter konfigurierbar wird.
- ob aeltere erledigte Inbox-Einträge spaeter ueber Filter erreichbar bleiben.
- welche Metadaten im Schnellkorrekturmodus direkt editierbar sind.
