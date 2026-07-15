---
title: "Discovery Draft - Austria Tax Case and Evidence Catalog"
description: "Nicht freigegebener Entwurf fuer oesterreichische Steuer-Sammelvorgaenge, Verfahrens-Cases, Dokumentrollen und Laenderpaket-Governance"
tags: [discovery, draft, tax, austria, cases, workflows, documents, jurisdiction, compliance]
lastUpdated: "2026-07-15"
status: "draft"
owner: "product-concept"
---

# Discovery Draft - Austria Tax Case and Evidence Catalog

## Status und Produktgrenze

Dieser Entwurf sammelt fachliche Kandidaten fuer ein spaeteres, versioniertes
Oesterreich-Laenderpaket. Er ist **keine freigegebene Steuerlogik**, keine
Rechts- oder Steuerberatung und keine Zusage fuer Commercial 1.0. Er darf weder
Fristen noch Anwendbarkeit, Absetzbarkeit, Vollstaendigkeit, Berechnung oder
Einreichung im Produkt aktivieren.

Rechts- und Quellenstand dieses Discovery-Dokuments: **2026-07-15**. Vor jeder
Freigabe muessen alle Quellen und Regeln erneut gegen den dann aktuellen Stand
geprueft und durch einen benannten oesterreichischen Tax-/Legal-Owner
freigegeben werden. OQ-010, WF-01 und WF-02 bleiben offen.

Die normative Produktgrenze bleibt
`docs/technical/DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md`; dieser
Entwurf darf sie weder erweitern noch umgehen. Die Einordnung in den gesamten
AT-Katalog steht in
`docs/discovery/AUSTRIA_CASE_WORKFLOW_COUNTRY_PACK_DRAFT.md`.

Mappm bleibt innerhalb der akzeptierten Produktgrenze:

- Unterlagen sammeln, klassifizieren, bestaetigen und kontrolliert exportieren;
- Fristen und erwartete Antworten nur aus einem freigegebenen, datierten Pack;
- niemals Buchhaltung, Steuerberechnung, Steuerberatung oder automatische
  Einreichung ohne eine neue explizite Produktentscheidung;
- steuerliche Relevanz immer als `candidate` oder `user_confirmed`, niemals als
  `deductible`, `accepted_by_authority` oder rechtlich garantiert;
- Privatperson, verwaltetes Unternehmen und andere Managed Subjects strikt
  getrennt halten.

## Modellierungsregel

Ein Steuer-Case wird pro fachlicher Sammlung gebildet, nicht pro Beleg:

```text
Tax Collection Case
  managedSubject
  jurisdiction: AT
  taxPurpose/regime
  period
  cadence
  workflowVersion
  legalSourceSnapshot
```

Eine Rechnung bleibt in ihrem urspruenglichen Vertrags-, Kauf-, Medizin- oder
Custom-Kontext und kann zusaetzlich auf einen Steuer-Case verweisen. Dieser
Steuer-Case ist **kein Parent des urspruenglichen Vorgangs**.

Innerhalb der Steuerfamilie kann es dennoch echte Komposition geben. Falls
periodische Umsatzsteuer-Sammlungen spaeter veroeffentlicht werden, ist dieses
Modell ein pruefenswerter Kandidat:

```text
Umsatzsteuer 2026                         annual tax Case
  UVA Q1 2026              part_of ->    Umsatzsteuer 2026
  UVA Q2 2026              part_of ->    Umsatzsteuer 2026
  UVA Q3 2026              part_of ->    Umsatzsteuer 2026
  UVA Q4 2026              part_of ->    Umsatzsteuer 2026
```

Die einzelnen Rechnungen sind dadurch nicht Kinder dieser Cases. Sie werden
als Evidenz mehreren Kontexten zugeordnet. Ob UVA-Perioden eigene Cases oder
Branches eines Jahres-Cases werden, bleibt bis zum Tax-Workflow-Review offen;
eigene Cases sind nur dann gerechtfertigt, wenn Frist, Handoff und Abschluss je
Periode wirklich eigenstaendig verwaltet werden.

## Kandidaten fuer Personen und Haushalte

| Draft key | Kandidat | Grenze und moegliche interne Tracks | Relation/Anmerkung |
|---|---|---|---|
| `at_employee_assessment_collection` | Arbeitnehmerveranlagung fuer eine Person und ein Kalenderjahr | freiwillig, verpflichtend und antragslos sind Modi desselben Jahreskontexts; Werbungskosten, Sonderausgaben, aussergewoehnliche Belastungen, Kinder-/Familienthemen und internationale Beilagen sind Tracks, keine Cases | Ein erster bestaetigter Beleg kann die Erstellung des Jahres-Cases vorschlagen; keine automatische Aussage ueber Vorteil oder Pflicht |
| `at_personal_income_tax_collection` | Einkommensteuer-Unterlagensammlung fuer eine natuerliche Person und ein Steuerjahr | betriebliche Einkuenfte, Vermietung/Verpachtung, bestimmte Kapital-/Auslandseinkuenfte und sonstige Einkuenfte koennen Tracks oder getrennte Quellensammlungen sein | Darf nicht parallel als Arbeitnehmerveranlagung fuer dasselbe Subjekt/Jahr angelegt werden, wenn das freigegebene Pack einen E1-Kontext verlangt; Applicability muss reviewed sein |
| `at_property_sale_tax_file` | Ereignisbezogene Unterlagensammlung fuer eine private Grundstuecksveraeusserung | Kauf-/Herstellungsunterlagen, Verbesserungen, Verkaufsunterlagen, Vertretungs-/Abwicklungsdokumente und Behoerdenkorrespondenz | Mit dem Immobilienverkaufs-Case verknuepft; nur dann eigener Tax Case, wenn ein eigenstaendiger Steuer-/Handoff-Verlauf besteht |
| `at_cross_border_income_evidence` | Zusaetzliche Sammlung fuer einen bestaetigten grenzueberschreitenden Sachverhalt | Auslandslohn, auslaendische Pension, nicht endbesteuerte Kapitalertraege und weitere Beilagen sind keine pauschal gleichartigen Regeln | Vorzugsweise Track/Subcollection des passenden Jahres-Cases; nur bei eigenstaendigem professionellem Handoff eigener `part_of` Case |

Die Arbeitnehmerveranlagung und die Einkommensteuererklaerung sind nicht zwei
beliebig parallel waehlbare Produkte. Das Pack muss aus bestaetigtem Subject-
und Regime-Kontext ableiten oder zur fachlichen Klaerung abstainen. Mappm darf
die Entscheidung nicht aus einem einzelnen Rechnungsbeleg erfinden.

## Kandidaten fuer Selbststaendige und verwaltete Organisationen

| Draft key | Kandidat | Periode | Produktgrenze |
|---|---|---|---|
| `at_business_evidence_handoff` | Konfigurierte Belegsammlung fuer Steuerberatung/Handoff | monatlich, quartalsweise, jaehrlich oder custom | Sammlung und Review; keine Buchungssaetze, Kontierung, Vorsteuer- oder Gewinnberechnung |
| `at_vat_period_collection` | Umsatzsteuervoranmeldungs-Unterlagen | monatlich oder quartalsweise nur nach freigegebener Anwendbarkeitsregel | Eigener Case nur bei eigenem Deadline-/Handoff-/Abschlusszyklus; sonst Branch im Jahreskontext |
| `at_vat_annual_collection` | Umsatzsteuerjahres-Unterlagensammlung | Kalenderjahr oder freigegebenes abweichendes Wirtschaftsjahr | Kann bestaetigte Perioden-Cases zusammenfassen; keine Berechnung oder Einreichung |
| `at_income_tax_collection` | Einkommensteuer-Unterlagensammlung fuer Einzelunternehmen/freie oder neue Selbststaendigkeit | Veranlagungsjahr | Identisch mit dem persoenlichen E1-Jahreskontext, nicht als doppelter Unternehmens-Case erzeugen; Business-Kontext bleibt als Managed-Subject-/Rollenbezug erhalten |
| `at_corporate_income_tax_collection` | Koerperschaftsteuer-Unterlagensammlung | Kalender- oder freigegebenes Wirtschaftsjahr | Nur fuer anwendbare OrganizationProfiles; Jahresabschluss/Bilanz bleiben importierte Evidenz, Mappm erstellt sie nicht |
| `at_partnership_assessment_collection` | Feststellungs-/Beteiligungs-Unterlagensammlung | Veranlagungsjahr | Kandidat fuer Personengesellschaft/Gemeinschaft und Beteiligte; Subject- und Rollenmodell fachlich pruefen |
| `at_recapitulative_statement_collection` | Zusammenfassende Meldung fuer bestaetigte EU-Sachverhalte | nach freigegebener Meldeperiode | Spezialpaket; nicht aus einer auslaendischen Rechnung allein aktivieren |
| `at_tax_prepayment_schedule` | Vorauszahlungsbescheide und Zahlungstermine fuer Einkommen-/Koerperschaftsteuer | ein Bescheid-/Kalenderkontext mit periodischen Tasks | Ein Jahres- oder Bescheidkontext, nicht vier neue Cases fuer vier Zahlungen |
| `at_rental_income_subcollection` | Unterlagensammlung je bestaetigtem Vermietungs-/Verpachtungskontext | Veranlagungsjahr | Optionaler `part_of` Case des Einkommensteuer-Jahresfalls, wenn Objekt, Dokumentmenge und Handoff eigenstaendig sind; sonst Track |

Arbeitgeber-Lohnabgaben, Kommunalsteuer, GPLB, OSS/IOSS, Intrastat, Zoll,
Registrierkassen- und branchenspezifische Spezialpflichten sind fuer einen
spaeteren Business-Scope zu inventarisieren. Sie gehoeren nicht automatisch in
das Haushaltsprodukt und duerfen nicht durch diesen Entwurf aktiviert werden.

## Steuerliche Verfahrens-Cases

Diese Kandidaten sind keine Belegkategorien, sondern koennen ein eigenes Ziel,
eine eigene Frist und einen eigenen Abschluss besitzen:

| Draft key | Kandidat | Beziehung zum Ausgangskontext |
|---|---|---|
| `at_tax_registration_or_identifier_request` | steuerliche Erfassung, Steuernummer-/UID-bezogener Antrag oder relevante Aenderungsmeldung | mit Unternehmensgruendung/OrganizationProfile und spaeteren Tax Cases verknuepft; keine dauerhafte Steuer-ID als Case modellieren |
| `at_tax_information_request_response` | Ergaenzungsersuchen oder anderes konkretes Nachforderungsverfahren beantworten | normalerweise Branch im betroffenen Jahres-/Perioden-Case; eigener `part_of` Case nur bei umfangreichem unabhaengigem Handoff |
| `at_tax_assessment_review` | Steuerbescheid empfangen, pruefen, Zahlung/Erstattung abstimmen und abschliessen | normalerweise Abschlussphase des zugrunde liegenden Tax Case, kein neuer Case nur wegen eines Bescheids |
| `at_tax_complaint` | Bescheidbeschwerde mit Begruendung, Nachweisen, Frist und Entscheidung | eigener `follow_up_to` oder `related_to` Case zum betroffenen Tax Case; kein `part_of`, wenn das Rechtsmittel nach dessen Abschluss unabhaengig weiterlaeuft |
| `at_tax_payment_relief_request` | Stundung/Ratenzahlung oder anderes Zahlungserleichterungsansuchen | eigener Authority-Request-Case, verknuepft mit Bescheid/Tax Case und bestaetigten Forderungen |
| `at_tax_audit_or_review` | Aussenpruefung/Nachschau mit Auftrag, Perioden, Anforderungen, Uebergaben, Bericht und Folgemassnahmen | eigener Case mit Links zu allen betroffenen Jahres-/Perioden-Cases; niemals Dokumente kopieren |
| `at_tax_procedure_change_request` | begruendeter Antrag auf Fristverlaengerung, Bescheidaenderung oder anderes Verfahren | zunaechst Branch/Task des betroffenen Case; nur bei eigenstaendigem Verlauf als Case hochstufen |

## Kategorien und Dokumentrollen, die keine Cases sind

Folgende Inhalte koennen innerhalb eines passenden Jahres-/Perioden-Cases
klassifiziert werden, duerfen aber nicht allein einen neuen Case erzeugen:

- Werbungskosten und deren fachliche Unterkategorien;
- Sonderausgaben;
- aussergewoehnliche Belastungen;
- Familienbonus-/Kinder-/Unterhalts- und Alleinverdiener-/Alleinerzieher-Themen;
- Pendler-, Homeoffice-, Arbeitsmittel-, Aus-/Fortbildungs- und Reisekosten;
- Spenden-, Kirchenbeitrags- und Versicherungsnachweise;
- betriebliche Einnahmen-/Ausgabenbelege;
- Vermietungs-/Verpachtungsbelege;
- Kapitalertrags-/Steuerreportings und Auslandsnachweise;
- Steuerbescheid, Vorauszahlungsbescheid, Buchungsmitteilung, Zahlungsbeleg,
  Gutschrift, Ergaenzungsersuchen und Zustellnachweis als Dokumentrollen;
- FinanzOnline-Nachricht oder Uploadbestaetigung als Korrespondenz/Ereignis.

Die korrekte steuerliche Behandlung dieser Kategorien darf Mappm nicht selbst
behaupten. Es darf nur die durch Nutzer oder professionellen Pack-Owner
bestaetigte Sammlung organisieren.

## Capture- und Matching-Beispiele

### Angestellte Person markiert eine Rechnung

```text
Internetvertrag/Record
  Dokument: Rechnung Maerz 2026

zusaetzlicher Vorschlag
  Arbeitnehmerveranlagung AT 2026
  status: tax relevance candidate
  category: berufliche Nutzung candidate
```

Mappm fragt nicht nach einem Prozentsatz, wenn dieser fuer den naechsten Schritt
nicht erforderlich ist, und behauptet keine Absetzbarkeit.

### Selbststaendige Person scannt einen Geschaeftsbeleg

```text
Managed Subject: Einzelunternehmen
  Originalkontext: Kauf/Vertrag/Custom Case
  Business evidence handoff: Q2 2026
  optional: UVA Q2 2026
  annual income-tax context: 2026
```

Welche der zusaetzlichen Zuordnungen gilt, kommt aus bestaetigtem Regime und
Pack. Ein Beleg allein darf keine Umsatzsteuerpflicht erfinden.

### Umsatzsteuer-Periode und Jahreskontext

Wenn Perioden als eigene Cases freigegeben werden, kann Assist beim ersten
bestaetigten Q1-Dokument gleichzeitig den neutralen Jahreskontext vorschlagen.
Die UI zeigt dennoch nur die aktuelle Sammlung und nicht eine kuenstliche
zweistufige Hierarchie.

## Versionierungs- und Freigabevertrag

Jede veroeffentlichte AT-Workflowdefinition benoetigt mindestens:

```text
jurisdiction: AT
taxPurpose/regime
subjectTypes
validForTaxYear or effectiveFrom/effectiveTo
cadence/applicability rule source
officialSources[]
sourceCheckedAt
professionalOwner
professionalReviewedAt
workflowVersion
withdrawal/replacement policy
```

Pflicht-Review-Trigger:

- vor erster Implementierung und vor jeder Store-/Produktfreigabe;
- beim Wechsel des Steuerjahres;
- bei Aenderung einer verlinkten amtlichen Quelle oder Rechtsgrundlage;
- bei gemeldeter fachlicher Abweichung oder Support-Incident;
- vor Wiederaktivierung eines zurueckgezogenen Packs.

Store-Text, Help Center und Marketing muessen denselben geprueften Scope und
Stand nennen. Ein altes Pack darf historische Cases lesbar halten, aber keine
neuen Fristen oder Zuordnungen mehr erzeugen.

## Amtliche Discovery-Quellen

Alle Quellen zuletzt geprueft am **2026-07-15**. Die Liste ist Grundlage fuer
Discovery, nicht die fachliche Freigabe:

- [BMF: Arbeitnehmerveranlagung](https://www.bmf.gv.at/themen/steuern/arbeitnehmerveranlagung/verfahren-arbeitnehmerinnenveranlagung/arbeitnehmerinnenveranlagung.html)
- [oesterreich.gv.at: Allgemeines zur Arbeitnehmerveranlagung](https://www.oesterreich.gv.at/de/themen/arbeit_beruf_und_pension/arbeitnehmerveranlagung/Seite.340000)
- [USP: Einkommensteuererklaerung](https://www.usp.gv.at/themen/steuern-finanzen/einkommensteuer-ueberblick/weitere-informationen-est/einkommensteuererklaerung.html)
- [USP: Einkommensteuervorauszahlungen und Einkommensteuererklaerung](https://www.usp.gv.at/themen/steuern-finanzen/einkommensteuer-ueberblick/est-vorauszahlungen-und-est-erklaerung.html)
- [USP: Umsatzsteuervoranmeldung und Umsatzsteuererklaerung](https://www.usp.gv.at/themen/steuern-finanzen/umsatzsteuer-ueberblick/umsatzsteuervoranmeldung-und-umsatzsteuererklaerung.html)
- [USP: Koerperschaftsteuererklaerung](https://www.usp.gv.at/themen/steuern-finanzen/koerperschaftsteuer-ueberblick/koerperschaftsteuererklaerung.html)
- [USP: Zusammenfassende Meldung](https://www.usp.gv.at/services/suchen-und-finden/lexikon/zusammenfassende-meldung.html)
- [BMF: Beschwerde, Zahlungserleichterung, Nachsicht](https://www.bmf.gv.at/themen/steuern/fristen-verfahren/beschwerde-zahlungserleichterung-nachsicht.html)
- [USP: Aussenpruefung](https://www.usp.gv.at/themen/steuern-finanzen/steuerliche-rechte-und-pflichten/weitere-informationen-zu-steuerlichen-rechten-und-pflichten-als-unternehmen/aussenpruefung.html)
- [BMF: Steuerbuch 2026](https://www.bmf.gv.at/public/top-themen/steuerbuch-2026.html)
- [BMF: Informationen zu Einkuenften aus Kapitalvermoegen](https://www.bmf.gv.at/themen/steuern/sparen-veranlagen/information-zu-einkuenften-aus-kapitalvermoegen.html)
- [oesterreich.gv.at: Immobilienertragsteuer](https://www.oesterreich.gv.at/de/lexicon/I/Seite.991651)

## Offene Entscheidungen

- Welche Kandidaten gehoeren in Commercial 1.0, spaetere Consumer Packs oder
  einen getrennten Business-Scope?
- Sind UVA-Perioden eigenstaendige Cases oder Workflow-Branches?
- Wann werden Quellensammlungen fuer Vermietung, Betrieb oder Ausland eigene
  `part_of` Cases statt Tracks?
- Welche Tax-/Legal-Organisation owns Inhalt, Haftung, Monitoring und Incident-
  Korrektur?
- Welche bestaetigten Regime-Fakten darf Mappm speichern, und wie werden sie
  datensparsam aktualisiert?
- Welche Exporte und Adviser-Handoffs sind sicher, interoperabel und ohne
  Buchhaltungsclaim moeglich?

## Stop Rules

Stop if:

- dieser Entwurf als freigegebenes Oesterreich-Pack behandelt wird;
- aus Sprache, Wohnort, Rechnung oder Berufsbezeichnung eine Steuerpflicht
  abgeleitet wird;
- ein Beleg als absetzbar oder eine Sammlung als vollstaendig bezeichnet wird;
- Fristen ohne gueltige, gepruefte Workflowversion aktiviert werden;
- Arbeitnehmerveranlagung und Einkommensteuererklaerung fuer dasselbe Subjekt
  und Jahr widerspruechlich erzeugt werden;
- Mappm Berechnung, Kontierung, Buchhaltung, Einreichung oder Beratung
  stillschweigend uebernimmt;
- private und geschaeftliche Managed Subjects oder Steuerperioden vermischt
  werden.
