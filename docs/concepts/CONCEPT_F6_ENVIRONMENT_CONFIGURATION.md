---
title: "Konzept F6 - Environment and Instance Configuration"
description: "Sichere Konfiguration fuer Mappm-Instanzen, Local Development Cloud, Development, Staging und Production"
tags: [concept, foundation, configuration, environments, cloud, instances, flavors]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted"
owner: "foundation/release"
---

# Konzept F6 - Environment and Instance Configuration

## Zweck

F6 trennt Produktinstanz, Umgebung, Vault-Modus, Laufzeiteinstellung und Secret.
Keine Umgebung wird durch harte URLs, private IPs oder versteckte Defaults im
Produktcode definiert.

## Umgebungsmodell

| Umgebung | Zweck | Datenregel |
|---|---|---|
| `local` | Flutter-App mit Fakes/lokaler Persistenz | nur synthetisch |
| `local-development-cloud` | realer lokaler Backend-/Contract-Stack | nur synthetisch |
| `development` | geteilte Managed-Integration | freigegebene synthetische Testdaten |
| `staging` | release-nahe Managed-Validierung | freigegebene synthetische/rechtlich erlaubte Testdaten |
| `production` | verkaufter Dienst | echte Kundendaten gemaess Policy |

Local Vault bedeutet nicht automatisch `local` Environment. Eine Production-
App mit Local Vault verwendet Account/Entitlement und gegebenenfalls Core
Assist gegen Production, waehrend ihre Vault-Daten lokal autoritativ bleiben.

## Produktinstanzen

Jede auslieferbare App-Instanz besitzt explizit versionierte, getrennte
Artefakte fuer:

- App-/Bundle-/Package-Identifier und Anzeigename.
- Environment-/Flavor-Konfiguration ohne Secrets.
- API-/Identity-/Telemetry-Ziele je Umgebung.
- erlaubte Features und Plattformfaehigkeiten.
- App Icons, Splash-/Brand-Assets und Store-Metadaten.
- Signing-/Entitlement-/Permission-Konfiguration je Plattform.

Instanzspezifische Env-Dateien folgen einem dokumentierten Schema. Sichere
Templates/Examples duerfen committed sein; echte Secrets, private Zertifikate
und Production-Credentials nicht. Fehlende Productionwerte fuehren zu einem
Build-/Startfehler, nie zu einem Fallback auf Development oder Fakes.

## Konfigurationsklassen

| Klasse | Beispiele | Ort |
|---|---|---|
| Build/Instance | App-ID, Name, Flavor, Icon-Set | versionierte Buildkonfiguration |
| Environment | API-/Identity-Basis, Telemetry-Ziel | validierte nicht geheime Config |
| Runtime Preference | Sprache, Theme, UI-Praeferenz | lokaler Settings Store |
| Product State | Vault-Modus, Entitlement, Cache, Migration | Repositories/Backend, nicht Config Flag |
| Secret | Tokens, Keys, Signing, Recovery | Secret Store/CI/OS Secure Storage |
| Dev Scenario | Fake-/Fixture-Auswahl | Dev-/Test-only Composition |

Vault-Autoritaet, Subscription und Assist sind keine frei manipulierbaren
Feature Flags.

## Operations Entrypoint

Das projektlokale `frontend.sh` ist der dokumentierte Entrypoint fuer Setup,
Start, Codegen, Verify und instanz-/umgebungsspezifische Befehle. Es validiert
Instanz und Umgebung, bevor Tools gestartet werden, und gibt keine Secrets aus.
CI verwendet dieselben transparenten Unterbefehle oder deren direkt
nachvollziehbare Scripts.

## Feature Flags

- Flags haben Owner, Default, Environment-Scope und Entferndatum/-bedingung.
- Security-, Legal-, Billing- oder Datenmigration darf nicht nur clientseitig
  per Flag kontrolliert werden.
- Production-Default ist fail closed.
- Dev-Fakes und Local Development Cloud sind in Production nicht erreichbar.

## Security und Privacy

- Keine Customer-Server-URL oder Self-Hosting-Einstellung im Produkt.
- Keine Secrets in Dart Defines, committed Env-Dateien, Logs oder UI.
- Environment- und Tenant-Isolation gilt fuer Identity, API, Storage, Keys,
  Telemetry, Push und Store-Konfiguration.
- Diagnose zeigt sichere Environment-/Version-IDs, keine Tokens oder internen
  URLs ohne Supportbedarf.

## Tests und Verifikation

- Schema-/Required-Field-Validierung fuer jede Instanz/Umgebung.
- Build Smoke fuer aktivierte Plattform-/Environment-Kombinationen.
- Production-Fail-closed bei fehlender/falscher Config.
- Nachweis, dass Production nie Fake, Local Development Cloud oder Dev-
  Telemetry verwendet.
- Icon/App-ID/Signing-/Permission-Konsistenz pro Instanz.
- Secret-Scan und keine Geheimnisse in Buildartefakten/Logs.

## Stop Rules

Stop, wenn Environment, Vault-Modus und Produktinstanz vermischt werden, eine
Production-App auf Dev/Fake zurueckfallen kann, Secrets in Buildconfig landen
oder eine neue Instanz ohne eigenes validiertes Config-/Icon-/Signing-Set
ausgeliefert werden soll.

## Handoff

Bootstrap/Entrypoint an `foundation-builder`, CI/Signing an
`quality-readiness`, Backend-/Environment-Vertraege an `contract-api`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die Phase stoppt.
