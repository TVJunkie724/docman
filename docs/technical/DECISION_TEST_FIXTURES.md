---
title: "Decision - Test Fixtures"
description: "Entscheidung zu synthetischen Testfixtures, Dokumentfixtures und API-/Microcks-Beispieldaten"
tags: [decision, testing, fixtures, synthetic-data, privacy, contracts, microcks]
lastUpdated: "2026-05-06"
status: "accepted"
---

# Decision - Test Fixtures

## Status

Accepted.

## Entscheidung

DocMan verwendet zentrale, synthetische App-Testfixtures unter `test/fixtures/`.

API-/Microcks-Beispiele gehoeren zu den API-Vertraegen unter `contracts/`, nicht in die App-Testfixtures.

Echte private Daten und anonymisierte private Daten sind fuer Tests, Mock-UIs, OpenAPI-Examples und Microcks-Artefakte verboten. DocMan verwendet frei erfundene, aber realistische Beispiele.

## Zielstruktur

```text
test/
  fixtures/
    domain/
      cases.json
      documents.json
      draft_inbox.json
      upload_queue.json
    files/
      pdf/
      images/
      scans/
    ui/
      mobile_capture_states.json

contracts/
  openapi/
    home-hub-health.openapi.yaml
    home-hub-pairing.openapi.yaml
    mobile-capture-upload.openapi.yaml
    draft-inbox.openapi.yaml
  examples/
    pairing.examples.yaml
    mobile-capture-upload.examples.yaml
```

## Regeln

- Keine echten Namen.
- Keine echten Adressen.
- Keine echten Arztbriefe, Rechnungen, Vertraege, Amtsdokumente oder Haushaltsunterlagen.
- Keine echten Screenshots, Scans, Fotos oder Datei-Inhalte.
- Keine echten Tokens, Secrets, lokalen Pfade oder Netzwerkadressen.
- Keine anonymisierten privaten Daten; nur vollstaendig synthetische Daten.
- Kleine, lesbare JSON/YAML-Fixtures bevorzugen.
- Grosse PDF-/Scan-Fixtures nur verwenden, wenn ein Test sie wirklich braucht.
- API-Beispiele muessen zu OpenAPI/Microcks passen und in `contracts/` liegen.
- App-Fixtures duerfen API-Vertraege referenzieren, aber nicht zur Contract Source of Truth werden.

## Beispiel-Domänen

Erlaubte synthetische Beispieldaten:

- Laborbefund ohne echte medizinische Details.
- Mietnachtrag ohne echte Adresse.
- Reiseunterlage mit frei erfundenen Orten und Buchungsnummern.
- Versicherungsbrief mit synthetischer Polizzennummer.
- Formular mit generischen Feldern.
- Kassenbeleg mit frei erfundenem Geschaeft und Betrag.

## Testschichten

| Ebene | Fixture-Ort |
|---|---|
| Domain / Riverpod / Widget Tests | `test/fixtures/domain/`, `test/fixtures/ui/` |
| Datei-/Scan-nahe Tests | `test/fixtures/files/` |
| OpenAPI Contract Examples | `contracts/examples/` |
| Microcks Import Artifacts | `contracts/openapi/` und `contracts/examples/` |

## Konsequenzen

- R3-D2 ist entschieden.
- F4 Testing Strategy nutzt `test/fixtures/` als App-Fixture-Root.
- F15 Mock Repository Blueprint verweist auf dieselbe synthetische Fixture-Regel.
- R3 kann ein kleines initiales Fixture-Set anlegen, ohne echte Daten zu riskieren.
- Microcks/OpenAPI-Beispiele werden zusammen mit Contracts gepflegt.

## Nicht entschieden

- genaue Dateinamen fuer alle spaeteren Fixture-Sets.
- ob Fixtures als JSON oder YAML starten.
- welche synthetischen PDF-/Scan-Dateien zuerst erzeugt werden.
