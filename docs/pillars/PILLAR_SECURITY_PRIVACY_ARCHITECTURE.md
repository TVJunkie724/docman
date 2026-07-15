---
title: "Enterprise-Säule - Security and Privacy Architecture"
description: "Enterprise-Bereich fuer Security-by-Design, Privacy-by-Design, Verschlüsselung, Secure Storage, Trust Boundaries und Zugriffsschutz"
tags: [pillar, enterprise, security, privacy, encryption]
lastUpdated: "2026-07-15"
version: "0.2"
status: "proposed"
owner: "security/privacy"
---

# Enterprise-Säule - Security and Privacy Architecture

## Zweck

Mappm verwaltet sensible Dokumente: medizinische Unterlagen, Vertraege,
Identitaetsnachweise, finanzielle Daten und Familiendokumente.

Security und Privacy sind deshalb Architekturthemen, nicht nachträgliche Features.

## Scope

- Datenklassifikation.
- Secure Storage fuer Secrets, Tokens und Schlüsselmaterial.
- Trennung von Dateien, Metadaten und Secrets.
- Verschlüsselungsstrategie.
- App-Lock und sensible Anzeigezustände.
- Trust Boundaries für Local/Cloud Vault, Account/Geräte, externe Links, OCR/LLM, Sync, Backup und Migration.
- Berechtigungsmodell.
- sichere Defaults.

## C1/C2-Minimum

- keine Secrets in lokaler DB.
- keine sensiblen Daten in Logs/Notifications.
- Device Sessions und Trust widerrufbar.
- Security-Grenzen in Repository/API-Contracts sichtbar.
- E2EE-/Zero-Knowledge-fähige Richtung nicht verbauen.

## Verwandte Konzepte

- F12 Secure Storage.
- F18 Runtime Readiness.
- Compliance & Legal Readiness.

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
