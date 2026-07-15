---
title: "Enterprise-Säule - Compliance and Legal Readiness"
description: "Enterprise-Bereich fuer DSGVO/GDPR, EU/AT Datenschutz, Apple/Google/Microsoft Store Policies, Lizenz-Compliance und rechtliche Produktreife"
tags: [pillar, enterprise, compliance, legal, dsgvo, gdpr, store]
lastUpdated: "2026-07-15"
version: "0.2"
status: "proposed"
owner: "legal/compliance/product"
---

# Enterprise-Säule - Compliance and Legal Readiness

## Zweck

Mappm muss rechtliche, Cloud-, Subscription- und Store-Anforderungen ab C0 mitdenken, auch wenn ein Local Release zuerst erscheint.

R10-D2 entscheidet: Privacy-, Security-, Store- und Rechtsanforderungen werden
bei der Implementierung immer mitgedacht. Oeffentliche Distribution oder Store-
Release bekommen ein eigenes Legal-/Privacy-Readiness-Gate.

## Rechtliche Standards

Zu berücksichtigen:

- DSGVO / GDPR.
- österreichische und EU-Datenschutzanforderungen.
- besondere Kategorien sensibler Daten, insbesondere Gesundheitsdaten.
- Datenminimierung.
- Auskunft, Export, Berichtigung und Löschung.
- Aufbewahrung und Retention.
- Transparenz über Verarbeitung.
- Cloud-/Sync-/OCR-/LLM-Datenverarbeitung nur mit klaren Rechts- und Trust-Boundaries.

## Store- und Distribution-Standards

Zu berücksichtigen:

- Apple App Store Review Guidelines.
- Google Play Developer Policies.
- Microsoft Store Policies.
- Local- und Managed-Cloud-Distribution sowie direkte und Store-basierte Kanäle.
- Review-/Demo-Zugriff ohne echte Nutzerdaten.
- App Signing und Plattformvorgaben.
- Open-Source- und Lizenz-Compliance.

## C0-C5-Minimum

- keine echten privaten Daten in Demos, Tests oder Review-Flows.
- Privacy-Texte und Datenklassen konzeptionell vorbereitet.
- Exportierbarkeit nicht verbauen.
- Löschung/Retention als Datenmodell-Thema vorbereiten.
- keine Cloud- oder KI-Weitergabe ohne explizite Entscheidung.
- keine Logs oder Diagnosepakete mit Dokumentinhalten, OCR-Rohtexten, Secrets
  oder sensiblen personenbezogenen Details.
- Plattform-Permissions minimal und begruendbar halten.
- Review-/Demo-Modus mit synthetischen Daten vorbereiten.

## Grenzen

Dieses Dokument ist Produktplanung, keine Rechtsberatung.

Vor öffentlicher Distribution, Store-Release oder produktiver Verarbeitung
außerhalb des privaten Haushalts braucht es eine separate rechtliche Prüfung.

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
