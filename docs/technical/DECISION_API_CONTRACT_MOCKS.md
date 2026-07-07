---
title: "Decision - API Contract Source and Mock Runner"
description: "Entscheidung zu OpenAPI als Contract Source of Truth und Microcks als Contract-Mock-/Verification-Runner"
tags: [decision, api, contracts, openapi, microcks, testing, home-hub, mobile-capture]
lastUpdated: "2026-05-08"
status: "accepted"
---

# Decision - API Contract Source and Mock Runner

## Status

Accepted.

## Entscheidung

DocMan verwendet fuer HTTP-basierte Home-Hub-, Capture- und spaetere Sync-Schnittstellen **OpenAPI** als maschinenlesbare Contract Source of Truth.

**Microcks** ist der bevorzugte und geplante Contract-Mock- und Contract-Verification-Runner.

Prism, WireMock oder andere HTTP-Stubbing-Tools werden nicht als paralleler Fallback in die Standardplanung aufgenommen. Sie koennen spaeter neu bewertet werden, wenn Microcks eine konkrete Anforderung nicht abdecken kann. Bis dahin gilt: ein Contract-Format, ein Contract-Mock-Runner, ein Compose-/CI-Pfad.

## Geltungsbereich

Diese Entscheidung betrifft API-Grenzen zwischen App, Mobile Capture, Home Hub und spaeterem Sync Backend.

Sie betrifft nicht:

- Flutter UI-Konzeptmocks.
- Riverpod-/Widget-/Domain-Tests mit Fake-Repositories.
- lokale Drift-/Repository-Tests.
- die konkrete ASP.NET-Core-Implementierung des Home Hubs.

## Contract-Grenzen

OpenAPI/Microcks werden fuer diese Schnittstellen geplant:

- Home-Hub Health und Capabilities.
- Pairing Session, QR-/Code-Pairing und Device Token.
- Mobile Capture Upload.
- Upload-Status und Retry-/Fehlerantworten.
- Draft-Inbox-Handoff.
- einfache offene Vorgangsliste fuer Mobile Capture, wenn im M2 verfuegbar.
- spaeter Sync-Status, Konflikte, Tombstones und Conflict Responses.
- spaeter OCR-/AI-Job-Status, falls daraus HTTP-Grenzen entstehen.

## Testschichten

```text
Flutter UI / Domain
  -> Fake Repositories fuer schnelle App-Tests

API Client / Home Hub Boundary
  -> OpenAPI Contract
  -> Microcks Mock/Contract Verification

Real Home Hub
  -> muss denselben OpenAPI-Vertrag erfuellen
```

Fake-Repositories und Microcks ersetzen einander nicht.

- Fakes pruefen App-Verhalten ohne Netzwerk.
- Microcks prueft API-Vertraege, Response-Szenarien und Client-/Server-Kompatibilitaet.

## Regeln

- API-Aenderungen starten mit oder aktualisieren die OpenAPI-Spezifikation.
- `DECISION_BACKEND_CONTRACT_FIRST_ARCHITECTURE.md` konkretisiert die
  Implementierungsreihenfolge: OpenAPI zuerst, Microcks-Szenarien, Flutter
  Client gegen Mock, ASP.NET-Core-Implementierung gegen denselben Vertrag.
- Microcks-Szenarien muessen Erfolgs-, Auth-, Validation-, Network-/Retry- und Serverfehler abdecken.
- Contract-Beispiele duerfen nur synthetische Daten enthalten.
- Keine echten Dokumente, echten Haushaltsdaten, Tokens oder Secrets in Specs, Examples oder Mock-Daten.
- API-Fehler werden in F5-Failure-Kategorien gemappt.
- Der echte Home Hub muss spaeter gegen denselben Vertrag getestet werden.
- Flutter-Konzeptmocks duerfen Microcks nicht direkt verwenden.

## Erste Spezifikationen

Empfohlene Reihenfolge:

1. `home-hub-health.openapi.yaml`
2. `home-hub-pairing.openapi.yaml`
3. `mobile-capture-upload.openapi.yaml`
4. `draft-inbox.openapi.yaml`
5. spaeter `sync.openapi.yaml`

Die konkrete Ablage der Specs wird in R3 festgelegt. Naheliegend ist ein dedizierter Contract-Ordner, z. B. `contracts/openapi/`, plus Microcks/Compose-Konfiguration.

## Konsequenzen

- R3-D3 ist entschieden.
- F11 API Integration verwendet OpenAPI als Ziel fuer API-Vertraege.
- F4 Testing Strategy trennt Fake-Repositories und Microcks-Contract-Tests verbindlich.
- F16 CI/CD plant Microcks als Contract-Gate, sobald API-Slices entstehen.
- Ein Prism-/WireMock-Fallback wird nicht proaktiv gebaut.

## Nicht entschieden

- genaue Ablage der OpenAPI-Dateien.
- konkrete Microcks-Compose-Konfiguration.
- ob Client-Code aus OpenAPI generiert oder zunaechst handgeschrieben wird.
