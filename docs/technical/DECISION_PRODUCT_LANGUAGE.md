---
title: "Decision - Product Language"
description: "Entscheidung zu zentralen Fachbegriffen in DocMan: Case, Vorgang, Event, Ereignis"
tags: [decision, product-language, domain-model]
lastUpdated: "2026-04-24"
status: "accepted"
---

# Decision - Product Language

## Status

Accepted.

## Entscheidung

DocMan verwendet künftig diese zentralen Begriffe:

| Ebene | Begriff | Bedeutung |
|---|---|---|
| Code / Domain | `Case` | Langlebiger Container für einen Alltagsvorgang |
| Deutsche UI | Vorgang | Nutzer sichtbarer Name für `Case` |
| Code / Domain | `Event` | Zeitpunkt oder Historieneintrag innerhalb eines `Case` |
| Deutsche UI | Ereignis | Nutzer sichtbarer Name für `Event` |
| Code / Domain | `Document` | Dokument, Datei oder Nachweis |
| Deutsche UI | Dokument | Nutzer sichtbarer Name für `Document` |
| Code / Domain | `Task` | Nächster Schritt oder Aufgabe |
| Deutsche UI | Aufgabe | Nutzer sichtbarer Name für `Task` |

## Begründung

Der bisherige Begriff `Incident` beschreibt technisch zwar einen Container, klingt aber produktlich nach Unfall, Störung oder Support-Ticket. DocMan verwaltet auch harmlose oder laufende Alltagsthemen wie Reisen, Bestellungen, Versicherungen, Schulzettel und Ausweisdokumente. `Incident` ist dafür zu eng und zu dramatisch.

`Event` / "Ereignis" wurde als Hauptmodell geprüft, aber verworfen. Ein Ereignis klingt nach einem punktuellen Zeitpunkt. DocMan braucht jedoch einen langlebigen Container, der Dokumente, Aufgaben, Status, Historie und verwandte Vorgänge zusammenhält.

`Case` ist kurz, international verständlich und passt zu Medizin, Verwaltung, Versicherung, Bestellungen und allgemeinen Vorgängen. In der deutschen UI ist "Vorgang" alltagsnäher und weniger juristisch.

## Modell

```text
Household
  -> Profiles
      -> Cases / Vorgänge
          -> Events / Ereignisse
          -> Documents / Dokumente
          -> Tasks / Aufgaben
          -> Related cases / Verknüpfte Vorgänge
```

## Konsequenzen

- Neue Konzepte und Implementationspläne verwenden `Case` statt `Incident`.
- Deutsche UI-Texte verwenden "Vorgang".
- `Event` bleibt für Timeline, Historie und punktuelle Vorgangsereignisse reserviert.
- Bestehender Code mit `Incident` wird nicht spontan umbenannt. Die Umstellung wird später als eigene Refactoring-Phase geplant.
- Alte Roadmaps mit `Incident`-Sprache wurden entfernt. `Incident` bleibt nur noch als bestehender Code- und Migrationskontext sichtbar.

## Offene Folgefragen

- Wann wird bestehender Code von `Incident*` auf `Case*` migriert?
- Wird die Datenbank-Migration die Umbenennung physisch vollziehen oder zunächst Alias-/Kompatibilitätsschichten nutzen?
- Welche Ereignistypen braucht ein `Case` im MVP?
