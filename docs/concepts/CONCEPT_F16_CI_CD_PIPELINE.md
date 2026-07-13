---
title: "Konzept F16 - CI/CD Pipeline and Quality Gates"
description: "Mappm Quality/CI/CD gates for Flutter, Cloud contracts/providers, migrations, environments and commercial releases"
tags: [concept, ci, cd, quality-gates, flutter, docs, compose]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F16 - CI/CD Pipeline and Quality Gates

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Cloud Delivery Rebaseline

CI/CD must separate Flutter, OpenAPI/generated clients, backend providers,
infrastructure and release promotion. Gates cover Local and Cloud fakes,
Microcks consumer/provider conformance, migration/source-preservation,
entitlement/cancellation, security/supply-chain, environment config drift,
backup/restore and rollback. Local Development Cloud is reproducible tooling;
Staging and Production promotion use separate secrets and approvals.

Dieses Konzept ersetzt den importierten F16-Inhalt aus dem alten Projekt.

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

F16 definiert, welche Qualitätsprüfungen DocMan lokal und in GitHub braucht.

## Grundsatz

Quality Gates schützen Produktversprechen, nicht nur Stil.

DocMan verwendet drei Gate-Stufen:

| Gate | Zweck |
|---|---|
| Local Change Gate | jede konkrete Aenderung prueft ihren Scope gezielt |
| R3 Foundation Gate | Foundation, Testbarkeit, Codegen und Zielpfad-Qualitaet sind unter Kontrolle |
| M2 Readiness Gate | M2-Flows, Builds, Contract-Smokes und Security-/Privacy-Minimum sind pruefbar |

Details stehen in `docs/technical/DECISION_MILESTONE_QUALITY_GATES.md`.

## Frühe Gates

- Format/Analyze für Flutter.
- relevante Unit-/Widget-Tests.
- keine Template-Tests als Scheinsicherheit.
- Dokumentationslinks und Markdown-Grundprüfung.
- keine bekannten alten Projektnamen in aktiver Doku.
- reproduzierbares Bootstrap-/Codegen-/Verify-Scriptset für lokale Entwicklung.
- keine neuen Analyzer-Issues in Zielpfaden.
- kein Legacy-Leak in Produktstart, Zielanalyse, Tests oder Builds.

## Spätere Gates

- Home-Hub Backend Tests.
- Docker/Compose Validate.
- API Contract Tests.
- Microcks Contract-Mock für Home-Hub/Capture/Sync.
- Mobile Capture Smoke.
- Storage Migration Tests.
- Release Signing Checks.

## Lokale Script-Gates

DocMan soll drei lokale Standardscripts haben:

| Script | Zweck |
|---|---|
| `scripts/bootstrap.sh` | frischen Checkout vorbereiten, Dependencies holen und Codegen ausführen; strenge Checks optional mit `--verify` |
| `scripts/codegen.sh` | Freezed/JSON/Drift/spätere Riverpod-Generatoren reproduzierbar ausführen |
| `scripts/verify.sh` | lokales Quality Gate vor Commit/PR |

Die Scripts sind absichtlich klein und transparent. Sie sollen lokal und später in CI wiederverwendbar sein.

## Codegen-Artefakte

Generierte Dart-Artefakte werden nicht committed:

- `.freezed.dart`
- `.g.dart`
- Drift-generierte Dateien
- spätere Riverpod-generierte Provider

Stattdessen erzeugen `scripts/bootstrap.sh`, `scripts/codegen.sh` und CI diese Dateien reproduzierbar. Wenn Generator-Output fehlt oder nicht erzeugbar ist, muss Analyze oder Verify fehlschlagen.

Git muss frei von neuen Generator-Artefakten bleiben. Nach dem R3-Cleanup prueft CI konservativ:

```bash
git ls-files | rg '(\\.freezed\\.dart|\\.g\\.dart)$'
```

Bis die aktuell getrackten Legacy-Artefakte entfernt sind, braucht dieser Check eine explizite Legacy-Allowlist oder bleibt als geplantes Gate dokumentiert. Erlaubte dauerhafte Ausnahmen brauchen eine explizite Decision. Quellen wie `pubspec.yaml`, `pubspec.lock`, `build.yaml`, OpenAPI-Spezifikationen, Examples und handgeschriebene Migrationen bleiben committed.

## Contract-Mock Gate

Sobald Home-Hub-, Capture- oder Sync-APIs entstehen, bekommt die CI ein Contract-Gate:

- API-Spezifikation validieren.
- Microcks starten.
- Client-Contract-Smoke gegen Mock ausführen.
- echte Backend-Implementierung später gegen denselben Vertrag prüfen.

Dieses Gate ist getrennt von Flutter-Fake-Repository-Tests. Fake-Repos prüfen App-Verhalten; Contract-Mocks prüfen Schnittstellen.

## M2 Readiness Gate

Vor M2-Abschluss muessen mindestens laufen:

- `scripts/bootstrap.sh --verify` auf frischem Checkout.
- `flutter analyze` fuer Produktpfade ohne neue Issues.
- `flutter test`.
- Desktop-M2 Smoke Build.
- Mobile-Capture relevante Unit-/Widget-/Smoke-Tests.
- OpenAPI-/Microcks Contract-Smokes fuer betroffene API-Slices.
- Security-/Privacy-Mindestchecks gegen Secrets in Logs und private Testdaten.

## Dokumentations-Gate

Solange Konzepte neu geschrieben werden:

- neue Planung verweist auf aktuelle Decisions.
- alte Roadmaps sind als Legacy markiert oder ersetzt.
- Concepts mit `accepted` dürfen keine fremden Projektnamen enthalten.

## Definition of Done

F16 gilt als umgesetzt, wenn:

- lokale und CI-Prüfungen dokumentiert sind.
- Flutter Analyze/Test laufen.
- Docs-Drift sichtbar wird.
- spätere Backend-/Compose-Gates vorgesehen sind.
- Bootstrap-, Codegen- und Verify-Scripts im Repo existieren und Generator-Output reproduzierbar erzeugen.
- generierte Dart-Artefakte nicht als Source of Truth committed werden.
- Contract-Mock-Grenze für Microcks dokumentiert ist.

## Offene Folgefragen

- Welche CI-Runner stehen zur Verfügung?
- Wann wird Docker/Compose in CI geprüft?
- Wann wird Microcks als Compose-Service ergänzt?
- Welche API-Spezifikation wird zuerst contract-getestet?

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
