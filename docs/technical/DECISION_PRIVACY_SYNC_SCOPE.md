---
title: "Decision - Privacy and Remote Data Scope"
description: "Datenklassifikation und Trust-Grenzen fuer Local/Cloud Vault, Core Assist, Sync, Backup, Export und Telemetry"
tags: [decision, privacy, sync, cloud, data-classification, assist]
lastUpdated: "2026-07-15"
status: "accepted-direction-trust-details-open"
owner: "security/privacy/product"
---

# Decision - Privacy and Remote Data Scope

## Entscheidung

Mappm klassifiziert Daten nach Schutzbedarf und Verarbeitungszweck. Eine
Datenklasse allein erlaubt keine Uebertragung: Vault-Modus, konkrete Operation,
Rechtsgrundlage/Einwilligung, Entitlement, Empfaenger, Verschluesselung,
Retention und User-Aktion bestimmen gemeinsam die zulaessige Verarbeitung.

## Datenklassen

| Klasse | Beispiele | Mindestregel |
|---|---|---|
| `account` | Account-ID, Plan, Device Trust, Session | getrennt von Dokumentinhalt; eng gescoped |
| `personal` | Name, Kontakt, Profil, Haushalt/Organisation | nur fuer benoetigten Managed-Subject-Kontext |
| `sensitiveMetadata` | Absender, Betrag, Frist, Case-/Record-Titel | keine unredigierte Telemetry/Notification |
| `specialCategory` | Gesundheits-, Versicherungs-, Identitaets- und vergleichbare Daten | besondere Rechts-/Security-Pruefung |
| `documentPayload` | Scan, PDF, Bild, Anhang | Vault-/Operation-spezifische Payload-Policy |
| `derivedContent` | OCR-Text, Fakten, Embeddings, Titel, Kandidaten | gleich sensibel wie Quelle oder strenger |
| `secret` | Token, Key, Recovery Secret, Presigned URL | Secure Storage/kurzlebig; nie normale Sync-Daten |
| `diagnostic` | Referenzcode, redigierter Stage-/Failure-Code | keine fachlichen Labels/Inhalte |

Eine Phase darf Klassen verfeinern, aber keine niedrigere Schutzstufe ohne
Security-/Privacy-Entscheidung annehmen.

## Zweckgrenzen

### Local Vault

Metadaten und Dateien bleiben lokal autoritativ. Account-/Entitlementdaten
duerfen den Service nutzen. Core Assist uebertraegt nur die fuer den expliziten
Processing-Auftrag benoetigten Daten gemaess Trust-/Retention-Vertrag. Daraus
entstehen kein Cloud Vault, kein Backup und kein Sync.

### Cloud Vault

Mappm Cloud ist Autoritaet fuer aktivierte Vault-Daten, Sync und Managed
Backup/Restore. Clientcache und Pending Operations folgen separaten
Retention-/Encryption-Regeln. Cloud-to-Local, Export und Loeschung bleiben
auch in Grace/Read-only erreichbar.

### Core/Advanced Assist

Assist ist eine eigene Verarbeitungsgrenze. Provider, Region, Klartextzugriff,
Training, Subprozessoren, Retention, Loeschbestaetigung und Telemetry werden vor
echten Dokumenten akzeptiert. Trainingsverwendung echter Dokumente ist nicht
erlaubt. Advanced Assist benoetigt eine neue Applicability-Pruefung.

### Export, Sharing und externe Aktionen

Export ist eine bewusste User-Aktion mit sichtbarem Umfang. Sharing benoetigt
separate Empfaenger-, Rechte-, Ablauf-, Widerrufs- und Auditregeln. Externe
Portale liegen ausserhalb der Mappm-Vertrauensgrenze.

### Telemetry und Support

Keine Dokumentinhalte, OCR-Texte, Suchqueries, fachlichen Titel, Beträge,
Kontakte, Kandidatenlabels, Secrets oder direkten Identifier. Supportpakete
benoetigen Preview, Redaction und explizite Freigabe.

## Offene Trust-Entscheidungen

Konkrete Kryptographie, Key Ownership/Recovery, Providerregionen,
Subprozessoren, Retention-Dauern und E2EE-/Zero-Knowledge-Faehigkeit bleiben in
den VC-/SEC-/DATA-Gates offen. Keine Phase darf aus diesem Richtungsentscheid
eine fertige Verschluesselungs- oder Rechtsgrundlage ableiten.

## Tests und Stop Rules

- Data-flow-/Threat-Model pro aktivierter Operation.
- Tests fuer Redaction, Tenant-/Vault-Isolation, Export und Delete.
- Contract-/Provider-Nachweis fuer Retention und Zweckbindung.
- synthetische Fixtures; keine anonymisierten privaten Dokumente.

Stop, wenn Datenklasse als pauschale Sync-/Assist-Erlaubnis verwendet wird,
Assist Backup impliziert, Secrets normal repliziert werden oder Provider,
Region, Retention beziehungsweise Rechtsgrundlage fuer echte Daten offen sind.
