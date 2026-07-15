---
title: "Konzept F13 - Configuration Pages"
description: "Ruhige Settings-UX fuer Account, Devices, Vault, Assist, Migration, Recovery, Profile und Diagnose"
tags: [concept, configuration, ux, settings, account, vault, assist, cloud, recovery]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted"
owner: "ui-concept"
---

# Konzept F13 - Configuration Pages

## Zweck

F13 definiert fachliche Settings-Flaechen. Einstellungen sind eine
Arbeits-/Kontrolloberflaeche, kein Marketingbereich und kein Ort fuer
Customer-Server-URLs oder Entwicklerkonfiguration.

## Bereiche

| Bereich | Nutzerzweck |
|---|---|
| Account und Plan | Account, Session, Free/Paid, Quota, Billing-/Grace-Status |
| Autorisierte Geraete | aktive Geraete/Sessions ansehen und widerrufen |
| Vaults und Speicher | Autoritaet, lokale Verfuegbarkeit, Cache, Speicherbedarf |
| Assist | Verarbeitung, Kontingent, Datenschutzinfo, Opt-out/manueller Fallback |
| Migration und Recovery | Local-to-Cloud, Cloud-to-Local, Export, Detached Recovery |
| Backup und Restore | letzter nachgewiesener Status, Fehler, Restore-/Exit-Aktion |
| Profile und Kontexte | verwaltete Personen/Organisationen und Zugriffe |
| Notifications | Reminder-Kanaele, Privacy und Plattformberechtigung |
| Datenschutz und Daten | Export, Loeschung, Retention, Einwilligungen/Notices |
| Diagnose und Support | Version, sichere Referenzcodes, redigiertes Supportpaket |
| Allgemein | Sprache, Theme und nicht fachliche Praeferenzen |

Nur Bereiche, die fuer Modus, Plattform und Entitlement anwendbar sind, werden
angezeigt. Nicht aktivierte Zukunftsfunktionen erscheinen nicht als leere
Settings.

## Vault- und Assist-Regeln

- `Auf diesem Geraet` und `Mappm Cloud` zeigen Autoritaet und Konsequenzen
  eindeutig.
- Ein Providerwechsel startet F36-Migration mit Preflight, Fortschritt,
  Verifikation und Recovery; er ist nie ein Toggle.
- Assist-Opt-out oder Quota aendert weder Vault-Autoritaet noch Backup.
- Local Vault ohne Cloud-Backup wird nicht als Fehler dargestellt.
- Cloud Cache, lokales Original und Cloud-Speicherung werden textlich getrennt.

## Account, Kuendigung und Loeschung

Settings trennen:

- Logout/Session beenden.
- Device widerrufen.
- Plan kuendigen/downgraden/reaktivieren.
- Vault exportieren oder migrieren.
- Vault loeschen.
- Account loeschen.

Jede destruktive Aktion nennt Scope, Folgen, Fristen und verbleibende
Recovery-/Exportmoeglichkeit. Account-Loeschung darf lokale Daten nicht still
remote loeschen.

## Progressive Disclosure

Standardansichten zeigen Status, Handlungsbedarf und naechste Aktion. Technische
IDs, Contract-Versionen, Queue-Details und Logs liegen nur in einer bewussten
Diagnoseflaeche. Normale Nutzer sehen keine Backend-, Bucket-, Endpoint- oder
Providerinternen Begriffe.

## Security und Privacy

- Keine Tokens, Keys, Presigned URLs oder Recovery Secrets als Klartext.
- Sensible Werte benoetigen kontextgerechtes Masking/Reauth.
- Supportexport zeigt vor Freigabe Umfang und Redaction.
- Local Development Cloud/Fake/Feature Flags erscheinen nie in Production
  Settings.
- Screenshots/Telemetry globaler Settings enthalten keine privaten
  Vault-/Dokument-/Profilnamen.

## Accessibility und Localization

- Settings sind mit Tastatur, Screenreader und Touch vollstaendig bedienbar.
- Status und Gefahr werden nicht nur farblich angezeigt.
- Fokus kehrt nach Dialog/Unterseite sinnvoll zur Ausgangszeile zurueck.
- Lange deutsche Texte und Textscale `2.0` verdecken keine Folgen/Actions.
- Bestaetigungen sind konkret und vermeiden Dark Patterns.

## Tests und Verifikation

- Local/Cloud, Free/Paid, online/offline, quota/grace/read-only.
- Device revoke, reauth, cancellation, reactivation und getrennte Loeschflows.
- Migration/Export/Recovery bei Fehler, Restart und unzureichendem Speicher.
- Assist offline/opt-out/failure ohne Vault-Statuswechsel.
- keine Dev-/Server-URL-/Secret-Flaechen in Production.
- Keyboard, Semantics, Fokus, Textscale und Datenschutz.

## Stop Rules

Stop, wenn Vaultwechsel als Toggle erscheint, Assist und Backup vermischt sind,
Loeschscopes unklar sind, technische Infrastruktur die normale UI dominiert
oder Production Entwickler-/Self-Hosting-Konfiguration exponiert.

## Handoff

Settings-Phasen gehen an `ui-architect`; Lifecycle-/Datenverhalten an
`data-architect`; Account-/Cloud-Vertraege an `contract-api`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die Phase stoppt.
