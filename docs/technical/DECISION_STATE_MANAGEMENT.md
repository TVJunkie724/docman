---
title: "Decision - State Management and Dependency Injection"
description: "Entscheidung zu Riverpod als Zielarchitektur für State Management und Dependency Injection in DocMan"
tags: [decision, architecture, riverpod, state-management, dependency-injection]
lastUpdated: "2026-04-24"
status: "accepted"
---

# Decision - State Management and Dependency Injection

## Status

Accepted.

## Entscheidung

DocMan verwendet künftig Riverpod als gemeinsames System für State Management und Dependency Injection.

`flutter_bloc` und GetIt werden nicht weiter als Zielarchitektur ausgebaut. Bestehender BLoC/GetIt-Code gilt als Spike-/Legacy-Code und wird in einer geplanten Foundation-Phase migriert oder ersetzt.

## Begründung

DocMan ist stark local-first und reaktiv geprägt:

- aktive Haushalte und Profile
- lokale Case-Streams
- Draft-Dokumente
- Such- und Filterzustände
- Sync-Status
- Upload-Queues
- Auth-/Session-Status
- abgeleitete Dashboard-Views

Riverpod passt gut zu diesen Anforderungen, weil State Management und Dependency Injection in einem testbaren Modell zusammenliegen. Lokale Datenbank-Streams, abgeleitete Zustände und Repository-Overrides in Tests lassen sich damit klarer modellieren als mit vielen BLoCs plus manuellen Subscriptions und zusätzlichem GetIt-Service-Locator.

Die Entscheidung ist nicht, dass BLoC schlecht ist. Die Entscheidung ist, dass DocMan bei einem geplanten Rebuild von Anfang an ein konsistentes, reaktives und local-first-freundliches Modell braucht.

## Zielregeln

- Riverpod ist das einzige State-Management- und DI-System.
- Kein Mischbetrieb aus BLoC und Riverpod in neuer Zielarchitektur.
- Kein GetIt in neuer Zielarchitektur.
- Repository- und Service-Abhängigkeiten werden über Riverpod Provider bereitgestellt.
- Feature-State wird über Riverpod Notifier/AsyncNotifier/StreamProvider modelliert.
- Widgets lesen State über Consumer-Patterns.
- Lokaler Widget-State bleibt in Flutter-Mechanismen, wenn er rein visuell ist, z.B. Animationen, Controller oder fokussierte Eingabefelder.

## Konsequenzen

- Neue Konzepte und Implementation-Pläne verwenden Riverpod.
- Projektlokale Codex-Skills müssen Riverpod als Zielarchitektur reflektieren.
- Bestehende BLoC-Dateien werden nicht ad hoc gelöscht, sondern in einer Foundation-Migration geplant.
- `flutter_bloc` und `get_it` werden erst entfernt, wenn keine produktiven Zielpfade mehr davon abhängen.
- Tests nutzen Provider-Overrides und testen bevorzugt Repository-Provider sowie echte Notifier-Logik.

## Migration Scope

Die Migration gehört in die Technical Foundation und darf nicht nebenbei während Feature-Arbeit passieren.

Zu planen:

- App root mit `ProviderScope`.
- Ablösung von `injection.dart`.
- Auth-State als Riverpod State.
- Case-/Document-Streams als Riverpod Provider.
- Repository-Provider für local-first Datenzugriff.
- Test-Helpers für ProviderScope/Overrides.
- Entfernen oder Isolieren alter BLoC/GetIt-Pfade.

## Offene Folgefragen

- Welche Riverpod-Version und Codegen-Konvention wird verwendet?
- Wird die Zielstruktur sofort feature-first oder zunächst layer-first mit Riverpod?
- Welche bestehende BLoC-Logik kann übernommen werden, und welche wird verworfen?
- In welcher Reihenfolge werden Auth, Cases und Documents migriert?
