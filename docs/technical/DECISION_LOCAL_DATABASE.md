---
title: "Decision - Local Database"
description: "Entscheidung zu SQLite und Drift für Local Authority sowie Cloud Cache und Pending State"
tags: [decision, local-storage, database, mobile, desktop, drift, sqlite, vault]
lastUpdated: "2026-07-22"
status: "accepted"
owner: "data-architect"
---
# Decision - Local Database

## Status

Angenommen. Mappm verwendet **SQLite mit Drift** für strukturierte lokale
Daten auf Mobile und Desktop.

## Authority

- Im **Local Vault** ist die lokale Datenbank autoritativ für strukturierte
  Produktdaten.
- Im **Cloud Vault** enthält sie nur policy-begrenzten Cache, Pending
  Operations und den für Offline-Verhalten erforderlichen Zustand. Sie darf
  keine lokale Vollständigkeit behaupten, die nicht belegt ist.
- Die Vault-Authority wird über Repository- und Provider-Wiring gewählt; sie
  darf nicht als UI- oder Drift-Sonderfall durchsickern.

## Scope

SQLite/Drift speichert unter anderem:

- Cases, Records, Dokumentmetadaten und typisierte Beziehungen;
- Managed Subjects, externe Akteure, Facts, wiederholbare Submission Events,
  Aufgaben und Termine; keine Claim-Tabelle;
- Capture-Manifeste, Seiten, logische Dokumentgrenzen, Upload- und
  Processing-Status;
- Vorschläge, Konfidenz, Provenienz, Review und Korrekturen;
- lokale IDs, Remote-Referenzen, Revisionen, Queue-State und Tombstones;
- lokalen Suchindex gemäß der Search-Entscheidung.

Originaldateien, Scans, PDFs, Vorschaubilder und andere große Binärdaten liegen
nicht als BLOBs in SQLite. Secrets, Session-/Device-Tokens und Recovery-Material
liegen ausschließlich in Secure Storage.

## Architekturgrenze

```text
Presentation
  -> Riverpod Feature State
    -> Domain Repository Interfaces
      -> Data Repositories
        -> Drift / SQLite
```

Drift-Typen, Tabellen und DAOs bleiben im Data Layer. Domain und Presentation
verwenden stabile Produktmodelle und Repository-Interfaces. Fakes und
Contract-Adapter implementieren dieselben Interfaces; Provider Overrides
wählen die konkrete Strategie.

## Schema- und Migrationsregeln

- Produktentitäten erhalten stabile, providerunabhängige IDs.
- Sync-fähige Tabellen führen mindestens Erstellungs-, Änderungs-,
  Versions- und Löschinformationen, soweit ihr Contract dies erfordert.
- Flexible, providernahe Rohdaten dürfen gezielt in versionierten JSON-Spalten
  liegen; stabile fachliche Felder werden explizit modelliert.
- Zeitwerte folgen `DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`: technische
  Zeitstempel bleiben von fachlichen Zeit-Facts, Ereignissen, Terminen,
  Fristen, Aufgaben, erwarteten Antworten und Remindern getrennt.
  Date-only-/Teilgenauigkeits-/Intervall-/Zeitzonenwerte, Provenienz,
  Vorschlagsstatus und Korrekturhistorie duerfen durch Persistenz oder Sync
  nicht verloren gehen.
- Migrationen sind vorwärts und rückwärts gegen unterstützte Upgrade-Pfade zu
  testen; fehlgeschlagene Migrationen dürfen Originaldaten nicht zerstören.
- Isar- und PocketBase-Spike-Modelle sind keine Zielarchitektur. Ihre Ablösung
  erfolgt kontrolliert und ohne ihre Typen in neue Domain-Verträge zu tragen.

## Suche

Drift-Abfragen decken strukturierte Filter ab. SQLite FTS5 ist der lokale
Volltextindex für bestätigte Metadaten und, sobald C2/C3 dies freigibt, für
lokal verfügbare OCR-Texte. Der Index ist rebuildbar und keine eigene Authority.

## Verifikation

Jeder Implementierungsslice mit Persistenz weist mindestens nach:

- Repository- und Providergrenzen ohne Drift-Leakage;
- Local- und Cloud-Vault-Semantik;
- Migration, Rollback-/Recovery-Verhalten und Datenintegrität;
- Queue-, Restart-, Partial-Failure- und Tombstone-Verhalten;
- sichere Trennung von Dateien, strukturierten Daten und Secrets;
- deterministische Fake- und Datenbanktests ohne private Echtdaten.

Die konkrete erste Tabellenmenge gehört in den freigegebenen C1/C2-
Implementation-Contract und wird nicht in dieser Technologieentscheidung
vorweggenommen.
