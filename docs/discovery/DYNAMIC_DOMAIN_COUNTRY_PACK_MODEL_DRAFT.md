---
title: "Discovery Draft - Dynamic Domain and Country-Pack Model"
description: "Entwurf fuer eine deklarative, versionierte und auditierbare Abbildung wachsender Case-, Dokument-, Workflow-, Laender- und Providerkombinationen"
tags: [discovery, draft, architecture, domain, workflows, taxonomy, country-packs, rules, versioning]
lastUpdated: "2026-07-15"
status: "draft"
owner: "product-concept"
---

# Discovery Draft - Dynamic Domain and Country-Pack Model

## Problem

Dieser Entwurf vertieft die akzeptierte Richtung aus
`docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`. Er ersetzt
die Decision nicht und akzeptiert insbesondere noch kein Serialisierungsformat,
keine Registry, Signaturtechnik oder Regel-DSL.

Mappm soll mit einem begrenzten stabilen Kern langfristig tausende fachliche
Kombinationen abbilden koennen:

- ein generischer Case, optionale Workflow-Muster, sichtbare Fachvorlage und
  Workflowvariante;
- Dokumentgrundart, semantische Variante, Rolle und erwarteter Slot;
- Land, Rechtsraum, Sprache und Terminologie;
- Managed-Subject-Typ und persoenlicher/geschaeftlicher Kontext;
- Provider, Behoerde, Versicherung, Vertrag oder Regime;
- Zeitraum, Ereignis und anwendbare Regelversion;
- bestehender Case-/Record-Graph und erkannte Evidenz.

Diese Kombinationen duerfen weder als tausende Flutter-Enums noch als
serverseitige Sonderfaelle pro Anbieter wachsen. Das Ziel ist eine
kompositorische, gepruefte und rueckverfolgbare Definitionsebene.

## Draft-Richtung

Mappm verwendet eine stabile Kernontologie und laedt versionierte, signierte
Definitionen fuer Taxonomie, Workflows und Rechtsraumvarianten. Definitionen
sind **Daten, kein ausfuehrbarer Fremdcode**.

```text
Stable Core Ontology
  + One Generic Case and Reusable Workflow Patterns
  + Canonical Domain Templates and Document Taxonomy
  + Reusable Workflow Modules
  + Jurisdiction/Country Pack
  + Provider/Regime Overlay
  + Managed-Subject Context
  + Evidence and Existing Graph
  = Versioned Runtime Proposal/Workflow Instance
```

Flutter und Backend teilen Contracts und Identifikatoren, nicht hardcodierte
fachliche Formulare oder laenderspezifische Entscheidungsbaeume.

## Schichten

### L0 - Stabile Kernontologie

Nur wenige langlebige Entitaeten und Relationen werden im Produktcode
implementiert:

- `Case` und `CaseLink(part_of|caused_by|follow_up_to|related_to)`;
- `Document`, Seiten-/Dateimanifest und Document-to-Context-Link;
- `Record` und versionierte Record-Evidenz;
- `ManagedSubject`, `ExternalParty` und Rollen;
- `WorkflowInstance`, Stage, Step, Branch, Claim, Task und Event;
- `Fact`, `FinancialEntry`, Appointment/Deadline und erwartetes Dokument;
- `RoutingProposal`, Evidenz, Confidence, Alternative und Nutzerkorrektur.

Diese Ebene kennt keine OeGK, Arbeitnehmerveranlagung, Passverlaengerung oder
Fluggastentschaedigung.

### L1 - Generischer Case, Workflow-Muster und kanonische Taxonomie

Eine kontrollierte, versionierte Taxonomie definiert stabile semantische IDs.
Sie trennt die eine generische `Case`-Entitaet und ihre optionalen
Workflowbindungen von den vorlaeufig acht wiederverwendbaren Prozessgrammatiken
und den zahlreicheren sichtbaren Fachvorlagen aus
`CASE_DOCUMENT_TAXONOMY_CANDIDATES.md`:

- optionale Workflow-Muster wie `submission`, `episode`, `incident` oder
  `resolution`;
- domainbezogene Fachvorlagen wie `benefit_application`, `medical_care`,
  `medical_expense`, `purchase` oder `tax_collection`;
- Dokumentgrundarten und nur nach Zulassungstest stabile semantische Varianten;
- Domains und Record-Arten;
- Dokumentrollen/Slots je Workflow;
- Fact-Typen und Value-Schemas;
- Actor-/Subject-Rollen.

Anzeigenamen sind lokalisiert und austauschbar. IDs duerfen nicht aus
deutschen Labels oder Laenderbegriffen gebildet werden. Ein Country-Pack darf
neue Vorlagen oder Varianten publizieren, aber weder eine neue Case-Entitaet
noch ein neues Workflow-Grundmuster einfuehren, ohne eine eigene
rueckwaertskompatible Produkt-/Schemaentscheidung.

```text
Case = generische Dokumentensammlung und Koordinationskontext
workflowPattern = optionale wiederverwendbare Prozessgrammatik
domainTemplate = sichtbares fachliches Ziel und Matchingprofil
workflowModules = wiederverwendbare Schritte/Branches/Claims
countryVariant = Regeln, Begriffe, Evidenz, Institutionen und Outputs
providerOverlay = Einreichkanal und bestaetigte Providerbesonderheit
```

### L2 - Wiederverwendbare Workflow-Module

Viele Ablaufe wiederholen sich ueber Domains hinweg. Module koennen in
Golden Workflows komponiert werden:

- Evidenz sammeln und Vollstaendigkeit reviewen;
- Antrag/Einreichung senden und Eingang bestaetigen;
- auf Antwort warten und erwartete Antwort ueberwachen;
- Rueckfrage/Nachreichung bearbeiten;
- Rechnung pruefen, bezahlen und Zahlung abstimmen;
- Claim bei einem oder mehreren bestaetigten Payern verwalten;
- Termin, Frist, Verlaengerung oder Erneuerung verwalten;
- Entscheidung/Bescheid pruefen;
- Beschwerde/Einspruch als verknuepften Case beginnen;
- Export/Handoff an eine professionelle Stelle;
- Abschluss, Restbetrag, Ergebnis und Archivierung.

Module besitzen keine Rechtswirkung ohne ein freigegebenes Country-/Provider-
Pack. Ein generisches `appeal`-Modul kennt beispielsweise noch keine
oesterreichische Frist.

### L3 - Jurisdiction-/Country-Pack

Ein Country-Pack bindet kanonische Fachvorlagen und Module an einen datierten
Rechtsraum. Die generische Case-Entitaet und globalen Workflow-Muster bleiben
dabei unveraendert:

- offizielle Terminologie und lokalisierte Texte;
- anwendbare Subject-/Regime-Kombinationen;
- erlaubte Workflowvarianten und Case-Graph-Blueprints;
- erforderliche/optionale Dokumentrollen und Facts;
- Frist-/Reminderregeln mit amtlicher Quelle;
- regionale Abweichungen und zustaendige Institutionstypen;
- Safety Copy, Disclaimer und Eskalationsgrenzen;
- fachliche Owner, Quellen, Gueltigkeit und Withdrawal-Policy.

Ein Pack kann fuer `AT` beginnen und spaeter regionale Module fuer Bundesland,
Gemeinde oder institutionsspezifische Verfahren referenzieren. Sprache allein
bestimmt niemals den Rechtsraum.

### L4 - Provider-/Regime-Overlay

Provider-Overlays spezialisieren einen freigegebenen Workflow, ohne ihn zu
duplizieren:

- Sozialversicherungstraeger oder Zusatzversicherung;
- Behoerde, Gemeinde, Bildungseinrichtung oder Mobilitaetsanbieter;
- Vertrags-/Tarif-/Polizzenmerkmale;
- Einreichkanal, erforderliche Referenzen und erwartete Antworttypen;
- providerabhaengige, datierte Regeln und Quellen.

Overlays duerfen universelle Regeln nicht ueberschreiben, wenn das Pack dies
nicht explizit erlaubt. Nutzerbezogene Providerdaten bleiben Vault-Daten und
sind nicht Bestandteil des globalen Packs.

### L5 - Managed-Subject- und Nutzerkontext

Zur Laufzeit werden nur bestaetigte oder reviewbare Kontextfakten verwendet:

- Person oder verwaltete Organisation;
- Land/Rechtsraum und relevante Aufenthalts-/Sitzkontexte;
- vorhandene Records wie Vertrag, Polizze oder Ausweis;
- bestaetigte Provider und Entitlements;
- Nutzerpraeferenzen, vorherige Korrekturen und erlaubte Automationsklasse.

Aus Namen, Sprache oder einem einzelnen Dokument darf kein sensibles Regime
oder rechtlicher Status stillschweigend dauerhaft abgeleitet werden.

### L6 - Runtime-Proposal und gepinnte Instanz

Backend/Core Assist kombiniert Dokumentevidenz, bestehenden Graph und die
gueltigen Definitionen zu einem Vorschlag:

```text
RoutingProposal
  primaryContext
  proposedCases[]
  proposedRecords[]
  proposedCaseLinks[]
  documentRoles[]
  workflowDefinition/version
  titleProposals[]
  relevantFacts[]
  evidence/provenance[]
  confidence/alternatives
```

Nach Bestaetigung pinnt ein Case die verwendete Definition und Version. Eine
spaetere Pack-Aenderung schreibt bestehende Cases nicht still um.

## Case-Graph-Blueprints

Eine Workflowdefinition darf nicht nur eine lineare State Machine liefern.
Sie kann einen reviewbaren Graph-Vorschlag beschreiben:

```text
trigger document roles
  -> anchor Case or Record
  -> optional dependent Cases
  -> allowed CaseLink types
  -> Claims/branches/tasks
  -> expected response documents
  -> completion outcome
```

Beispiele:

- medizinische Rechnung -> medizinischer Behandlungsfall plus
  Kostenabrechnungs-Case mit `part_of`;
- Vertragsrechnung -> Vertrags-Record, kein Rechnungs-Case;
- Internetkuendigung -> Vertrags-Record, kein erfundener Umzugs-Parent;
- UVA-Periodensammlung -> optionaler `part_of` Jahres-Steuer-Case;
- Reparaturrechnung mit bestaetigter Schadennummer -> bestehender Schaden-Case;
  ohne Schadennachweis kein Unfall-Parent;
- Datenschutz-Auskunft -> eigenstaendiger Request-Case; eine spaetere
  Behoerdenbeschwerde ist ein verknuepfter Folge-/Dispute-Case.

Blueprints schlagen Struktur vor. Sie duerfen keine Relationen ohne
Evidenz/Review erzwingen.

## Deklaratives Pack-Format

Ein spaeterer Contract koennte konzeptionell folgende Form besitzen:

```yaml
packId: at.consumer.core
version: 2026.1.0
jurisdiction: AT
effectiveFrom: 2026-01-01
sourceCheckedAt: 2026-07-15
schemaVersion: 1
dependencies:
  taxonomy: core-taxonomy@1
  modules: workflow-modules@1
definitions:
  - templateId: benefit_application
    workflowPatternId: submission
    variants: []
  - templateId: medical_care
    workflowPatternId: episode
    variants: []
  - templateId: medical_expense
    workflowPatternId: settlement
    variants: []
documentMappings: []
providerOverlays: []
decisionTables: []
localizations: []
sources: []
approvals: []
compatibility: {}
withdrawalPolicy: {}
signature: {}
```

Das konkrete Format bleibt Contract-/Data-Architecture-Arbeit. JSON Schema oder
ein gleichwertiges strikt typisiertes Format muss unbekannte Felder,
inkompatible Versionen und ungueltige Referenzen deterministisch ablehnen.

## Regelmodell

Regeln muessen nachvollziehbar und begrenzt sein:

- typisierte Praedikate und Entscheidungstabellen statt beliebigem Code;
- explizite Inputs, Outputs und verwendete Quellen;
- dreiwertige Ergebnisse `applicable`, `not_applicable`, `unknown`;
- `unknown` fuehrt zu Rueckfrage, neutralem Workflow oder Abstention;
- keine Regel darf aus fehlenden Daten einen positiven Rechtsanspruch ableiten;
- jede abgeleitete Aufgabe/Frist traegt Rule-ID, Pack-Version und Evidenz;
- Backend kann komplexes Matching berechnen; der Client rendert nur bekannte,
  schema-validierte Resultate und fuehrt keine versteckte Rechtslogik aus.

## Distribution, Offline und Vault-Grenzen

- Packs werden signiert, schema-validiert und ueber einen kontrollierten
  Registry-/Releaseprozess verteilt.
- Local und Cloud Vaults koennen freigegebene Definitionen lokal cachen.
- Ein bereits gestarteter Case bleibt mit seiner gepinnten Version offline
  verstaendlich und bedienbar.
- Pack-Download, Vault-Sync und Assist-Verarbeitung sind getrennte Operationen.
- Packs enthalten keine privaten Dokumente, Providerzugangsdaten oder
  tenant-spezifischen Geheimnisse.
- Ein widerrufenes Pack bleibt fuer historische Anzeige verfuegbar, darf aber
  keine neuen Cases, Fristen oder Automationen starten.

## Versions- und Migrationsmodell

- Pack-Versionen sind unveraenderlich.
- Neue Cases verwenden die aktuell freigegebene kompatible Version.
- Laufende Cases wechseln nur nach klassifizierter Migration und sichtbarer
  Auswirkungspruefung; rechtlich relevante Aenderungen duerfen nicht still
  migriert werden.
- Korrekturen unterscheiden Datenfehler, Textkorrektur, Regelkorrektur,
  Sicherheitsrueckzug und Rechtsaenderung.
- Historie speichert, welche Regel zu welchem Vorschlag, Task oder Termin
  gefuehrt hat.
- Entfernte Provider-/Workflowvarianten erhalten einen Replacement- oder
  Withdrawal-Pfad.

## Qualitaetsvertrag

Jede veroeffentlichte Kombination braucht:

- Schema-, Referenz- und Signaturpruefung;
- Golden Fixtures mit synthetischen Dokumenten;
- positive, negative, `unknown`- und Widerspruchsfaelle;
- Graph-Invarianten und `part_of`-Zykluspruefung;
- deterministische Frist-/Zeitzonen-/Kalender-Tests;
- Accessibility- und Localization-Pruefung der sichtbaren Texte;
- juristische/fachliche Review-Evidence und aktuelle Quellen;
- Microcks-/Contract-Fixtures fuer Registry, Pack-Aufloesung und
  Routing-Proposals;
- Rollback-, Withdrawal-, Offline- und Altversions-Tests;
- Monitoring fuer Fehlzuordnungen, Abstention und Nutzerkorrekturen ohne
  sensible Inhalte in Telemetrie.

## Governance

Eine Definition durchlaeuft mindestens:

```text
draft
  -> domain review
  -> legal/regulatory review where applicable
  -> security/privacy review
  -> fixture and contract verification
  -> approved
  -> staged rollout
  -> active
  -> superseded or withdrawn
```

Content Owner, Legal Owner, technische Pack-Owner und Releasefreigabe muessen
getrennt nachvollziehbar sein. Community- oder AI-generierte Definitionen
duerfen niemals ohne denselben Reviewpfad produktiv werden.

## Offene Architekturentscheidungen

- finaler minimaler Workflow-Muster-Satz und Zulassungskriterien fuer neue
  Muster, Fachvorlagen, Dokumentgrundarten und semantische Varianten;
- Registry und Vertrauens-/Signaturmodell;
- genaue Schema- und Regel-DSL;
- Auswertungsteilung zwischen Backend und Client;
- Pack-Granularitaet fuer Land, Region, Provider und Steuerjahr;
- Kompatibilitaets- und Migrationsregeln;
- lokaler Cache, Rollback und Notfall-Withdrawal;
- welche Definitionen im App-Binary als Recovery-Baseline liegen;
- wie professionelle Content-Owner Quellenmonitoring und Incident-Korrekturen
  betreiben;
- wie Nutzerkorrekturen die Rankingmodelle verbessern, ohne unreviewte Regeln
  zu veraendern.

## Stop Rules

Stop if:

- Laender-/Providerlogik in Flutter-Screens, Enums oder `switch`-Kaskaden
  hardcodiert wird;
- Packs beliebigen ausfuehrbaren Code enthalten;
- Anzeigenamen als stabile IDs dienen;
- ein nationales Formular, eine Behoerde, ein Payer oder eine sichtbare
  Fachvorlage automatisch einen neuen Case-Typ, ein neues Workflow-Grundmuster
  oder einen Dokumentgrundtyp erzeugt;
- ein laufender Case durch Pack-Update still seine Bedeutung, Frist oder
  Aufgaben verliert;
- unreviewte Definitionen produktive Rechts-/Gesundheits-/Finanzentscheidungen
  ausloesen;
- ein unbekannter Kontext als positive Anwendbarkeit interpretiert wird;
- Provider-Overlay universelle Safety-/Compliance-Regeln umgehen kann;
- Pack-Telemetrie sensible Dokumentinhalte oder Case-Titel offenlegt.
