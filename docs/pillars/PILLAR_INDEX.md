---
title: "Mappm Product Pillar Index"
description: "Master-Landkarte der Mappm Produkt- und Plattform-Säulen sowie querschnittlichen Assurance Tracks"
tags: [pillars, roadmap, product, enterprise, governance]
lastUpdated: "2026-07-14"
version: "1.1"
status: "accepted"
---

# Mappm Product Pillar Index

## Zweck

Dieser Index ist die Säulenlandkarte für Mappm.

Eine Säule beschreibt einen großen Verantwortungsbereich des Produkts oder der Produktentwicklung. Säulen sind nicht identisch mit Roadmap-Phasen:

- Roadmap-Phasen beantworten: Wann bauen wir welches Stück?
- Säulen beantworten: Welche Bereiche muss DocMan dauerhaft abdecken?
- Assurance Tracks beantworten: Welche Qualitäts-, Sicherheits-, Rechts- und
  Betriebsanforderungen müssen jede betroffene Phase begleiten?
- F-Konzepte beantworten: Welche querschnittlichen Frontend-/Foundation-Regeln gelten über Säulen hinweg?

Alle Produkt-Säulen bauen auf der DMS-Zielarchitektur in
`docs/technical/DECISION_DMS_TARGET_ARCHITECTURE.md` auf. Der M2 darf kleine
Slices liefern, aber die langfristige Produktstruktur bleibt ein verbundenes
Dokumentenmanagementsystem mit Dokumenten, Dateien, Versionen, Vorgängen,
Profilen, Fakten, Aufgaben, Suche, Export, Sync und Intelligence.

Die konkrete zeitliche Umsetzung der Säulen steht nicht in diesem Index,
sondern in `docs/roadmap/PILLAR_ROADMAP_INDEX.md`.

## Produkt-Säulen

| Säule | Zweck |
|---|---|
| `PILLAR_CAPTURE_INBOX.md` | Dokumente erfassen, importieren, scannen, prüfen und aus der Draft-Inbox verarbeiten |
| `PILLAR_CASES_RECORDS.md` | eigenständige Vorgänge, typisierte Beziehungen, Unterlagen, Dokumente und Versionen |
| `PILLAR_CONTRACTS_SUBSCRIPTIONS.md` | Verträge, Abos, wiederkehrende Rechnungen, Kündigungsfristen und schlanke Verläufe |
| `PILLAR_TASKS_REMINDERS_QUICK_ACCESS.md` | Aufgaben, Fristen, Erinnerungen, Schnellzugriff |
| `PILLAR_SEARCH_FACTS_INSIGHTS.md` | Suche, strukturierte Fakten, Claims, finanzielle und fachliche Auswertungen |
| `PILLAR_EXPORT_SHARING_EXTERNAL_ACTIONS.md` | Export, Druck, Mail, externe App-/Website-Links, lokale Exportpakete |
| `PILLAR_HOUSEHOLD_PROFILES_ACCESS.md` | verwaltete Personen/Organisationen, Haushalt, Kinderprofile, Partnerzugriff und spätere Rechte |

Vorlagen, Checklisten, Custom Cases und Workflow-Hilfen sind eine
unterstützende Capability über Cases, Tasks und Länderpakete. Das Dokument
`PILLAR_TEMPLATES_WORKFLOWS.md` bleibt ihre normative Detailquelle.

## Plattform-Säulen

| Säule | Zweck |
|---|---|
| `PILLAR_CLOUD_IDENTITY_SYNC.md` | Mappm Cloud, Account/Gerätevertrauen, Vaults, Entitlements, Upload, Sync, Konflikte und Migration |
| `PILLAR_INTELLIGENCE_AUTOMATION.md` | Core Assist mit OCR, Klassifikation, Akteur-/Fact-/Vorgangsvorschlägen sowie spätere Advanced-Assist-Automation |
| `PILLAR_ADMIN_SETTINGS_STORAGE_HEALTH.md` | Client-Plattform, Vault-/Account-Einstellungen, Speicher-/Cachezustand, Backup/Export und Diagnose |

## Assurance Tracks

Diese Bereiche sind keine gleichrangigen Feature-Säulen. Sie liefern
verbindliche Gates und Slices in jede betroffene Phase und können parallel von
eigenen Owners bearbeitet werden. Kein Feature darf sie auf einen späten
"Hardening"-Block verschieben.

| Säule | Zweck |
|---|---|
| `PILLAR_QUALITY_ASSURANCE.md` | QA, Teststrategie, Regression, Fake-Repos, Microcks, Accessibility, Visual Checks |
| `PILLAR_OBSERVABILITY_RUNTIME_OPERATIONS.md` | Logging, Audit, Telemetry, Metrics, Health Checks, Redaction, Runtime-Betrieb |
| `PILLAR_SECURITY_PRIVACY_ARCHITECTURE.md` | Security-Architektur, Privacy-by-Design, Verschlüsselung, Trust Boundaries |
| `PILLAR_COMPLIANCE_LEGAL_READINESS.md` | DSGVO/GDPR, EU/AT Datenschutz, Apple/Google/Microsoft Store Policies, Lizenzen |
| `PILLAR_RELEASE_DISTRIBUTION_CHANGE_MANAGEMENT.md` | CI/CD, Versionierung, Migrationen, Rollback, Signing, Distribution |
| `PILLAR_DATA_LIFECYCLE_RESILIENCE.md` | Backup/Restore, Retention, Löschung, Tombstones, Storage Integrity, Recovery |
| `PILLAR_DEVELOPER_EXPERIENCE_ARCHITECTURE_GOVERNANCE.md` | Bootstrap, Codegen, Architekturregeln, ADRs, Issues, Definition of Done |
| `PILLAR_DESIGN_SYSTEM_UX_GOVERNANCE.md` | Design-System, Navigation, Komponenten, Accessibility, responsive UX |
| `PILLAR_SUPPORT_DIAGNOSTICS.md` | Diagnosepakete, Support-Modus, Fehleranalyse, Nutzerhilfe ohne Datenleck |
| `PILLAR_COMPATIBILITY_PLATFORM_SUPPORT.md` | macOS, iOS, Android, später Windows/Linux, Plattformfähigkeiten und Unterschiede |
| `PILLAR_INTEGRATION_GOVERNANCE.md` | Regeln für externe Links, Deep Links, spätere APIs, Trust Boundaries und Credentials |

## Slice-Regel

Eine Phase implementiert einen vertikalen Slice aus einer oder mehreren
Säulen. Sie aktiviert zugleich die betroffenen Assurance Tracks. Eine Säule
kann parallel bearbeitet werden, wenn ihre Contracts und Abhängigkeiten
akzeptiert sind; Basisslices werden vor abhängigen Slices geplant.

Beispiel:

- `Capture & Inbox` liefert echten M2-Nutzen.
- `Compliance & Legal Readiness` liefert phasenbezogene Regeln; die konkrete
  Store-Einreichung bleibt ein Release-Gate.
- `Observability` liefert lokale Diagnose- und Redaction-Regeln, aber noch keinen großen Monitoring-Stack.
- `Core Assist` ist C2/C3-Scope, wird aber erst mit akzeptierten
  Daten-/Trust-/AI-Gates für echte Dokumente aktiviert; Advanced Assist bleibt
  ein späterer Slice.

## Akzeptanz

Die Säulenlandkarte ist akzeptiert, wenn:

- jede langfristig wichtige Verantwortung genau eine primäre Säule hat.
- Roadmap-Phasen auf Säulen verweisen.
- GitHub Issues und Milestones später einer Phase und mindestens einer Säule zugeordnet werden können.
- F-Konzepte nicht mehr für fachliche Produktbereiche missbraucht werden.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
