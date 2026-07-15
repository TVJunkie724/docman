---
title: "Decision - API Contract Source and Mock Runner"
description: "OpenAPI als Contract Source of Truth und Microcks als Contract-Mock-/Verification-Runner"
tags: [decision, api, contracts, openapi, microcks, testing, cloud, capture]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "contract-api"
---

# Decision - API Contract Source and Mock Runner

## Entscheidung

Mappm verwendet fuer HTTP-basierte Mappm-Cloud-Schnittstellen **OpenAPI** als
maschinenlesbare Contract Source of Truth. **Microcks** ist der Standard fuer
Contract Mocks, Consumer-Szenarien und Provider Verification.

Prism, WireMock oder parallele Stubbing-Standards werden nicht vorsorglich
eingefuehrt. Eine Abweichung benoetigt einen nachgewiesenen, von Microcks nicht
erfuellten Bedarf und eine neue Entscheidung.

## Scope

Vertragsfamilien umfassen:

- Account, Session, Device Trust und Offline-Berechtigung.
- Plan, Entitlement, Quota, Grace und Read-only.
- Vault-Inventar, Cloud-Autoritaet, Cache/Pending, Sync und Konflikte.
- Capture Upload, Artefakte, asynchrone Verarbeitung und Proposal Review.
- Core Assist mit Titel-, Typ-, Fact-, Managed-Subject- und
  Case-/Record-Vorschlaegen.
- Local-to-Cloud/Cloud-to-Local-Migration, Export, Restore und Loeschung.
- spaeteres Sharing und Advanced Assist nur nach eigener Freigabe.

Nicht Teil dieser Entscheidung sind UI-Mocks, Riverpod-/Domain-Tests mit Fakes,
lokale Drift-Tests und konkrete ASP.NET-Core-Persistenz.

## Testschichten

```text
Domain / Riverpod / Widgets
  -> deterministische Fake-Repositories

API Consumer
  -> OpenAPI
  -> Microcks-Szenarien

Local Development Cloud / Managed Backend
  -> Provider Verification gegen denselben Vertrag
```

Fakes beweisen App-Verhalten. Microcks beweist Contract-Verhalten. Local
Development Cloud beweist echte Integration. Keine Ebene ersetzt eine andere.

## Regeln

- API-Aenderungen beginnen mit einem akzeptierten Contract-Change.
- Contract-/Backend-Owner entscheiden DTOs, Endpunkte, Mapping, Persistenz,
  Autorisierungs- und Policy-Architektur.
- Frontend beschreibt benoetigte Zustaende, Aktionen und Fehler, erfindet aber
  keine Serverloesung.
- Remote DTOs werden im Data Layer gemappt und sind keine Domain Entities.
- Fehler besitzen stabile Codes und harmlose Referenz-IDs; Servertexte werden
  nicht direkt als Nutzertexte angezeigt.
- OpenAPI Examples und Microcks-Daten sind ausschliesslich synthetisch.
- Keine Dokumente, OCR-Texte, privaten Dateinamen, Accountdaten, Tokens,
  Secrets oder Presigned URLs in Specs, Examples oder Reports.
- Breaking Changes benoetigen Versionierung, Migrations-/Rolloutplan und
  Kompatibilitaetsnachweis.
- Vertrag und Provider pruefen Idempotenz, Retry/Resume, Teilfehler und
  Retention dort, wo sie fachlich relevant sind.

## Capture-Mindestabdeckung

Capture-Szenarien trennen Upload-Bestaetigung, Processing und Review. Sie decken
mindestens ab:

- ein logisches Dokument mit mehreren Seiten und mehrere Dokumente je Session.
- durable Originalannahme, Idempotency Replay und Checksum-Fehler.
- Processing-Stufen, Teilfehler, Cancel, Retry und Restart.
- verpflichtenden Titelvorschlag fuer neue Cases sowie gerankte Case-/Record-
  Kandidaten mit Confidence und Provenance.
- New-Case-/Case-Intent als Signal, nicht als finale Zuordnung.
- Auth, Entitlement, Quota, Rate Limit, Unsupported Media und Servicefehler.

## Ablage und Namensraum

Die geplante Zielablage fuer normative Specs ist `contracts/openapi/`, fuer
synthetische Examples `contracts/examples/` und fuer Runner-Konfiguration
`contracts/microcks/`. Diese Pfade werden erst durch einen freigegebenen
Contract-Implementation-Plan angelegt, sofern dieser keinen begruendeten und
geprueften alternativen Projektpfad festlegt. Neue Namen verwenden
`mappm-cloud` oder die fachliche Vertragsfamilie, nicht den historischen
Home-Hub-Namensraum.

## Verifikation

- OpenAPI-Lint und Example-Validierung.
- Microcks Happy-, Failure-, Auth-, Conflict-, Idempotency- und
  Retention-Szenarien.
- Flutter Consumer-Tests fuer DTO-Mapping und F5-Failures.
- Provider Verification in Local Development Cloud und Staging.
- CI blockiert nicht kompatible Contract-Aenderungen.
- Security-Scan fuer Secrets/PII in Contract-Artefakten.

## Stop Rules

Stop, wenn:

- Controllercode oder ein Fake zur Contract Source of Truth wird.
- Frontend allein DTOs, Endpunkte oder Policy festlegt.
- echte oder anonymisierte private Daten in Contract-Artefakte gelangen.
- Capture-Intent als endgueltiges Routing gilt.
- ein Breaking Change ohne Versionierungs- und Rolloutplan freigegeben wird.

## Handoff

OpenAPI/Microcks geht an `contract-api`; App-Fakes an `quality-readiness`;
Provider-Implementierung an ein getrenntes Backend-Issue/-Team.
