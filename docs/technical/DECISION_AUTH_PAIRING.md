---
title: "Draft Decision - Auth and Pairing"
description: "Vorläufige Entscheidungsvorlage für Mobile-/Desktop-Pairing, Home-Hub-Zugriff und MVP-Auth"
tags: [decision, draft, auth, pairing, mobile-capture, home-hub]
lastUpdated: "2026-04-27"
status: "draft"
---

# Draft Decision - Auth and Pairing

## Status

Draft.

## Kontext

Der MVP braucht kein Cloud-OAuth. Mobile Capture braucht aber eine kontrollierte Verbindung zum Home Hub.

## Zielrichtung

Für den MVP ist Pairing wahrscheinlicher als klassischer OAuth-Login.

Mögliche Richtung:

- Home Hub erzeugt Pairing-Code oder QR-Code.
- Mobile/Desktop koppeln sich mit dem Home Hub.
- Gerät erhält ein Pairing Secret oder Session Secret.
- Secret wird über F12 gespeichert.
- Home Hub kann Geräte widerrufen.

## Nicht-Ziele

- Google/Microsoft OAuth als MVP-Pflicht.
- vollständige Multi-Tenant-Auth.
- öffentliche Account-Plattform.

## Noch zu entscheiden

- Pairing-Code, QR-Code oder manueller Setup-Key?
- Braucht Desktop im MVP Pairing oder nur Mobile?
- Wie werden Geräte im Home Hub widerrufen?
- Welche Session-Laufzeit ist sinnvoll?

