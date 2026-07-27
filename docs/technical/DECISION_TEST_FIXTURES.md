---
title: "Decision - Test Fixtures"
description: "Zentrale synthetische Fixtures für App, Dokumente, OpenAPI und Microcks"
tags: [decision, testing, fixtures, synthetic-data, privacy, contracts, microcks]
lastUpdated: "2026-07-24"
status: "accepted"
owner: "quality-readiness"
---
# Decision - Test Fixtures

## Status

Angenommen. Echte, pseudonymisierte oder nur anonymisiert geglaubte private
Daten sind in Tests, Mocks, Screenshots, OpenAPI-Examples und Microcks-
Artefakten verboten.

## Orte und Ownership

```text
test/fixtures/
  domain/       Cases, Records, Documents, Subjects, Tasks, Submission Events
  files/        synthetische PDF-, Bild- und Scanartefakte
  ui/           Capture-, Processing-, Review-, Vault- und Fehlerzustände

contracts/
  openapi/      versionierte API-Verträge
  examples/     synthetische Request-/Response- und Microcks-Beispiele
```

App-Fixtures gehören Tests und Fakes. Contract-Beispiele gehören dem
API-Vertrag und werden nicht aus Flutter-Modellen zur Source of Truth gemacht.

## Regeln

- Alle Namen, Adressen, Firmen, Identifikatoren, medizinischen Angaben,
  Dokumenttexte, Scans und Bilder sind vollständig erfunden.
- Keine echten Tokens, URLs, Secrets, lokalen Pfade oder Netzwerkadressen.
- Kleine lesbare JSON-/YAML-Fixtures; große Dateien nur für einen belegten
  Testzweck.
- Fixtures erhalten stabile IDs, klare Szenarionamen, erwartete Ergebnisse und
  soweit nötig Version/Locale/Country-Pack.
- Ambiguitaet, niedrige Scanqualitaet, falsches Candidate-Ranking, Mixed Batch,
  mehrere Versicherungen, Vault-Unterschiede, Quota, Retry und Loeschung sind
  explizite Szenarien, nicht zufaellige Datenvariation.
- Intelligence-Fixtures bilden die Zielgrenze kleiner beziehungsweise mittlerer
  General-Purpose-Modelle ab. Fakes duerfen keine semantische
  Falschprofil-/Falsch-Case-/Falschdokument-, Dokumentkohaerenz-,
  Workflow-Zustands-, Frist- oder Beziehungswahrheit erfinden.
- Eine Datei mit semantisch gemischten Seiten bleibt im aktuellen Zielrelease
  ein gueltiges generisches logisches Dokument; technische Scanqualitaet wird
  getrennt und nur als nicht blockierender Hinweis getestet.
- Medizinische und behördliche Beispiele enthalten nur die minimal nötigen
  synthetischen Inhalte.
- Goldens/Screenshots dürfen keine Hostnamen, Benutzernamen oder absolute
  Pfade der Entwicklungsmaschine enthalten.

## Verifikation

CI prüft Schema-/Contract-Gültigkeit, deterministische Ladebarkeit, fehlende
Secrets/absolute Pfade und die Zuordnung kritischer Fixtures zu Tests. OpenAPI-
Beispiele müssen gegen den Vertrag validieren und in Microcks importierbar sein.

F4, F15 und jeder Implementation Contract benennen die benötigten Fixture-
Szenarien. Neue Produktlogik darf keine privaten Daten als vermeintlich
realistischere Testgrundlage einführen.
