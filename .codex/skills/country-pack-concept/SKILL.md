---
name: country-pack-concept
description: Verwende diesen Skill, wenn Mappm ein laender-, rechtsraum-, provider-, tarif- oder formularspezifisches Regelpaket plant, recherchiert, versioniert, prueft oder aktualisiert. Er gilt fuer Institutionen, Terminologie, Extraktionsmuster, Workflows, Fristen, Quellen, Reviewdaten und Withdrawal; er ist generisch und verwendet Oesterreich nur als erste Anwendung.
---

# Country Pack Concept

## Ziel

Ergaenze universelle Mappm-Case-/Dokumentsemantik durch aktuelle, datierte und
versionierte Country-/Provider-Regeln, ohne nationale Varianten in globale
IDs einzubauen.

## Normative Quellen

Lies:

1. `docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`
2. `docs/technical/DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md`
3. `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md`
4. `docs/technical/DECISION_INTELLIGENCE_SCOPE.md`
5. `docs/ops/OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md`
6. `docs/regulatory/REGULATORY_SOURCE_REGISTER.md`
7. die betroffenen globalen Family-/Dokument-Decisions;
8. vorhandene Country-/Provider-Decision oder Discovery-Datei.

Nutze `references/COUNTRY_PACK_TEMPLATE.md` und
`references/SOURCE_REVIEW_MATRIX.md`.

## Research-Pflicht

Country-, Rechts-, Store-, Provider-, Frist- und Formularregeln sind
zeitabhaengig. Recherchiere vor jeder fachlichen Freigabe im Internet und
verwende vorrangig aktuelle offizielle Primaerquellen der Behoerde, des
Gesetzgebers, Providers oder Plattformbetreibers.

- Datieren jede Quelle und jeden Abruf.
- Halte `validFrom`, optional `validTo`, Rechtsraum, Provider/Tarif,
  Rule-Version und naechsten Review fest.
- Trenne belegte Aussage, Produktinterpretation und offene Annahme.
- Zitiere keine Suchergebnisse als Quelle.
- Lege ohne aktuelle offizielle Evidenz keine aktive Regel oder Frist fest.

## Vorgehen

### 1. Globale Referenzen festlegen

Referenziere bestehende universelle Case-, Workflow-, Dokument-, Rollen- und
Record-IDs. Ein lokales Formular oder Providername erzeugt nicht automatisch
eine globale ID.

### 2. Pack-Scope definieren

Bestimme:

- Country/Region und Sprache getrennt;
- Rechtsraum, Institution, Provider, Tarif/Formular und Zielgruppe;
- aktivierte globale Familien und Varianten;
- lokale Begriffe/Aliase und Erkennungs-/Feldmuster;
- Workflow-/Task-/Fristregeln und erwartete Antworten;
- generischen Fallback;
- Zielrelease und Commercial Claim.

Erkennungs-/Feldmuster sind Hilfen fuer OCR, Parser und Ranking, keine
Zusicherung semantischer Erkennung. Plane fuer kleine beziehungsweise mittlere
General-Purpose-Modelle. Ein Pack darf keine betroffene Person,
Dokumentkohaerenz, Workflow-Zustand, Kausalitaet oder Beziehung als
verlaessliche Modellwahrheit voraussetzen. Ein Pack darf fuer
produktdefinierte, typabhaengige Reviewfelder lokale Datumsbegriffe und
semantische Kandidaten liefern. Der Top-Kandidat, weitere erkannte Werte,
`Kein Datum` und manuelle Eingabe bleiben vor der sichtbaren
Nutzerbestaetigung wirkungslos. Nicht erkannte lokale Varianten fallen auf
generischen Dokument-, Case- und manuellen Fact-Flow zurueck.

### 3. Regeln mit Provenienz modellieren

Jede aktive Regel besitzt Quelle, Fundstelle, Abrufdatum, Owner,
Reviewstatus, Geltungsbeginn/-ende, Startanker, Berechnung beziehungsweise
Ausloeser und Withdrawal-Verhalten.

Eine Modellinterpretation oder ein Providername allein finalisiert keine
materielle Frist. Mappm weist Nutzer auf Regelstand und Hilfscharakter hin und
behauptet keine Rechts-, Steuer-, Versicherungs- oder Deckungsberatung.

### 4. Betrieb planen

Erfuelle OPS-09:

- monatlicher Quellencheck;
- mindestens halbjaehrlicher menschlicher Fachreview;
- Pre-Publish- und Release-Gate;
- unveraenderliche veroeffentlichte Versionen;
- Change-/Incident-Issue;
- Withdrawal, Fallback und Korrektur ohne stille historische Neuberechnung;
- benannter fachlicher und technischer Owner.

Store-Compliance, EU-/lokales Recht und andere zeitabhaengige Anforderungen
erhalten dieselbe Datums-/Quellen-/Reviewdisziplin.

### 5. Handoffs

Product/Domain besitzt Semantik und Scope. Legal/Compliance beziehungsweise
benannte Fachowner pruefen Rechts-/Providerbehauptungen. Backend/Data/API
entscheiden Registry, Signatur, Distribution, Caching, DTOs, Mapping und
Persistenz. UI plant erst danach Darstellung und Korrektur.

Verfolge technische Unsicherheit im Feasibility-Register. Erstelle getrennte
Issues mit `github-issue`; kein gemischtes Frontend-/Backend-Issue.

## Stop Rules

Stoppe, wenn:

- zeitabhaengige Regeln ohne aktuellen offiziellen Quellencheck entstehen;
- Sprache als Country-/Jurisdiction-Erkennung dient;
- Country-/Providerdetails globale Case-/Dokument-IDs vervielfachen;
- ein Pack ohne generischen Fallback, Owner oder Reviewdatum aktiv wird;
- eine Regel Rechts-, Steuer-, Deckungs- oder Erstattungsgewissheit behauptet;
- ein Pack ein intelligenteres Modell als die akzeptierte
  Small-/Medium-Model-Baseline voraussetzt oder semantische
  Personen-/Kohaerenz-/Workflow-/Frist-/Beziehungswahrheit verspricht;
- ein Update historische bestaetigte Fristen still neu berechnet;
- Discovery-Draft als veroeffentlichtes Pack gelesen wird;
- der Skill DTOs, Endpunkte, Registry- oder Persistenzarchitektur erfindet.
