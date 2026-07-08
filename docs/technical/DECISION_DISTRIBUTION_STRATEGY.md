---
title: "Decision - Distribution Strategy"
description: "Entscheidung zur ersten privaten/self-hosted Distribution und vorbereiteter Store-Readiness fuer spaetere mobile/Desktop-Verteilung"
tags: [decision, distribution, self-hosted, app-store, release, privacy]
lastUpdated: "2026-06-10"
status: "accepted"
---

# Decision - Distribution Strategy

## Status

Accepted.

R10-D1 ist entschieden. Mappm wird zuerst privat/self-hosted genutzt. Store-
Regeln werden trotzdem frueh vorbereitet.

## Entscheidung

Mappm startet nicht als oeffentliche Store- oder SaaS-Distribution.

Erste produktive Nutzung:

- private/self-hosted Nutzung.
- lokale oder signierte Desktop-Builds.
- Mobile Testbuilds, interne Tests oder spaetere TestFlight-/Android-Internal-
  Testing-Pfade.
- Home Hub im privaten Haushalt oder auf eigener Infrastruktur.

Nicht zuerst:

- oeffentliche App Stores.
- Cloud-SaaS-Vertrieb.
- Enterprise-Mandantenprodukt.
- fremde Managed Cloud als Voraussetzung.

## Store-Regeln Trotzdem Vorbereiten

Auch wenn Stores nicht der erste Distributionsweg sind, darf Mappm Store-
Readiness nicht verbauen.

Frueh vorbereiten:

- minimale Permissions.
- klare Privacy-Texte.
- keine versteckten externen Dienste.
- Review-/Demo-Modus ohne echte private Daten.
- reproduzierbare Builds.
- App Signing und Release Notes als spaetere Readiness-Arbeit.
- Apple, Google und Microsoft Policy-Matrix vor oeffentlicher Distribution.

## Warum

Mappm verwaltet sensible Haushaltsdokumente. Deshalb sind lokale Nutzbarkeit,
Home-Hub-Setup, Backup/Restore, Datenschutz und Testbarkeit wichtiger als
fruehe Store-Sichtbarkeit.

Mobile Capture macht Store-Regeln spaeter relevant, aber sie sollen nicht die
erste nutzbare private Version blockieren.

## Konsequenzen

- R10-D1 ist entschieden: private/self-hosted zuerst.
- Store-Distribution ist spaeter moeglich, aber readiness-gated.
- Mobile Store-Vorgaben werden vorbereitet, nicht ignoriert.
- Keine oeffentliche Distribution ohne R10-D2/rechtliche Pruefung.
- Privacy-, Security-, Store- und Rechtsanforderungen werden bei der
  Implementierung laufend mitgedacht.
- F8 Distribution Readiness bleibt gueltig und wird gegen diese Entscheidung
  ausgerichtet.

## Nicht entschieden

- konkreter erster Desktop-Installer.
- konkrete Mobile-Testdistribution.
- Store-Reihenfolge Apple/Google/Microsoft.
- Zeitpunkt oeffentlicher Distribution.
