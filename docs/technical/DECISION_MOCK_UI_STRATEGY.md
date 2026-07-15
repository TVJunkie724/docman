---
title: "Decision - Mock UI Strategy"
description: "Entscheidung zum Umgang mit Legacy-App, UI-Spikes, Mock-Screens, Fake-Repositories und Contract-Mocks"
tags: [decision, mocks, ui, fakes, testing, legacy, riverpod]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "ui-concept/quality-readiness"
---
# Decision - Mock UI Strategy

## Status

Accepted.

## Entscheidung

Mappm verwendet Mock-UI nur als kontrollierte Konzeptvalidierung, nicht als zweiten Produktpfad.

Die bestehende App bleibt vorerst als Legacy-Referenz erhalten. Sie darf fuer Designgefuehl, fachliche Ideen und bestehende Flow-Ansichten gelesen werden, wird aber nicht als Zielarchitektur weiterentwickelt.

Neue UI-Mocks entstehen isoliert in einem klar markierten Mock-Bereich und verwenden synthetische Daten. Wenn ein Mock fachlich ueberzeugt, wird daraus ein freigegebener UI-Implementation-Plan und Phase-Handoff. Der Mock selbst wird nicht heimlich zur Produktimplementierung.

## Begriffe

| Begriff | Bedeutung |
|---|---|
| Legacy-Referenz | bestehende Spike-App, nur zum Nachschauen von Ideen, Design und Fachannahmen |
| UI-Mock | isolierter Screen oder Flow zur visuellen und interaktiven Konzeptpruefung |
| Fake Repository | Test-/Dev-Implementierung eines echten Domain-Repository-Vertrags |
| Contract-Mock | externer API-Mock, z. B. Microcks, fuer Cloud-Identity-, Vault-, Capture-, Sync- und Migrationsvertraege |
| Produktpfad | echte App-Screens und Provider, die ausschließlich aus einem freigegebenen Plan entstehen |

## Regeln

- Legacy-Code darf nicht als Architekturvorlage fuer neue Mocks dienen.
- Neue Mocks duerfen keine BLoC-, GetIt-, Isar- oder PocketBase-Flaeche erweitern.
- Mocks duerfen keine echte Datenbank, kein Dateisystem, keine Mappm/Development Cloud, keine API und keine privaten Dokumente verwenden.
- Mock-Daten sind synthetisch, lokal und klar als Mock erkennbar.
- Mocks liegen getrennt von Produkt-Screens, bevorzugt unter `lib/presentation/screens/mocks/` oder einem spaeter definierten Feature-Mock-Bereich.
- Mocks sind nur ueber einen eigenen Mock-Katalog-Entry-Point erreichbar, nicht ueber die normale Produktnavigation.
- Der geplante Entry Point ist `lib/main_mock_catalog.dart`; ein Script wie `scripts/run_mocks.sh` darf diesen Start vereinfachen.
- Ein Mock darf lokale Widget-State-Mechanik fuer reine Interaktion nutzen.
- Interaktive Mocks starten als Stufe-2-Mocks: klickbare Flutter-only Flows ohne Repository, Backend, Drift, Microcks oder Cloud-Service.
- Mocks verwenden die aktuelle Theme-/Widget-Basis der App, duerfen Layout und Flow aber frei verbessern.
- Sobald ein Mock als Feature weitergebaut wird, braucht er einen Implementation-Plan mit Riverpod, Domain-Vertraegen, Tests und klarer Definition of Done.
- Im Produktpfad duerfen keine sichtbaren Mock-Daten erscheinen.

## Zielbild

```text
Legacy-App
  -> lesen als Referenz
  -> nicht weiter ausbauen

Mock-UI
  -> Konzept pruefen
  -> synthetische Daten
  -> isolierter Bereich

Feature-Plan
  -> Riverpod Provider
  -> Domain Repository Contracts
  -> Fake Repository fuer Tests
  -> echte Data-Implementierung spaeter austauschbar

Contract-Mock
  -> OpenAPI / Microcks
  -> prueft Identity-, Vault-, Capture-, Sync- und Migrationsvertraege
```

## Erste Mock-Baseline

Der erste Mock-Flow ist:

```text
Mobile Capture
  -> Upload-Queue
  -> asynchrone Processing-/Review-Inbox
  -> Backend-/Assist-Titel und bestes Case-/Record-Matching pruefen
  -> bestaetigen oder gezielt korrigieren
```

Der Mock soll beantworten, ob globales Mobile Capture, optionales
`Neuen Vorgang starten`, Warte-/Fehlerzustand und kompakter Ergebnisreview ohne
Metadatenformular verstaendlich sind. Konkrete finale UI bleibt offen.

## Synthetische Daten

Mock-Daten sollen realistisch, aber harmlos sein:

- keine echten Namen.
- keine echten Adressen.
- keine echten Arztbriefe, Rechnungen, Vertraege oder Amtsdokumente.
- keine echten Datei-Inhalte oder Screenshots.
- plausible, frei erfundene Haushalts-, Vorgangs-, Upload- und Dokumentbeispiele.

## Uebergang zum Feature

Ein Mock wird erst dann Feature-Arbeit, wenn er reviewed und akzeptiert wurde.

Der Uebergang erfolgt ueber:

- UI-/Feature-Plan.
- Domain-Interfaces.
- Riverpod-Provider.
- Fake-Repositories fuer Tests.
- spaetere echte Data-/Backend-Implementierung.

Nicht blind uebernommen werden:

- hardcoded Mock-Daten.
- Mock-State.
- Demo-Navigation.
- vereinfachte Fehlerlogik.
- visuelle Abkuerzungen, die im Produktpfad nicht robust sind.

## Konsequenzen

- Mock-UI wird isoliert, nicht entfernt und nicht mit dem Produktpfad vermischt.
- F15 beschreibt nicht nur Test-Fakes, sondern auch die Grenze fuer UI-Konzeptmocks.
- Die alte App kann waehrend des Rebuilds als Design-/Fachreferenz bleiben, muss aber klar vom Zielpfad getrennt sein.
- Mock-Screens sind wertvoll, solange sie Entscheidungen beschleunigen und spaeter sauber in Feature-Arbeit ueberfuehrt oder geloescht werden.

## Nicht entschieden

- Der genaue finale Ordner fuer Feature-nahe Mocks nach der F1-Zielstruktur.
- Ob es einen globalen Dev-Fake-Modus in der App gibt oder nur test-/mock-spezifische Provider Overrides.
