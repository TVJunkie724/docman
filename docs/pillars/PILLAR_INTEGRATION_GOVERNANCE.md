---
title: "Enterprise-Säule - Integration Governance"
description: "Enterprise-Bereich fuer externe Links, Deep Links, spätere APIs, Portale, Trust Boundaries, Credentials und Integrationsregeln"
tags: [pillar, enterprise, integrations, external-links, trust-boundaries]
lastUpdated: "2026-07-12"
version: "0.2"
status: "proposed"
---

# Enterprise-Säule - Integration Governance

## Zweck

DocMan soll externe Dienste sinnvoll nutzen können, ohne sich an sie zu ketten oder Credentials unsicher zu speichern.

R13-D1 entscheidet: Mappm startet mit manuellen externen Links und
Export-/Oeffnen-Aktionen. Automatische Portalaktionen werden spaeter nur
geprueft, falls sie technisch, rechtlich und sicherheitlich tragfaehig sind.

## Scope

- externe Website-Links.
- App-/Deep-Links.
- lokale Export- und Uebergabeziele.
- spätere Portal-APIs.
- Schul-, SV-, Versicherungs-, Behörden- und Anbieterportale.
- Trust Boundaries.
- keine Credential-Speicherung ohne explizites Sicherheitskonzept.
- Integrationskatalog.

## M2-Minimum

- externe Aktionslinks als manuelle Links.
- Desktop Web-URL öffnen.
- Mobile Universal/App Link vorbereiten.
- keine Portalautomatisierung.
- keine gespeicherten Fremd-Credentials.
- kein externer App-Zugriff auf Mappm.

## Spaetere Pruefung

Portalautomatisierung ist kein Zielversprechen. Sie darf nur weiterverfolgt
werden, wenn ein konkretes Portal stabile Schnittstellen, klare Auth,
vertretbare Nutzungsbedingungen und sichere Fehlerbehandlung erlaubt.

## Verwandte Säulen

- Export and External Actions.
- Security and Privacy Architecture.
- Compliance and Legal Readiness.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
