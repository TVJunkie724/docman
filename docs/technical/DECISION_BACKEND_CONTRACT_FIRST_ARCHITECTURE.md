---
title: "Decision - Backend Contract-First Architecture"
description: "Vorlaeufige contract-first Architektur fuer Managed Mappm Cloud, Local Development Cloud und Flutter-Domain-Ports"
tags: [decision, backend, contract-first, openapi, microcks, aspnet-core, flutter]
lastUpdated: "2026-07-15"
status: "accepted-provisional"
owner: "contract-api/backend"
---

# Decision - Backend Contract-First Architecture

## Status

Vorlaeufig akzeptiert. ASP.NET Core als Zieltechnologie, OpenAPI/Microcks als
Contract-Standard sowie die Ownership-Grenze sind verbindliche Richtung.
Konkrete Contract-Familien, DTOs, Operationen und Backend-Module werden erst
durch getrennte Contract-/Backend-Implementation-Contracts freigegeben.

## Entscheidung

Mappm baut den Managed Service **contract-first**. Die stabile Produktgrenze ist
der versionierte OpenAPI-Vertrag, nicht ASP.NET Controller, EF-Modelle,
PostgreSQL-Tabellen oder Object-Storage-SDKs.

```text
Flutter Presentation / Riverpod
  -> Domain Ports / Use Cases
      -> Data Adapter
          -> OpenAPI Client
              -> Mappm Cloud Contract

Mappm Cloud
  -> ASP.NET Core API
  -> PostgreSQL fuer Metadaten, Revisionen, Jobs und Audit
  -> S3-kompatibler Object Storage fuer Payloads
  -> Worker/Hosted Services fuer Processing und Lifecycle Jobs
```

Die Local Development Cloud fuehrt denselben Stack und dieselben akzeptierten
Vertragsversionen mit ausschliesslich synthetischen Daten aus. Sie ist kein
Kundenfeature und kein Self-Hosting-Produkt.

## Ownership-Grenze

Frontend darf beschreiben:

- benoetigte Nutzeraktionen und sichtbare Zustaende.
- Offline-, Loading-, Error-, Retry-, Conflict- und Review-Verhalten.
- benoetigte fachliche Operationen und Acceptance Conditions.
- synthetische Consumer-Szenarien.

Contract-/Backend-Owner entscheiden:

- DTOs, Endpunkte und Operation IDs.
- Authentifizierungs-/Autorisierungs- und Policy-Architektur.
- serverseitiges Mapping, Persistenz, Transaktionen und Retention.
- Job-, Queue-, Object-Storage- und Deploymentarchitektur.
- SLOs, Limits und serverseitige Fehlercodes in Abstimmung mit Product/Ops.

Frontend- und Backend-Implementation bleiben getrennte Issues. Ein
Cross-Cutting-Epic darf beide koordinieren, aber nicht ihre Deliverables
vermischen.

## Contract-first Ablauf

```text
1. Produkt-/Trust-Gates und fachliche Capability akzeptieren.
2. Contract/API Owner definiert OpenAPI und synthetische Examples.
3. Microcks bildet relevante Consumer-Szenarien ab.
4. Flutter implementiert/mapped den Consumer hinter Domain-Ports.
5. Backend implementiert denselben Vertrag.
6. Provider Verification, Integration und Staging Smoke laufen.
7. Breaking-Change-/Rollout- und Observability-Nachweis schliessen den Slice.
```

## Portfamilien

App-seitig werden getrennte fachliche Ports vorgesehen fuer:

- Account, Session, Device Trust und Entitlement.
- Local-/Cloud-Vault, Cache, Pending Operations und Sync.
- Capture Upload und Processing Job.
- Core Assist und Proposal Review.
- Migration, Export, Restore und Delete.
- spaeter Sharing und Advanced Assist.

Local Vault, Cloud Vault, Fake und Contract Consumer implementieren passende
Ports. Ein Port darf keine ASP.NET-, EF-, PostgreSQL-, S3- oder Remote-DTO-
Typen in Domain/Presentation exponieren.

## Capture und Processing

Capture Upload bestaetigt ausschliesslich die dauerhafte technische Annahme und
queued Processing. Es finalisiert weder Dokumentgrenze noch Case-/Record-
Zuordnung. Core Assist erzeugt pro logischem Dokument Titel, Typ, Fakten,
Managed Subject sowie gerankte Case-/Record-Kandidaten mit Provenance.

Ein New-Case-/Case-Intent bleibt Signal. Der Nutzer bestaetigt aktuell
folgenreiche Zuordnungen; spaetere Automation benoetigt klassenweise Quality-
Freigabe. Der konkrete Vertrag liegt beim Contract/API Owner.

## Backendform

Mappm startet als modularer Monolith plus Worker-Grenze, nicht als
Microservice-Landschaft. API und einfache Background Jobs duerfen anfangs in
einem Deployable liegen. Ein separater Worker/Broker wird erst eingefuehrt,
wenn Durchsatz, Isolation, Retry oder Betriebsmetriken dies rechtfertigen.

Spezialisierte OCR-/LLM-Komponenten duerfen hinter einem Processing-Port in
anderen Laufzeiten arbeiten. Providerdetails und Rohantworten bleiben
Infrastruktur und leaken nicht in Domain/UI.

## Security und Privacy

- Keine Secrets oder privaten Inhalte in Specs, Examples, Logs oder normalen
  Fehlern.
- Account, Device, Vault und Operation begrenzen jeden Zugriff.
- Uploadziele sind kurzlebig und eng gescoped.
- Local-Vault-Assist aktiviert keine dauerhafte Cloud-Vault-Speicherung.
- Sync, Backup, Assist und Telemetry sind getrennte Trust-/Retention-Grenzen.
- Backend-Persistenzmodelle sind kein API-Vertrag.

## Tests und Verifikation

- OpenAPI-/Microcks-Consumer- und Provider-Verifikation.
- App-Tests ueber Fake-Ports und Contract Consumer.
- Backend-Tests fuer Auth, Policy, Transaktion, Idempotenz und Tenant-Isolation.
- Integration gegen Local Development Cloud; Staging-Smoke vor Release.
- Restart-, Retry-, Conflict-, Migration- und Retention-Szenarien je betroffenem
  Slice.

## Stop Rules

Stop, wenn:

- UI direkt Controller, Remote DTOs oder Storage-SDKs verwendet.
- Frontend Backend-Policy oder Persistenz festlegt.
- OpenAPI nachtraeglich aus zufaellig implementierten Endpoints abgeleitet wird.
- Local Development Cloud als Kundenprodukt erscheint.
- ein Slice ohne Contract-, Failure-, Security- und Provider-Verification-
  Nachweis gebaut werden soll.

## Offene Entscheidungen

- konkrete .NET-Solution- und Modulstruktur.
- Minimal APIs versus Controller pro Slice.
- Client-Codegen versus handgeschriebener Client.
- konkrete Auth-Libraries, Sync-/Conflict- und Sharing-Protokolle.

Diese Punkte werden pro Contract-/Backend-Slice entschieden und nicht vom
Frontend vorweggenommen.
