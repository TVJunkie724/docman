---
title: "Konzept F8b - Review Access Strategy"
description: "DocMan-spezifische Strategie für Demo-/Review-Zugänge, synthetische Daten und testbare private/self-hosted Setups"
tags: [concept, review, demo, distribution, synthetic-data]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F8b - Review Access Strategy

## Status

Accepted.

Dieses Konzept ersetzt den importierten F8b-Inhalt aus dem alten Projekt.

## Zweck

F8b beschreibt, wie DocMan später prüfbar wird, ohne echte private Dokumente oder einen öffentlichen Demo-Cloud-Dienst zu benötigen.

## Grundsatz

Review-Daten sind synthetisch.

Keine echten Haushaltsdokumente, keine echten Ausweise, keine echten Rechnungen.

## Review-Modi

| Modus | Zweck |
|---|---|
| Local Demo Data | App mit synthetischem Haushalt und Dokumenten |
| Fake Home Hub | Upload/Health/Pairing simulieren |
| Private Review Hub | später kontrollierter self-hosted Demo-Hub |

## Anforderungen

- reproduzierbare Demo-Daten.
- klarer Review-Pfad.
- kein Cloud-SaaS-Zwang.
- keine echten Secrets.
- Mobile Capture prüfbar ohne echte privaten Dokumente.

## Definition of Done

F8b gilt als umgesetzt, wenn:

- Demo-/Review-Datenkonzept existiert.
- Reviewer keine echten Daten brauchen.
- Fake/Home-Hub-Review mit F15 zusammenpasst.

## Offene Folgefragen

- Wann brauchen wir Review-Artefakte wirklich?
- Soll es einen Demo-Modus in der App geben?
- Welche synthetischen Dokumente decken Kernflows ab?

