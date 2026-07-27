---
title: "Konzept F11 - API Integration"
description: "Contract-first API-Konzept fuer Account, Devices, Core Assist, Managed Cloud, Capture, Vault-Migration und Sync"
tags: [concept, foundation, api, account, assist, cloud, capture, migration, identity, entitlements]
lastUpdated: "2026-07-25"
version: "5.1"
status: "accepted"
owner: "contract-api"
---

# Konzept F11 - API Integration

## Status und Source of Truth

Akzeptiert. OpenAPI ist die Source of Truth fuer Mappm-Cloud-HTTP-Vertraege;
Microcks fuehrt versionierte Contract-Szenarien aus. Local Development Cloud,
Shared Development, Staging und Production implementieren dieselben akzeptierten
Vertragsversionen. Dieses Konzept ersetzt Home-Hub-, QR-Pairing-, Tailscale-
und kundenverwaltete Self-Hosting-Vertraege.

## Zweck und Ownership

F11 definiert App-seitige Vertragsgrenzen und erforderliche fachliche
Faehigkeiten. Frontend darf benoetigte Zustaende, Aktionen und Fehler
beschreiben. Contract-/Backend-Owner entscheiden jedoch DTOs, Endpunkte,
Mapping, Persistenz, Autorisierungs- und Policy-Architektur.

## Architekturgrenze

```text
Presentation / Riverpod
  -> Domain Repository oder Use Case
      -> Data Repository
          -> generierter oder handgeschriebener API Client
              -> Mappm Cloud HTTP Contract
```

- Presentation und Domain kennen keine HTTP-Clients oder Remote DTOs.
- API-/SDK-Exceptions werden im Data Layer auf F5-Failures gemappt.
- DTOs sind keine Domain Entities.
- Client-Codegen ist eine Implementierungsentscheidung; OpenAPI bleibt in
  beiden Faellen normativ.
- Stable IDs, Revisionen und Idempotency Keys duerfen nicht durch UI-generierte
  Zufallslogik ersetzt werden.

## Vertragsfamilien

### Identity, Device und Entitlement

- Account-Erstellung, Login, Session-Erneuerung und Logout.
- Device Authorization/Trust, Widerruf und begrenzte Offline-Berechtigung.
- Profil-/Vault-Zugriff ohne stille Default-Zuordnung.
- Plan, Core-Assist-Kontingent, Quota, Grace, Read-only und Zahlungspruefung.
- Account-/Datenexport, Loeschanforderung und Status.

Normale Local- und Cloud-Nutzung benoetigt einen Account. Detached Recovery ist
der eigenstaendige Exit fuer vorhandene lokale Daten, nicht ein anonymer
Onboardingmodus.

### Vault und Sync

- Vault-Inventar, Autoritaets-/Zugriffsmetadaten und Cloud-Revisionen.
- Payload-/Metadatentransfer und durable Pending Operations.
- Delta-/Sync-Abfragen, Konfliktbasis und Tombstones.
- Local-to-Cloud und Cloud-to-Local mit Inventar, Checkpoint, Resume,
  Finalisierung und Verifikation.
- Export, Restore, Retention und Loeschung als getrennte Operationen.

Der Vertrag darf Cache-Praesenz nie als Vault-Autoritaet interpretieren.

### Capture und Core Assist

Upload-Bestaetigung, asynchrone Verarbeitung und Proposal Review sind getrennte
fachliche Schritte. Der Vertrag muss tragen koennen:

- stabile Capture-, Artifact-, Document- und Processing-Job-IDs.
- ein logisches Dokument mit mehreren Seiten pro abgeschlossener Scan-Einheit.
- mehrere Dokumente in einer technischen Session.
- Groesse, MIME, Hash, Idempotenz und resumable Transfer gemaess Policy.
- Stufenstatus fuer OCR, Extraktion, Indexierung und Matching.
- pro Dokument Teilfehler, Retry, Cancel und Delete.
- konservativen Titel ohne standardmaessiges Datum, grobe Typ-/Domain- und
  Ausstellerkandidaten, typabhaengig vorausgefuellte Datums-/Zeitfelder mit
  Top-Kandidat/Alternativen/`Kein Datum`/manueller Eingabe, genau einen
  Haushalts-Gesamtrechnungsbetrag sowie gerankte Case-/Record-Kandidaten.
- Confidence, Provenance, Modell-/Regelversion und Vorschlagsversion.
- User-Bestaetigung/Korrektur sowie erhaltene akzeptierte Werte.
- ein unveraendertes logisches Dokument pro abgeschlossener Mobile-Scan-Einheit
  beziehungsweise Desktop-Datei; gemischte Semantik erzeugt in M1 weder
  Ablehnung noch `invalid`, `separate_documents_required` oder Auto-Split.

Der von der Nutzerin gewaehlte Managed-Subject-/Verwaltungskontext ist
autoritativ. Ein Case-scoped Upload erscheint sofort in diesem Case und wird
nicht semantisch als Falschzuordnung bewertet. Ein New-Case-Intent ist eine
verbindliche Produktabsicht, waehrend Titel, Case-Familie und zusaetzliche
Links weiterhin Vorschlaege bleiben. Auch bei niedriger Confidence liefert der
Vertrag die besten verfuegbaren Case-/Record-Kandidaten plus manuelle Suche
beziehungsweise Neuanlage. Ein konservativer Titelvorschlag fuer einen neuen
Case ist verpflichtender Bestandteil der Assist-Ausgabe.

Der Vertrag setzt keine semantische Empfaenger-/Profil-, Dokumentkohaerenz-,
Workflow-Zustands-, Frist- oder Beziehungsentscheidung durch das Modell
voraus. Beziehungen sind optionale Best-effort-Vorschlaege und immer
nutzbestaetigt. Die verbindliche Grenze steht in
`../technical/DECISION_INTELLIGENCE_SCOPE.md`.

Local-Vault-Assist darf temporaere Verarbeitung ueber die Cloud verwenden,
ohne daraus dauerhafte Cloud-Vault-Speicherung, Backup oder Modelltraining
abzuleiten. Retention und Loeschbestaetigung muessen explizit vertraglich
definiert sein.

### Advanced Assist

Spaetere Anbieter oder Modelle liegen hinter derselben fachlichen Grenze.
Provider-spezifische Payloads, Prompt-Details und Modellantworten leaken nicht
in Domain oder Presentation. Neue Faehigkeiten benoetigen Datenschutz-, Kosten-
und Qualitaetsfreigabe.

## Versionierung und Kompatibilitaet

- OpenAPI und Examples werden versioniert und reviewt.
- Breaking Changes benoetigen explizite Version/Migration und Client-Rollout-
  Plan.
- Clients behandeln unbekannte optionale Felder tolerant, unbekannte
  sicherheitsrelevante Zustaende jedoch nicht still.
- Capability-/Versionsabfragen duerfen Rollout-Kompatibilitaet unterstuetzen,
  aber keine Produkt- oder Berechtigungsregeln ersetzen.
- Idempotenz- und Retention-Dauern werden vom Contract-/Policy-Owner festgelegt,
  nicht im Frontend erfunden.

## Fehlervertrag

Vertraege liefern stabile maschinenlesbare Fehlercodes und harmlose
Referenz-IDs. Relevante Klassen umfassen:

- Authentifizierung und Autorisierung.
- Entitlement, Quota, Grace und Read-only.
- Validation, Payload-Limit und Unsupported Media.
- Conflict/Revision und Idempotency Replay.
- Retryable Service/Network/Processing Failure.
- Integrity, Retention, Migration und Deletion State.

HTTP-Status allein ist keine ausreichende Produktsemantik. Nutzertexte bleiben
im lokalisierten Frontend; rohe Servertexte werden nicht angezeigt.

## Security und Privacy

- TLS, sichere Tokenbehandlung und plattformgerechter Device Trust sind Pflicht.
- Tokens, Presigned URLs, Dokumentinhalte, OCR-Text und PII landen nicht in
  Logs, Analytics oder Contract Examples.
- Upload- und Download-Berechtigungen sind kurzlebig, eng gescoped und an
  Account, Device, Vault und Operation gebunden.
- Loeschung, Export, Sharing und Migration benoetigen explizite Autorisierung
  und Auditierbarkeit.
- Environments und Tenants sind isoliert; nur synthetische Daten sind in Local
  Development Cloud und Microcks erlaubt.

## Microcks und Integrationsumgebungen

Microcks prueft mindestens:

- akzeptierte Happy Paths und relevante Fehler pro Vertragsfamilie.
- Idempotency Replay, Konflikt und Teilfehler.
- Auth-/Entitlement-/Quota-/Grace-Zustaende.
- Capture Upload, Verarbeitung, Poll/Push-Status und Review-Payloads.
- Migration, Export und Delete-Lifecycle.

Fake-Repositories bleiben fuer App-Logik zustaendig. Local Development Cloud
prueft reale Adapter und Persistenz. Staging prueft managed Deployment,
Security-Konfiguration und End-to-End-Integration.

## Accessibility und Localization

Nicht direkt auf Transportebene anwendbar. Vertraege muessen jedoch stabile
Codes und strukturierte Parameter liefern, damit das Frontend sichere,
lokalisierte und semantisch eindeutige Meldungen erzeugen kann. Servertexte sind
kein Ersatz fuer lokalisierte UI-Texte.

## Tests und Verifikation

- OpenAPI-Lint und Schema-/Example-Validierung.
- Microcks-Szenarien fuer jede akzeptierte relevante Antwortklasse.
- Consumer-Tests fuer Mapping in Domain und F5-Failures.
- Restart-, Idempotenz-, Resume- und Conflict-Tests.
- Security-Tests fuer Zugriffsscope, Token-/URL-Leakage und Tenant-Isolation.
- Integration gegen Local Development Cloud und Staging Smoke Tests.
- Kompatibilitaetsnachweis fuer unterstuetzte Client-Versionen.

## Stop Rules

Stop, wenn:

- Frontend DTOs, Endpunkte, Persistenz oder Policy-Architektur allein festlegt.
- ein Mock oder Fake zum normativen Vertrag wird.
- ein New-Case-Intent als fertige semantische Klassifikation missverstanden
  oder ein usergewaehlter Managed-Subject-/Case-Kontext vom Modell
  ueberstimmt wird.
- Assist implizit Cloud-Backup oder unbefristete Retention aktiviert.
- ein Breaking Change ohne Versionierungs-/Rolloutplan erscheint.
- Contract Examples echte oder anonymisierte private Daten enthalten.
- Fehler nur durch freie Servertexte oder HTTP-Status beschrieben werden.

## Handoff

Konkrete OpenAPI-/Microcks-Arbeit geht an `contract-api`; App-Adapter an
`data-architect`/`foundation-builder`; UI-Verhalten an `ui-architect` nach
geprueftem Konzept und Plan.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die betroffene Phase stoppt.
