---
title: "Produkt-Säule - Tasks, Reminders and Quick Access"
description: "Produktbereich fuer Aufgaben, To-dos, Fristen, Erinnerungen, Benachrichtigungsquellen und Schnellzugriff"
tags: [pillar, tasks, reminders, quick-access, deadlines, notifications]
lastUpdated: "2026-07-15"
version: "0.3"
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
- Zusatzversicherung nach SV-Erstattung einreichen.
- Anruf bei Versicherung erledigen.
- Arzttermin fuer ein Kind machen.
- wichtiges Dokument schnell finden.

## Grundmodell

```text
Task
  Nutzeraufgabe oder empfohlener nächster Schritt

Reminder
  zeitbasierter Hinweis auf Task, Record, Claim, Deadline oder Case

QuickAccessItem
  bewusst angepinnter schneller Zugriff auf wichtige Dokumente, Records oder Vorgänge
```

Tasks und Reminders sind fachliche Objekte. Notifications sind nur ein Ausgabekanal.

Mappm bietet eine fokussierte Agenda über Aufgaben, Fristen, Termine, erwartete
Antworten, Gültigkeiten und Reminder. Es ist kein allgemeiner Kalender.

## Task

Eine Aufgabe kann manuell erstellt oder im C2/C3-Kern aus bestaetigten
Workflow-, Fact-, Claim-, Record- oder Core-Assist-Vorschlaegen erzeugt werden.

Mindestfelder:

- Titel.
- Status: `open`, `done`, `dismissed`.
- optionales Fälligkeitsdatum.
- optionales Erinnerungsdatum oder Reminder-Offset.
- Profilbezug.
- optionale Verknüpfung zu Vorgang, Dokument, Record, Claim oder Fact.
- Priorität.
- Quelle: manuell, Workflow, später OCR/LLM-Vorschlag.
- optionale externe Aktionslinks.

## Reminder

Ein Reminder beschreibt, wann Mappm erinnern soll.

```text
Reminder
  dueAt
  remindAt
  channelPreference
  targetType: task / record / case / claim / document
  targetId
```

Notification-Regeln, Redaction und technische Fehler-/Systemhinweise bleiben im querschnittlichen F18-Konzept.

Reminder unterscheiden Datum, Offset und Kanal:

- `quiet`: Agenda, Badge oder In-App-Erinnerung.
- `notifying`: datenschutzsichere lokale oder geräteübergreifende Notification.
- ein oder mehrere Workflow-/Nutzer-Offsets.
- Ruhezeiten und Kanalpräferenz.

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
- automatische Aufgabenerzeugung ohne Review; bestaetigte Vorschlaege gehoeren
  bereits zum Core.
- externe Freigabe als Notfallzugriff.

## Abgrenzung

- Externe Links und Export liegen in `PILLAR_EXPORT_SHARING_EXTERNAL_ACTIONS.md`.
- Facts, Claims und finanzielle Auswertungen liegen in `PILLAR_SEARCH_FACTS_INSIGHTS.md`.
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
