---
title: "Konzept F8 - Distribution Readiness"
description: "DocMan-spezifische Distribution-Planung für private/self-hosted Nutzung, signierte Builds, Mobile Stores und spätere öffentliche Verteilung"
tags: [concept, distribution, app-store, mobile, desktop, self-hosted]
lastUpdated: "2026-06-10"
version: "3.1"
status: "accepted"
---

# Konzept F8 - Distribution Readiness

## Status

Accepted.

Dieses Konzept ersetzt den importierten F8-Inhalt aus dem alten Projekt.

## Zweck

F8 hält fest, wie DocMan später verteilt werden kann. Distribution ist nicht M2-führend, darf aber Architektur nicht überraschen.

## M2-Richtung

Die erste produktive Richtung ist privat/self-hosted. R10-D1 bestaetigt diese
Linie in `docs/technical/DECISION_DISTRIBUTION_STRATEGY.md`.
R10-D2 bestaetigt zusaetzlich, dass Privacy/Legal bei der Implementierung
mitgedacht werden, aber erst vor Store/Public Release als eigenes Gate blocken.

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
- Store-Regeln fuer Apple, Google und Microsoft vorbereiten, ohne M2/private
  Nutzung davon abhaengig zu machen.
- Legal-/Privacy-Readiness als Gate vor Store/Public Release fuehren.

## Definition of Done

F8 gilt als umgesetzt, wenn:

- M2 nicht von Store-Distribution abhängt.
- spätere Mobile-Distribution nicht blockiert wird.
- Privacy-/Permission-Anforderungen sichtbar sind.
- Review-/Demo-Modus ohne echte private Daten geplant ist.
- public/store Distribution nicht ohne Legal-/Privacy-Gate erfolgt.

## Offene Folgefragen

- Wann brauchen wir TestFlight/Android Internal Testing?
- Wird Desktop signiert verteilt?
- Wann wird die Store-Policy-Matrix konkret ausgearbeitet?
- Wer fuehrt die rechtliche/praktische Privacy-Review vor Public Release durch?
