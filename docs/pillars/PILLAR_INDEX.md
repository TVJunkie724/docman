---
title: "DocMan Product Pillar Index"
description: "Master-Landkarte der DocMan Produkt-, Plattform-, Enterprise- und Governance-Säulen"
tags: [pillars, roadmap, product, enterprise, governance]
lastUpdated: "2026-05-12"
version: "0.3"
status: "proposed"
---

# DocMan Product Pillar Index

## Zweck

Dieser Index ist die Säulenlandkarte für DocMan.

Eine Säule beschreibt einen großen Verantwortungsbereich des Produkts oder der Produktentwicklung. Säulen sind nicht identisch mit Roadmap-Phasen:

- Roadmap-Phasen beantworten: Wann bauen wir welches Stück?
- Säulen beantworten: Welche Bereiche muss DocMan dauerhaft abdecken?
- F-Konzepte beantworten: Welche querschnittlichen Frontend-/Foundation-Regeln gelten über Säulen hinweg?

Alle Produkt-Säulen bauen auf der DMS-Zielarchitektur in
`docs/technical/DECISION_DMS_TARGET_ARCHITECTURE.md` auf. Der MVP darf kleine
Slices liefern, aber die langfristige Produktstruktur bleibt ein verbundenes
Dokumentenmanagementsystem mit Dokumenten, Dateien, Versionen, Vorgängen,
Profilen, Fakten, Aufgaben, Suche, Export, Sync und Intelligence.

Die konkrete zeitliche Umsetzung der Säulen steht nicht in diesem Index,
sondern in `docs/roadmap/PILLAR_ROADMAP_INDEX.md`.

## Produkt-Säulen

| Säule | Zweck |
|---|---|
| `PILLAR_CAPTURE_INBOX.md` | Dokumente erfassen, importieren, scannen, prüfen und aus der Draft-Inbox verarbeiten |
| `PILLAR_CASES_RECORDS.md` | Vorgänge, Subvorgänge, Dokumente, Records/Nachweise, Versionen und Beziehungen |
| `PILLAR_TASKS_REMINDERS_QUICK_ACCESS.md` | Aufgaben, Fristen, Erinnerungen, Schnellzugriff |
| `PILLAR_SEARCH_FACTS_INSIGHTS.md` | Suche, strukturierte Fakten, Claims, finanzielle und fachliche Auswertungen |
| `PILLAR_EXPORT_SHARING_EXTERNAL_ACTIONS.md` | Export, Druck, Mail, externe App-/Website-Links, spätere sichere Freigaben |
| `PILLAR_HOUSEHOLD_PROFILES_ACCESS.md` | Haushalt, Profile, Kinderprofile, Partnerzugriff und spätere Rechte |
| `PILLAR_TEMPLATES_WORKFLOWS.md` | Vorlagen, Checklisten, empfohlene nächste Schritte und Workflow-Hilfen |

## Plattform-Säulen

| Säule | Zweck |
|---|---|
| `PILLAR_HOME_HUB_SYNC.md` | Home Hub, Pairing, Upload, Sync, Konflikte, backend-agnostische Self-Hosted-Basis |
| `PILLAR_INTELLIGENCE_AUTOMATION.md` | OCR, Klassifikation, Fact-Vorschläge, Formularvorbefüllung, lokale LLM-Pipelines |
| `PILLAR_ADMIN_SETTINGS_STORAGE_HEALTH.md` | Setup, Einstellungen, Speicherzustand, Backup-Status, lokale Administration |

## Enterprise- und Governance-Säulen

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

## MVP-Regel

Eine Säule darf im MVP nur einen kleinen Slice liefern.

Beispiel:

- `Capture & Inbox` liefert echten MVP-Nutzen.
- `Compliance & Legal Readiness` liefert Mindestregeln, aber noch keine vollständige Store-Einreichung.
- `Observability` liefert lokale Diagnose- und Redaction-Regeln, aber noch keinen großen Monitoring-Stack.
- `Intelligence` wird vorbereitet, aber nicht gebaut.

## Akzeptanz

Die Säulenlandkarte ist akzeptiert, wenn:

- jede langfristig wichtige Verantwortung genau eine primäre Säule hat.
- Roadmap-Phasen auf Säulen verweisen.
- GitHub Issues und Milestones später einer Phase und mindestens einer Säule zugeordnet werden können.
- F-Konzepte nicht mehr für fachliche Produktbereiche missbraucht werden.
