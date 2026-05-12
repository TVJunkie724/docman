---
title: "Decision - Legacy Readiness Scope"
description: "Entscheidung, dass nur der DocMan-Zielpfad production-readiness-relevant ist und Legacy-Code als Referenz eingefroren wird"
tags: [decision, legacy, r3, production-readiness, clean-rebuild]
lastUpdated: "2026-05-06"
status: "accepted"
---

# Decision - Legacy Readiness Scope

## Status

Accepted.

## Entscheidung

Nur der neue DocMan-Zielpfad ist production-readiness-relevant.

Der bestehende Spike-/Legacy-Code bleibt nur als Design- und Fachreferenz erhalten. Er wird nicht enterprise-grade gemacht, nicht modernisiert und nicht durch einzelne Warnungs-Fixes künstlich stabilisiert.

R3 verbessert also nicht die alte App. R3 sorgt dafür, dass neue Arbeit sauber entsteht, Legacy nicht weiterwächst und der alte Code aus Produkt-, Build- und Analyze-Pfaden entfernt oder klar isoliert wird.

## Zielpfad

Der Zielpfad umfasst neue oder migrierte DocMan-Arbeit in:

- `lib/app/`
- `lib/core/`
- künftig `lib/features/`
- künftig `lib/shared/`
- `lib/main.dart`, sobald es auf die neue App zeigt
- `lib/main_mock_catalog.dart`
- `test/`
- `scripts/`
- `contracts/`
- aktive Planungsdokumente unter `docs/concepts/` und `docs/technical/`

Diese Pfade müssen formatierbar, analysierbar, testbar und reproduzierbar aufgebaut sein.

## Legacy-Referenz

Legacy umfasst den alten Spike-Bestand, solange er nicht explizit in den Zielpfad migriert wurde. Dazu gehören insbesondere alte BLoC-, GetIt-, Isar- und PocketBase-Pfade sowie alte Incident-orientierte Screens und Workflows.

Legacy darf genutzt werden, um:

- visuelles Gefühl zu verstehen.
- fachliche Begriffe und alte Flow-Ideen zu prüfen.
- sinnvolle UI-Details in neue Mock- oder Feature-Pläne zu übertragen.

Legacy darf nicht genutzt werden, um:

- neue Architekturentscheidungen abzuleiten.
- neue Features darauf aufzubauen.
- R3- oder MVP-Qualität zu messen.
- PocketBase, Isar, BLoC oder GetIt weiter als Zieltechnologien zu legitimieren.

## Regeln

- Keine neuen Produktpfade dürfen BLoC, GetIt, Isar oder PocketBase importieren.
- Legacy-Code wird nicht um Tests, neue Provider, neue Screens oder neue Features erweitert.
- Legacy-Warnungen werden nicht einzeln abgearbeitet, nur damit `flutter analyze` fuer den alten Spike sauber wirkt.
- Wenn Legacy den Zielpfad, Build oder Analyze blockiert, ist die bevorzugte Lösung Isolation, Migration oder Entfernung, nicht Legacy-Härtung.
- Alte Pfade dürfen gelöscht werden, sobald ihr fachlicher oder visueller Nutzen in neue Konzepte, Mocks oder Features übertragen wurde.
- Falls eine Legacy-Abhängigkeit kurzfristig technisch unvermeidbar ist, braucht sie eine klare Migrationsnotiz oder ein GitHub Issue mit Acceptance Criteria und Verification.

## Quality Gates

R3- und MVP-Gates messen den Zielpfad.

Ein Gate darf nicht an alten Warnungen scheitern, die nur in eingefrorenem Legacy-Code liegen und den Zielpfad nicht beeinflussen. Ein Gate darf aber auch nicht grün gemeldet werden, wenn Legacy noch aktiv in Produktstart, Zielanalyse, Tests oder Build-Kommandos hineinleckt.

Die sinnvolle R3-Arbeit ist deshalb:

- Zielpfad-Analyse und Zielpfad-Tests grün bekommen.
- alte Produkt-Entry-Points vom neuen Entry-Point trennen.
- Legacy-Abhängigkeiten aus neuen Pfaden entfernen.
- alte Dateien löschen oder in einen klaren Referenzbereich verschieben, sobald sie nicht mehr gebraucht werden.

## Konsequenzen

- R3-D1 ist entschieden.
- R3 behandelt Legacy als Scope-/Isolationsthema, nicht als Refactoring-Auftrag.
- GitHub Issues sollen Legacy-Cluster beschreiben, die den Zielpfad blockieren, nicht jede einzelne alte Analyzer-Warnung.
- Der bestehende Code darf als Designreferenz bleiben, verliert aber seinen Status als Produktbasis.

## Nicht entschieden

- der genaue Zeitpunkt, an dem alte Legacy-Dateien gelöscht werden.
- ob eine temporäre `legacy_reference/`-Ablage sinnvoller ist als direkte Löschung.
- welche alten UI-Details vor Löschung noch in Mock- oder Feature-Pläne übernommen werden.
