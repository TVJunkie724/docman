---
title: "Decision - Auth and Pairing"
description: "Entscheidung fuer Mobile-/Desktop-Pairing, Home-Hub-Zugriff und spaetere Identity Provider"
tags: [decision, accepted, auth, pairing, mobile-capture, home-hub, identity]
lastUpdated: "2026-04-30"
status: "accepted"
---

# Decision - Auth and Pairing

## Status

Accepted.

Der MVP verwendet **QR Pairing** als primaeren Flow fuer die Kopplung an den privaten Home Hub. Ein **manueller Pairing-Code** ist der Fallback.

Google- oder Microsoft-Identity wird fuer den MVP nicht implementiert, aber als spaetere optionale Identity-Provider-Schicht vorbereitet.

## Entscheidung

MVP:

- Home Hub erzeugt ein kurzlebiges Pairing-Secret.
- Desktop oder Home-Hub-Setup zeigt einen QR-Code.
- Mobile Capture scannt den QR-Code.
- Manueller Pairing-Code ist Fallback, falls QR nicht moeglich ist.
- Das gekoppelte Geraet erhaelt ein geraetegebundenes Upload-/Session-Token.
- Das Token wird in Secure Storage gespeichert.
- Der Home Hub kann gekoppelte Geraete und Tokens widerrufen.
- Mobile Capture funktioniert offline weiter und laedt spaeter ueber die Upload Queue hoch.

Nicht MVP:

- Google Login.
- Microsoft Login.
- vollstaendige Account-Plattform.
- vollstaendiges Rollen- und Haushalts-Rechtemodell.

Spaeter optional:

- Google/Microsoft Identity als Identity Provider.
- Passkeys oder andere lokale/standardisierte Identity-Optionen.
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

Der MVP braucht Device Pairing, weil Mobile Capture ein konkretes Telefon mit einem konkreten Home Hub koppeln muss.

Cloud-OAuth identifiziert dagegen primaer eine Person. Das loest nicht automatisch die Frage, ob dieses Geraet zu diesem privaten Home Hub hochladen darf.

## Begruendung

QR Pairing passt besser zum MVP als Cloud-OAuth:

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

Sie darf aber nicht Voraussetzung fuer lokale/private Nutzung werden.

## Architekturregeln

Erlaubt:

- neutrale Domain-Begriffe wie `IdentityProvider`, `HouseholdMember`, `DeviceSession`, `PairedDevice`.
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
- offene eingehende Firewall-Ports als MVP-Annahme.

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
- Wird ein Admin-Passwort fuer den Home Hub bereits im MVP benoetigt?
- Wie wird Revocation im Home-Hub-UI sichtbar?
- Welche Identity Provider werden post-MVP zuerst geprueft?
