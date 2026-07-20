---
title: "Entscheidungsentwurf - Geraeteuebergreifende Capture-Uebergabe"
description: "Draft fuer Smartphone-zu-Desktop-Erfassung, Cloud-Vault-Capture-Sitzungen, Local-Vault-Direkttransfer und macOS Continuity Camera"
tags: [decision, draft, capture, mobile, desktop, cross-device, cloud-vault, local-vault, continuity-camera]
lastUpdated: "2026-07-20"
status: "draft"
owner: "product-concept/security/data-architect/contract-api/platform"
---

# Entscheidungsentwurf - Geraeteuebergreifende Capture-Uebergabe

## Status

Draft. Dieses Dokument haelt die gewuenschte Produktoption und ihre
Trust-Grenzen fest, autorisiert aber keine Implementierung. OQ-013 besitzt die
noch offene Freigabe.

Der akzeptierte Capture-Core in `DECISION_DOCUMENT_CAPTURE.md` bleibt
unabhaengig:

- Mobile scannt und importiert direkt in der Mappm-App;
- Desktop importiert Dateien und Bilder ueber Picker und Drag-and-drop;
- Desktop setzt fuer normale Nutzung kein Smartphone voraus;
- Dokumentenscans ueber eine Desktop-Webcam sind verboten.

## Ziel

Eine Nutzerin soll ein Papierdokument mit dem Smartphone erfassen und den
Vorgang bei Bedarf am Desktop weiterverarbeiten koennen, ohne Dateiexport,
Messenger oder unerklaerte Cloud-Ablage.

Die bevorzugte Produktlogik ist:

```text
Desktop initiiert optionale Capture-Sitzung
  -> autorisiertes Smartphone uebernimmt die Sitzung
  -> Mappm-Mobile-App verwendet native Scanner-Komponente
  -> Original und Manifest werden nach Vault-Modus dauerhaft gesichert
  -> Desktop beobachtet denselben fachlichen Capture-/Processing-Zustand
  -> normaler Assist-, Matching- und Review-Pfad
```

Konkrete Controls, QR-Codes, Deep Links, Texte, Gesten und Screenlayouts sind
nicht entschieden.

## Gemeinsame Produktregeln

- Die Mappm-Mobile-App besitzt Capture-Sitzung, Dokumentgrenzen, Vault-/Queue-
  Uebergabe und Review-Kontext; die Aufnahme selbst verwendet den geprueften
  nativen iOS-/Android-Scanner hinter dem Mappm-Port.
- Eine Sitzung ist ein technischer Handoff, kein Case und kein Beweis, dass
  mehrere Dokumente zusammengehoeren.
- Jedes abgeschlossene Scan-Dokument behaelt eigene stabile Identitaet,
  Seitenreihenfolge, Manifest, Status, Retry und Matching.
- Nur fuer den Account/Vault autorisierte Geraete duerfen eine Sitzung
  uebernehmen oder beobachten.
- Sensitive Titel, Dateinamen, OCR-Texte oder Dokumentinhalte erscheinen nicht
  in Pairing-Code, Deep Link, QR-Inhalt, Logs oder Notifications.
- Smartphone-Erfassung ist eine Komfortoption. Dateipicker und Drag-and-drop
  bleiben am Desktop vollwertig.

## Variante A: Cloud Vault

Bei einem Cloud Vault ist Mappm Cloud bereits die autoritative Ablage. Der
naheliegende Draft-Pfad ist eine kurzlebige, account-, device- und
vaultgebundene Capture-Sitzung:

```text
Desktop erstellt Capture-Sitzung
  -> Smartphone bestaetigt autorisierte Uebernahme
  -> Mobile uebertraegt Original/Manifest in denselben Cloud Vault
  -> Server bestaetigt durable Annahme und Processing Job
  -> Desktop erhaelt Status und Review Proposal
```

Der Handoff darf keine zweite Dokumentkopie oder parallele Desktop-Upload-
Identitaet erzeugen. Session-Expiry, Idempotenz, Quota, Cancel, Retry,
Geraetewiderruf und Partial Failure gehoeren in einen spaeteren
OpenAPI-/Microcks-Contract.

## Variante B: Local Vault

Ein Local Vault ist auf seinem Geraet autoritativ. Ein Mobile-Scan darf deshalb
nicht still ueber Mappm Cloud, Assist-Speicher oder einen dauerhaften Relay-
Speicher in den Desktop-Vault gelangen.

Ein spaeterer Local-to-Local-Pfad benoetigt eine eigene akzeptierte
Direkttransferentscheidung mit mindestens:

- ausdruecklicher Auswahl von Quell- und Zielgeraet;
- kurzlebiger, an Account, Devices, Ziel-Vault und Operation gebundener
  Autorisierung;
- Ende-zu-Ende-geschuetztem Transfer und gegenseitiger Geraetepruefung;
- Manifest-, Groessen- und Checksum-Verifikation vor Annahme;
- Ablauf, Abbruch, Replay-/Duplicate-Schutz und nachvollziehbarer
  Fehlerbehandlung;
- keiner dauerhaften Serverkopie und keiner Umdeutung als Backup oder Sync;
- klarer Fallback auf expliziten Datei-Export/-Import, solange der
  Direkttransfer nicht freigegeben ist.

Ob der Transport im lokalen Netz, ueber WebRTC, einen kurzlebigen Relay oder
eine andere Technik erfolgt, ist nicht entschieden. Ein technischer Vorschlag
darf das Local-Vault-Trust-Modell nicht implizit veraendern.

## Variante C: macOS Continuity Camera

macOS darf spaeter Apples native Continuity-Camera-Dokumentaufnahme als
plattformbezogene Komfortintegration pruefen. Dabei startet eine native
Mac-App-Aktion die Aufnahme auf einem kompatiblen iPhone/iPad und uebergibt das
Ergebnis an die Mac-App.

Diese Variante:

- benoetigt nicht zwingend die Mappm-Mobile-App;
- ist kein plattformuebergreifender Mappm-Sync;
- kann besonders fuer einen lokalen Mac-Vault nuetzlich sein;
- benoetigt einen geprueften macOS/AppKit-Adapter hinter einem
  plattformneutralen Mappm-Port;
- muss das erhaltene PDF/Bild sofort durch denselben kontrollierten
  Import-, Durability-, Security- und Review-Pfad wie andere Desktop-Dateien
  fuehren.

Apple-Account-, OS-, Geraete-, Bluetooth-/WLAN- und Verfuegbarkeitsbedingungen
werden vor Aktivierung aus aktueller offizieller Dokumentation geprueft. Die
Funktion ist eine optionale macOS-Faehigkeit und darf keine Voraussetzung fuer
Desktop M1 werden.

## Abgrenzung

Nicht Teil dieses Drafts sind:

- Dokumentenscans ueber Desktop-Webcams;
- eine selbst gebaute Kamera-/Scan-Engine;
- allgemeiner Local-Vault-Sync zwischen Geraeten;
- Sharing an andere Accounts;
- stille Cloud-Backups fuer Local Vault;
- die konkrete Capture- oder Review-Oberflaeche;
- Apple-/Google-spezifische SDK-Typen in Domain oder Presentation.

## Security, Privacy und Support

Originale, Seiten, Dateinamen, Manifest, OCR-Output, Titel, Matching-Kandidaten
und Pairing-Beziehungen sind sensibel. Spaetere Contracts muessen mindestens
Device-Revoke, Session-Hijacking, QR-/Link-Replay, falschen Vault, falsches
Managed Subject, Offline-Abbruch, Netzwerkwechsel, Duplicate Confirm und
Support-Diagnostik ohne Inhalte abdecken.

Support sieht technische Session-/Operation-/Reference-Codes und redigierte
Statusklassen, niemals den Pairing-Secret, Dokumentinhalt oder OCR-Text.

## Verifikation vor Freigabe

Eine spaetere Entscheidung und Phase muessen mit synthetischen Dokumenten
belegen:

- Cloud-Vault-Handoff zwischen zwei autorisierten Geraeten;
- abgelaufene, widerrufene, wiederholte und fremde Sitzung;
- App-/Geraete-Neustart und Netzwerkwechsel waehrend jeder Stufe;
- mehrere Dokumente in einer Sitzung ohne erzwungenes gemeinsames Matching;
- identische Session-/Dokumentidentitaet ohne doppelte Originale;
- Local-Vault-Transfer ohne dauerhafte Relay-/Cloud-Ablage;
- Manifest-/Checksum-Fehler und sichere Ablehnung;
- macOS-Adapter verfuegbar/nicht verfuegbar/abgebrochen;
- vollwertiger Desktop-Dateiimport ohne Smartphone;
- Negativtest: keine Desktop-Webcam-Scan-Funktion.

## Stop Rules

Stop, wenn:

- ein Local-Vault-Dokument fuer den Handoff still dauerhaft in der Cloud
  gespeichert wird;
- Account-, Device- oder Vault-Autorisierung umgangen wird;
- Pairing-Secrets oder Dokumentdaten in Logs, Links, Telemetrie oder
  Notifications gelangen;
- Sitzungsgemeinsamkeit als fachliche Case-Zuordnung verwendet wird;
- ein fehlendes Smartphone normalen Desktop-Import blockiert;
- Continuity Camera als plattformuebergreifender Sync oder Mappm-Backup
  beschrieben wird;
- ein Dokumentenscan ueber eine Desktop-Webcam angeboten wird;
- dieser Draft ohne OQ-013-Freigabe und Implementation Contract umgesetzt wird.

## Offene Freigabepunkte

- Welche Varianten gehoeren zu Commercial 1.0, spaeteren Releases oder gar
  nicht in das Produkt?
- Braucht Cloud-Vault-Handoff einen Desktop-initiierten Code/Link oder reicht
  die gemeinsame Capture-Inbox autorisierter Geraete?
- Welches konkrete Trust- und Transportmodell gilt fuer Local-to-Local?
- Welche Desktopplattformen erhalten native OS-Komfortadapter?
- Welche Mindestversionen, Fallbacks, SLOs und Supportgrenzen gelten?

Diese Fragen werden in OQ-013 geschlossen, bevor Contract-, Data- oder
UI-Implementierung geplant wird.
