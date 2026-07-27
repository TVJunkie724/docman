---
title: "Rebaseline - Mappm Cloud Capture Contract Shape"
description: "Akzeptierte fachliche Capture-Vertragsform; konkrete OpenAPI-Rekontraktierung erforderlich"
tags: [decision, cloud, mobile-capture, openapi, microcks, upload, processing]
lastUpdated: "2026-07-22"
status: "accepted-shape-recontract-required"
owner: "contract-api"
---

# Rebaseline - Mappm Cloud Capture Contract Shape

## Status

Die fachliche Form `initiate -> transfer -> confirm` sowie Idempotenz,
Checksum und durable Originalannahme sind akzeptiert. Dieses Dokument legt
keine DTOs, Endpunkte, Fehlercodes oder Limits fest. Der konkrete Mappm-Cloud-
Vertrag muss durch `contract-api` als OpenAPI/Microcks-Slice rekontraktiert und
reviewt werden.

Der historische Dateiname bleibt nur fuer Traceability bestehen. Es gibt keinen
Customer Home Hub und kein QR-Pairing im Produktvertrag.

## Fachlicher Ablauf

```text
1. Upload initiieren
2. Artefakte ueber den ausgehandelten Transport uebertragen
3. Upload mit Manifest und Integritaetsnachweis bestaetigen
4. Originale dauerhaft annehmen und Processing Job queuen
5. Processing-/Proposal-Status separat bereitstellen
6. User-Bestaetigung/Korrektur separat persistieren
```

Upload-Bestaetigung finalisiert weder logische Dokumentgrenzen noch
Case-/Record-Zuordnung.

## Fachliche Anforderungen

Der konkrete Vertrag muss mindestens ausdruecken koennen:

- Account-/Device-/Vault-/Entitlement-Kontext.
- stabile Client-Operation und Idempotency Key.
- Artefaktmanifest, Groesse, MIME, Seitenzahl und Checksum.
- ein logisches Dokument mit mehreren Seiten sowie mehrere Dokumente pro
  technischer Capture Session.
- optionalen New-Case-, vorhandenen Case- oder Managed-Subject-Intent als
  Matching-Signal.
- Upload-, Verifikations- und Processing-Referenzen.
- Retry/Resume/Expiry und Teilfehler.
- maschinenlesbare Failure-/Conflict-/Review-Semantik.

Contract/API Owner entscheiden die finalen Felder, DTOs und Operationen.

## Intent- und Review-Regel

Ein ungueltiger oder veralteter Intent darf ein valides Original nicht
zerstoeren. Die Capture Session bleibt verarbeitbar; der Intent wird als
sichtbarer Review-Konflikt behandelt. Assist liefert weiterhin beste
Case-/Record-Kandidaten. Bei sehr niedriger Confidence steht ein neuer leichter
Custom Case mit vorgeschlagenem Titel zuerst; vorhandene Cases bleiben
auswaehlbar.

Core Assist liefert pro logischem Dokument insbesondere:

- editierbaren Dokument- und gegebenenfalls Case-/Record-Titel.
- Typ, relevante Fakten, Managed Subject und External Party.
- gerankte Case-/Record-Kandidaten mit Confidence und Provenance; kein
  Claim-Matching.
- Workflow-/Task-/Fristvorschlaege innerhalb freigegebener Definitionen.

## Fehler- und Security-Grenze

Der Vertrag muss Auth, Authorization, Entitlement/Quota, Validation, Payload-
Policy, Integrity, Expiry, Conflict, Rate Limit und retrybaren Servicefehler
unterscheidbar machen. Exakte Codes und HTTP-Mappings gehoeren in OpenAPI.

- Keine Tokens, URLs, Dokumentinhalte, OCR-Texte oder sensiblen Dateinamen in
  Logs, Examples oder Fehlertexten.
- Storage Keys und Providerdetails sind Infrastruktur, keine Domain-/UI-Daten.
- Local-Vault-Capture/Assist darf keine dauerhafte Cloud-Vault-Speicherung
  implizieren.
- Cleanup darf Originale erst nach bestaetigter Policy-/Lifecycle-Bedingung
  entfernen.

## Microcks-Mindestfaelle

- Initiate/Transfer/Confirm erfolgreich.
- wiederholtes Confirm idempotent.
- Checksum-/Manifest-/MIME-/Groessenfehler.
- abgelaufene Session und widerrufenes Device.
- Quota/Rate Limit/Retryable Service Failure.
- ungueltiger Intent bei erhaltenem Upload.
- Processing queued, Teilfehler und Review-ready.
- App-/Client-Restart mit Fortsetzung.

Alle Examples sind vollsynthetisch.

## Stop Rules

Stop, wenn:

- dieses Shape-Dokument als fertiger API-Vertrag behandelt wird.
- Frontend konkrete DTOs, Endpunkte oder Backend-Policy festlegt.
- Confirm bereits Routing finalisiert.
- ein Intent oder Teilfehler ein valides Original verliert.
- Vertrag und Microcks keine Idempotenz-/Restart-Szenarien besitzen.

## Handoff

Der naechste Schritt ist ein separates `contract-api`-Issue fuer OpenAPI,
Microcks, Consumer Mapping und Backend-Provider-Verification.
