---
title: "Konzept F12 - Secure Storage"
description: "Mappm Secure Storage fuer Local/Cloud keys, account/device sessions, migration checkpoints and trust boundaries"
tags: [concept, foundation, secure-storage, security, sessions, cloud, keys]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F12 - Secure Storage

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Normative Secret Boundary

Customer Home-Hub pairing secrets are superseded. Secure Storage may contain
Local Vault key material, Cloud access/refresh tokens, device credentials,
wrapped key references, recovery state and sensitive migration credentials.
Normal Drift/cache stores contain no usable secrets. Managed Trust versus
Zero-Knowledge/E2EE remains VC-02; no implementation may invent key ownership,
recovery or server-decryption behavior before approval.

Dieses Konzept ersetzt den importierten F12-Inhalt aus dem alten Projekt.

## Legacy Detail Baseline (non-normative)

The remaining imported detail is retained only for migration context and useful
feature-specific examples. It must not authorize Home Hub, Tailscale, customer
self-hosting, universal local-first authority, old milestone scope or QR server
pairing. Where it differs, the rebaseline above,
`DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`,
`DECISION_COMMERCIAL_CORE_SCOPE.md` and F36 are authoritative. Before this
concept is used for implementation, its affected detail must be rewritten into
the phase's approved implementation contract.

Normative rebaseline: every normal Local and Cloud mode stores account/device
session and entitlement material in Secure Storage. Local content keys remain
device/recovery scoped so Detached Recovery cannot depend solely on a live
account token. Assist upload/job credentials are separate from Vault keys and
must not imply Cloud document authority.

## Zweck

F12 definiert, welche sicherheitskritischen Daten DocMan lokal geschützt speichern muss.

F10 speichert normale lokale App-Daten und Dateien. F12 speichert Geheimnisse.

## Secure-Storage-Daten

| Datum | Zweck | M2 |
|---|---|---|
| Device ID Secret | Gerät stabil identifizieren, ohne es als Klartext-Geheimnis zu behandeln | Ja |
| Pairing Secret | Mobile/Desktop mit Home Hub koppeln | Ja |
| Session Token | authentifizierte Home-Hub-Kommunikation | Falls Login/Pairing umgesetzt |
| Refresh Token | spätere längere Sessions | Später |
| Local Encryption Key | spätere lokale Verschlüsselung sensibler Daten | Prüfen |
| Sync Device Key | spätere Sync-/Signatur-/E2E-Modelle | Später |

Nicht in Secure Storage:

- Cases.
- Documents.
- Drafts.
- Upload Queue Metadaten.
- nicht geheime Settings.
- Dateiinhalte, solange keine Verschlüsselungsentscheidung getroffen ist.

## Grundsatz

Secrets dürfen nicht in:

- normaler lokaler DB.
- Shared Preferences.
- Logs.
- Crash Reports.
- URL Query Parametern.
- UI-State.

App-Code greift nicht direkt auf OS-Keychain/KeyStore zu. Zugriff läuft über ein SecureStorageRepository.

## Plattformziel

DocMan ist Desktop + Mobile.

Secure Storage muss diese Plattformen unterstützen:

- macOS.
- Windows.
- Linux Desktop.
- iOS.
- Android.

Web ist aktuell kein Ziel.

## Repository-Grenze

```text
Feature Provider / Application
  -> SecureStorageRepository Contract
      -> Secure Storage Implementation
          -> OS Keychain / Credential Store / KeyStore
```

Regeln:

- F12 definiert Speicherung, nicht den kompletten Auth-Flow.
- Pairing/Auth-Provider aus F2 nutzen F12.
- F11 API-Clients erhalten Tokens nur über sichere Infrastruktur.
- Tests verwenden In-Memory-Fakes.

## Pairing

Mobile Capture nutzt im M2 Pairing statt Login. Der lokale Desktop-M2 erzwingt kein klassisches Login.

Pairing muss:

- ein Gerät eindeutig freigeben.
- widerrufbar sein.
- ohne Cloud-SaaS funktionieren.
- Home-Hub-Adresse und geheime Kopplung trennen.

F10 darf die nicht geheime Home-Hub-Adresse speichern. F12 speichert das Pairing Secret.

## Session-Verhalten

M2 darf einfach starten:

- gekoppelte Geräte speichern Secret.
- Home Hub akzeptiert Capture Uploads nur von freigegebenen Geräten.
- ungültiges Secret erzeugt AuthFailure nach F5.

Später kann daraus ein vollständiger Session-/Refresh-Flow werden.

## Linux-Fallback

Linux Secure Storage kann je nach Desktop-Umgebung schwieriger sein.

Regel:

- Produktpfad soll sichere Speicherung erwarten.
- Development darf In-Memory-Fallback haben, wenn klar sichtbar.
- Stiller unsicherer Persistenz-Fallback ist nicht erlaubt.

## Verlust und Recovery

Wenn Secure Storage verloren geht:

- lokale App-Daten bleiben erhalten.
- Home-Hub-Verbindung muss neu gekoppelt werden.
- Upload Queue darf nicht gelöscht werden.
- nicht hochgeladene Dateien bleiben lokal sichtbar.

## Definition of Done für F12

F12 gilt als umgesetzt, wenn:

- Secrets nicht in F10 landen.
- SecureStorageRepository existiert.
- Pairing-/Session-Secrets geschützt gespeichert werden.
- Tests ohne OS-Keychain laufen können.
- Fehler in Secure Storage als F5-Failures sichtbar werden.
- Logout/Unpair Secrets löscht, ohne lokale Dokumente zu zerstören.

## Offene Folgefragen

- Welches Flutter-Package wird konkret genutzt?
- Welche Secrets müssen zwischen Desktop und Mobile getrennt sein?
- Wird lokale Datei-/DB-Verschlüsselung im M2 geprüft oder verschoben?

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
