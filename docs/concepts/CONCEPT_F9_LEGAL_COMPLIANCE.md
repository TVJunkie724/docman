---
title: "Konzept F9 - Legal, Privacy and Regulatory Compliance"
description: "Datierte Legal-/Privacy-/EU-Regulatory-Gates fuer Local/Cloud Vault, Assist, Verkauf und Betrieb"
tags: [concept, legal, privacy, gdpr, cloud, ai-act, cra, eidas, subscriptions]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted-governance"
owner: "legal/compliance/product"
---

# Konzept F9 - Legal, Privacy and Regulatory Compliance

## Hinweis

Dieses Dokument ist Produkt-/Architektur-Governance und keine Rechtsberatung.
Vor Verkauf, realer Datenverarbeitung und jedem relevanten Release ist eine
aktuelle fachkundige Rechts-/Compliance-Pruefung erforderlich.

## Grundsatz

Legal, Privacy und Regulatory Readiness werden ab C0 pro Slice geplant und
nicht in ein spaetes Hardening verschoben. Local Vault, Cloud Vault, Core
Assist, Billing, Sharing, Identity und jedes Country/Provider Pack werden
getrennt auf Anwendbarkeit, Rollen, Zwecke, Datenfluesse und Risiken geprueft.

## Regulatorische Themen

Die verbindliche, datierte Arbeitsstruktur liegt unter `docs/regulatory/`:

- REG-01 DSGVO/GDPR und nationale Datenschutzanforderungen.
- REG-02 EU AI Act.
- REG-03 Cyber Resilience Act.
- REG-04 eIDAS/EUDI/ID Austria und Identity Trust.
- REG-05 NIS2-Applicability.
- REG-06 Data Act, Portabilitaet und Cloud Switching.
- REG-07 Produkthaftung, Verbraucher-, Vertrags- und Supportthemen.
- REG-08 Store-/Plattform-Compliance.

Das Source Register fuehrt zusaetzlich oesterreichisches DSG/NISG 2026,
Accessibility, digitale Verbraucherleistungen, Fernabsatz/E-Commerce, DSA und
den European Health Data Space mit expliziten Applicability-Triggern. Hinzu
kommen Urheber-/Lizenzrecht, UWG/Marketing Claims, Steuer-/Medizin-
Haftungsgrenzen, Export/Sharing und laenderspezifische Regeln der aktivierten
Maerkte.

## Datierte Quellenregel

Jede rechtliche, regulatorische oder Store-Aussage traegt:

- `asOf`-/Pruefdatum.
- Rechtsraum, Produktmodus, Nutzergruppe und betroffenen Flow.
- Primaerquelle und gegebenenfalls fachkundige Reviewquelle.
- Applicability: applicable, not applicable, conditional oder open.
- konkrete Produkt-/Contract-/Data-/Ops-Auswirkung.
- Owner, naechstes Reviewdatum und Trigger fuer ausserplanmaessige Pruefung.

Vor einem neuen Projekt, Markt, Provider, Store, AI-Modell, Billingmodell oder
Release werden Quellen erneut aktuell geprueft. Historische Checklisten sind
kein Freigabenachweis.

## Datenschutzvertrag

Pro Verarbeitung werden dokumentiert:

- Verantwortlicher/Auftragsverarbeiter/Subprozessor und Kontakt.
- Zweck, Datenklassen, Rechtsgrundlage und Transparenz.
- Datenminimierung, Privacy by Default und besondere Kategorien.
- Region, Transfermechanismus und Zugriff.
- Retention, Loeschung, Backupauswirkung und Audit.
- Betroffenenrechte: Auskunft, Export, Berichtigung, Einschraenkung,
  Widerspruch und Loeschung.
- DPIA-/DSFA-, DPO- und Incident/Breach-Pruefung, falls anwendbar.

Kuendigung, Vault-Loeschung und Account-Loeschung sind getrennt. Export und
Cloud-to-Local bleiben gemaess akzeptierter Policy erreichbar.

## AI/OCR

- Core Assist ist eine eigene Verarbeitung mit dokumentiertem Provider,
  Region, Zweck, Datenumfang, Retention, Loeschung und Human Oversight.
- Keine stillen externen Requests oder Trainingsverwendung echter Dokumente.
- Vorschlaege, Confidence, Provenance, Korrektur und Automation werden
  risikobasiert dokumentiert.
- Rechtlich/medizinisch/steuerlich verbindliche Claims kommen nicht aus einem
  LLM ohne freigegebene fachliche Quelle und Governance.
- Jede Advanced-Assist-Erweiterung startet eine neue AI-/Privacy-
  Applicability-Pruefung.

## Security, CRA und Betrieb

Anwendbare Secure-by-Design-, Vulnerability-, Update-, SBOM-, Incident-,
Supportzeitraum- und Reportingpflichten werden in Produkt, CI/CD und Operations
abgebildet. Marketing, Terms, Privacy Notice, Supportversprechen und tatsaechlich
gelieferte Updatefaehigkeit muessen uebereinstimmen.

## Country-/Provider-Packs

Jedes aktivierte Pack ist versioniert, datiert, quellenbasiert, fachlich
reviewt, lokalisierbar, withdrawbar und besitzt einen Update-/Haftungsowner.
Mappm behauptet keine Frist, Anspruchsberechtigung, Absetzbarkeit oder
Vollstaendigkeit ausserhalb des freigegebenen Scopes.

## Tests und Evidence

- Data-flow-/RoPA-/DPIA-Inputs pro relevantem Slice.
- DSAR-, Export-, Correction-, Delete- und Retention-Tests.
- Consent/Notice/Opt-out-/Withdrawal- und Dark-Pattern-Review.
- AI Human-Oversight-, Abstention-, Correction- und Audit-Nachweise.
- SBOM, Vulnerability, Update, Incident und Supportprozess.
- Store-/Market-/Country-Pack-Check mit Datum und Primaerquellen.

## Stop Rules

Stop, wenn Quellen/Pruefdatum fehlen, Applicability offen ist, echte Daten ohne
akzeptierte Rolle/Rechtsgrundlage/Retention fliessen, AI Training unklar ist,
Country Claims ungeprueft sind oder ein Release Datenschutz-/CRA-/Store-/
Consumer-Gates auf spaeter verschiebt.

## Handoff

Jeder betroffene Implementation Contract nennt Legal-/Privacy-/Regulatory-
Owner und Evidence. Frontend, Backend, Data, Security und Operations erhalten
getrennte Issues fuer ihre Konsequenzen.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die Phase stoppt.
