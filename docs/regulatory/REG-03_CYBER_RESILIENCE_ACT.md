---
title: "REG-03 Cyber Resilience Act"
description: "CRA-Vertrag fuer Secure by Design, Schwachstellen, Updates, Reporting und Konformitaet"
tags: [regulatory, cra, cybersecurity, release, sbom]
status: "accepted-governance-needs-legal-review"
owner: "security/release"
lastUpdated: "2026-07-15"
jurisdiction: "EU/EEA, Oesterreich"
regulatoryAsOf: "2026-07-15"
sourcesCheckedAt: "2026-07-15"
nextReviewDue: "2026-08-15"
primarySources: ["docs/regulatory/REGULATORY_SOURCE_REGISTER.md"]
legalReviewer: "Legal/Security-Compliance-Pruefung erforderlich"
---

# REG-03 Cyber Resilience Act

## Stichtage

- 11.09.2026: CRA-Meldepflichten fuer aktiv ausgenutzte Schwachstellen und
  schwere Sicherheitsvorfaelle beginnen.
- 11.12.2027: volle Anwendung des CRA.
- Die konkrete Produktklasse, Herstellerrolle, Konformitaetsroute und moegliche
  Ausnahmen werden fachkundig bestaetigt.

## Verbindliche Entscheidungen

- Produktklasse, Komponenten, Hersteller-/Importer-/Distributorrolle.
- Secure-by-Design-/Default-Anforderungen und Threat Model.
- Supportzeitraum, Sicherheitsupdates und End-of-Support-Kommunikation.
- Vulnerability Intake, Coordinated Disclosure, Triage und Remediation SLAs.
- SBOM, Dependency Provenance, Signierung und Supply-Chain-Kontrollen.
- Konformitaetsbewertung, technische Dokumentation und CE-/Release-Verantwortung.
- CRA Single Reporting Platform, CSIRT-/ENISA-Zustaendigkeit und
  24h-/72h-/Final-Report-Prozess.

## Produkt- und Betriebsanforderungen

- sichere Defaults fuer Vault, Account, Device Session, Sharing und Assist.
- signierte, reproduzierbare Updates mit Rollback-/Recovery-Strategie.
- keine bekannten ausnutzbaren Schwachstellen ohne dokumentierten Entscheid.
- Vulnerability- und Incidentprozess existieren vor externer Beta, nicht erst
  vor der vollen CRA-Anwendung.
- Support-, Update- und Securityversprechen in Produkt, Store, Terms und
  Supportkanal stimmen ueberein.

## Evidence

- Threat Models, Security Tests, Dependency-/Secret-Scans und SBOM pro Release.
- Vulnerability Disclosure Policy, Intake- und Eskalationstest.
- signierter Build-/Update-/Rollback-Nachweis.
- Tabletop-Test fuer 24h Early Warning, 72h Notification und Final Report.
- technische Dokumentation und nachvollziehbare Releasefreigabe.

## Stop Rules

- Stop ohne Product-Scope-/Rollenentscheid, SBOM, Update-/Supportpolicy oder
  Vulnerabilityprozess.
- Stop, wenn bis 11.09.2026 kein verifizierter Meldeprozess samt Owner und
  Erreichbarkeit besteht.
- Stop bei nicht reproduzierbaren oder nicht signierten Releaseartefakten.
