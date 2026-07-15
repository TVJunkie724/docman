---
title: "Konzept F12 - Secure Storage"
description: "Secure-Storage-Grenze fuer Vault Keys, Account-/Device-Sessions, Assist, Migration und Recovery"
tags: [concept, foundation, secure-storage, security, sessions, cloud, keys]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted-trust-details-open"
owner: "security/data-architect"
---

# Konzept F12 - Secure Storage

## Status

Die Speichergrenze ist akzeptiert. Konkretes Key Ownership, Recovery,
Server-Decryption und Managed-Trust-versus-E2EE/Zero-Knowledge bleiben durch
VC-02/SEC-Gates offen. Keine Implementierung darf diese Details erfinden.

## Zweck

F12 trennt Secrets und Schluesselmaterial von Drift, File Store, UI-State,
Logs und normaler Konfiguration. App-Code greift ueber einen Port auf
plattformspezifische Keychain/Keystore/Credential Stores zu.

```text
Application/Data Adapter
  -> SecureStoragePort
      -> Platform Secure Storage
      -> In-memory Fake fuer Tests
```

## Zulaessige Daten

- Account Access-/Refresh-/Offline-Session-Material.
- widerrufbare Device-Credentials/Trust-Referenzen.
- Local-Vault-Keymaterial oder wrapped Key References gemaess akzeptiertem
  Kryptomodell.
- Cloud-/Assist-Job-Credentials und kurzlebige Uploadtickets, falls lokal
  persistiert werden muessen.
- Recovery-/Migration-Credentials und sichere Checkpoint-Referenzen.

Nicht in Secure Storage gehoeren Domain Entities, Dokumente, OCR-Texte,
Upload-Queue-Metadaten, normale Settings oder grosse Payloads.

## Regeln

- Keine Secrets in SQLite, Shared Preferences, Env-Dateien, Dart Defines,
  URLs, Logs, Crash Reports oder Provider-State.
- Secure-Storage-Eintraege sind nach Instanz, Environment, Account, Device und
  Vault gescoped, soweit fachlich notwendig.
- Assist-Credentials sind von Vault-Keys getrennt und begruenden keine
  Cloud-Autoritaet.
- Local Content Keys bleiben so recovery-faehig, dass Detached Recovery nicht
  nur von einem aktiven Accounttoken abhaengt.
- Logout, Device-Revoke, Account Delete und Vault Delete besitzen getrennte
  Secret-Cleanup-Regeln und loeschen keine Dokumente als Nebenwirkung.
- Es gibt keinen stillen unsicheren Persistenz-Fallback. Development darf einen
  klar markierten In-memory Fake verwenden.

## Plattform

Aktivierte Plattformen muessen vor Release ihre Secure-Storage-
Implementierung, Lock-/Biometrie-/Backup-Eigenschaften und Fehlerfaelle
nachweisen. Windows/Linux werden erst aktiviert, wenn ein sicherer Adapter und
Recovery-Verhalten freigegeben sind. Web ist nicht automatisch eingeschlossen.

## Verlust und Recovery

Bei verlorenen/ungueltigen Secrets bleiben Originaldaten unangetastet.
Account-/Device-Credentials koennen Reauth verlangen. Ein Local-Vault-Keyverlust
darf nicht durch stilles Neuanlegen kaschiert werden; die App zeigt einen
Integrity-/Recovery-State. Pending Uploads bleiben erhalten, soweit ihr lokales
Original zugaenglich ist.

## Security und Privacy

- Secrets werden im Speicher nur so lange wie noetig gehalten und nicht in
  Debug UI/DevTools exponiert.
- Reveal/Export von Recoverymaterial ist eine eigene reauthentifizierte Aktion.
- Key Rotation, Backup, Recovery und Loeschung brauchen atomare, auditable
  Transitionen.
- Keine echten Secrets in Fixtures, Screenshots oder Contract Examples.

## Tests und Verifikation

- Port-/Adaptertests pro aktivierter Plattform.
- Missing/locked/corrupt/revoked/rotated Credential.
- Logout/Reauth/Device-Revoke ohne Datenverlust.
- Detached-Recovery- und Local-Key-Verlustpfad.
- Environment-/Account-/Vault-Isolation.
- Negative Scans fuer Secret-Leaks in DB, Config, Logs und State.
- Production-Fail-closed bei fehlendem sicherem Adapter.

## Stop Rules

Stop, wenn Key Ownership/Recovery offen ist, ein unsicherer Fallback persistiert,
Secrets in normalen Stores/Logs landen, Logout Daten loescht oder Local
Recovery ein Live-Service-Token zwingend benoetigt.

## Handoff

Kryptographie/Trust an Security Owner, Persistenzadapter an `data-architect`,
Umsetzung an `foundation-builder`, Nachweise an `quality-readiness`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die Phase stoppt.
