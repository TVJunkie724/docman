---
title: "Konzept F1 - Project Structure"
description: "Mappm-Projektstruktur fuer Flutter Clients, Vault-Provider, Managed Cloud, lokale Development Cloud und Clean Architecture"
tags: [concept, foundation, project-structure, flutter, clean-architecture, riverpod, local-first]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F1 - Project Structure

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Vault/Cloud Rebaseline

The target structure supports Local-authoritative and Cloud-authoritative Vault
providers. Customer Home Hub/self-hosting paths are superseded. Backend runtime
lives behind OpenAPI/Domain ports and is developed through a separate managed
Cloud backend plus Local Development Cloud; Flutter Presentation never imports
provider SDKs or server DTOs.

Dieses Konzept ersetzt den importierten F1-Inhalt aus dem alten Projekt. Der alte Inhalt ist nicht mehr Source of Truth für DocMan.

## Legacy Detail Baseline (non-normative)

The remaining imported detail is retained only for migration context and useful
feature-specific examples. It must not authorize Home Hub, Tailscale, customer
self-hosting, universal local-first authority, old milestone scope or QR server
pairing. Where it differs, the rebaseline above,
`DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`,
`DECISION_COMMERCIAL_CORE_SCOPE.md` and F36 are authoritative. Before this
concept is used for implementation, its affected detail must be rewritten into
the phase's approved implementation contract.

## Zweck

F1 definiert, wie DocMan als Flutter-Projekt strukturiert werden soll, damit die App vom aktuellen Spike zu einer wartbaren, local-first, self-hosted-fähigen Produktbasis wachsen kann.

Die Struktur muss vier Dinge gleichzeitig ermöglichen:

- einen kleinen, realen M2 mit Desktop-Verwaltung plus Mobile Capture
- saubere Clean-Architecture-Grenzen
- Riverpod als State Management und Dependency Injection
- späteren Ausbau zu Home Hub, Sync, OCR und lokalen LLM-Pipelines

## Verbindliche Entscheidungen

Dieses Konzept baut auf diesen Entscheidungen auf:

- Produktmodell: `Case` / Vorgang, `Event` / Ereignis.
- State Management und DI: Riverpod.
- Datenfluss: local-first mit generischem self-hosted Sync Backend.
- Backend-Rolle: eigener self-hosted Docker-/Compose-Stack als Draft-Zielbild; PocketBase nicht Zielarchitektur.
- M2: Desktop-Verwaltung plus Mobile Capture mit minimalem Home-Hub-Eingangskorb.
- Mobile im M2: capture-only, optionale Vorgangszuordnung als Komfortpfad.
- Kernmodell: Vorgänge bleiben `Case`; Dokumente, Records/Nachweise, Versionen und strukturierte Fakten werden als eigene Konzepte vorbereitet.
- Alte Foundation-Konzepte werden DocMan-spezifisch neu geschrieben.
- Mock-UI: Legacy-App nur als Referenz; neue Mocks isoliert und nicht im Produktpfad.
- Legacy-Readiness: nur der Zielpfad ist production-readiness-relevant; alter Spike-Code wird eingefroren, isoliert oder gelöscht.

## Grundprinzip

DocMan soll nicht um Screens herum wachsen, sondern um fachliche Verantwortungen.

Die Struktur trennt deshalb:

- Produktdomäne: Vorgänge, Dokumente, Records/Nachweise, strukturierte Fakten, Profile, Aufgaben, Ereignisse.
- App-Infrastruktur: Config, Fehler, Logging, Routing, Security.
- Lokale Datenhaltung: lokale DB, Datei-Cache, Upload-Queue.
- Remote-Anbindung: Capture Gateway, später Sync Backend.
- Darstellung: Desktop- und Mobile-UI als Clients derselben fachlichen Regeln.

## Aktueller Stand

Der aktuelle Code verwendet eine Layer-First-Struktur:

```text
lib/
  data/
  domain/
  presentation/
```

Das ist für einen Spike akzeptabel, aber langfristig zu grob. Wenn DocMan Desktop, Mobile Capture, lokale Persistenz, Upload-Queue, Sync-Status und spätere Intelligence-Flows bekommt, werden reine Großordner schnell unübersichtlich.

## Zielstruktur

Die Zielstruktur ist eine modulare Feature-Struktur mit gemeinsamen Foundation-Bereichen.

```text
lib/
  app/
    app.dart
    bootstrap/
    routing/

  core/
    config/
    errors/
    logging/
    result/
    security/
    sync/
    time/
    ui/

  features/
    cases/
    documents/
    records/
    facts/
    profiles/
    tasks/
    events/
    draft_inbox/
    mobile_capture/
    home_hub/
    search/
    insights/
    settings/

  shared/
    domain/
    testing/
```

Diese Zielstruktur ist eine Planungsrichtung, kein sofortiger Big-Bang-Refactor.

## App Layer

`app/` enthält den Startpunkt der Anwendung und das verbindende App-Gerüst.

```text
app/
  app.dart
  bootstrap/
  routing/
```

In `app/` gehören:

- ProviderScope und App-Bootstrap.
- App-weites Routing.
- Startkonfiguration.
- Plattform- und Runtime-Initialisierung.

Nicht in `app/` gehören:

- Feature-spezifische Businesslogik.
- direkte lokale DB- oder Backend-Zugriffe.
- konkrete Case-, Document- oder Capture-Regeln.

## Core Layer

`core/` enthält geteilte Infrastruktur, aber keine DocMan-Fachlogik.

```text
core/
  config/
  errors/
  logging/
  result/
  security/
  sync/
  time/
  ui/
```

### Core-Regeln

- `core/` darf von Features verwendet werden.
- `core/` darf keine Features importieren.
- `core/` enthält keine konkreten Vorgangs-, Dokument- oder Profilregeln.
- Geteilte UI-Primitives dürfen in `core/ui/` liegen.
- Fachliche UI-Komponenten bleiben im jeweiligen Feature.

## Feature-Struktur

Jedes Feature folgt derselben Grundform:

```text
features/<feature>/
  domain/
  application/
  data/
  presentation/
```

### `domain/`

Enthält fachliche Typen, Regeln und Repository-Verträge des Features.

```text
domain/
  entities/
  value_objects/
  repositories/
  policies/
```

Domain darf nicht importieren:

- Flutter UI.
- Riverpod.
- lokale DB-SDKs.
- Backend-SDKs.
- HTTP-Clients.

### `application/`

Enthält App-spezifische Use Cases und Feature-Orchestrierung.

```text
application/
  services/
  commands/
  queries/
```

Application darf Domain nutzen und fachliche Abläufe koordinieren. Sie bleibt frei von Widget-Code.

### `data/`

Enthält Implementierungen für lokale Speicherung, Remote-Zugriff, DTOs und Mapper.

```text
data/
  local/
  remote/
  mappers/
  repositories/
```

Data darf SDKs und Infrastruktur kennen. Data übersetzt aber immer in DocMan-Domain-Typen.

### `presentation/`

Enthält Screens, Widgets und Riverpod Provider/Notifier des Features.

```text
presentation/
  providers/
  screens/
  widgets/
```

Presentation darf Domain- und Application-Schichten nutzen, aber nicht direkt lokale DBs oder Remote-SDKs ansprechen.

## M2-Features

Für den M2 sind diese Feature-Bereiche zentral:

| Feature | Verantwortung |
|---|---|
| `cases/` | Vorgänge erstellen, bearbeiten, schließen, anzeigen |
| `documents/` | Dokument-Metadaten, Datei-Referenzen, Dokumentstatus |
| `draft_inbox/` | ungeprüfte Dokumente, mobile Uploads, Zuordnung zu Vorgängen |
| `tasks/` | Aufgabenübersicht, Fälligkeiten, einfache Reminder-Daten |
| `quick_access/` | angepinnte wichtige Dokumente, Records und Vorgänge |
| `mobile_capture/` | capture-only Flow, lokale Upload-Queue, optionale Vorgangszuordnung |
| `profiles/` | betroffene Person, einfache Haushalts-/Profilzuordnung |
| `home_hub/` | minimaler Capture-Upload, Verbindung, Health, Pairing als späteres Detail |
| `search/` | lokale Suche und Filter für M2-Daten |
| `settings/` | lokale Einstellungen, Home-Hub-Verbindung, Diagnose |

## Spätere Features

Diese Bereiche werden vorbereitet, aber nicht im M2 vollständig gebaut:

| Feature | Zeitpunkt |
|---|---|
| `sync/` | nach M2, wenn echter Multi-Geräte-Sync geplant wird |
| `family_access/` | nach stabilen Profilen und Sync |
| `reminders/` | wenn wiederkehrende Reminder, OS-/Push-Benachrichtigungen oder Kalenderintegration ausgebaut werden |
| `intelligence/` | nach stabiler Dokumentbasis und Home-Hub-Pipeline |
| `admin/` | wenn Home-Hub-Setup und Wartung UI brauchen |
| `audit/` | wenn Änderungsverlauf und Compliance wichtiger werden |

## Mobile Capture als Feature

Mobile Capture ist ein eigenes Feature, weil es eigene Zustände und eigene Fehlerfälle hat:

- Kamera-/Datei-Erfassung.
- lokale Upload-Queue.
- Retry-Status.
- optional gecachte Liste offener Vorgänge.
- Upload an Home Hub.
- Fallback in Draft-Inbox.

Mobile Capture darf nicht zur vollständigen mobilen Vorgangsverwaltung anwachsen. Wenn Mobile später mehr kann, wird das über ein eigenes Mobile-Konzept erweitert.

## Home Hub als Feature-Grenze

Der M2 braucht einen minimalen Home-Hub-Anteil, aber noch kein vollständiges Sync Backend.

`home_hub/` beschreibt deshalb in der Flutter App nur:

- Verbindung zum privaten Backend.
- Health-/Reachability-Status.
- Capture-Upload.
- Upload-Status.
- spätere Pairing-/Login-Flows.

Tailscale ist keine Feature-Grenze. Die App kennt nur Backend-Adresse, Auth-/Pairing-Zustand und Fähigkeiten.

## Shared Domain

`shared/domain/` ist sparsam zu verwenden.

Dort dürfen nur Konzepte liegen, die wirklich mehrere Features fachlich teilen, zum Beispiel:

- IDs.
- Zeitstempel.
- leichte Basistypen für Audit/Sync-Metadaten.
- gemeinsame Failure- oder Result-Typen, sofern F5 das bestätigt.

Nicht nach `shared/domain/` gehören:

- `Case`, nur weil mehrere Features darauf verweisen.
- `Document`, nur weil Mobile Capture Dokumente erzeugt.
- bequeme Ablage für unklare Typen.

Wenn ein Typ eine klare fachliche Heimat hat, bleibt er im Feature.

## Import-Regeln

Grundregel:

```text
presentation -> application -> domain
data -> domain
app/core -> darf Features verdrahten, aber keine Fachlogik besitzen
```

Erlaubt:

- Feature Presentation importiert Feature Application und Domain.
- Feature Application importiert Feature Domain.
- Feature Data implementiert Feature Domain-Repositories.
- Features importieren `core/`.
- App-Bootstrap verdrahtet Provider und Routing.

Nicht erlaubt:

- Domain importiert Flutter, Riverpod, lokale DB oder Backend-SDKs.
- Presentation importiert direkt Data.
- Feature A importiert willkürlich intern Feature B.
- PocketBase-, Home-Hub- oder Tailscale-Begriffe leaken in Domain-Kontrakte.

## Feature-übergreifende Zusammenarbeit

Manche M2-Flows berühren mehrere Features. Beispiel:

```text
Mobile Capture
  -> erzeugt Upload
  -> Home Hub nimmt Upload an
  -> Draft Inbox zeigt Upload
  -> Document wird geprüft
  -> Case wird optional zugeordnet
```

Solche Flows werden nicht durch direkte Feature-Verflechtung gelöst. Stattdessen werden gemeinsame fachliche Verträge bewusst definiert:

- IDs und Referenzen.
- Repository-Verträge.
- Application-Services.
- Event-/Statusmodelle.

Wenn zwei Features stark gekoppelt wirken, muss die Grenze überprüft werden, statt heimlich Imports zu stapeln.

## Migration vom aktuellen Spike

Die Umstellung erfolgt nicht als Big-Bang.

Die bestehende App bleibt waehrend des Rebuilds als Legacy-Referenz erhalten. Sie darf fuer Designgefuehl, fachliche Begriffe und alte Flow-Ideen herangezogen werden. Neue Arbeit entsteht aber in der Zielstruktur oder in einem klar isolierten Mock-Bereich.

Legacy-Code selbst ist kein Production-Readiness-Ziel. Er wird nicht enterprise-grade gemacht, nicht mit neuen Tests nachgerüstet und nicht durch BLoC/GetIt/Isar/PocketBase-Modernisierung verlängert. Sobald fachliche oder visuelle Erkenntnisse übertragen sind, darf alter Code gelöscht oder aus dem aktiven Produktpfad verschoben werden.

Empfohlene Reihenfolge:

1. Bestehende Mock- und Spike-Pfade markieren und vom Produktpfad trennen.
2. Neue Zielstruktur für neue Arbeit festlegen.
3. Domain-Begriffe von `Incident` auf `Case` planen.
4. Riverpod-Bootstrap vorbereiten.
5. Lokale Persistenz- und Repository-Grenzen nach F10/F2/F5 ausrichten.
6. M2-Features im Zielpfad neu aufbauen und nur gezielt fachliche/visuelle Details aus Legacy übernehmen.
7. Alte BLoC/GetIt/Isar/PocketBase-Pfade entfernen, sobald keine Zielpfade mehr davon abhängen.

## Dokumentationsregel

Dieses Konzept ist noch kein Implementation-Plan.

Implementation-Pläne müssen später konkretisieren:

- welche Dateien verschoben oder neu angelegt werden
- welche Migrationsreihenfolge sicher ist
- welche Tests vor und nach jedem Schritt laufen
- welche alten Spike-Pfade gelöscht, isoliert oder ersetzt werden
- welche Mock-Screens reine Konzeptvalidierung bleiben und welche in Feature-Arbeit ueberfuehrt werden

## Definition of Done für F1

F1 gilt als umgesetzt, wenn:

- neue Planung die Zielstruktur verwendet
- alte Layer-First-Struktur nicht mehr als Zielarchitektur gilt
- Domain-Grenzen frei von Backend-SDK-Typen sind
- Presentation nicht direkt Data importiert
- Riverpod als Verdrahtungsmodell vorgesehen ist
- Mobile Capture, Draft-Inbox und Home Hub als eigene Verantwortungen sichtbar sind
- spätere Sync- und Intelligence-Erweiterung strukturell Platz haben

## Offene Folgefragen

- Wird die Migration in-place erfolgen oder über neue Feature-Ordner parallel zum bestehenden Spike?
- Welche Features müssen vor R3 tatsächlich physisch existieren?
- Wie wird der Flutter-Code später für Desktop und Mobile geteilt?
- Wird `sync/` ein eigenes Feature oder Teil von `home_hub/`, sobald vollständiger Sync geplant wird?
- Welche Struktur bekommt der spätere Server-Stack außerhalb von `lib/`?

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
