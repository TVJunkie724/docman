---
title: "Konzept F7 - Logging"
description: "Privacy-sicheres strukturiertes Logging fuer Client, Managed Cloud, Capture, Migration und Support"
tags: [concept, foundation, logging, diagnostics, privacy, cloud]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted"
owner: "quality-readiness/security"
---

# Konzept F7 - Logging

## Zweck und Abgrenzung

F7 definiert technische Logkategorien und Redaction. F18 besitzt Telemetry,
Audit, Notifications, Correlation und Observability. Logs sind weder Audit Trail
noch Produktanalytics.

## Grundsaetze

- Privacy gewinnt gegen Diagnosebequemlichkeit.
- Strukturiert loggen: Eventcode, Severity, Environment, Component,
  Correlation-ID und redigierte technische Attribute.
- Nutzertexte, Exceptiontexte und Providerpayloads werden nicht blind geloggt.
- Production ist standardmaessig sparsam; Debug-Level ist zeitlich/gezielt und
  darf Redaction nie deaktivieren.
- Local Development Cloud, Development, Staging und Production verwenden
  getrennte Sinks/Zugriffe. Productiondaten werden nie in Dev kopiert.

## Erlaubt

- App-/Service-Version und sicherer Environment-Key.
- Start/Shutdown und Komponenteninitialisierung.
- redigierte Storage-/Schema-/Migrationsresultate.
- Capture-/Upload-/Processing-Stufe ohne Inhalt oder fachliche Labels.
- Retryzahl, grobe Dauer, Failure-/Referenzcode.
- Vault-Modus ohne Name, Titel oder direkte Account-ID.
- Cache/Pending/Quota/Entitlement als grobe technische Klasse.

## Verboten

- Dokumentinhalt, OCR-Text, Prompt, Modellantwort oder Suchquery.
- Dokument-, Case-, Record-, Personen- oder Organisationsname.
- Betrag, Diagnose, Versicherungs-/Ausweis-/Kontaktdaten.
- Tokens, Keys, Recovery Secrets, Cookies oder Presigned URLs.
- private Dateipfade/Dateinamen und rohe HTTP-/SDK-Payloads.
- direkte Account-, Tenant- oder Device-Identifier ohne akzeptierte
  Pseudonymisierung.

Derived Content erbt mindestens die Schutzklasse seiner Quelle.

## Kategorien

| Kategorie | Beispiele |
|---|---|
| `app` | Lifecycle, Version, Configuration Validation |
| `storage` | DB/Schema, File Store, Integrity |
| `capture` | Artifact durable, Boundary Stage, Queue |
| `processing` | OCR/Extract/Index/Match Stage |
| `cloud` | Contract/Transport/Revision ohne Payload |
| `identity` | Session/Device/Entitlement Code |
| `migration` | Inventory/Checkpoint/Verify |
| `security` | redigiertes Policy-/Integrity-Ereignis |
| `ui` | unerwarteter Render-/Navigationfehler ohne Inhalt |

## Lokale Logs und Diagnoseexport

Lokale Logs sind begrenzt, rotierend und pro Environment/Vault-Kontext
geschuetzt. Ein Diagnoseexport benoetigt Preview, Redaction, explizite
User-Freigabe, definierte Retention und einen sichtbaren Scope. Dokumente/OCR
werden nie automatisch beigefuegt.

## Fehlerbehandlung

F5-Failures liefern stabile sichere Codes. Logging darf technische Ursache und
Correlation aufnehmen, aber keine rohe Exception an UI oder Support geben.
Wiederholte identische Fehler werden rate-limited/aggregiert, ohne einen
Incident zu verschleiern.

## Tests und Verifikation

- Redaction-Tests mit synthetischen PII-/Secret-Markern.
- Snapshot-/Schema-Tests fuer strukturierte Events.
- Negative Tests fuer Exception-, HTTP-, Dateipfad- und Providerpayload-Leaks.
- Environment-/Sink-Isolation.
- Rotation/Retention und Diagnoseexport-Scope.
- Correlation ueber Retry/Restart ohne fachliche Identifier.

## Stop Rules

Stop, wenn private Inhalte/Labels oder Secrets logbar sind, Debug Redaction
umgeht, Productiondaten in Dev-Sinks gelangen oder Support ohne Preview einen
ungeprueften Logexport erzeugt.

## Handoff

Implementierung/Gates an `quality-readiness`, Failure-Mapping an
`frontend-error-handling`, Backendinstrumentierung in ein separates
Operations-/Backend-Issue.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die Phase stoppt.
