---
title: "Produkt-Säule - Tasks, Reminders and Quick Access"
description: "Produktbereich fuer Aufgaben, To-dos, Fristen, Erinnerungen, Benachrichtigungsquellen und Schnellzugriff"
tags: [pillar, tasks, reminders, quick-access, deadlines, notifications]
lastUpdated: "2026-05-06"
version: "0.1"
status: "proposed"
---

# Produkt-Säule - Tasks, Reminders and Quick Access

## Zweck

DocMan soll nicht nur Dokumente speichern, sondern helfen, nächste Schritte nicht zu vergessen.

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

## Task

Eine Aufgabe kann manuell erstellt oder später aus Workflows, Facts, Claims, Records oder OCR/LLM-Vorschlägen erzeugt werden.

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

Ein Reminder beschreibt, wann DocMan erinnern soll.

```text
Reminder
  dueAt
  remindAt
  channelPreference
  targetType: task / record / case / claim / document
  targetId
```

Notification-Regeln, Redaction und technische Fehler-/Systemhinweise bleiben im querschnittlichen F18-Konzept.

## Quick Access

Mit Notfallzugriff meint DocMan hier Schnellzugriff, nicht automatisch externe Berechtigung.

Schnellzugriff ist eine kuratierte Sicht auf wichtige Dokumente, Records oder Vorgänge:

- Geburtsurkunde.
- Staatsbürgerschaftsnachweis.
- Meldezettel.
- Ausweise.
- Versicherungs-Polizzen.
- wichtige medizinische Unterlagen.
- Schlüsseldokumente fuer Kinder.

## M2-Scope

Schlanker M2-Slice:

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
- automatische OCR/LLM-Aufgabenerzeugung ohne Review.
- externe Freigabe als Notfallzugriff.

## Abgrenzung

- Externe Links und Export liegen in `PILLAR_EXPORT_SHARING_EXTERNAL_ACTIONS.md`.
- Facts, Claims und finanzielle Auswertungen liegen in `PILLAR_SEARCH_FACTS_INSIGHTS.md`.
- Runtime-Notifications, Audit und Observability bleiben F18.

## Offene Folgefragen

- Heißt der UI-Bereich `Schnellzugriff`, `Wichtig` oder `Notfallmappe`?
- Werden lokale OS-Benachrichtigungen schon im R4-M2 umgesetzt?
- Welche Reminder werden automatisch aus Records vorgeschlagen?
