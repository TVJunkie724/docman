---
title: "Konzept F6 - Environment Configuration"
description: "DocMan-spezifische Konfiguration für lokale App, Home Hub, private Server, Dev/Production-Profile und sichere Defaults"
tags: [concept, foundation, configuration, environments, home-hub, self-hosted]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F6 - Environment Configuration

## Status

Accepted.

Dieses Konzept ersetzt den importierten F6-Inhalt aus dem alten Projekt.

## Zweck

F6 definiert, wie DocMan konfiguriert wird, ohne private Serveradressen, Secrets oder alte Cloud-Annahmen in Code oder Repo einzubauen.

## Grundsatz

DocMan ist local-first und self-hosted-orientiert.

Konfiguration muss deshalb:

- lokale Nutzung ohne Backend erlauben.
- optionalen Home Hub konfigurieren.
- private Serveradressen unterstützen.
- Tailscale/LAN/VPN nicht als Produktlogik behandeln.
- Secrets aus normaler Konfiguration heraushalten.

## Konfigurationsarten

| Art | Beispiele | Speicherort |
|---|---|---|
| Build-Konfiguration | App-Name, Feature-Flags, Flavor | Build/Dart define |
| Laufzeit-Settings | Home-Hub-URL, Sprache, Theme | F10 Local Storage |
| Secrets | Pairing Secret, Session Token | F12 Secure Storage |
| Dev-Konfiguration | Fake-Repositories, lokale Testdaten | Dev-only Config |
| Server-Konfiguration | Compose-Variablen, Storage-Pfade | Späterer Server-Stack |

## App-Modi

| Modus | Zweck |
|---|---|
| Local Only | Desktop-App ohne Home Hub, lokale Arbeit |
| Home Hub Connected | MVP mit Mobile Capture Upload |
| Dev Fake | UI-/Provider-Entwicklung ohne echten Server |
| Integration | Tests gegen lokalen Home-Hub/Compose-Stack |

Cloud-SaaS ist kein Zielmodus.

## Home-Hub-Konfiguration

Die App speichert nicht geheim:

- Home-Hub-URL.
- zuletzt geprüfter Health-Status.
- Capabilities.
- Anzeigename des Hubs.

Die App speichert geheim über F12:

- Pairing Secret.
- Session Token.
- Device Secret.

## Feature Flags

Feature Flags dürfen frühe Entwicklung erleichtern, aber nicht Produktlogik verstecken.

Mögliche Flags:

- mobileCaptureEnabled.
- homeHubUploadEnabled.
- fakeRepositoriesEnabled.
- intelligencePreviewEnabled.

Production-Defaults müssen konservativ sein.

## Definition of Done

F6 gilt als umgesetzt, wenn:

- keine harten IPs oder Platzhalter-URLs im Produktpfad stehen.
- Home-Hub-URL konfigurierbar ist.
- Secrets nur über F12 laufen.
- Dev Fake klar von Produktmodus getrennt ist.
- App ohne Home Hub sinnvoll startet.

## Offene Folgefragen

- Welche konkrete Config-Datei-/Dart-define-Strategie verwenden wir?
- Wie wird Mobile erstmalig mit der Home-Hub-Adresse versorgt?
- Welche Dev-Fakes sind im MVP erlaubt?

