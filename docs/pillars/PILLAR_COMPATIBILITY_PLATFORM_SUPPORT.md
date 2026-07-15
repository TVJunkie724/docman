---
title: "Enterprise-Säule - Compatibility and Platform Support"
description: "Enterprise-Bereich fuer macOS, iOS, Android, später Windows/Linux, Plattformfähigkeiten und Store-/OS-Unterschiede"
tags: [pillar, enterprise, compatibility, platform, macos, ios, android]
lastUpdated: "2026-07-15"
version: "0.2"
status: "proposed"
owner: "product-concept/quality-readiness"
---

# Enterprise-Säule - Compatibility and Platform Support

## Zweck

Mappm laeuft ueber mehrere Plattformen mit unterschiedlichen Faehigkeiten.

## Scope

- macOS Desktop.
- iOS Mobile Capture.
- Android Mobile Capture.
- spätere Windows/Linux-Unterstützung.
- Dateisystem-Unterschiede.
- Secure Storage je Plattform.
- Notifications je Plattform.
- Share Sheet, Deep Links und App Links.
- Scanner APIs.
- Store-Vorgaben je Plattform.

## Commercial-Core-Minimum

- Zielplattformen je C-Gate und Release explizit benennen.
- Mobile Scan nicht als plattformneutralen Foto-Upload verkürzen.
- sichere Fallbacks definieren, wenn Plattformfähigkeiten fehlen.

## Verwandte Säulen

- Capture and Inbox.
- Compliance and Legal Readiness.
- Release, Distribution and Change Management.

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
