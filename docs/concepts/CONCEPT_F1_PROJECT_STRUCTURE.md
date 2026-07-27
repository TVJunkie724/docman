---
title: "Konzept F1 - Projektstruktur"
description: "Verbindliche Mappm-Flutter-Projektstruktur für Clean Architecture, Riverpod, Vault-Provider und getrennte Managed-Cloud-Contracts"
tags: [concept, foundation, project-structure, flutter, clean-architecture, riverpod]
lastUpdated: "2026-07-22"
version: "5.1"
status: "accepted-rebaseline"
owner: "foundation/product"
---

# Konzept F1 - Projektstruktur

## Status und Zweck

Accepted rebaseline. F1 definiert die verbindliche Struktur des Flutter-
Clients. Es ersetzt importierte Feature-first-, Home-Hub- und Self-hosting-
Vorgaben. Die Repository-Wurzel bleibt gemäß
`docs/technical/DECISION_REPOSITORY_LAYOUT.md` ein einzelnes Flutter-Projekt.

Ziel ist eine wartbare, testbare Struktur für Local- und Cloud-Vaults,
Capture/Core Assist, Cases, Records, Suche, Aufgaben und spätere aktivierte
Produkt-Slices. F1 ist kein Dateiverschiebeplan; konkrete Migrationen benötigen
einen freigegebenen Foundation-Implementation-Contract.

## Scope

F1 regelt:

- Repository- und `lib/`-Topologie;
- Abhängigkeitsrichtung zwischen Presentation, Domain und Data;
- Riverpod-Bootstrap und Provider-Zuständigkeit;
- fachliche Slices innerhalb der Layer;
- Client-/Contract-/Backend-Grenzen;
- Test- und Legacy-Struktur;
- Stop Rules für neue Dateien und Migrationen.

Nicht in F1 entschieden werden konkrete Widgets, DTOs, Endpunkte, Drift-
Tabellen, Workflowinhalte, Providerprodukte oder Server-Deploymentdetails.

## Repository-Struktur

```text
docman/
├── lib/
├── test/
├── integration_test/
├── scripts/
├── assets/
├── docs/
├── .codex/
├── frontend.sh
└── pubspec.yaml
```

Ein Backend wird in einem getrennten Repository oder nach neuer akzeptierter
Layout-Entscheidung in einem klar abgegrenzten Service-Verzeichnis geführt. Es
teilt keine Flutter-internen Domainklassen oder Data-Implementierungen.

## Verbindliche `lib/`-Topologie

```text
lib/
├── app/
│   ├── bootstrap/
│   ├── routing/
│   └── app.dart
├── core/
│   ├── clock/
│   ├── errors/
│   ├── ids/
│   ├── logging/
│   ├── result/
│   └── security/
├── domain/
│   ├── entities/
│   ├── repositories/
│   ├── policies/
│   ├── value_objects/
│   └── workflows/
├── data/
│   ├── local/
│   ├── remote/
│   ├── mappers/
│   └── repositories/
├── presentation/
│   ├── providers/
│   ├── screens/
│   ├── theme/
│   ├── utils/
│   └── widgets/
└── main.dart
```

Fachliche Bereiche wie Capture, Cases, Documents, Records, Profiles, Tasks,
Search, Vaults und Assist werden innerhalb der zuständigen Layer durch
eindeutige Unterordner gruppiert. Sie erzeugen keine zweite parallele
`features/<feature>/domain|data|presentation`-Topologie.

## Abhängigkeitsrichtung

```text
Presentation -> Domain <- Data
        App verdrahtet Provider, Routing und Runtime
        Core liefert fachneutrale Querschnittsbausteine
```

Verbindliche Regeln:

- Domain importiert weder Flutter/Riverpod noch Drift, HTTP-, Cloud- oder
  Provider-SDKs.
- Data implementiert Domain-Repositories und mappt externe DTOs/Datensätze in
  Domain-Typen.
- Presentation importiert Domain, aber niemals `lib/data/`.
- Riverpod Provider stellen Domain-Repositories und Feature-State bereit; sie
  rufen keine Drift-, File-Store- oder HTTP-Clients direkt auf.
- `app/` enthält Bootstrap, Routing und Provider-Verdrahtung, keine
  Fachentscheidungen.
- `core/` bleibt fachneutral und darf keine Case-, Dokument-, Profil- oder
  Workflowregeln besitzen.
- Featureübergreifende Abläufe verwenden Domain-Ports, IDs und explizite
  Workflows statt gegenseitiger interner Imports.

## Fachliche Ownership

Die Domain besitzt genau einen generischen `Case`, typisierte `CaseLink`s,
Documents, Records, Managed Subjects, Tasks, Submission Events, Facts und Processing-
Begriffe. Subvorgang ist keine eigene Entität. Dokumente und Records können
über stabile Linkobjekte mehreren Cases zugeordnet werden.

Capture benötigt eigene Domainbegriffe für Session, logische Dokumenteinheit,
Seite/Artefakt, Processing Job, Proposal-Version, Review und Korrektur. Vault-
Autorität, Account/Entitlement und Assist-Job bleiben getrennte Zustände.

## Provider- und Contract-Grenzen

Der Client kennt Domain-Ports für:

- Local- und Cloud-Vault-Repositories;
- File Store und Secure Storage;
- Capture Upload und Processing Jobs;
- Account, Device Trust und Entitlements;
- Export, Restore und Provider-Migration;
- Search, Preview und Notifications.

Mappm Cloud, Local Development Cloud und Microcks erfüllen akzeptierte
Contracts, werden aber nicht in Presentation oder Domain abgebildet. Customer
Home Hub, Tailscale-Pairing und konfigurierbare Self-hosting-URLs besitzen
keinen Zielpfad.

## Desktop und Mobile

Desktop und Mobile verwenden dieselben Domainregeln und Repository-Ports.
Plattformspezifische Scanner-, Dateiauswahl-, Secure-Storage- oder
Notification-Adapter bleiben in Data/Platform-Integration. Mobile Capture ist
kein separates fachliches Datenmodell und darf keine zweite Case-/Document-
Implementierung erzeugen.

Globale Erfassung beginnt in einem sichtbaren, gegebenenfalls vorausgewaehlten
Managed-Subject-Kontext, verlangt aber vor dem Scan kein allgemeines Profil-,
Case- oder Metadatenformular. Optionale bekannte Typ-/Subtyp-/Fact-/Case-
Angaben sind provenienztragende Signale und kein Ersatz fuer Analyse.
Backend/Core Assist liefert editierbare Titel und Zuordnungsvorschlaege;
Presentation zeigt nur die freigegebenen Reviewfolgen.

## Teststruktur

```text
test/
├── core/
├── domain/
├── data/
├── presentation/
├── fixtures/
└── helpers/

integration_test/
└── approved_vertical_flows/
```

Tests spiegeln Ownership, nicht zwingend jede Ordnerstufe. Domain-/Provider-
Tests verwenden deterministische Fakes. Data-Tests nutzen In-Memory-Drift oder
isolierte temporäre Stores. Widgettests verwenden Riverpod Overrides.
Microcks-Tests bleiben getrennte Contract-Consumer-Tests.

## Legacy-Migration

`flutter_bloc`, GetIt, Isar und PocketBase sind Legacy-/Spike-Pfade. Neue
Produktarbeit erweitert sie nicht. Migrationen erfolgen in überprüfbaren
Slices:

1. Zielpfad und Legacy-Grenze sichtbar machen.
2. Domain-Port und Fake etablieren.
3. Riverpod Provider und Ziel-Data-Adapter ergänzen.
4. Verhalten und Datenmigration testen.
5. Legacy-Verbraucher entfernen.
6. Abhängigkeit erst löschen, wenn kein Zielpfad sie mehr benötigt.

Kein Feature-Implementation-Issue darf nebenbei die gesamte Projektstruktur
umbauen.

## Security, Accessibility und Lokalisierung

Projektstruktur selbst besitzt keine sichtbare UI. Sie muss jedoch verhindern,
dass Secrets, Dokumentinhalte, OCR-Text oder Diagnosedaten in ungeschützte
Konfiguration, Logs, Fixtures oder Screenshots gelangen. UI-Slices verwenden
deutsche sichtbare Texte und erfüllen die zuständigen Accessibility-/Design-
System-Konzepte.

## Verification

Ein betroffener Foundation-Plan muss mindestens nachweisen:

- `scripts/bootstrap.sh` funktioniert aus einem frischen Checkout;
- `scripts/codegen.sh` reproduziert generierte Artefakte;
- `scripts/verify.sh` prüft den Zielpfad;
- Importregeln verhindern Presentation-to-Data- und Domain-to-SDK-Leaks;
- neue Zielpfade erzeugen keine BLoC/GetIt/Isar/PocketBase-Abhängigkeit;
- Fake-Repositories lassen Provider- und Widgettests ohne Netzwerk laufen;
- Local-/Cloud-/Assist-Zustände bleiben in Typen und Tests unterscheidbar.

Exakte Befehle, erwartete Ergebnisse und zulässige Legacy-Baseline gehören in
den jeweiligen Phase-Implementation-Contract.

## Stop Rules

Planung oder Implementierung stoppen, wenn:

- eine zweite konkurrierende `lib/`-Topologie eingeführt wird;
- Presentation Data oder Provider-SDKs direkt importiert;
- Domain Flutter, Riverpod, Drift, HTTP oder Cloud-Typen importiert;
- Server-DTOs oder Persistenzmodelle zu Domain-Entitäten werden;
- ein separater Subcase-Typ oder verpflichtender `caseType` entsteht;
- Vault-Autorität, Account, Entitlement und Assist-Status vermischt werden;
- Customer Home Hub, Self-hosting-URL oder QR-Server-Pairing wieder als
  Produktstruktur erscheint;
- Legacy-Code ohne Daten-/Verhaltensnachweis entfernt oder erweitert wird;
- ein UI-/Feature-Issue still eine Repository- oder Backendarchitektur
  entscheidet.

## Handoff

- konkrete Foundation-Migration: `foundation-builder` nach akzeptiertem Plan;
- Storage-/Schema-Vertiefung: `data-architect`;
- API-/OpenAPI-Grenze: `contract-api`;
- UI-Implementation-Plan: `ui-architect`;
- Zielpfad-/CI-/Testgates: `quality-readiness`.

## Enterprise Quality Contract

Dieses Konzept übernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. F1 bleibt für seine
Strukturgrenzen maßgeblich; der gemeinsame Vertrag ergänzt Security, Privacy,
Verification, Stop Rules und Handoff.
