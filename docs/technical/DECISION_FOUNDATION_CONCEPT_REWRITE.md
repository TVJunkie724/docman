---
title: "Decision - Foundation Concept Rewrite"
description: "Entscheidung zum Umgang mit importierten Foundation-Konzepten aus einem anderen Projekt"
tags: [decision, documentation, concepts, source-of-truth, foundation]
lastUpdated: "2026-04-26"
status: "accepted"
---

# Decision - Foundation Concept Rewrite

## Status

Accepted.

## Entscheidung

Die vorhandenen Foundation-Konzepte unter `docs/concepts/CONCEPT_F*.md` stammen aus einem anderen Projekt und sind inhaltlich nicht mehr Source of Truth für DocMan.

Die Konzept-Slots bleiben aber fachlich relevant. DocMan braucht voraussichtlich weiterhin jedes dieser Konzepte, nur zugeschnitten auf dieses Projekt.

Deshalb werden die Konzepte nicht kleinteilig geflickt und nicht als Legacy-Archiv weitergeführt. Sie werden nacheinander DocMan-spezifisch neu geschrieben. Alte, nicht mehr benötigte Dokumente dürfen gelöscht werden, sobald ihr Inhalt durch DocMan-spezifische Planung ersetzt oder ausdrücklich verworfen wurde.

## Regel

- Alte Konzeptinhalte gelten als Legacy-Input, nicht als verbindliche Planung.
- Jedes Konzept wird vor Nutzung neu auf DocMan zugeschnitten.
- Alte Projektnamen, fremde Architekturannahmen und importierte Tooling-Vorgaben werden entfernt.
- Veraltete Dokumente müssen nicht archiviert werden; löschen ist erlaubt, wenn keine aktuelle Source-of-Truth-Funktion mehr besteht.
- Neue Konzepte müssen zu den akzeptierten DocMan-Entscheidungen passen.
- Ein Konzept wird erst nach Rewrite wieder Source of Truth.

## Verbindlicher Kontext für alle Rewrites

- Produktmodell: `Case` / Vorgang, `Event` / Ereignis.
- State Management und DI: Riverpod.
- Datenfluss: local-first mit generischem self-hosted Sync Backend.
- Backend-Rolle: eigener self-hosted Docker-/Compose-Stack als Draft-Zielbild; PocketBase nicht Zielarchitektur.
- MVP: Desktop-Verwaltung plus Mobile Capture.
- Mobile: capture-only im MVP, direkte Vorgangszuordnung nur als Komfortpfad.
- KI/OCR/LLM: nicht im MVP, aber als spätere lokale asynchrone Pipeline mitdenken.
- Cloud-SaaS ist aktuell nicht Teil der Produktplanung.

## Rewrite-Inventar

| Konzept | DocMan-Ziel |
|---|---|
| F1 Project Structure | Neu geschrieben: DocMan App-Struktur, Foundation-Migration, modulare Feature-Zielstruktur |
| F2 State Management | Neu geschrieben: Riverpod-Zielarchitektur für local-first App, Upload-Queue, Draft-Inbox, Sync-Status |
| F3 Coding Conventions | Neu geschrieben: DocMan-spezifische Flutter-/Dart-Konventionen |
| F4 Testing Strategy | Neu geschrieben: Tests für Domain, Riverpod, lokale Persistenz, Desktop/Mobile Capture und später Backend |
| F5 Error Handling | Neu geschrieben: Result-/Failure-Modell, Offline-/Sync-/Upload-Fehler |
| F6 Environment Configuration | Neu geschrieben: Local, Home-Hub, private Server, keine Cloud-SaaS-Annahmen |
| F7 Logging | Neu geschrieben: Lokale App-Logs, Home-Hub-Logs, Privacy-sensible Diagnose |
| F8 Store & Distribution Compliance | Neu geschrieben: private/self-hosted Distribution, spätere Stores |
| F8b Review Access Strategy | Neu geschrieben: Review über synthetische Daten und Fake/Home-Hub-Modi |
| F9 Legal / DSGVO Compliance | Neu geschrieben: Private Dokumente, Self-Hosted-Betrieb, Datenschutz, Exportierbarkeit |
| F10 Local Storage | Neu geschrieben: Local-first Datenbank, Datei-Cache, Queue, Drafts |
| F11 API Integration | Neu geschrieben: DocMan Sync Backend, Capture Gateway, keine fremden API-Generator-Annahmen |
| F12 Secure Storage | Neu geschrieben: Gerätegeheimnisse, Sessions, Pairing, lokale Schlüssel |
| F13 Configuration Pages | Neu geschrieben: Home-Hub-Verbindung, Profile, Storage, spätere Admin-/Setup-Flows |
| F14 Form Field Catalog | Neu geschrieben: DocMan-Formulare für Vorgänge, Dokumente, Profile, Review von Vorschlägen |
| F15 Mock Repository Blueprint | Neu geschrieben: Mocks für UI, Offline-Flows, Capture Gateway und spätere Sync-Fälle |
| F16 CI/CD Pipeline | Neu geschrieben: Flutter Checks, Dokumentationsqualität, später Backend/Compose Checks |
| F17 Mobile Capture Plan | Neu erstellt: MVP-Mobile-Capture, Upload-Queue, Vorgangszuordnung, Capture Gateway, späterer Ausbau |

## Reihenfolge

Empfohlene Rewrite-Reihenfolge:

1. F1 Project Structure.
2. F10 Local Storage.
3. F2 State Management.
4. F5 Error Handling.
5. F11 API Integration.
6. F12 Secure Storage.
7. F4 Testing Strategy.
8. F6 Environment Configuration.
9. F7 Logging.
10. F15 Mock Repository Blueprint.
11. F13 Configuration Pages.
12. F14 Form Field Catalog.
13. F9 Legal / DSGVO Compliance.
14. F16 CI/CD Pipeline.
15. F8 Store & Distribution Compliance.
16. F8b Review Access Strategy.
17. F17 Mobile Capture Plan.

## Konsequenzen

- Bestehende Konzeptdateien dürfen nicht als Umsetzungsgrundlage verwendet werden, bis sie DocMan-spezifisch neu geschrieben wurden.
- Veraltete Legacy-Dokumente dürfen gelöscht werden, statt als Archiv weitergetragen zu werden.
- Neue Implementation-Pläne müssen auf akzeptierte Decision-Dokumente und neu geschriebene Konzepte verweisen.
- Wenn ein altes Konzept einer akzeptierten Decision widerspricht, gilt die Decision.
- Der Rewrite selbst bleibt Dokumentationsarbeit und darf keine App-Code-Änderungen enthalten.

## Offene Folgefragen

- Brauchen Konzepte künftig einen Frontmatter-Status wie `draft`, `accepted`, `legacy`?
- Welche Konzepte sind für R2 Technical Foundation zwingend vorab nötig?
