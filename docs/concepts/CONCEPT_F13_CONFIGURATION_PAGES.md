---
title: "Konzept F13 - Configuration Pages"
description: "DocMan-spezifische UX-Regeln für Einstellungen, Home-Hub-Verbindung, Profile, Storage, Diagnose und spätere Admin-Flows"
tags: [concept, configuration, ux, settings, home-hub, profiles]
lastUpdated: "2026-05-06"
version: "3.1"
status: "accepted"
---

# Konzept F13 - Configuration Pages

## Status

Accepted.

Dieses Konzept ersetzt den importierten F13-Inhalt aus dem alten Projekt.

## Zweck

F13 definiert, welche Konfigurationsflächen DocMan braucht und wie sie sich fachlich verhalten.

## Grundsatz

Konfiguration ist kein Marketingbereich. Sie muss ruhig, klar und diagnosefähig sein.

## MVP-Konfigurationsbereiche

| Bereich | Zweck |
|---|---|
| Allgemein | Sprache, Theme, lokale Präferenzen |
| Profile | aktives Profil, einfache Profilverwaltung |
| Haushalt | spätere Haushaltsmitglieder, Kinderprofile, Zugriffsstatus |
| Home Hub | URL, Health Check, Pairing-Status |
| Storage | lokale Speicherorte, Cache-Status, Export später |
| Mobile Capture | verbundenes Gerät, Upload-Status, Queue-Hinweise |
| Diagnose | App-Version, Logs, Health, Feature Flags |

## UX-Regeln

- Status zuerst, Details darunter.
- Keine Secrets anzeigen.
- Verbindungsprobleme handlungsorientiert erklären.
- Lokale Nutzung nicht als Fehler darstellen, wenn kein Home Hub verbunden ist.
- Riskante Aktionen brauchen Bestätigung.
- Diagnose darf technisch sein, aber nicht panisch.

## Home-Hub Setup

Die Home-Hub-Konfiguration muss zeigen:

- Backend-Adresse.
- Erreichbarkeit.
- Capabilities.
- Pairing-Status.
- letzte erfolgreiche Verbindung.
- Upload-Fähigkeit.

Tailscale wird höchstens als Setup-Hinweis erwähnt, nicht als Produktzustand.

## Definition of Done

F13 gilt als umgesetzt, wenn:

- Settings-Struktur für MVP klar ist.
- Home-Hub-Verbindung verständlich konfigurierbar ist.
- Secrets nicht sichtbar sind.
- Diagnose Status und nächste Aktion trennt.
- Profil- und Haushaltsbereiche getrennt geplant sind, damit MVP-Profilwahl nicht mit späterer Rechteverwaltung vermischt wird.

## Offene Folgefragen

- Braucht der MVP einen Setup-Wizard?
- Wie wird Mobile Pairing dargestellt?
- Welche Storage-Informationen sind für normale Nutzer sinnvoll?
- Welche Haushalts-/Kinderprofilverwaltung ist R5-Minimum?
