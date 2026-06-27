---
title: "Decision - Trust, Encryption and Deployment Model"
description: "Entscheidung zur private-first Produktarchitektur, austauschbaren Daten-/Processing-Modi, Verschluesselung, Trust Boundaries und eID-faehiger Identity-Schicht"
tags: [decision, trust, encryption, deployment, cloud, local-first, identity, eidas, eudi, id-austria, intelligence]
lastUpdated: "2026-06-27"
status: "accepted"
---

# Decision - Trust, Encryption and Deployment Model

## Status

Accepted.

Diese Entscheidung erweitert die bisherige Local-first-Richtung. Ordna bleibt
lokal nutzbar, wird aber als private-first Dokumentenplattform geplant, weil
Sync, Backup, Sharing und intelligente Assistenz dauerhaft Backend- und
Processing-Faehigkeiten brauchen.

## Entscheidung

Ordna wird als **private-first, offline-capable, service-ready** Produkt
gebaut.

Local-only ist ein unterstuetzter Betriebsmodus, aber nicht das vollstaendige
Produktziel. Fuer automatische Dokumenterkennung, OCR, LLM-Assistenz, Cloud-
Backup, Account-Sync und account-uebergreifendes Sharing braucht Ordna eine
explizit modellierte Service-Schicht.

Die Service-Schicht darf aber nicht bedeuten, dass die Cloud automatisch die
fachliche Klartext-Wahrheit aller sensiblen Daten wird.

```text
Ordna Client
  -> lokale Arbeitsfaehigkeit
  -> lokaler Cache / lokale Replik
  -> lokale Verschluesselungs- und Review-Grenzen

Ordna Data / Sync Layer
  -> austauschbare Storage- und Sync-Implementierungen
  -> local-only, Home Hub, Managed Cloud oder Hybrid

Ordna Processing Layer
  -> none, on-device, Home Hub/private server oder Managed Intelligence

Ordna Trust Layer
  -> Keys, Recovery, Sharing, Identity Provider, Audit und Freigaben
```

Damit ist die Produktposition:

```text
Private-first:
  Nutzerinnen behalten Kontrolle ueber Dokumente und Zugriffsrechte.

Offline-capable:
  Kernarbeit bleibt lokal moeglich, solange der gewaehlte Modus das erlaubt.

Service-ready:
  Sync, Backup, Sharing und Intelligence koennen ueber private oder managed
  Dienste laufen.
```

## Betriebsmodi

Ordna muss mehrere Betriebsmodi tragen koennen.

| Modus | Rolle | Datenhaltung | Processing |
|---|---|---|---|
| Local-only | privater Einzelgeraete-Modus | lokal | none oder on-device |
| Private Home Hub | Haushalt / eigene Infrastruktur | lokale Replik plus privater Server | Home Hub / privater Worker |
| Managed Ordna Cloud | komfortabler Account-Sync, Backup, Sharing | lokale Replik plus managed Sync/Backup | Managed Intelligence optional |
| Hybrid | offlinefaehiger Client mit ausgewaehlten Diensten | je nach Policy | je nach Freigabe |

Local-only darf nicht entfernt werden, aber es ist nicht die einzige
Zielarchitektur.

## Austauschbarer Data Layer

Der Data Layer wird nicht als einzelnes Repository gedacht, sondern als mehrere
Ports mit austauschbaren Implementierungen.

```text
MetadataStore
  Drift/local, remote API, hybrid sync store

DocumentBlobStore
  local file store, Home-Hub storage, S3/MinIO, encrypted cloud store

SecretStore
  OS Keychain/Keystore/Secure Storage only

SyncEngine
  local-only, device sync, household sync, account sync

ProcessingService
  none, on-device, Home Hub, managed cloud

KeyManagement
  device keys, account keys, household/data-room keys, document content keys,
  recovery keys and sharing key wrapping

IdentityProvider
  local profile, passkey, eIDAS/EUDI provider, ID Austria as first Austrian
  provider, future national or federated providers
```

Presentation und Domain duerfen nicht wissen muessen, ob Drift, S3, MinIO,
HTTP, ein Home Hub oder ein Managed Service die konkrete Implementierung ist.
Sie arbeiten gegen Domain-Interfaces und Provider.

## Datenklassen

Ordna unterscheidet mindestens diese Datenklassen:

| Klasse | Beispiele | Grundregel |
|---|---|---|
| accountOps | Account, Abo, Quotas, Device-Status, Audit-Ereignisse | serverseitig lesbar, aber minimiert |
| normalMetadata | Status, Tags, einfache Aufgaben | syncbar mit Zugriffskontrolle |
| sensitiveMetadata | Dokumenttitel, Absender, Datum, Betrag, Frist, Adresse | syncbar, nicht in Logs/Push/Telemetry |
| highlySensitiveMetadata | Ausweisnummern, SV-/Versicherungsnummern, medizinische Details | verschluesselungs- und redaction-faehig modellieren |
| documentPayload | PDFs, Scans, Fotos, Originaldateien | payload-key-faehig, nicht als normaler DB-Blob |
| ocrDerived | OCR-Rohtext, Klassifikation, LLM-Vorschlaege, extrahierte Fakten | eigene Trust Boundary, loeschbar, reviewpflichtig |
| secret | Tokens, Pairing-Secrets, Recovery Keys, Content Keys | nur Secure Storage / Key Management, nie normale DB |

Diese Klassen ergaenzen `DECISION_PRIVACY_SYNC_SCOPE.md`; sie ersetzen sie
nicht.

## Verschluesselungsmodell

Ordna muss E2EE-/Zero-Knowledge-faehig geplant werden, auch wenn nicht jede
Verschluesselungsstufe im M2 implementiert wird.

Regeln:

- Dokumentdateien werden so gespeichert, dass verschluesselte Payloads moeglich
  sind.
- Strukturierte sensible Metadaten werden so modelliert, dass spaetere
  Feldverschluesselung moeglich bleibt.
- Secrets, Tokens und Keys liegen nie in normalen Tabellen, Logs oder Sync-
  Journalen.
- Der Server darf fuer Sync, Backup und Sharing benoetigte Betriebsdaten sehen,
  aber nicht automatisch alle Nutzdaten im Klartext.
- Backup ist eine Produktfunktion mit sichtbarem Status, Restore-Test und
  Recovery-Konzept.
- Sharing wird als Key- und Rechteproblem modelliert, nicht als blosse
  Dateikopie.

Zielrichtung fuer Keys:

```text
Device Key
  schuetzt lokale Geraetegeheimnisse

Account/User Key
  verbindet Account und berechtigte Geraete

Household/Data-Room Key
  schuetzt gemeinsam genutzte Datenraeume

Document Content Key
  verschluesselt einzelne Dokument-Payloads oder Dokumentgruppen

Recovery Key / Recovery Kit
  ermoeglicht Wiederherstellung ohne stille Anbieter-Klartextmacht

Sharing Key Wrapping
  gibt Content Keys an berechtigte Accounts/Geraete weiter
```

Die genaue Kryptografie, Bibliotheken und Recovery UX werden spaeter separat
entschieden. Diese Entscheidung legt die Architekturpflicht fest.

## Intelligence Trust Boundary

OCR, Mapping und LLM-Funktionen brauchen Klartext oder entschluesselte
Zwischendaten. Deshalb sind sie nicht dasselbe wie verschluesselter Sync.

Ordna unterscheidet:

```text
Speichern / Sync / Backup
  bevorzugt verschluesselt, serverseitig moeglichst ohne Klartextzugriff

Intelligente Analyse
  braucht je nach Modus temporaeren Klartextzugriff
```

Processing-Ziele:

| Ziel | Privacy | UX / Aufwand |
|---|---|---|
| on-device | sehr privat | hardwareabhaengig, begrenzte Leistung |
| Home Hub / private server | privat kontrollierbar | Setup- und Hardwareaufwand |
| Managed Intelligence | beste Komfort-UX | explizite Trust Boundary noetig |

Managed Intelligence darf nur mit klaren Regeln geplant werden:

- Verarbeitung nur im gewaehlten Modus oder nach expliziter Freigabe.
- Keine Nutzung privater Dokumente fuer Training ohne separate, bewusste
  Zustimmung.
- Kurze und dokumentierte Retention fuer Processing-Artefakte.
- Loeschbare OCR-/LLM-Ergebnisse.
- Keine sensiblen Inhalte in Logs, Telemetry oder Supportpaketen.
- Vorschlaege bleiben reviewpflichtig nach
  `DECISION_ASSISTED_REVIEW_SUGGESTIONS.md`.

## Identity, eIDAS, EUDI und ID Austria

Ordna trennt Identity von Datenzugriff.

```text
Identity Provider beantwortet:
  Wer ist diese Person?

Key Management beantwortet:
  Welche Daten darf diese Person oder dieses Geraet entschluesseln?
```

ID Austria ist ein sinnvoller erster vertrauensstarker Provider fuer
Oesterreich. Sie darf aber nicht als nationaler Sonderfall in den Domain-Kern
eingebrannt werden.

Ordna plant eine generische eID-faehige Identity-Schicht:

```text
TrustedIdentityProvider
  -> passkey
  -> local account
  -> eIDAS-notified national eID
  -> EU Digital Identity Wallet / EUDI
  -> ID Austria as first Austrian provider
  -> future national or federated providers
```

Regeln:

- ID Austria ist optional und nicht Voraussetzung fuer lokale Nutzung.
- eIDAS-/EUDI-Faehigkeit wird als Architekturziel vorbereitet.
- ID Austria kann Account-Verifikation, Profil-Verifikation, Sharing,
  Recovery-Freigaben, High-Risk Actions und spaetere qualifizierte Signaturen
  absichern.
- Kryptografische Zugriffsrechte bleiben im Ordna-Key-Management.
- Profile, Login/Identity und Management Grants bleiben getrennt gemaess
  `DECISION_PROFILE_IDENTITY_AND_MANAGEMENT.md`.

## Produktfolgen

Ordna wird nicht mehr nur als "local-first Dokumenten-App" beschrieben.

Bessere Produktformulierung:

```text
Ordna ist eine private Dokumentenplattform mit lokalem Offline-Client,
austauschbaren Daten- und Processing-Modi, verschluesseltem Sync/Backup/Sharing
und optionaler intelligenter Assistenz.
```

Fuer Nutzerinnen kann das in Modi sichtbar werden:

```text
Ordna Lokal
  Dokumente lokal verwalten, ohne Cloud oder Account-Zwang.

Ordna Privat
  Home Hub / eigener Server fuer Sync, Backup und private Verarbeitung.

Ordna Cloud
  komfortabler Account-Sync, Backup, Sharing und optionale Managed
  Intelligence mit klarer Trust Boundary.
```

## Konsequenzen

- `DECISION_DATA_FLOW.md` bleibt gueltig, muss aber als Local-only/Private-
  first Baseline verstanden werden, nicht als Ausschluss spaeterer Managed-
  Betriebsformen.
- Der Data Layer muss ueber Ports/Provider austauschbar bleiben.
- Sync, Backup, Sharing und Processing duerfen nicht als nachtraegliche
  Sonderfaelle an lokale Repositories angeflanscht werden.
- API- und Domain-Modelle muessen verschluesselte Payloads, Key Wrapping,
  Sharing Grants, Device Grants, Recovery und Processing Jobs vorbereiten.
- Identity Provider werden generisch modelliert; ID Austria ist ein erster
  oesterreichischer Provider, nicht die einzige Identitaetsarchitektur.
- Intelligence ist fuer die volle Assistenz-UX eine Kernfaehigkeit, aber sie
  laeuft ueber eine explizite Processing- und Trust-Grenze.

## Nicht entschieden

- konkrete Kryptografie und Bibliotheken.
- konkrete Recovery UX und Recovery-Key-Verwahrung.
- konkrete Managed-Cloud-Produktpolitik und Preismodell.
- genaue eIDAS-/EUDI-/ID-Austria-Integrationsreihenfolge.
- ob Managed Intelligence standardmaessig pro Datenraum, Dokumenttyp oder
  einzeln freigegeben wird.
- konkrete Retention-Zeiten fuer Processing-Artefakte.
- genaue Rollenmatrix fuer Sharing und Haushaltszugriff.

