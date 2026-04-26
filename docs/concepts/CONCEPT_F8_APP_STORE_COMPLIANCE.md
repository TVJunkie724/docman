---
title: "Konzept F8 - Distribution Readiness"
description: "DocMan-spezifische Distribution-Planung für private/self-hosted Nutzung, signierte Builds, Mobile Stores und spätere öffentliche Verteilung"
tags: [concept, distribution, app-store, mobile, desktop, self-hosted]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F8 - Distribution Readiness

## Status

Accepted.

Dieses Konzept ersetzt den importierten F8-Inhalt aus dem alten Projekt.

## Zweck

F8 hält fest, wie DocMan später verteilt werden kann. Distribution ist nicht MVP-führend, darf aber Architektur nicht überraschen.

## MVP-Richtung

Der MVP ist privat/self-hosted.

Primär:

- lokale Desktop-Builds.
- Mobile Testbuilds.
- Home Hub im privaten Setup.

Nicht primär:

- öffentliche App Stores.
- Cloud-SaaS-Vertrieb.
- Enterprise-Mandantenprodukt.

## Spätere Distribution

Mögliche Pfade:

- signierte Desktop-Builds.
- TestFlight/Android interne Tests.
- private Familien-/Haushaltsinstallation.
- später öffentliche Store-Prüfung, falls gewünscht.

## Store-Relevanz

Mobile Capture kann Stores später relevant machen. Deshalb sollte DocMan:

- Privacy-Texte sauber halten.
- keine versteckten externen Dienste nutzen.
- Review ohne echte private Daten ermöglichen.
- App-Berechtigungen minimal halten.

## Definition of Done

F8 gilt als umgesetzt, wenn:

- MVP nicht von Store-Distribution abhängt.
- spätere Mobile-Distribution nicht blockiert wird.
- Privacy-/Permission-Anforderungen sichtbar sind.

## Offene Folgefragen

- Wann brauchen wir TestFlight/Android Internal Testing?
- Wird Desktop signiert verteilt?
- Brauchen wir vor MVP irgendeine Store-Readiness?

