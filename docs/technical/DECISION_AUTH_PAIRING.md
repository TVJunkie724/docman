---
title: "Decision - Auth and Pairing"
description: "Entscheidung fuer Mobile-/Desktop-Pairing, Home-Hub-Zugriff und spaetere Identity Provider"
tags: [decision, accepted, auth, pairing, mobile-capture, home-hub, identity]
lastUpdated: "2026-07-12"
status: "superseded"
---

# Decision - Auth and Pairing

## Status

Superseded on 2026-07-12 for customer-product authentication. Normal Local and
Cloud use requires account/device identity under
`DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`.
QR/manual Home-Hub pairing may remain only as historical or local-development
test input until a new Identity/Device Trust decision is accepted.

Der M2 verwendet **QR Pairing** als primaeren Flow fuer die Kopplung an den privaten Home Hub. Ein **manueller Pairing-Code** ist der Fallback.

Google- oder Microsoft-Identity wird fuer den M2 nicht implementiert, aber als spaetere optionale Identity-Provider-Schicht vorbereitet.

Ergaenzend gilt `docs/technical/DECISION_LOCAL_LOGIN.md`: Der lokale Desktop-M2 erzwingt kein klassisches Login. Er nutzt ein lokales Profil; Mobile Capture wird ueber Device Pairing gekoppelt.

## Entscheidung

M2:

- Home Hub erzeugt ein kurzlebiges Pairing-Secret.
- Desktop oder Home-Hub-Setup zeigt einen QR-Code.
- Mobile Capture scannt den QR-Code.
- Manueller Pairing-Code ist Fallback, falls QR nicht moeglich ist.
- Das gekoppelte Geraet erhaelt ein geraetegebundenes Upload-/Session-Token.
- Das Token wird in Secure Storage gespeichert.
- Der Home Hub kann gekoppelte Geraete und Tokens widerrufen.
- Mobile Capture funktioniert offline weiter und laedt spaeter ueber die Upload Queue hoch.

Späterer Milestone:

- Google Login.
- Microsoft Login.
- Desktop-Login als Pflichtpfad.
- vollstaendige Account-Plattform.
- vollstaendiges Rollen- und Haushalts-Rechtemodell.

Spaeter optional:

- Google/Microsoft Identity als Identity Provider.
- Passkeys oder andere lokale/standardisierte Identity-Optionen.
- eIDAS-/EUDI-faehige Identity Provider, mit ID Austria als naheliegendem
  ersten oesterreichischen Provider.
- Household-Mitglieder und Rollen.
- Account-Linking zwischen Person, Haushalt und Geraeten.

## Wichtige Trennung

DocMan trennt bewusst zwei Konzepte:

```text
Device Pairing
  Geraet <-> Home Hub
  Zweck: Dieses konkrete Geraet darf zu diesem konkreten privaten Home Hub hochladen.

User Identity
  Person <-> Haushalt / Rolle
  Zweck: Diese Person hat bestimmte Rechte in einem Haushalt.
```

Der M2 braucht Device Pairing, weil Mobile Capture ein konkretes Telefon mit einem konkreten Home Hub koppeln muss.

Cloud-OAuth identifiziert dagegen primaer eine Person. Das loest nicht automatisch die Frage, ob dieses Geraet zu diesem privaten Home Hub hochladen darf.

## Begruendung

QR Pairing passt besser zum M2 als Cloud-OAuth:

- Es funktioniert fuer private Self-Hosted-Setups ohne Cloud-Abhaengigkeit.
- Es loest das echte Mobile-Capture-Problem: Geraet mit Home Hub koppeln.
- Es passt zu NAS, Heimserver, Tailscale und lokalen Netzwerken.
- Es ist fuer ein einzelnes Haushalt-/Home-Hub-Setup einfacher als OAuth-Provider-Konfiguration.
- Es vermeidet fruehe Komplexitaet durch Redirects, Mobile Deep Links, Client IDs, Provider-Review und Refresh-Token-Flows.

Cloud Identity bleibt wertvoll, aber spaeter:

- fuer komfortableres Login.
- fuer mehrere Personen im Haushalt.
- fuer Rollen, Einladungen und Account-Verwaltung.
- fuer optionales Identity Federation.

This historical statement is superseded: account/device identity is now a
normal Local and Cloud prerequisite, while offline continuity and Detached
Recovery prevent account dependence from becoming data lock-in.

## Architekturregeln

Erlaubt:

- neutrale Domain-Begriffe wie `IdentityProvider`, `HouseholdMember`, `DeviceSession`, `PairedDevice`.
- `LocalProfile` als lokaler M2-Begriff ohne Cloud-Account-Pflicht.
- ein `PairingRepository` oder vergleichbare Domain-Grenze.
- Provider/Repository-Austauschbarkeit fuer Pairing-Fakes in Tests.
- spaetere Provider fuer Google, Microsoft oder Passkeys hinter neutralen Interfaces.

Nicht erlaubt:

- `googleUser`, `microsoftAccount` oder provider-spezifische Begriffe in Domain-Kernmodellen.
- Cloud-OAuth als Pflichtpfad fuer Mobile Capture.
- Tailscale als Produkt- oder Domain-Begriff.
- Upload-Tokens in SQLite oder normaler lokaler Datenbank.

## Secrets und Speicherung

Pairing- und Session-Secrets werden gemaess `docs/concepts/CONCEPT_F12_SECURE_STORAGE.md` gespeichert.

Regeln:

- Pairing-Secrets sind kurzlebig.
- Upload-/Session-Tokens sind geraetegebunden.
- Tokens sind widerrufbar.
- Tokens werden nicht in SQLite gespeichert.
- Logs duerfen keine Secrets, Tokens oder Pairing-Codes enthalten.

## Offline-Verhalten

Mobile Capture darf ohne aktuelle Verbindung zum Home Hub erfassen.

Erwartetes Verhalten:

- neue Scans landen lokal in der Mobile Upload Queue.
- Upload startet, wenn Home Hub erreichbar und Token gueltig ist.
- bei abgelaufenem oder widerrufenem Token wird nicht still verworfen.
- Nutzerin sieht einen Zustand wie "erneut koppeln" oder "Verbindung pruefen".

## Transport

Tailscale ist eine geeignete fruehe Transportoption fuer private Heimnetz-/Server-Setups, aber nicht Teil des Produkts.

Die App kennt:

- Home-Hub-Adresse.
- Pairing-/Session-Status.
- Erreichbarkeit.
- Upload-Faehigkeiten.

Die App kennt nicht:

- Tailscale als fachliche Voraussetzung.
- feste Cloud-Abhaengigkeit.
- offene eingehende Firewall-Ports als M2-Annahme.

## Konsequenzen fuer R2/R3

R2 muss:

- Pairing-Konzept in Config und Secure Storage vorbereiten.
- Domain-Begriffe fuer Device Pairing neutral halten.
- keine Cloud-OAuth-Abhaengigkeit einfuehren.
- Home-Hub-URL und Pairing-Status konfigurierbar machen.

R3 Mobile Capture muss:

- QR Pairing als primaeren Setup-Flow planen.
- manuellen Pairing-Code als Fallback planen.
- Upload Queue mit Pairing-/Token-Zustand verbinden.
- Re-Pairing und widerrufene Tokens als Fehler-/Review-Zustaende behandeln.

## Akzeptanz

Die Entscheidung ist akzeptiert, wenn:

- Issue #2 geschlossen ist.
- `docs/ROADMAP_REBUILD.md` R2-D5 als erledigt markiert.
- F12 Secure Storage und F17 Mobile Capture dieser Richtung nicht widersprechen.

## Offene Folgefragen

- Wie kurzlebig ist ein Pairing-Code konkret?
- Erzeugt Desktop den QR-Code oder immer der Home Hub?
- Wird ein Admin-Passwort fuer den Home Hub bereits im M2 benoetigt?
- Wie wird Revocation im Home-Hub-UI sichtbar?
- Welche Identity Provider werden spaetere Milestones zuerst geprueft,
  insbesondere Passkeys, eIDAS/EUDI und ID Austria?
