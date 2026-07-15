---
title: "Decision - Export Baseline and Deferred Secure Sharing"
description: "Bewusster Export als Commercial-Core-Baseline; sicheres Sharing bleibt eigener spaeterer Trust-Slice"
tags: [decision, export, sharing, privacy, portability, external-access]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "product-concept/security"
---

# Decision - Export Baseline and Deferred Secure Sharing

## Entscheidung

Mappm liefert im Commercial Core einen bewussten lokalen Export und einen
vollstaendigen Cloud-Exit. Account-zu-Account-Sharing und zeitlich begrenzte
Freigaben sind geplant, aber keine Nebenwirkung des Exportflows. Sie werden erst
in R14 nach eigenem Trust-/Rights-/Contract-/Revocation-/Audit-Gate aktiviert.

## Exportformen

- einzelnes Dokument als Originaldatei.
- mehrere ausgewaehlte Dokumente als Paket.
- Case-/Record-Export mit optionalem Manifest und bestaetigten Metadaten.
- vollstaendiger Vault-/Account-Datenexport gemaess Policy/Betroffenenrecht.
- Cloud-to-Local-Migration als verifizierter Autoritaetswechsel, getrennt vom
  einfachen Export.

Export dupliziert keine fachliche Besitzstruktur in Mappm. Nach lokaler Uebergabe
an Mail, Portal, Druck, Share Sheet oder Datentraeger liegt der externe Versand
ausserhalb der Mappm-Vertrauensgrenze.

## Secure Sharing als eigener Slice

Vor Aktivierung muessen entschieden und getestet sein:

- Empfaengeridentitaet und Berechtigung.
- Objekt-/Action-Scope, Ablauf und Widerruf.
- Verschluesselung, Key-/Download-Modell und Reauth.
- Copy/Download/Weitergabe-Grenzen und transparente Nicht-Garantien.
- Audit, Notifications, Retention, Loeschung und Betroffenenrechte.
- Missbrauch, verlorener Zugriff, Account-Loeschung und Support.

Ein Exportlink, unbefristeter Object-Storage-Link oder externes Rollenmodell ist
kein zulaessiger Shortcut.

## Security und Privacy

- Vor Export zeigt die UI Umfang, Profile/Vaults, Dateizahl und sensible
  Konsequenz.
- Archive/Manifeste enthalten nur bewusst gewaehlte Daten.
- Temporare Exportartefakte besitzen sichere Ablage und Cleanup.
- Keine Dokumenttitel/-inhalte in globalen Notifications, Logs oder Audit.
- Kuendigung/Quota blockiert erforderlichen Export/Cloud-to-Local nicht.

## Tests und Stop Rules

- Einzeldokument, Paket, kompletter Export, Abbruch, Speicherfehler und Cleanup.
- Multi-Profile-/Vault-Scope und keine unbeabsichtigte Datenbeimischung.
- Integritaet/Manifest und Restore-/Import-Lesbarkeit, soweit zugesichert.
- Export nach Kuendigung/Grace/Read-only.

Stop, wenn Sharing still ueber Export aktiviert wird, unbefristete Links ohne
Revocation entstehen, Exportprofile vermischt oder Exit durch Entitlement
blockiert wird.
