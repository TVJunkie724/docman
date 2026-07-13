---
title: "Enterprise-Säule - Compatibility and Platform Support"
description: "Enterprise-Bereich fuer macOS, iOS, Android, später Windows/Linux, Plattformfähigkeiten und Store-/OS-Unterschiede"
tags: [pillar, enterprise, compatibility, platform, macos, ios, android]
lastUpdated: "2026-07-12"
version: "0.1"
status: "proposed"
---

# Enterprise-Säule - Compatibility and Platform Support

## Zweck

DocMan läuft über mehrere Plattformen mit unterschiedlichen Fähigkeiten.

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

## M2-Minimum

- Zielplattformen für M2 explizit benennen.
- Mobile Scan nicht als plattformneutralen Foto-Upload verkürzen.
- sichere Fallbacks definieren, wenn Plattformfähigkeiten fehlen.

## Verwandte Säulen

- Capture and Inbox.
- Compliance and Legal Readiness.
- Release, Distribution and Change Management.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
