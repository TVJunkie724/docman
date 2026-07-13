---
title: "Decision - Milestone Quality Gates"
description: "Entscheidung zu verpflichtenden lokalen, R3- und Milestone-Quality-Gates fuer DocMan"
tags: [decision, quality-gates, r3, milestones, testing, ci, production-readiness]
lastUpdated: "2026-07-12"
status: "accepted"
---

# Decision - Milestone Quality Gates

## 2026 Commercial-Core Rebaseline

Quality gates apply to C0-C7. Replace Home-Hub boundaries with Mappm Cloud and
Local Development Cloud; add Local/Cloud authority, migration, entitlement,
cancellation, restore, environment separation and release-operation evidence.

## Status

Accepted.

## Entscheidung

DocMan verwendet gestufte Quality Gates:

1. **Local Change Gate** fuer jede konkrete Aenderung.
2. **R3 Foundation Gate** fuer den Abschluss der Quality-&-Production-Readiness-Phase.
3. **M2 Readiness Gate** fuer den Start echter Produkt-Slice-Arbeit und den Abschluss des Capture-and-Review-Kerns.

Die Gates sollen neue Arbeit sauber halten und verhindern, dass Legacy-Schuld in den Zielpfad leckt. Sie duerfen Legacy-Probleme nicht verstecken, aber sie muessen realistisch genug sein, um den alten Spike geordnet zu isolieren, zu migrieren oder zu entfernen.

## Gate 1 - Local Change Gate

Jede Aenderung muss mindestens die zum Scope passenden Checks bestehen.

Pflicht fuer Flutter-/Dart-Code:

```bash
dart format --output=none --set-exit-if-changed <changed dart paths>
flutter analyze <changed dart paths or target package path>
flutter test <relevant tests>
```

Pflicht fuer reine Dokumentation:

- Links und Dateipfade plausibel.
- betroffene Roadmap/Decision/Concept-Dokumente widersprechen sich nicht.
- keine fremden Projektnamen oder alten Importannahmen in aktiver Planung.

Pflicht fuer API-Contract-Aenderungen:

- OpenAPI-Spezifikation aktualisiert oder neu angelegt.
- synthetische Examples aktualisiert.
- Microcks-Szenarien fuer relevante Erfolgs- und Fehlerfaelle geplant oder umgesetzt.

## Gate 2 - R3 Foundation Gate

R3 gilt erst als abgeschlossen, wenn:

- frischer Checkout per `scripts/bootstrap.sh` arbeitsfaehig wird.
- `scripts/codegen.sh` reproduzierbar laeuft.
- `scripts/verify.sh` als Standard-Gate laeuft.
- `flutter test` gruen ist.
- `flutter analyze` fuer den Zielpfad gruen ist.
- Legacy nicht mehr in Produktstart, Zielanalyse, Tests oder Builds hineinleckt.
- neue Riverpod-/Domain-/Repository-Logik mit Fake-Repositories testbar ist.
- synthetische Fixtures unter `test/fixtures/` und API-Beispiele unter `contracts/` vorbereitet sind.
- keine Tests, Fixtures, Examples oder Mock-UIs echte private Daten enthalten.
- API-Grenzen fuer Home Hub/Capture/Sync OpenAPI-/Microcks-faehig geplant sind.

R3 darf nicht abgeschlossen werden, wenn harte Zielpfad-Analyzer-Fehler, kaputte Tests, fehlende Codegen-Reproduzierbarkeit oder aktive Legacy-Leaks in Produktpfade offen bleiben.

## Gate 3 - M2 Readiness Gate

Vor M2-Abschluss muessen zusaetzlich gelten:

- `scripts/bootstrap.sh --verify` funktioniert auf einem frischen Checkout.
- `flutter analyze` ist fuer Produktpfade ohne neue Issues gruen.
- `flutter test` ist gruen.
- Desktop-Smoke-Build ist gruen.
- Mobile-Capture-relevante Unit-/Widget-/Smoke-Tests sind gruen.
- lokale Persistenz-, Upload-Queue- und Draft-Inbox-Flows sind testabgedeckt.
- API-Slices fuer Home Hub/Capture haben OpenAPI-Specs und Microcks-Contract-Smokes.
- Security-/Privacy-Mindestregeln sind pruefbar: keine Secrets in Logs, keine privaten Testdaten, Secure-Storage-Grenze fuer Tokens.
- kritische Bugs fuer Datenverlust, Security, Login/Pairing oder Upload-Verlust sind geschlossen oder bewusst als M2-blockierend markiert.
- aktive Konzepte/Decisions/Roadmap widersprechen dem implementierten M2-Slice nicht.

## Legacy-Regel

Legacy-Schuld darf waehrend R2/R3 existieren, aber nur als eingefrorene Referenz ausserhalb des Zielpfads.

- Neue Zielpfade duerfen keine neuen BLoC/GetIt/Isar/PocketBase-Abhaengigkeiten aufbauen.
- Legacy-Warnungen im alten Spike werden nicht einzeln als Production-Readiness-Arbeit abgearbeitet.
- Ein Legacy-Problem muss dann getrackt werden, wenn es Zielpfad, Build, Tests oder Analyze blockiert.
- Neue Aenderungen duerfen Legacy nicht erweitern und keine Legacy-Abhaengigkeit in Zielpfade ziehen.

## Konsequenzen

- R3-D5 ist entschieden.
- R3-D1 legt den Scope fest: Zielpfad sauber, Legacy eingefroren.
- F16 beschreibt diese Gate-Stufen als Quality-Gate-Modell.
- F4 nutzt diese Gates fuer Regression und milestone-kritische Flow-Tests.

## Nicht entschieden

- konkrete CI-Runner und GitHub-Actions-Ausgestaltung.
- exakte Microcks-Compose-Datei.
- ob Golden Tests vor M2 verpflichtend werden.
