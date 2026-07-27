---
title: "Produkt-Säule - Tasks, Reminders and Quick Access"
description: "Produktbereich fuer Aufgaben, To-dos, Fristen, Erinnerungen, Benachrichtigungsquellen und Schnellzugriff"
tags: [pillar, tasks, reminders, quick-access, deadlines, notifications]
lastUpdated: "2026-07-24"
version: "0.5"
status: "accepted-direction"
owner: "product-concept"
---

# Produkt-Säule - Tasks, Reminders and Quick Access

## Zweck

Mappm soll nicht nur Dokumente speichern, sondern helfen, naechste Schritte
nicht zu vergessen.

Beispiele:

- Rechnung bis nächste Woche zahlen.
- Versicherung einen Monat vor Ablauf prüfen.
- Rechnung bei Sozialversicherung einreichen.
- Zusatzversicherung nach bestaetigter SV-Abrechnung/Erstattung oder Ablehnung
  einreichen; Eingangsbestätigung, Rueckfrage oder Nachforderung genuegen nicht.
- Anruf bei Versicherung erledigen.
- Arzttermin fuer ein Kind machen.
- wichtiges Dokument schnell finden.

## Grundmodell

```text
Task
  Nutzeraufgabe oder empfohlener nächster Schritt

Deadline
  fachlich belegte Frist oder Faelligkeit

Appointment / ExpectedResponse
  geplanter Termin oder erwartetes externes Ergebnis

Reminder
  zeitbasierter Hinweis auf Task, Record, Submission Event, Deadline oder Case

QuickAccessItem
  bewusst angepinnter schneller Zugriff auf wichtige Dokumente, Records oder Vorgänge
```

Tasks, Deadlines, Termine, erwartete Antworten und Reminders sind
unterscheidbare fachliche Objekte beziehungsweise Projektionen. Notifications
sind nur ein Ausgabekanal.

Mappm bietet eine fokussierte Agenda über Aufgaben, Fristen, Termine, erwartete
Antworten, Gültigkeiten und Reminder. Es ist kein allgemeiner Kalender.

Die gemeinsame Semantik fuer Zeit-Facts, Ereignisse, Termine, Fristen,
Aufgaben, erwartete Antworten, Reminder, Genauigkeit und Provenienz besitzt
`docs/technical/DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`. Diese Saeule
entscheidet nicht durch ein einzelnes `documentDate`, was in der Agenda
erscheint.

Mehrere regelbasierte Fristen, Rule-/Quellenprovenienz, frueheste offene
kritische Frist, Nutzerbestaetigung und Updateverhalten folgen
`docs/technical/DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`. Eine
Country-/Provider-Regel darf erst mit dem Betriebsgate aus
`docs/ops/OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md` aktive Fristen oder
Reminder erzeugen.

## Task

Eine Aufgabe kann manuell erstellt oder im C2/C3-Kern aus bestaetigten
Workflow-, Fact-, Event-, Record- oder Core-Assist-Vorschlaegen erzeugt werden.
Eine harmlose, interne und reversible Aufgabe aus einem bereits bestaetigten
Fact benoetigt keine zweite Bestaetigung. Beispiel: bestaetigter Zahlstatus
`unbezahlt` erzeugt direkt eine editier- und verwerfbare Zahlungsaufgabe.

Mindestfelder:

- Titel.
- Status: `open`, `done`, `dismissed`.
- optionales Fälligkeitsdatum.
- optionales Erinnerungsdatum oder Reminder-Offset.
- Profilbezug.
- optionale Verknüpfung zu Vorgang, Dokument, Record, Event oder Fact.
- Priorität.
- Quelle: manuell, bestaetigter Workflow/Fact/Event oder gepruefte Regel; ein
  OCR-/LLM-Kandidat wird erst nach seiner ausdruecklichen semantischen
  Bestaetigung zur Aufgabenquelle.
- optionale externe Aktionslinks.

Faelligkeitsdatum und Erinnerungszeitpunkt bleiben getrennte typisierte Werte.
Ein reines Datum erhaelt keine erfundene Uhrzeit oder UTC-Mitternacht.

## Reminder

Ein Reminder beschreibt, wann Mappm erinnern soll.

```text
Reminder
  remindAt oder offset zum bestaetigten Zielzeitwert
  channelPreference
  targetType: task / record / case / event / document
  targetId
```

Notification-Regeln, Redaction und technische Fehler-/Systemhinweise bleiben im querschnittlichen F18-Konzept.

Reminder unterscheiden Datum, Offset und Kanal:

- `quiet`: Agenda, Badge oder In-App-Erinnerung.
- `notifying`: datenschutzsichere lokale oder geräteübergreifende Notification.
- ein oder mehrere Workflow-/Nutzer-Offsets.
- Ruhezeiten und Kanalpräferenz.

Ein automatisch aus einer Regel erzeugter Reminder bleibt als automatisch
erzeugt erkennbar, editierbar und deaktivierbar. Regelstand, Fundstelle,
Berechnung, Bestaetigung und Quellenreview muessen erreichbar sein. Eine Frist
erzeugt nicht automatisch eine laute Notification; mehrere Payer-Fristen
werden nicht zu einer Frist verschmolzen.

Bei monatlich, jährlich oder anders wiederkehrend kündbaren Verträgen erzeugt
Mappm nicht automatisch jeden Zyklus eine laute Erinnerung. Eine wiederkehrende
Prüfung wird bewusst aktiviert oder durch ein bestätigtes Ereignis wie eine
Preisänderung vorgeschlagen.

## Quick Access

Mit Notfallzugriff meint Mappm hier Schnellzugriff, nicht automatisch externe
Berechtigung.

Schnellzugriff ist eine kuratierte Sicht auf wichtige Dokumente, Records oder Vorgänge:

- Geburtsurkunde.
- Staatsbürgerschaftsnachweis.
- Meldezettel.
- Ausweise.
- Versicherungs-Polizzen.
- wichtige medizinische Unterlagen.
- Schlüsseldokumente fuer Kinder.

## C3-Scope

Schlanker C3-Slice:

- Aufgabenübersicht.
- Aufgaben manuell erstellen, erledigen, verwerfen.
- Aufgabe mit Vorgang, Dokument, Record oder Profil verknüpfen.
- Fälligkeitsdatum.
- einfaches Erinnerungsdatum oder Reminder-Offset.
- fällig, bald und überfällig sichtbar machen.
- wichtige Dokumente/Records an Schnellzugriff pinnen.
- optional einen externen Link an einer Aufgabe öffnen.

Späterer Milestone:

- komplexe wiederkehrende Aufgaben.
- Kalenderintegration.
- Push über mehrere Geräte.
- Automation aus noch unbestaetigten Modellvorschlaegen; deterministische
  reversible Ableitungen aus bestaetigten Facts gehoeren bereits zum Core.
- externe Freigabe als Notfallzugriff.

Externe Kalenderintegration exportiert spaeter nur bewusst ausgewaehlte,
bestaetigte Agenda-Objekte. Sie benoetigt einen eigenen Consent-, Privacy-,
Security-, Zeitzonen-, Idempotenz-, Konflikt- und Disconnect-Contract; reine
Dokumentdaten werden nicht automatisch exportiert.

## Abgrenzung

- Externe Links und Export liegen in `PILLAR_EXPORT_SHARING_EXTERNAL_ACTIONS.md`.
- Facts, Submission Events und finanzielle Auswertungen liegen in
  `PILLAR_SEARCH_FACTS_INSIGHTS.md`.
- Runtime-Notifications, Audit und Observability bleiben F18.

## Offene Folgefragen

- Heißt der UI-Bereich `Schnellzugriff`, `Wichtig` oder `Notfallmappe`?
- Welche lokalen OS-Benachrichtigungen gehoeren in C3 und welche erst in C5?
- Welche Reminder werden automatisch aus Records vorgeschlagen?
- Welche ruhigen/benachrichtigenden Defaults gelten je Plattform und
  Schutzklasse?

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
