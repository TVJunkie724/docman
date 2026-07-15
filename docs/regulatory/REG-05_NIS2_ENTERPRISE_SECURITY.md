---
title: "REG-05 NIS2 und oesterreichisches NISG 2026"
description: "Applicability-, Governance-, Incident- und Lieferkettenvertrag fuer Managed Cloud und Enterprise"
tags: [regulatory, nis2, nisg, austria, enterprise-security]
status: "accepted-governance-needs-legal-review"
owner: "security/legal"
lastUpdated: "2026-07-15"
jurisdiction: "EU/EEA, Oesterreich"
regulatoryAsOf: "2026-07-15"
sourcesCheckedAt: "2026-07-15"
nextReviewDue: "2026-08-15"
primarySources: ["docs/regulatory/REGULATORY_SOURCE_REGISTER.md"]
legalReviewer: "Legal/Security-Compliance-Pruefung erforderlich"
---

# REG-05 NIS2 und oesterreichisches NISG 2026

## Aktueller Planungsstand

Oesterreich hat NIS2 mit dem NISG 2026 umgesetzt; wesentliche Bestimmungen
treten am **01.10.2026** in Kraft. Ob Mappm direkt erfasst ist, haengt unter
anderem von Rechtstraeger, Unternehmensgroesse, konkretem Cloud-/ICT-Dienst,
Zielsektor und Ausnahmen ab. Unabhaengig vom direkten Scope koennen
Enterprise-Kunden entsprechende Lieferketten- und Vertragsanforderungen
stellen.

## Applicability-Entscheid

Vor Managed-Cloud-/Enterprise-Launch werden dokumentiert:

- Rechtstraeger, Sitz, Groesse und verbundene Unternehmen.
- angebotene Dienste und Zuordnung zu NIS2-/NISG-Sektoren.
- Zielkunden und Rolle in deren Lieferkette.
- direkte Registrierung/Meldepflicht oder begruendete Nichtanwendbarkeit.
- Geschaeftsleitungs-, Governance-, Schulungs- und Auditpflichten.
- Aufsichts-, CSIRT- und Incidentkontakte.

## Sicherheitsvertrag

- Risk Management fuer Identity, Vault, Sync, Assist, Provider und Betrieb.
- Incident Detection, Klassifikation, Eskalation, Meldung und Kommunikation.
- Business Continuity, Backup, Restore, Disaster Recovery und Crisis Handling.
- Supply-Chain-, Provider- und Beschaffungspruefung.
- Access Control, MFA, Kryptografie, Vulnerability- und Patchmanagement.
- Wirksamkeitspruefung, Training, Audit und Managementfreigabe.

## Produkt-/Contract-Folgen

- Frontend beschreibt sichere Nutzerflows, Status und Recovery, entscheidet
  aber keine Backend-Policy- oder Incidentarchitektur.
- Backend/Operations definieren technische Controls, Telemetrie, Runbooks,
  SLIs/SLOs und Evidence.
- Enterprise-Vertraege, SLA und Security Annex versprechen nur nachweisbare
  Faehigkeiten.
- CRA- und NIS2/NISG-Meldewege werden koordiniert, aber nicht vermischt.

## Stop Rules

- Stop, wenn die NISG-2026-Applicability vor dem 01.10.2026 oder vor
  Enterprise-/Managed-Cloud-Launch nicht fachkundig entschieden ist.
- Stop ohne Incident-, Continuity-, Supply-Chain- und Management-Governance.
- Stop, wenn Kundenzusagen strengere Controls versprechen als verifiziert
  betrieben werden.
