---
title: "Decision - Document Taxonomy and Role Model"
description: "Mappm-Taxonomie mit minimal ausreichender Klassifikation, getrennten Dokumentgrundarten, Varianten, Domaenen, Record-Arten, Quellen und beziehungsbezogenen Rollen"
tags: [decision, document-types, subtypes, roles, metadata, records, workflows, intelligence]
lastUpdated: "2026-07-25"
status: "accepted-direction"
owner: "product-concept"
---

# Decision - Document Taxonomy and Role Model

## Status

The taxonomy axes, relationship-role model and the principle of **minimum
sufficient classification** are accepted as a permanent product rule, not an
M1-only simplification. The complete set of document base
types/semantic variants and its full mapping to optional workflow patterns and
domain templates is not yet accepted and requires the R0.6 product review.
Minimum sufficient classification is explicitly not a ban or presumption
against subtypes. Semantic variants are a normal part of the target model and
must be retained wherever they improve durable retrieval or materially change
matching, extraction, workflow, tasks, deadlines, state, export or handoff.
`medical_invoice` remains the leading accepted product-value example because
it opens a stable Medical Cost Settlement composition with payment and
multiple Payer paths. `docs/discovery/CASE_DOCUMENT_TAXONOMY_CANDIDATES.md` currently proposes a
reduced set of global base types and retains roughly 300 terms only as
normalization, alias, OCR and fixture vocabulary.

Die produktive Typ-/Variantenliste bleibt bewusst klein. Alle Planungen setzen
kleine bis mittlere General-Purpose-Modelle voraus, die grobe Unterschiede wie
Apothekenrechnung versus Elektronikrechnung erkennen koennen, aber keine feine
Formular-, Rollen-, Rechts- oder Lebenskontextsemantik verlaesslich
beherrschen. Ein produktrelevanter Subtyp bleibt erlaubt, benoetigt aber einen
belegten Erkennungspfad auf der Zielmodellklasse oder eine einfache bewusste
Nutzereingabe. Der breite/generische Typ bleibt immer vollwertiger Fallback.

Workflow-Muster, Fachvorlagen-IDs, deutsche Case-Titel, Katalogstatus und
Disposition werden nicht in der Dokumenttaxonomie gepflegt. Deren alleinige
SSOT ist `DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`; dieses Dokument und der
Discovery-Entwurf referenzieren sie nur fuer Mapping und Kompatibilitaet.

The former mixed M2 catalog (`invoice`, `contract`, `health`, `authority`,
`evidence_photo`, `note_other`, etc.) is a historical seed only. It must not be
implemented as the final normalized taxonomy because it mixes semantic type,
domain, medium, Record meaning and fallback values.

## Decision

### Produktziel und minimale ausreichende Klassifikation

Mappm optimiert nicht auf taxonomische Vollstaendigkeit. Das Produkt soll
Dokumente eines Haushalts auffindbar und nutzbar machen, ihren fachlichen
Kontext erschliessen und daraus relevante Vorgaenge, Records, Aufgaben,
Fristen, erwartete Antworten und weitere Aktionen ableiten.

`Document` bleibt technisch ein eigenstaendiges Kernobjekt fuer Original,
Versionen, Suche, Provenienz und Verknuepfungen. Fuer die Nutzerin ist aber
nicht die moeglichst genaue Benennung jedes Dokuments das Ziel. Massgeblich ist
die **am wenigsten granulare stabile Klassifikation, die den benoetigten
Produktnutzen vollstaendig traegt**.

| Bedarf | Bevorzugte Abbildung |
|---|---|
| langlebige, spaeter gezielt benoetigte Unterlage | passender Record-Kind und nur die dafuer notwendige Dokumentgrundart |
| materiell anderes Matching, Workflowverhalten, Aufgabe, Frist, Zustand, Export- oder Handoff-Verhalten | bestehende Grundart, in begruendeten Faellen eine stabile Variante oder eine sparsame beziehungsbezogene Rolle |
| konkrete fachliche Bedeutung ohne eigenes Produktverhalten | generierter editierbarer Titel, extrahierte Facts, Parties, Volltextindex und Aliasvokabular |
| keine belastbare oder keine produktrelevante feinere Unterscheidung | bewusster allgemeiner beziehungsweise breiter Domain-Dokumenttyp oder `unknown`-Fallback |

Ein erkannter Begriff darf daher fuer Titel, Suche, Matching und Erklaerung
genutzt werden, ohne als persistierter Subtyp zu existieren. Beispielsweise
kann `Bewilligung Physiotherapie` ein allgemeines medizinisches Dokument mit
genau diesem Titel, bestaetigten Facts und der Rolle `response` oder `decision`
sein. Das System verliert dadurch keine fuer den Ablauf benoetigte Bedeutung.

Eine allgemeine oder breite Klassifikation ist kein Fehlerzustand und kein
qualitativ minderwertiger Fallback. Sie ist die beabsichtigte Zielabbildung,
wenn weitere Granularitaet weder Wiederauffindbarkeit noch Produktverhalten
verbessert. Die Nutzerin muss eine fachliche Feinheit nicht bestaetigen, wenn
Titel, Kontext und sichtbare Folge bereits eindeutig genug sind.

Mappm classifies a document across separate axes:

| Axis | Question | Example |
|---|---|---|
| document base type | Welche stabile fachliche Grundart hat das Dokument? | Rechnung/Charge, Entscheidung, Vertrag/Polizze, Report |
| optional semantic variant | Welche stabile, produktrelevante Auspraegung liegt vor? | zum Beispiel `medical_invoice`; weitere Kandidaten bleiben bis OQ-011 offen |
| domain | In welchem Fachbereich tritt es auf? | Gesundheit, Wohnen, Arbeit, Steuer |
| relationship role | Welche Funktion hat es in genau diesem Case/Record oder bestaetigten Ereignis? | Ausloeser, Nachweis, Einreichung, Antwort, Entscheidung |
| Record kind | Welches langlebige Objekt/versioniert es? | Reisepass, Polizze, Mietvertrag |
| source/format | Wie kam es herein und welches Medium ist es? | Mobile Scan, PDF, Bildnachweis, E-Mail spaeter |
| jurisdiction/provider context | Welche gepruefte Variante ist anwendbar? | AT, konkrete SV/Versicherung/Behoerde |

These axes are not flattened into one global enum or user form.

Ein technischer Container wie ein ZIP-Medienpaket ist keine fachliche
Dokumentgrundart. Der kontextuelle medizinische Desktop-Archivimport verwendet
eine Quelle/Containerart wie `media_archive`; der bereits geoeffnete Care-Case,
Domain, Titel und Facts beschreiben die fachliche Bedeutung. DICOM, Roentgen,
CT, MRT,
mitgelieferter Viewer oder USB/CD werden dadurch nicht automatisch zu globalen
Dokumenttypen oder semantischen Varianten.

Der case-lokale Archivimport darf einen allgemeinen beziehungsweise breiten medizinischen
Dokumentkontext verwenden. Eine spaetere technische Vorschauunterstuetzung
aendert nicht die fachliche Taxonomie.

Zeitangaben sind strukturierte, provenienzgebundene Facts nach
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`, keine Dokumentgrundart und
normalerweise kein Grund fuer eine semantische Variante. `Laborbefund` oder
`Radiologiebefund` wird beispielsweise nur dann ein eigener globaler
Varianten-Key, wenn die Unterscheidung den unten definierten Produktwerttest
erfuellt; erkennbare Details duerfen sonst im Titel, in Facts und im Suchindex
bleiben.

## Gepruefte fileee-Kandidaten und Mappm-Disposition

Am 25. Juli 2026 wurde die oeffentlich dokumentierte fileee-Typauswahl als
Marktbenchmark gegen das Mappm-Modell geprueft. Die fileee-KI-Seite nennt zehn
Typen, das aktuelle offizielle Hilfecenter listet vierzehn Typen plus
`Anderes`; fuer Mappm ist daher die konkrete Begriffsliste, nicht die
abweichende Anzahl, der relevante Input.

- https://www.fileee.com/ki
- https://fileee.thinkowl.com/self-service-portal/fileee/knowledgebase/file/19686/Welche-Dokumente-erkennt-die-fileee-Analyse%3F

Die folgende Disposition ist verbindlicher Input fuer R0.6/OQ-011, aber keine
Freigabe, die Tabelle ungeprueft als Enum zu implementieren:

| Marktbegriff | Mappm-Disposition | M1-Grenze |
|---|---|---|
| Rechnung | bestehende Grundart `invoice_or_charge`; `medical_invoice` bleibt produktrelevante Variante | ja |
| Kassenzettel/Kassenbeleg | fuer Nutzer dieselbe verstaendliche Finanzfamilie `Rechnung & Beleg`, fachlich primaer `payment_record`, weil normalerweise bereits bezahlt | ja; kein neuer Zahlungstask allein aus dem Typ |
| Ticket | `ticket_or_entitlement` bleibt spaeterer Produktwertkandidat | M1 generisch |
| Gehaltsabrechnung | `financial_statement`; stabile Variante nur nach Produktwert-/Feasibility-Gate | ja als unterstuetzter Begriff, keine Lohnbuchhaltung |
| Zertifikat/Zeugnis | `credential_or_certificate` plus konkreter langlebiger Record-Kind | ja |
| Information | kein eigener M1-Typ | generisch mit Titel/Facts |
| Brief | kein eigener M1-Typ | generisch mit Titel, Aussteller/Absender und Facts |
| Vertrag | `contract_or_policy` plus langlebiger Vertrags-/Polizzen-Record | ja |
| Werbung | kein Produktwert fuer den Zielscope | kein Typ, kein M1-Flow |
| Kontoauszug | `financial_statement`, gegebenenfalls an Bankkonto-Record gebunden | ja, ohne Transaktionsanalyse in M1 |
| Identifikation | `credential_or_certificate` plus spezifischer Identity-Record | ja |
| Bankkarte | spaeterer, Security-/Privacy-gegateter Payment-Record-Kandidat; keine vollstaendige Karte/CVV still archivieren | nicht M1 |
| Mitgliedsausweis | spaeterer Wallet-/Karten-/Berechtigungs-Record-Kandidat | nicht M1 |
| Arbeitsunfaehigkeitsbescheinigung | produktwertgepruefter Variantenkandidat mit Gesundheits-, Arbeits- und Zeitbezug | M1-Kandidat; finaler Gate in OQ-011/WF-01 |
| Anderes | vollwertiger generischer Fallback | ja |

Mitglieds-, Kunden-, Gutschein- und Berechtigungskarten sowie gegebenenfalls
Visitenkarten werden fuer einen spaeteren, eigenstaendigen
Wallet-/Karten-/Kontakt-Slice vorgemerkt. Sie werden nicht in die M1-
Dokumenttaxonomie gedrueckt. Bankkarten bleiben davon getrennt und benoetigen
vor jeder Aktivierung einen eigenen Security-/Privacy-/Datenminimierungs-Gate.

## Kompakte Review-Feldprofile

Jede produktiv unterstuetzte Grundart und jede produktrelevante Variante
braucht vor ihrer Freigabe ein versioniertes minimales Review-Feldprofil. Das
Profil bestimmt die wenigen fachlich relevanten Felder; OCR/Parser/Modell
liefern nur Werte und Kandidaten dafuer. Sie duerfen weder neue sichtbare
Felder erfinden noch die gesamte Rohmetadatenmenge standardmaessig anzeigen.

Ein optionales Feld erscheint im normalen Review nur, wenn ein sinnvoller
Kandidat vorliegt oder die konkrete Nutzeraktion seine Eingabe benoetigt.
Pflichtentscheidungen mit direkter Folge, insbesondere `Offen` oder `Bezahlt`
bei einer Rechnung, bleiben sichtbar. Weitere erkannte Werte sind ueber
Details oder eine direkte Aktion erreichbar.

Initialer Feldprofil-Stand:

| Grundart/Variante | Kompakter Standardreview | Typrelevante Zeitfelder | Normalerweise nur Details | Reversible Folge nach Bestaetigung |
|---|---|---|---|---|
| `unknown` beziehungsweise generisches Dokument | editierbarer Titel; Aussteller/Absender nur bei brauchbarem Kandidaten | kein Datumsfeld standardmaessig; erkannte Werte koennen bewusst als Fact, Frist, Termin oder Reminder uebernommen werden | Datumsstrings, Referenzen, weitere Parties/Facts | nur die von der Nutzerin gewaehlte Aktion |
| `invoice_or_charge` | Titel, Aussteller, ein Gesamtbetrag, `Offen` oder `Bezahlt` | `Rechnungsdatum`, `Faellig am` | Rechnungsreferenz, Leistungsdatum/-zeitraum und weitere erkannte Zeitwerte | `Offen` erzeugt die reversible Zahlungsaufgabe; bestaetigte Faelligkeit terminiert sie |
| `medical_invoice` | Rechnungsprofil plus bestaetigter medizinischer Kontext | `Rechnungsdatum`, `Faellig am`; Behandlungs-/Leistungsdatum nur bei brauchbarem Kandidaten | weitere medizinische und Payer-Referenzen | Zahlungsaufgabe und Vorschlag fuer Medical Cost Settlement; keine Deckungs- oder Erstattungsbehauptung |
| `payment_record` | Titel, Aussteller/Zahlungspartner und bestaetigter Gesamtbetrag, soweit sinnvoll | `Bezahlt am` | Zahlungsreferenz und weitere Zeitwerte | bestaetigter Zahlungsnachweis beziehungsweise tatsaechlicher Outflow; keine neue Zahlungsaufgabe |
| `contract_or_policy` | Titel und Vertragspartner/Provider, soweit erkannt | `Beginn`, `Gueltig bis`; weitere Fristfelder nur fuer einen freigegebenen Record-/Workflowkontext | Referenzen, Tarif-/Produktbegriffe und sonstige Datumswerte | bestaetigte Laufzeit/Frist darf Agenda-/Reminder-Folge erhalten; keine Deckungs-, Anspruchs- oder Rechtsbehauptung |
| `financial_statement` | Titel, ausstellende Stelle und Abrechnungszeitraum | `Zeitraum von/bis` beziehungsweise fachlich gleichwertige Periodenangabe | Einzeltransaktionen und weitere Betraege/Datumswerte; keine Transaktionsanalyse in M1 | Ablage, Suche und Periodenbezug; keine Buchhaltungsfolge |
| `credential_or_certificate` | Titel, ausstellende Stelle und zugehoeriger Record, soweit vorhanden | `Ausgestellt am`, `Gueltig bis` | weitere Referenzen und Datumswerte | bestaetigte Gueltigkeit darf eine Ablauf-Erinnerung erzeugen |
| `report_or_assessment` | Titel und Aussteller | `Ausgestellt am`; Ereignis-/Leistungsdatum nur in einem freigegebenen Varianten-/Case-Profil | weitere erkannte Datumswerte und Fachbegriffe | Ablage, Suche und Matching; standardmaessig keine Aufgabe |
| `referral_or_prescription` | Titel und Aussteller | `Ausgestellt am`, `Gueltig bis` nur bei brauchbarem Kandidaten | Fachbegriffe, Referenzen und weitere Datumswerte | optionaler Termin-/Erledigungshinweis erst aus bestaetigtem Fact oder bewusster Aktion |
| Arbeitsunfaehigkeitsbescheinigung als offener Variantenkandidat | Titel und Aussteller | `Arbeitsunfaehig von/bis` | Diagnose- oder Arbeitgeberdetails werden nicht vorausgesetzt | bestaetigter Zeitraum ist agenda-/reminderfaehig; keine arbeitsrechtliche Bewertung |

`Arbeitsunfaehigkeitsbescheinigung` bleibt bis OQ-011/WF-01 ein Kandidat; ihr
Feldprofil ist daher ebenfalls noch keine M1-Enum-Freigabe. Fuer alle weiteren
Grundarten aus dem Discovery-Katalog wird das Profil erst gemeinsam mit ihrem
Product-Value-, Country- und Backend-Feasibility-Gate freigegeben.

Bei jedem Datumsfeld gelten unabhaengig vom Typ dieselben Reviewoptionen:
semantischer Top-Kandidat, andere erkannte Datumswerte, `Kein Datum` und
`Manuell eingeben`; nicht verwendete Kandidaten bleiben unter Details. Erst
die sichtbare gebuendelte Bestaetigung aktiviert die Feldbedeutung oder daraus
deterministisch abgeleitete harmlose, interne und reversible Folgen.

## Base Type and Semantic Variant

Document base type is the stable semantic class used for search, display,
extraction and broad workflow compatibility. A semantic variant adds precision
only where it passes the following product-value gate across
countries/providers.

A new base type or semantic variant is justified only when all of these are
true:

1. It creates durable value through at least one of:
   - targeted later retrieval or use as a durable Record version;
   - materially different matching, extraction, workflow, task, deadline,
     expected response or state transition;
   - materially different retention, security, export, sharing or handoff.
2. Title, full text, Facts, Party, Domain, Record kind, relationship role or a
   country/provider alias cannot preserve that value sufficiently.
3. The distinction has stable semantics, a testable recognition/fallback path
   and does not require the user to understand specialist taxonomy.
4. Its benefit outweighs schema, migration, localization, AI-training,
   correction and UI complexity.

Display convenience, linguistic precision or explainability alone is not
enough. If the product behaves the same, the more specific term remains title,
Fact, alias or search vocabulary instead of becoming a subtype.

This gate selects useful subtypes; it does not minimize their number as an end
in itself. A candidate that passes the gate must not be collapsed merely to
keep the catalog small. Conversely, a recognizable term does not become a
subtype without product value. The target is sufficient, understandable
structure rather than either maximum granularity or blanket generalization.

Der Gate gilt fuer jeden neuen oder geaenderten persistierten Typ, jede
semantische Variante und jeden breiten Domain-Typ. Nur der universelle
generische/`unknown`-Fallback benoetigt keinen eigenen Produktwertnachweis.
Backend, OCR oder ein Modell darf keinen Typ eigenmaechtig in den Produktkatalog
aufnehmen. Es darf mit Test- oder Produkt-Evidenz eine Promotion vorschlagen;
Product/Domain entscheidet Semantik und Freigabe.

Eine Promotion benoetigt zusaetzlich:

- belegte Erkennungs-/Abstention-Qualitaet auf der vorgesehenen kleinen/
  mittleren Zielmodellklasse oder einen einfachen expliziten
  Nutzereingabepfad sowie einen generischen Fallback;
- Country-/Provider-Abgrenzung und synthetische repräsentative Fixtures;
- Auswirkungen auf Matching, Workflow, Tasks, Zeit, Suche, Export und
  Migration;
- einen Eintrag beziehungsweise Abschluss im
  `../execution/handoffs/DOMAIN_BACKEND_FEASIBILITY_REGISTER.md`;
- ausdrueckliche Produktfreigabe und versionierte Katalogmigration.

Semantic variant must not encode temporary workflow state, provider, country,
sender, format or Case role. A phrase such as `OeGK-Wahlarztrechnung`
therefore resolves to base type `invoice_or_charge`, a useful semantic variant
such as `medical_invoice`, Medical Domain, local aliases, Payer/Party, Facts,
link roles and pack context. OeGK, year, paid/open state and submission state
do not produce further combined subtype keys.

Backend/Core Assist proposes base type and semantic variant. The user corrects
through a small relevant choice surface; the default flow does not expose a
full taxonomy form.

## Domain

Domain is orthogonal. `invoice` can occur in health, housing, purchase, work or
tax contexts. `health` therefore must not remain a top-level type equivalent to
`invoice`.

A document may have one primary domain and additional contextual domains where
needed, but domain alone does not select a jurisdictional workflow or prove a
Case relation.

## Country-, Rechtsraum- und Provider-Layer

Dokumente derselben fachlichen Art koennen je Land, Rechtsraum, Provider und
Version andere Bezeichnungen, Layouts, Pflicht-/Optionalfelder oder
Referenzformate besitzen. Mappm trennt deshalb:

1. **globale fachliche Semantik:** stabiler Base Type und gegebenenfalls
   produktrelevante semantische Variante;
2. **Country-/Jurisdiction-Layer:** lokalisierte Namen, Synonyme, typische
   Feld-/Datums-/Referenzmuster und versionierte Extraktionshinweise;
3. **Provider-/Formular-Layer:** konkreter Aussteller, Tarif, Formular- oder
   Dokumentstand, nur wo ausreichend belegt und gepflegt.

Diese Layer duerfen die globale Taxonomie nicht durch kombinierte Keys wie
Land-Provider-Jahr-Status vervielfachen. Sprache allein bestimmt weder Land
noch Rechtsraum.

Bei Rechnungen duerfen Country-/Provider-Packs rechtlich vorgeschriebene oder
typische Inhaltsfelder als Analysehinweis pflegen. Mappm prueft oder behauptet
jedoch **nicht** die rechtliche Gueltigkeit, Compliance, steuerliche
Abzugsfaehigkeit oder formale Korrektheit einer Rechnung. Fehlende oder
unsichere Felder machen weder Dokument noch Case ungueltig. Eine solche
Pruefung waere ein separates, rechtlich freizugebendes Produkt und liegt
ausserhalb des Mappm-Scope.

## Relationship Roles

A role describes what a document does in a specific relationship, not what the
document is globally.

The same document may be:

- `decision` in one Case;
- `evidence` in a linked benefit Case;
- `context` in an accident Case;
- a version/source of one durable Record.

Roles therefore belong on link/slot objects such as `DocumentCaseLink`, links
zwischen Dokument und bestaetigtem Einreichungsereignis or Record-version
relations. They do not belong as one global mutable field on `Document`.

Sparse universal role vocabulary may include:

- `trigger`;
- `evidence`;
- `submission`;
- `response`;
- `decision`;
- `confirmation`;
- `payment_proof`;
- `context`.

Workflow-specific slots may be more precise, for example
`primary_payer_decision` or `repair_estimate`, only when the precision changes:

- workflow completeness;
- expected response;
- next action;
- grouping/display;
- export/handoff;
- explainability.

The same minimum-sufficient principle applies to slots. If a generic role plus
title/Facts drives the same behavior, no more precise workflow slot is added.

Users do not normally configure technical role/slot keys. Backend/Core Assist
proposes them from document content and the selected workflow; current material
consequences remain reviewable.

## Record Kind

Record kind classifies the durable object, not the incoming file. A passport
scan may have a document base type/semantic variant and simultaneously become
the current version of `Record(kind=passport)`. Contracts, policies, identity
records and warranties follow the same distinction.

Record kind controls versioning/validity behavior only where explicitly
defined. It must not be used as a substitute for document base type or
workflow.

## Fallback and Unknown Values

The product needs both intentional broad values and safe unknown/fallback
values. Their exact keys remain part of OQ-011, but their meanings must remain
distinct:

- a known general document whose finer classification has no product value;
- a known broad domain document, for example general medical correspondence;
- an actually unknown document base type;
- unknown semantic variant;
- no supported domain;
- generic relationship role/context;
- unknown Record kind.

One combined `note_other` value must not hide whether the unknown concerns type,
domain, medium or product support.

Unknown classification is reviewable and reprocessable. Intentional general
classification may remain final. Neither state justifies invented specificity
or a large mandatory form.

Named forms for Reha, Psychotherapy, authorization, travel costs or comparable
special cases remain `unknown`/generic or broad medical/general documents when
no accepted base type/variant adds durable product value. A concrete generated
title, extracted Facts and a sparse relationship/workflow role may preserve the
meaning without introducing one global type per form. Missing fine
classification never affects Case validity.

## Relationship to Cases and Workflows

- Document base type/variant narrows compatible templates but does not hardcode
  one.
- The `Case` entity remains generic. Optional workflow pattern, domain template
  and pack describe guided behavior, the visible user goal and local rules.
- Relationship role/slot explains the document's function in that Case,
  Record or bestaetigten Ereignis.
- A lightweight Custom Case may accept documents before a guided workflow is
  known.
- If a Custom Case later adopts a compatible guided workflow, Backend/Core
  Assist proposes more precise slots without losing prior links/history.
- Country/provider rules live in versioned workflow packs, not in global type
  keys.

### Verbindlicher Check bei jedem neuen Vorgang

Bei jeder kuenftigen Case-/Workflow-Konzeption wird das vorkommende
Dokumentvokabular zuerst inventarisiert und jeder Begriff genau einer
bevorzugten Abbildung zugeordnet:

1. bestehende Dokumentgrundart oder bereits akzeptierte Variante;
2. allgemeines beziehungsweise breites Domain-Dokument;
3. Titel-, Alias-, OCR-, Such- oder Fixture-Vokabular;
4. extrahierter Fact oder Party;
5. beziehungsbezogene Rolle beziehungsweise Workflow-Slot;
6. langlebiger Record-Kind;
7. technisches Source-/Formatmerkmal.

`Neuer Dokumenttyp` ist nie die Standardantwort. Er ist nur nach bestandenem
Produktwerttest zulaessig. Ein Case-Konzept darf eine fachliche Dokumentliste
zur Szenarioabdeckung fuehren, aber daraus keine Typenliste ableiten.

## Capture and Title Behavior

Backend/Core Assist proposes base type, semantic variant, roles and a localized
editable title as part of every capture result. Title is not derived by merely
exposing the taxonomy label; it uses actual document/context evidence according
to `DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`.

## Required Next Review

Before implementation locks a catalog, product discovery must review:

- the proposed global base-type/semantic-variant set against the complete raw
  terminology inventory;
- the proposed minimal workflow patterns and all visible domain templates;
- durable Record kinds;
- universal versus jurisdiction/provider-specific values;
- globale Semantik versus Country-/Provider-Extraktions- und Aliaslayer;
- role/slot coverage per workflow;
- unknown/fallback and migration behavior;
- synthetic fixtures and ambiguity cases;
- localization, accessibility and search terminology;
- stable keys/versioning/deprecation policy.
- fuer jeden vorgeschlagenen Typ und jede Variante einen dokumentierten
  Produktwerttest sowie die bewusst generisch belassenen Gegenbeispiele;
- je Case-/Workflow-Familie die Zuordnung ihrer Begriffe zu Typ, Titel/Alias,
  Fact, Rolle, Record oder Source/Format statt einer Subtyp-Ableitung.

## Stop Rules

Stop if:

- the historical M2 table is treated as the final catalog;
- domain, medium, Record kind and semantic type are mixed in one enum;
- one global role is stored on Document;
- every workflow detail becomes a universal role;
- a document term becomes a type or subtype only because it is fachlich
  recognizable, appears in one Case family or allows a more exact label;
- AI/OCR precision is persisted as taxonomy although title, Facts, role and
  search index would preserve the same product value;
- a Case concept derives document types directly from its scenario document
  list without the minimum-sufficient product-value gate;
- minimum sufficient classification is interpreted as a general subtype ban,
  a presumption against variants or a target to minimize subtype count;
- base-type/variant selection becomes a large default capture form;
- AI type/title output becomes final without the active review/automation gate;
- country/provider rules are encoded in global document-type keys;
- Backend/AI einen neuen Typ ohne Produktwerttest, Feasibility-Evidenz und
  Product-/Domain-Freigabe einfuehrt;
- Country-/Provider-Analyse als rechtliche Gueltigkeits- oder
  Compliance-Pruefung des Dokuments dargestellt wird;
- implementation starts before the dedicated complete-catalog review is
  accepted.
