---
title: "REG-01 DSGVO- und Datenschutz-Compliance"
description: "Datenschutzvertrag fuer personenbezogene und besonders geschuetzte Mappm-Daten"
tags: [regulatory, gdpr, dsgvo, dsg, privacy, austria]
status: "accepted-governance-needs-legal-review"
owner: "compliance/privacy"
lastUpdated: "2026-07-15"
jurisdiction: "EU/EEA, Oesterreich"
regulatoryAsOf: "2026-07-15"
sourcesCheckedAt: "2026-07-15"
nextReviewDue: "2026-08-15"
primarySources: ["docs/regulatory/REGULATORY_SOURCE_REGISTER.md"]
legalReviewer: "Legal/DPO-Pruefung erforderlich"
---

# REG-01 DSGVO- und Datenschutz-Compliance

## Scope

Mappm verarbeitet Account-, Profil-, Dokument-, Gesundheits-, Finanz-,
Vertrags-, Identitaets-, Nutzungs- und Supportdaten. Lokale Speicherung hebt
die Pflichten fuer Account, Core Assist, Telemetrie, Support oder Cloud nicht
auf. Daten Minderjaehriger oder verwalteter Personen benoetigen eine eigene
Vertretungs-/Berechtigungspruefung.

## Verbindlicher Verarbeitungsvertrag

Pro Zweck und Provider werden dokumentiert:

- Verantwortlicher, Auftragsverarbeiter, Subprozessoren und Kontakt.
- Datenkategorien, besondere Kategorien, Betroffene und Empfaenger.
- Zweck, Rechtsgrundlage, Erforderlichkeit und Datenminimierung.
- Region, Speicherort, Zugriff, Drittlandtransfer und Schutzmechanismus.
- Retention, Loeschung, Backup- und Cachewirkung.
- Transparenz, Einwilligung/Withdrawal, Widerspruch und sonstige Rechte.
- DSFA/DPIA-, DPO-, RoPA- und Breach-Applicability.

## Produktanforderungen

- Privacy by Default in Local und Cloud Vault.
- getrennte Flows fuer Subscription-Ende, Cloud-to-Local, Vault-Loeschung,
  Account-Loeschung und Detached Recovery.
- Auskunft, maschinenlesbarer Export, Berichtigung, Einschraenkung,
  Widerspruch und Loeschung mit nachvollziehbarem Status.
- keine echten Dokumente in Fixtures, Screenshots, Review-Accounts oder
  Entwicklungstelemetrie.
- Logs, Crash Reports, Supportbundles und AI-Prompts sind standardmaessig frei
  von Dokumentinhalt, Secrets und direkten Identifikatoren.
- Provider- und Zweckwechsel starten einen neuen Review; keine stillen
  Trainings-, Analyse- oder Marketingzwecke.

## Health- und AI-Daten

Gesundheitsdaten und andere besondere Kategorien erhalten einen eigenen
Rechtsgrundlagen-/Schutzmassnahmenentscheid. Der EDPB-AI-Hinweis im Source
Register wird fuer Training, Fine-Tuning, RAG und Modellprovider beruecksichtigt.
Mappm verwendet echte Kundendokumente nicht fuer Modelltraining, solange kein
separat freigegebener Rechts-, Produkt- und Consent-Vertrag existiert.

## Evidence und Tests

- aktuelles Datenflussdiagramm, Verzeichnis der Verarbeitungen und
  Providerregister.
- DSAR-, Export-, Correction-, Delete-, Retention- und Backup-Purge-Tests.
- Consent/Notice/Withdrawal- und Dark-Pattern-Review.
- Redaction-Tests fuer Logs, Crash, Support und Assist.
- dokumentierter Incident-/Breach-Prozess mit Rollen und Fristen.

## Stop Rules

- Stop ohne Rechtsgrundlage, Retention, Rollen- und Transferentscheid.
- Stop, wenn Export/Loeschung nur in der UI behauptet, aber nicht Ende-zu-Ende
  verifiziert ist.
- Stop, wenn besondere Kategorien ohne dokumentierte Schutzmassnahmen oder
  echte Daten in nicht freigegebene AI-/Support-/Analytics-Systeme gelangen.
