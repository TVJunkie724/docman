---
title: "Decision - Milestone Quality Gates"
description: "Verbindliche Quality Gates fuer lokale Aenderungen und Commercial-Core-Gates C0-C7"
tags: [decision, quality, testing, ci, production-readiness, gates]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "quality-readiness"
---

# Decision - Milestone Quality Gates

## Entscheidung

Mappm verwendet ein lokales Change Gate und gestaffelte C0-C7-Gates. Ein Gate
misst den freigegebenen Zielpfad und seine Abhaengigkeiten. Historische
Milestone-Namen, eine hohe Testzahl oder ein gruener Happy Path ersetzen keinen
Nachweis der Produktversprechen.

## Change Gate

Jede Aenderung prueft mindestens:

- Formatierung/Lint/Analyzer fuer betroffene Quellen.
- relevante Unit-, Provider-, Repository- und Widgettests.
- Dokumentlinks/Frontmatter/Contract-Examples, falls betroffen.
- keine neue Legacy-Abhaengigkeit oder Architekturverletzung.
- keine Secrets, privaten Fixtures oder sensiblen Logs.
- aktualisierte Acceptance-/Verification-Evidence.

Exakte Commands stehen im Implementation Contract und verwenden nach
Moeglichkeit `frontend.sh`/`scripts/verify.sh`.

## C0 - Product and Trust Contract

- Scope, Owner und Source of Truth eindeutig.
- Vault-/Account-/Assist-/Commercial-/Country-/Taxonomie-Gates geschlossen oder
  mit Owner, Zielphase und zulässigem Nicht-Scope explizit verschoben.
- aktuelle Legal-/Regulatory-/Store-Applicability mit Datum/Quelle geplant.
- keine widerspruechliche aktive Architektur in Concepts/Decisions/Roadmap.

## C1 - Vault, Account and Provider Foundation

- Clean Architecture/Riverpod/Domain-Port-Zielpfad analysierbar.
- Local/Cloud Authority, Cache, Pending, Session/Device und Entitlement getrennt.
- Drift/File/Secure-Storage-Grenzen und Migrationen testbar.
- Fakes/Fixtures vollsynthetisch und deterministisch.
- OpenAPI/Microcks-Baseline fuer aktivierte Provider.
- Bootstrap/Codegen/Verify aus frischem Checkout reproduzierbar.

## C2 - Capture, Core Assist and Review

- hochwertige Mobile-/Desktop-Erfassung mit haltbarem Original.
- ein logisches Dokument pro Scan-Einheit; Mixed Session/Import korrigierbar.
- OCR/Extraction/Index/Matching sowie verpflichtender Titelvorschlag.
- High/Medium/Low Confidence, Outlier, Teilfehler, App-Kill und Retry.
- User-Bestaetigung sichtbarer Folgen bis zur freigegebenen Automation.
- Local-/Cloud-/Free-/Paid-/Offline-/Quota-Matrix fuer aktivierten Scope.
- Contract Consumer/Provider, Privacy, A11y und Mobile-Build-Evidence.

## C3 - Document Core, Cases, Records, Search and Tasks

- jedes akzeptierte Dokument besitzt primaeren Case oder Record.
- Custom/Guided Case parity, Mehrfachbeziehungen und Korrektur.
- Search, Tasks/Agenda und relevante Facts funktionieren im aktivierten Scope.
- kein grosser Case-Typ-Picker, keine losen Dokumente, kein Subcase-Datentyp.
- responsive/keyboard/semantics/privacy Evidence fuer Kernflows.

## C4 - Lifecycle and Commercial Safety

- Local Export/Backup/Restore und aktivierte Managed-Cloud-Backups.
- Local-to-Cloud/Cloud-to-Local mit Checkpoint, Verifikation und einer
  Autoritaet.
- Entitlement, Kuendigung, Grace, Read-only, Reaktivierung und getrennte
  Vault-/Account-Loeschung.
- Exit bleibt bei Quota/Payment/Cancellation erreichbar.
- Restore-/Migration-/Deletion-/Rollback-Drills dokumentiert.

## C5 - Compliance, Operations and Release

- CI/CD, Supply Chain, Signing, Update, Migration und Rollback.
- Staging/Production-Config-/Secret-/Environment-Isolation.
- Observability, SLO/Incident, Support und redigierte Diagnose.
- datierte Legal/Privacy/AI-Act/CRA/eIDAS/EUDI/Store-/Country-Pack-Gates.
- reproduzierbarer Release Candidate mit SBOM/Lizenzen und Review Access.

## C6 - Closed Beta

- freigegebene realistische Beta-Daten/Accounts und Supportprozess.
- Recovery, Export, Migration, Rollback und Incident unter realen Bedingungen.
- keine offenen P0/P1; P2-Risiken bewertet und geowned.
- Telemetry/Privacy/SLO-Evidence ohne sensible Datenlecks.

## C7 - Commercial 1.0

- dokumentiertes Go/No-Go durch Product, Security, Privacy, Quality,
  Operations, Legal/Compliance und Release.
- alle aktivierten Produktclaims, Maerkte, Plaene, Plattformen und Provider sind
  exakt durch Evidence gedeckt.
- Support-, Update-, Incident-, Retention- und Decommission-Verpflichtungen sind
  finanzierbar und betreibbar.

## Legacy und Waiver

Legacy darf isoliert und als Baseline dokumentiert sein, aber keinen
Produktstart, Analyzer, Build, Test, Migration oder Releasepfad beeinflussen.
Waiver sind klein, risikobewertet, mit Owner/Issue/Ablaufdatum versehen und
duerfen Datenverlust, Security, Privacy, Legal, Restore oder Exit nicht umgehen.

## Stop Rules

Stop, wenn ein Gate nur als Checklist ohne Evidence abgehakt wird, Local/Cloud
nicht getrennt getestet sind, Contract-/Restore-/Migration-/Privacy-
Nachweise fehlen, bekannte P0/P1 offen sind oder ein veralteter Rechts-/Store-
Check als aktuelle Freigabe gilt.
