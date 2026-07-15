---
title: "Konzept F16 - CI/CD Pipeline and Quality Gates"
description: "CI/CD-Vertrag fuer Flutter, Contracts, Managed Backend, Migrationen, Supply Chain und Commercial Releases"
tags: [concept, ci, cd, quality-gates, flutter, contracts, cloud, release]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted"
owner: "quality-readiness/release"
---

# Konzept F16 - CI/CD Pipeline and Quality Gates

## Zweck

F16 definiert reproduzierbare lokale und CI/CD-Gates. CI/CD schuetzt
Produktversprechen, Datenintegritaet und Releasefaehigkeit, nicht nur Stil.

## Pipeline-Grenzen

Getrennt gebaut und verifiziert werden:

- Flutter-App je Instanz, Plattform und Environment.
- OpenAPI, Examples, Microcks und gegebenenfalls generierte Clients.
- ASP.NET-Core-/Worker-Provider in separatem Backend-Repo/-Issue.
- Infrastructure/Deployment/Config.
- Datenbank-/File-/Vault-Migrationen.
- Store-/Desktop-Releaseartefakte und Promotion.

Frontend- und Backend-Implementation-Issues bleiben getrennt. Ein gemeinsames
Gate darf beide Artefakte integrieren, aber nicht Ownership vermischen.

## Lokale Entrypoints

Das projektlokale `frontend.sh` kapselt dokumentierte Befehle fuer Setup,
Instanz-/Environment-Auswahl, Start, Codegen, Test und Verify. Transparente
Unter-Scripts wie `scripts/bootstrap.sh`, `scripts/codegen.sh` und
`scripts/verify.sh` duerfen verwendet werden. Lokal und CI muessen dieselben
Pruefungen oder nachweislich aequivalente Commands ausfuehren.

## Gate-Stufen

| Gate | Inhalt |
|---|---|
| Change Gate | Format, Analyze/Lint, betroffene Unit-/Widget-/Docs-Tests |
| C1 Foundation Gate | Bootstrap, Codegen, Architektur, Fakes, Storage/Secure Storage, Zielpfad |
| C2/C3 Vertical Gate | Capture, Assist, Cases/Records, Offline/Restart, Contract Consumer, A11y/Privacy |
| C4 Lifecycle Gate | Migration, Backup/Restore, Entitlement, Grace, Export/Delete, Rollback |
| C5 Release Gate | Supply Chain, Signing, Stores, Ops, Legal/Regulatory, Staging |
| C6/C7 Promotion | Beta Evidence, Incident/Recovery, Go/No-Go und Commercial Promotion |

Details und exakte Commands gehoeren in den jeweiligen Implementation Contract
und `docs/technical/DECISION_MILESTONE_QUALITY_GATES.md`.

## Flutter-Gates

- deterministischer Dependency- und Codegen-Setup aus frischem Checkout.
- Format, Analyzer/Lints und alle relevanten Tests.
- Architektur-/Importgrenzen und kein neuer Legacy-Leak.
- Widget/Semantics/Responsive/Golden-Evidence fuer betroffene UI.
- Mobile/Desktop Build Smoke je aktivierter Instanz/Plattform.
- keine Fakes, Dev-Menues oder Local Development Cloud in Production.

Generierte Artefakte folgen der akzeptierten Codegen-Policy. CI prueft
Reproduzierbarkeit und unerwarteten Diff, statt handgeschriebene oder stale
Generatorausgabe still zu akzeptieren.

## Contract-/Backend-Gates

- OpenAPI-Lint, Example-Validation und Breaking-Change-Check.
- Microcks Consumer-Szenarien.
- Flutter DTO-/Failure-Mapping gegen den Contract.
- Provider Verification des getrennten Backends.
- Integration gegen Local Development Cloud; Staging Smoke vor Promotion.
- Migration-, Idempotenz-, Conflict-, Tenant-Isolation- und Retention-Tests.

Fake-Repositories pruefen Appverhalten und ersetzen Contract Tests nicht.

## Supply Chain und Security

- Dependency-/License-/Vulnerability-Scan und SBOM nach aktivierter
  Regulatory-/Release-Policy.
- Secret Scan, signierte/geschuetzte Build-Credentials und minimale CI-Rechte.
- gepinnte/ueberpruefbare Toolchains und Runner Images.
- Artefakt-Checksums, Provenance/Attestation soweit erforderlich.
- keine privaten Dokumente in Testartefakten, Logs, Screenshots oder Reports.

## Environment und Promotion

Local Development Cloud, Development, Staging und Production sind getrennt.
Promotion verwendet unveraenderliche Artefakte plus environment-spezifische
Secret-/Config-Injektion, nicht einen manuellen Neubau. Production benoetigt
Approvals, Rollback, Monitoring, Incident- und Datenmigration-Runbook.

## Data/Lifecycle-Gates

- Up-/Down-/Forward-Compatibility gemaess akzeptierter Migration Policy.
- Quellenerhalt und genau eine Vault-Autoritaet.
- Backup/Restore Drill und Export/Migration/Delete.
- App-Kill/Deployment-Abbruch/Retry und idempotente Wiederaufnahme.
- kein Release bei ungeklaertem Recovery einer destruktiven Migration.

## Datierte Legal-/Store-Gates

Store-, CRA-, AI-Act-, DSGVO-, EUDI/eIDAS-, Consumer- und andere anwendbare
Checks dokumentieren Datum, Primaerquelle, Applicability und Owner. CI kann
Evidence/Expiry pruefen, ersetzt aber keine fachkundige Abnahme.

## Tests und Evidence

Jeder Gate-Job publiziert klaren Scope, Commands, Versionen, Assertions und
Artefaktreferenzen. Flaky Tests werden nicht blind wiederholt oder ignoriert;
sie blockieren oder erhalten ein priorisiertes Issue mit Owner und Frist. Eine
Allowlist ist klein, datiert und verfaellt.

## Stop Rules

Stop, wenn Production aus einem anderen Pfad als getestete Artefakte gebaut
wird, Frontend/Backend-Ownership vermischt wird, Contract-/Migration-/Restore-
Gates fehlen, Secrets/PII in CI gelangen oder ein volatiler Legal-/Store-Check
ohne aktuelles Datum als Releasefreigabe gilt.

## Handoff

Pipeline-/Gate-Umsetzung an `quality-readiness`; Contract-Gates an
`contract-api`; Foundation-Scripts an `foundation-builder`; Store/Release an
Release-/Legal-Owner.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die Phase stoppt.
