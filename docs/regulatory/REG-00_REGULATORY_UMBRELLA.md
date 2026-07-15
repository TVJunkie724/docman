---
title: "Mappm REG-00 Regulatory Umbrella"
description: "Regulatorischer Planungs- und Freigabevertrag fuer EU, Oesterreich, Stores und Plattformen"
tags: [regulatory, legal, eu, austria, stores, governance]
lastUpdated: "2026-07-15"
status: "accepted-governance"
owner: "compliance/product"
regulatoryAsOf: "2026-07-15"
sourcesCheckedAt: "2026-07-15"
nextReviewDue: "2026-08-15"
primarySources: ["docs/regulatory/REGULATORY_SOURCE_REGISTER.md"]
legalReviewer: "fachkundige Legal-/Compliance-Pruefung vor Freigabe erforderlich"
---

# Mappm REG-00 Regulatory Umbrella

## Zweck

Mappm verarbeitet sensible persoenliche Dokumente und plant Cloud-Speicherung,
Sync, Sharing, OCR/LLM-Assist, Abonnements und mehrere Vertriebsplattformen.
Compliance ist deshalb ein Querschnitt jedes Implementation Contracts und kein
spaeter Release-Nachtrag.

REG-00 ist Governance, keine Rechtsberatung.
`REGULATORY_SOURCE_REGISTER.md` dokumentiert den am 15.07.2026 geprueften
Planungsstand; die fachkundige Applicability-Entscheidung bleibt ein eigenes
Gate.

## Verbindliche Familien

| Familie | Artifact | Primaerer Trigger |
|---|---|---|
| Datenschutz/DSGVO/DSG | `REG-01_GDPR_PRIVACY_COMPLIANCE.md` | jeder personenbezogene Datenfluss |
| AI/OCR/LLM | `REG-02_EU_AI_ACT_GOVERNANCE.md` | Core Assist, Advanced Assist, Modell-/Providerwechsel |
| Produktsicherheit/CRA | `REG-03_CYBER_RESILIENCE_ACT.md` | kommerzielle Software, Updates, Schwachstellen und Incidents |
| eIDAS/EUDI/ID Austria | `REG-04_EIDAS_EUDI_IDENTITY_TRUST.md` | Identity Provider, Attribute, Signatur oder Account-Binding |
| NIS2/NISG 2026 | `REG-05_NIS2_ENTERPRISE_SECURITY.md` | Managed Cloud, Unternehmensgroesse, Zielsektor oder Lieferkette |
| Data Act/Portabilitaet | `REG-06_DATA_ACT_PORTABILITY_CLOUD_SWITCHING.md` | Cloud, Export, Providerwechsel und Offboarding |
| Vertrag/Haftung/Support | `REG-07_PRODUCT_LIABILITY_TERMS_SUPPORT.md` | Verkauf, Trial, Subscription, Claims und Supportversprechen |
| Store/Plattform | `REG-08_STORE_PLATFORM_COMPLIANCE.md` | jeder Distributionskanal und jedes Release |

Zusaetzlich werden je Feature insbesondere DSA, E-Commerce, digitale
Verbraucherdienste, Accessibility und bei Health-Interoperabilitaetsclaims der
European Health Data Space geprueft.

## Slice-Pflichten

Jeder betroffene Implementation Contract nennt:

- Rechtsraum, Markt, Nutzergruppe, Produktmodus und Instanz.
- betroffene Datenklassen, Zwecke, Rollen und Datenfluesse.
- relevante REG-Artefakte und datierte Primaerquellen.
- Applicability-Status und offenen fachkundigen Entscheid.
- konkrete UI-, Contract-, Data-, Security-, Ops- und Supportfolgen.
- Tests, Evidence, Owner, Reviewdatum und Stop Rule.

Frontend und Backend erhalten getrennte Issues. Frontend darf erforderliche
Fachinformationen und Nutzerflows beschreiben; Backend/API entscheidet seine
Contracts, DTOs, Endpunkte, Mapping-, Persistence- und Policy-Architektur.

## Review-Takt

- mindestens monatlich waehrend C0-C3 und vor jedem externen Release.
- ereignisbasiert bei Rechts-/Policy-Aenderung, neuem Markt, Provider,
  AI-Modell, Store, Billingmodell oder Datenzweck.
- unmittelbar vor gesetzlichen Stichtagen, insbesondere CRA-Reporting am
  11.09.2026, oesterreichischem NISG 2026 am 01.10.2026 und den ab
  09.12.2026 relevanten neuen Produkthaftungsregeln.

## Stop Rules

- Stop, wenn Applicability, Quelle, Datum, Owner oder fachkundige Freigabe fuer
  einen betroffenen Release fehlen.
- Stop, wenn echte Daten einen nicht freigegebenen Zweck, Provider, Markt oder
  Rechtsraum erreichen.
- Stop, wenn ein Release rechtliche, Store-, Security- oder
  Accessibility-Gates als spaeteres Hardening behandelt.
- Stop, wenn Marketing, Terms, Privacy Notice, Store-Deklaration und
  tatsaechliches Produktverhalten nicht uebereinstimmen.

## Handoff

F9 definiert die globale Legal-/Privacy-Governance, F8 die Distribution. Die
REG-Artefakte liefern die fachlichen Gate-Inputs; `quality-readiness` prueft
Evidence, nicht die Rechtsfrage selbst.
