---
title: "Discovery Draft - Austria Case and Workflow Country Pack"
description: "Vorlaeufige Oesterreich-Abstimmung des gesamten Mappm-Case-, Record-, Dokument- und Workflow-Kandidatenkatalogs"
tags: [discovery, draft, austria, country-pack, cases, records, documents, workflows, compliance]
lastUpdated: "2026-07-15"
status: "draft"
owner: "product-concept"
---

# Discovery Draft - Austria Case and Workflow Country Pack

## Status und Ziel

Dieser Entwurf stimmt den aktuellen Mappm-Zielkatalog vorlaeufig auf
Oesterreich ab. Er umfasst nicht nur Steuern, sondern derzeit relevante
Fachvorlagen, Record-Kontexte, wichtige Dokumentbegriffe und moegliche
Workflowvarianten. Alle Vorlagen verwenden den generischen Case, optionale
Workflow-Muster, Branches und Records aus
`CASE_DOCUMENT_TAXONOMY_CANDIDATES.md`.

Der Entwurf ist **kein freigegebenes AT-Produktpaket**. Rechts-, Gesundheits-,
Versicherungs-, Steuer-, Arbeits-, Familien- und Behoerdenregeln muessen vor
jeder Aktivierung mit aktuellen amtlichen Quellen, benanntem fachlichem Owner,
Fixtures und WF-01/WF-02-Freigabe geprueft werden.

Discovery- und Quellenstand: **2026-07-15**. Ein spaeteres Pack muss `effective`
und `sourceCheckedAt` getrennt versionieren und beim Jahres-/Rechtswechsel neu
geprueft werden.

Normative Produktgrenzen bleiben
`docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`,
`docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` und
`docs/technical/DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`. Der
dynamische technische Vertiefungsentwurf liegt in
`docs/discovery/DYNAMIC_DOMAIN_COUNTRY_PACK_MODEL_DRAFT.md`.

## Pack-Schnitt

Oesterreich soll nicht als ein unteilbares Mega-Paket ausgeliefert werden. Der
vorlaeufige Schnitt ist:

```text
at.consumer.core
  authority, identity, purchase, contracts, housing, basic damage

at.health
  medical care terminology, payer/provider overlays, care/support

at.family
  birth/civil records, family benefits, childcare, care contexts

at.employment-education
  employment, AMS-related flows, school/study/support

at.mobility-travel
  vehicle, accident, passenger rights, travel authorization

at.tax.<tax-year>
  employee, person, sole-proprietor and organization tax collections

at.privacy-security
  data-subject requests, DSB complaint, fraud/identity incidents

at.business (later/conditional)
  managed organizations and specialist compliance packs
```

Subpacks teilen kanonische IDs und Workflowmodule. Sie koennen separat
freigegeben, aktualisiert oder zurueckgezogen werden.

## Rolle des Oesterreich-Packs nach der Normalisierung

Der globale Kern kennt genau eine `Case`-Entitaet. Ein Case ist bereits ohne
Workflow eine vollwertige benannte Dokumentensammlung beziehungsweise ein
Kontext. Die vorlaeufigen optionalen Workflow-Muster sind `submission`,
`transaction`, `episode`, `incident`, `settlement`, `resolution`, `proceeding`
und `collection`. Das AT-Pack erzeugt keine neuen Kernentitaeten. Es publiziert
sichtbare, gepruefte Fachvorlagen mit diesen Mustern, beispielsweise:

| Sichtbare AT-Vorlage | Optionales Workflow-Muster | AT-/Provider-Spezialisierung |
|---|---|---|
| Pflegegeld beantragen | `submission` | Leistung, Stelle, Evidenz, Begutachtung, Entscheidung und Fristen |
| Reisepass erneuern | `submission` | Record-Anker, Termin/Gebuehr, Identitaetsnachweise und Ausgabe |
| Kindergartenplatz beantragen | `submission` | Bundesland/Gemeinde/Institution, Platz-Outcome |
| Wahlarztrechnung abwickeln | `settlement` | medizinische Rechnung, bestaetigte Payer, Claims und Erstattungen |
| Medizinischer Behandlungsfall | `episode` | AT-Terminologie und optionale Provider-/Payer-Links, aber keine AT-only Case-Klasse |
| Verkehrsunfall regulieren | `incident` | AT-Melde-/Versicherungsvarianten und bedingte Polizei-Schritte |
| Arbeitnehmerveranlagung sammeln | `collection` | Subject, Steuerjahr, Regime und gepruefte Evidenzrollen |

Jeder **konkrete** Antrag mit eigenem Ziel und Ergebnis ist weiterhin ein
eigener Case. Pflegegeld, Behindertenpass und erhoehte Familienbeihilfe werden
also nicht zu einem Case zusammengezogen. Sie verwenden aber denselben
`submission`-Muster mit unterschiedlichen Vorlagen. Formular, Beilagen,
Korrespondenz, Nachforderung, Begutachtung und Entscheidung bleiben innerhalb
des jeweiligen Antrags-Cases; sie sind keine Cases pro Dokument.

## Aktivierungsstufen

| Stufe | Bedeutung |
|---|---|
| `G` | generischer Mappm-Workflow kann mit oesterreichischer Sprache, aber ohne Rechtsclaim funktionieren |
| `A` | echtes AT-Pack mit datierter fachlicher/rechtlicher Freigabe erforderlich |
| `P` | zusaetzliches Provider-, Bundesland-, Gemeinde- oder Institutions-Overlay erforderlich |
| `S` | specialist/later; fuer Commercial Core nicht ohne eigene Scope-Entscheidung |
| `C` | bleibt primaer Custom-/Umbrella-Kontext; Assist darf ihn nicht aus schwacher Evidenz erfinden |

Keine Stufe bedeutet bereits freigegebenen Release-Scope.

## Universelle Verwaltungs- und Verfahrensvorlagen in AT

| Vorlagen-Arbeitsname | AT-Variante/Terminologie | Draft-Komposition | Stufe |
|---|---|---|---|
| `custom_context_or_project` | frei benannter Vorgang, z.B. Umzug, Renovierung, Hochzeit | keine AT-Regel; Nutzer oder bestaetigte Auswahl bildet Kontext | `C` |
| `authority_application_or_submission` | Antrag, Ansuchen, Anzeige, Meldung, Einreichung | Antrag -> Bestaetigung -> Ergaenzung -> Bescheid/Erledigung; konkrete Stelle/Frist nur im Fachpack | `A/P` |
| `entitlement_or_benefit_claim` | Beihilfe, Foerderung, Leistung, Zuschuss, Kostenuebernahme | generisches Claim-/Authority-Modul; Anspruch nie aus Dokument allein behaupten | `A/P` |
| `record_acquisition_or_issuance` | Erstausstellung von Reisepass, Urkunde, Nachweis, Berechtigung | Prozess-Case erzeugt/aktualisiert langlebigen Record | `A/P` |
| `record_renewal_or_replacement` | Verlaengerung, Duplikat, Ersatz, Wiedererteilung | bestehender Record ist Anker; Verlust/Missbrauch ggf. verknuepfter Security Case | `A/P` |
| `registration_change_or_notification` | Anmeldung, Abmeldung, Ummeldung, Aenderungsanzeige | je Register eigener Workflow; Melde-, Kfz-, Unternehmens- und andere Register nicht vermischen | `A/P` |
| `objection_or_appeal` | Beschwerde, Einspruch, Berufung oder Rechtsmittel nach Materie | Ausgangsbescheid/-entscheidung verknuepfen; Rechtsmittelart und Frist nur aus Fachpack | `A` |
| `dispute_or_recovery` | Reklamation, Rueckforderung, Leistungs-/Zahlungsstreit | zuerst informelle Klaerung, optional formelle Eskalation | `G/A` |
| `formal_proceeding` | gerichtliches oder behoerdliches Verfahren mit Aktenzeichen | eigener Case; keine Rechtsberatung, Schriftsatzgenerierung oder Fristbehauptung ohne Spezialpack | `A/S` |
| `audit_or_compliance_response` | Pruefung, Nachschau, Kontroll-/Auskunftsverfahren | Auftrag, Scope, Evidenz, Handoff, Bericht, Folgemassnahmen | `A/S` |
| `payment_relief_or_debt_resolution` | Stundung, Ratenzahlung, Zahlungsvereinbarung | mit Forderungs-/Bescheidkontext verknuepfen; keine Bonitaets-/Rechtsberatung | `A/P` |
| `fraud_identity_or_security_incident` | Identitaetsmissbrauch, Karten-/Kontomissbrauch, Betrug, Dokumentverlust | Sperren/Melden/Nachweise/Recovery als Module; Polizei, Bank, Provider nur soweit bestaetigt | `G/A/P` |

## Gesundheit, Pflege und soziale Unterstuetzung in AT

| Vorlagen-Arbeitsname | AT-Variante/Terminologie | Draft-Komposition | Stufe |
|---|---|---|---|
| `medical_care` | medizinischer Behandlungsfall; Dokumente u.a. Ueberweisung/Zuweisung, Befund, Labor-/Radiologiebefund, Arzt-/Entlassungsbrief | erstes medizinisches Dokument findet/erzeugt neutralen Behandlungsfall; Arztbesuch, Diagnostik, Krankenhaus und Nachsorge sind Abschnitte, nicht automatisch Case-Typen | `G/A` |
| `medical_cost_settlement` | Wahl-/Privatarztrechnung, Zahlung, Einreichung, Kostenerstattung, Zusatzversicherung | bei neuem Behandlungsfall `part_of` Medical Care; je wirtschaftlicher Verpflichtung ein Kosten-Case, Korrektur/Gutschrift/Beleg bleiben darin; Payer als Claims | `A/P` |
| `medical_authorization_or_benefit` | Bewilligung/Kostenuebernahme fuer Behandlung, Medikament, Heilbehelf, Reha oder Polizzenleistung | eigener Benefit Case nur bei eigenem Antrag/Entscheidung/Outcome; sonst Branch im Care Case | `A/P` |

Pflegebedarf, Entlassungsmanagement, Pflegeorganisation und langfristige
Unterstuetzung bilden keine gemeinsame Fachvorlage. Begutachtungen sind
Steps/Evidenz; Pflegegeld, Behindertenpass, Hilfsmittel, Dienste und andere
Leistungen erhalten nur bei eigenem Ziel und Ergebnis einen eigenen
`submission`-Case. Ein generischer Umbrella-Case darf zusammenhaengende Cases
und langlebige Records verbinden.

AT-Matching muss mehrere bestaetigte Sozialversicherungs-/Krankenfuersorge- und
Zusatzversicherungs-Kontexte eines Managed Subject unterstuetzen. Es darf weder
einen Standardpayer vorauswaehlen noch eine Einreichreihenfolge ohne Evidenz
erzwingen. Provider-Overlays werden separat geprueft.

## Versicherung, Unfall und Schaden in AT

| Vorlagen-Arbeitsname | AT-Variante/Terminologie | Draft-Komposition | Stufe |
|---|---|---|---|
| `accident_or_damage_settlement` | Verkehrs-, Haushalts-, Haftpflicht-, Sach- oder sonstiger Schaden | Ereignis, Beteiligte, Evidenz, Meldung, Reparatur und Claims; Polizei nur bedingter Step/Event | `A/P` |
| `insurance_benefit_claim` | Leistung aus Unfall-, Kranken-, Reise-, Rechtsschutz-, Haushalts- oder anderer Polizze | Polizze bleibt Record; Claim kann im Ausgangs-Case bleiben oder bei eigenem Outcome Case werden | `A/P` |
| `travel_insurance_claim` | Storno, Krankheit, Gepaeck, Reiseabbruch etc. nach Polizze | voraussichtlich Provider-/Domainvariante von Insurance Benefit Claim | `A/P` |

Eine Werkstattrechnung allein beweist keinen Unfall. Ein bestaetigtes
Schadendatum, Akten-/Schadennummer oder vorhandener Schaden-Case kann dagegen
ein starkes Matching-Signal sein. Medizinische Folgen werden als eigener
Medical Care Case mit `caused_by` verknuepft, wenn sie unabhaengig weiterlaufen.

## Kauf, Zahlung, Finanzierung und Assets in AT

| Vorlagen-Arbeitsname | AT-Variante/Terminologie | Draft-Komposition | Stufe |
|---|---|---|---|
| `purchase_fulfilment_and_remedy` | Bestellung/Kauf, Lieferung, Maengelbehebung, Rueckabwicklung | Bestellung bis akzeptierte Leistung oder abgeschlossene Rueckabwicklung bleibt ein Case | `G/A` |
| `return_or_refund` | Ruecktritt/Rueckgabe und Kaufpreiserstattung | standardmaessig Branch im Purchase Case; eigener Case nur bei unabhaengigem Verlauf | `A` |
| `repair_or_service_resolution` | Reparatur-/Serviceauftrag bis Abnahme und Zahlung | eigenstaendig oder Branch von Purchase, Warranty oder Damage | `G/A` |
| `warranty_or_guarantee_claim` | Gewaehrleistung oder vertragliche Garantie | in AT strikt unterschiedliche Rechts-/Vertragsgrundlagen; sichtbare Begriffe nicht vermischen | `A/P` |
| `payment_or_chargeback` | Karten-/Lastschrift-/Ueberweisungsproblem und Rueckforderung | Bank-/Zahlungsprovider-Overlay; Fraud Case bei Missbrauch verknuepfen | `A/P` |
| `financing_or_credit_application` | Kredit, Darlehen, Leasing oder Ratenfinanzierung beantragen | Antrag als Case; abgeschlossener Vertrag als Record; keine Finanzberatung | `A/P/S` |
| `debt_collection_or_repayment_arrangement` | Forderung/Mahnung/Inkasso pruefen und klaeren | Forderung bestreiten oder Zahlungsplan sind unterschiedliche Branches/Outcomes | `A/S` |

Vertraege, Abos, Kredit-/Leasingvertraege und Garantien bleiben Record-led.
Ordentliche Aenderung, Kuendigung und Endabrechnung erzeugen nicht automatisch
neue Cases; nur unabhaengige Streit-/Recovery-Arbeit wird verknuepft.

## Wohnen, Immobilie und Versorgung in AT

| Vorlagen-Arbeitsname | AT-Variante/Terminologie | Draft-Komposition | Stufe |
|---|---|---|---|
| `rental_start_handover_or_end` | Mietanbahnung, Uebergabe, Kaution/Endabrechnung, Rueckgabe | Mietvertrag/Mietverhaeltnis als Record; konkrete offene Transaktion als Case | `A/P` |
| `property_purchase_or_sale` | Liegenschaft/Eigentumswohnung kaufen oder verkaufen | Vertrag, Finanzierung, Treuhand, Grundbuch, Uebergabe; Steuer-/Finanz-Cases zusaetzlich verknuepfen | `A/P/S` |
| `construction_or_renovation` | Bau-, Sanierungs- oder Renovierungsprojekt | Custom/Guided Umbrella; Auftraege, Abnahmen, Rechnungen, Bewilligungen und Disputes verknuepfen | `G/A/P` |
| `utility_connection_switch_or_issue` | Strom/Gas/Wasser/Internet anschliessen, wechseln oder klaeren | Vertrag bleibt Record; Anschluss/Wechsel/Dispute als Case | `G/A/P` |
| `relocation_umbrella` | Umzug als bewusst angelegter Sammelvorgang | Nutzer waehlt Records/Cases/Dokumente; keine einzelne Kuendigung beweist Umzug | `C` |

Miet-, Bau- und Foerderregeln koennen von Bundesland, Gemeinde und konkreter
Vertrags-/Objektart abhaengen. Ein AT-Basispack reicht fuer diese Varianten
nicht aus.

## Arbeit, Bildung, Familie und Lebensereignisse in AT

| Vorlagen-Arbeitsname | AT-Variante/Terminologie | Draft-Komposition | Stufe |
|---|---|---|---|
| `job_application_or_onboarding` | Bewerbung, Zusage/Absage, Vertragsabschluss und Onboarding | nach Abschluss Employment Record; Bewerbungsunterlagen sensibel behandeln | `G/P` |
| `employment_change_leave_or_end` | Vertragsaenderung, Krankenstand, Karenz/Elternteilzeit, Kuendigung/Ende | Employment Record als Anker; medizinische Details nicht unnoetig in Arbeitgeberkontext kopieren | `A/P` |
| `payroll_or_compensation_issue` | Lohn-/Gehaltsabrechnung, offene Zahlung oder Abweichung klaeren | Dispute-Familie mit Employment Domain; Steuer-Case nur zusaetzlicher Kontext | `A/P` |
| `education_admission_or_enrollment` | Schul-/Kindergarten-/Hochschulaufnahme und Einschreibung | Bund, Land, Gemeinde und Institution koennen unterschiedliche Varianten liefern | `A/P` |
| `exam_or_certification` | Anmeldung, Zulassung, Pruefung, Ergebnis und Zertifikat | Zertifikat/Zeugnis wird Record | `G/A/P` |
| `scholarship_or_education_support` | Studien-, Schul-, Heim- oder andere Bildungsbeihilfe | Benefit-/Authority-Familie mit Education Domain | `A/P` |
| `childcare_placement_or_support` | Betreuungsplatz und/oder Kostenbeihilfe | Platzsuche und Foerderantrag koennen getrennte Outcomes/Cases sein | `A/P` |
| `family_or_parental_benefit` | Familienbeihilfe, Kinderbetreuungsgeld, Familienzeit-/sonstige Leistung | antragslose und antragsbeduerftige Varianten unterscheiden; Managed-Subject-Beziehungen explizit | `A/P` |
| `civil_or_family_status_procedure` | Geburt/Urkunden, Name, Ehe/Partnerschaft, Trennung, Obsorge etc. | hochsensible Varianten; Urkunden Records, Verfahren Cases | `A/P/S` |
| `estate_or_death_administration` | Todesfall/Nachlass als Umbrella mit Behoerden-, Vertrags-, Versicherungs- und Vermoegensarbeit | bewusster Umbrella; Verlassenschafts-/Gerichtsverfahren als eigenstaendiger Case | `A/P/S` |

Geburt ist ein gutes Beispiel fuer kompositorische Planung: medizinischer
Behandlungsfall, Urkundenausstellung, Familienleistungen, Versicherungs- und
Arbeitskontexte koennen zusammenhaengen, bleiben aber eigenstaendige Outcomes.
Ein bewusster Parent/Umbrella darf sie gruppieren, ohne Inhalte zu besitzen.

## Steuer, Migration, Mobilitaet, Reise und Datenschutz in AT

| Vorlagen-Arbeitsname | AT-Variante/Terminologie | Draft-Komposition | Stufe |
|---|---|---|---|
| `tax_document_collection` | Arbeitnehmerveranlagung, E1-, UVA-, USt-, KSt-, Feststellungs- und weitere gepruefte Sammlungen | detailliert in `AUSTRIA_TAX_CASE_CATALOG_DRAFT.md`; Beleg bleibt in Originalkontext und wird zusaetzlich verlinkt | `A/P/S` |
| `immigration_residence_or_citizenship` | Visum, Aufenthaltstitel, Niederlassung, Staatsbuergerschaft | Bundes-/EU-/Herkunftskontext und Status hochsensibel; Spezialpack zwingend | `A/P/S` |
| `vehicle_acquisition_or_registration` | Kfz-Kauf, Zulassung, Ummeldung, Abmeldung | Fahrzeug als Asset/Record; Zulassungsprozess als Case | `A/P` |
| `vehicle_inspection_or_service` | wiederkehrende Begutachtung (`Pickerl`), Wartung, Reparatur | Serviceereignisse im Asset-Kontext; eigener Case nur bei offenem Outcome | `A/P` |
| `travel_authorization_or_visa` | Einreisegenehmigung/Visum fuer bestaetigtes Zielland | Zielstaat-/EU-Pack, nicht nur AT; Reisedokumente als Records | `A/P/S` |
| `travel_disruption_or_passenger_claim` | Bahn, Bus, Schiff oder Flug: Ausfall, Verspaetung, Gepaeck, Erstattung/Entschaedigung | EU-/AT-APF-Regeln und Anbieter-Overlay; zuerst Anbieterclaim, ggf. APF-Folgecase | `A/P` |
| `privacy_or_data_subject_request` | Auskunft, Berichtigung, Loeschung, Einschraenkung, Portabilitaet, Widerspruch | Request an Verantwortlichen; DSB-Beschwerde als eigener verknuepfter Case | `A` |

## Oesterreichische Dokumentbegriffe und kanonische Zuordnung

| AT-Begriff | Normalisierte Dokumentabbildung | Wichtige Abgrenzung |
|---|---|---|
| Meldezettel | `form` oder `application_or_filing` + Residence Domain | vom ausgestellten Nachweis unterscheiden |
| Meldebestaetigung | `credential_or_certificate` + Residence Record | nicht mit dem eingereichten Meldezettel vermischen |
| Strafregisterbescheinigung | `registry_extract` + Criminal Record variant | langlebiger Nachweis/Record mit Ausstellungsdatum |
| e-card | `credential_or_certificate` + Insurance Record | kein medizinischer Case |
| Ueberweisung/Zuweisung | `referral_or_prescription` + Medical Referral variant | nicht mit Bankueberweisung verwechseln |
| Einweisung | `referral_or_prescription` + Medical Admission variant | von normaler fachaerztlicher Ueberweisung unterscheiden |
| Befund | `report_or_assessment` + Medical Finding variant | Labor-, Radiologie-, Pathologie- und allgemeine Befunde als Varianten/Facts pruefen |
| Entlassungsbrief | `report_or_assessment` + Discharge Summary variant | aerztlich und pflegerisch unterscheidbar |
| Wahlarztrechnung/Privathonorarnote | `invoice_or_charge` + Medical Domain | Rechnungstyp nicht mit Payer-/Workflowrolle vermischen |
| Kostenerstattungsentscheidung/-zahlung | `decision_or_order`, `financial_statement` oder `payment_record` | Claim-Ergebnis, Abrechnung und Zahlungsbeleg nicht als einen Dokumenttyp vermischen |
| Polizze | `contract_or_policy` + Insurance Policy Record | Versionen/Nachtraege am Record |
| Schadenmeldung | `application_or_filing` + Damage/Insurance Domain | Dokumentrolle `submission`; kein eigener Case-Typ |
| Europaeischer Unfallbericht | `record_or_log` + Accident Report variant | Ereignisevidenz, Polizei nicht impliziert |
| Kostenvoranschlag | `offer_or_quote` | Medizin, Reparatur und Bau als Domains |
| Gewaehrleistung | statutory remedy context | nicht mit Garantie gleichsetzen |
| Garantieerklaerung | `contract_or_policy` oder `credential_or_certificate` + Guarantee Record | vertragliche Bedingungen/Provider |
| Betriebskostenabrechnung | `financial_statement` + Housing Domain | Miet-/Immobilien-Record plus moeglicher Dispute |
| Bescheid | `decision_or_order` + Authority Domain | konkrete Materie und Rechtsmittel-Pack erforderlich |
| Beschwerde/Einspruch/Berufung | `application_or_filing` + Appeal variant | keine global austauschbaren Fristen oder Begriffe |
| Strafverfuegung/Organstrafverfuegung | `decision_or_order` + Penalty variant | unterschiedliche Verfahrenskontexte |
| Arbeitnehmerveranlagung | `application_or_filing` im AT Tax-Collection-Kontext | Steuerjahr/Subject/Regime zwingend |
| UVA/Umsatzsteuerjahreserklaerung | `application_or_filing` im AT VAT-Collection-Kontext | periodische und jaehrliche Kontexte unterscheiden |
| Zulassungsschein | `credential_or_certificate` + Vehicle Registration Record | Fahrzeug-Asset als Anker |
| Paragraph-57a-Gutachten/Pickerlbericht | `report_or_assessment` + Vehicle Inspection variant | sichtbarer Alias darf kanonische ID nicht bestimmen |
| Familienbeihilfe-Bescheid/-Mitteilung | `decision_or_order` + Family Benefit Domain | antragslose und antragsbeduerftige Pfade unterscheiden |
| Pflegegeldbescheid | `decision_or_order` + Care Benefit Domain | medizinische Evidenz und Benefit-Submission getrennt halten |

PDF, Papier, Scan, Foto, E-Mail, Portaldownload und Screenshot bleiben
Source-/Formatdaten. OeGK, SVS, BVAEB, KFA, Gemeinde, Bank, Versicherung,
Arzt/Klinik und Anbieter bleiben Provider/ExternalParty, keine Dokumenttypen.

## AT-Graph-Defaults fuer Assist

Diese Defaults sind Discovery-Hypothesen und muessen pro Workflow geprueft
werden:

1. Medizinische Rechnung ohne bestehenden Kontext: neutraler Medical Care
   Parent plus Kostenabrechnung als gemeinsamer Vorschlag.
2. Befund/Ueberweisung: bestehender oder neuer Medical Care Case; kein
   Kosten-Case ohne Rechnung/finanziellen Ausloeser.
3. Vertrags-/Abo-Rechnung: Vertrags-Record; kein Rechnungs-Case.
4. Bestellung/Lieferung/Rueckgabe: ein Purchase Case; kein Parent pro Dokument.
5. Reparaturrechnung: Service-/Asset-Kontext; Damage Parent nur bei bestaetigtem
   Schadenbezug.
6. Steuerrelevanter Beleg: Originalkontext plus zusaetzlicher Tax Collection
   Case; Original-Case ist kein Kind des Tax Case.
7. Periodische UVA: optionaler Jahres-Parent innerhalb der Tax-Familie, wenn
   Perioden als eigenstaendige Cases freigegeben werden.
8. Behoerdenbescheid: Ausgangs-Case finden/erzeugen; Beschwerde nur bei
   ausdruecklichem Ziel als verknuepfter Folge-/Dispute-Case.
9. Datenschutzrequest: eigenstaendiger Request-Case; DSB-Beschwerde erst nach
   eigenem formellem Outcome.
10. Umzug/Renovierung/Hochzeit: nur expliziter oder reviewter Custom-Umbrella,
    niemals aus einem schwachen Einzeldokument.

## Quellenregister fuer Discovery

Alle Links zuletzt geprueft am **2026-07-15**. Ein aktives Pack braucht je
konkreter Variante tiefere Quellen und professionelle Freigabe.

- [oesterreich.gv.at](https://www.oesterreich.gv.at/) - zentrale Lebenslagen,
  Behoerdenwege, Familie, Wohnen, Mobilitaet und persoenliche Dokumente.
- [Gesundheitsportal: medizinischer Befund](https://www.gesundheit.gv.at/gesundheitsleistungen/arztbesuch/medizinischer-befund1.html)
- [Gesundheitsportal: Entlassung aus dem Krankenhaus](https://www.gesundheit.gv.at/gesundheitsleistungen/krankenhausaufenthalt/entlassungstag-krankenhaus.html)
- [Gesundheitsportal: ELGA eBefund](https://www.gesundheit.gv.at/gesundheitsleistungen/elga/e-befund.html)
- [oesterreich.gv.at: Leistungen der Krankenversicherungstraeger](https://www.oesterreich.gv.at/de/themen/gesundheit/patientenrechte/Seite.3700100)
- [oesterreich.gv.at: Verhalten bei einem Verkehrsunfall](https://www.oesterreich.gv.at/de/themen/notfaelle_unfaelle_und_kriminalitaet/unfall/4/Seite.2892001)
- [Konsumentenfragen: Gewaehrleistung und Garantie](https://www.konsumentenfragen.at/konsumentenfragen/Rund_um_den_Vertrag/Nach_dem_Kauf/Gewaehrleistung_und_Garantie.html)
- [oesterreich.gv.at: Familienbeihilfe](https://www.oesterreich.gv.at/de/themen/familie_und_partnerschaft/familienbeihilfe/Seite.450233)
- [oesterreich.gv.at: Schwangerschaft und Geburt](https://www.oesterreich.gv.at/de/landingpages/geburt)
- [oesterreich.gv.at: Schuleinschreibung](https://www.oesterreich.gv.at/de/themen/bildung_und_ausbildung/schulen/4/Seite.110031)
- [oesterreich.gv.at: Studienbeihilfe](https://www.oesterreich.gv.at/de/themen/bildung_und_ausbildung/hochschulen/universitaet/1/2/1/Seite.160368)
- [eAusweise/oesterreich.gv.at: Fuehrerschein-Behoerdenwege](https://eausweise.oesterreich.gv.at/de/themen/persoenliche_dokumente_und_bestaetigungen/fuehrerschein/3)
- [Agentur fuer Passagier- und Fahrgastrechte](https://www.apf.gv.at/)
- [Oesterreichische Datenschutzbehoerde: Betroffenenrechte](https://dsb.gv.at/rechte-pflichten/ihre-rechte-als-betroffene-person)
- [Oesterreichische Datenschutzbehoerde: Beschwerde](https://dsb.gv.at/eingabe-an-die-dsb/beschwerde)
- [BMF/USP Tax Sources](AUSTRIA_TAX_CASE_CATALOG_DRAFT.md#amtliche-discovery-quellen)
- [RIS - Rechtsinformationssystem des Bundes](https://www.ris.bka.gv.at/) -
  verbindliche Rechtsgrundlagen muessen je freizugebender Variante geprueft
  werden.

## Offene Entscheidungen

- Welche Subpacks und Golden Workflows gehoeren wirklich in Commercial 1.0?
- Welche Bereiche duerfen nur als neutrale Custom-/Generic Cases starten?
- Welche Fachpartner ownen Medizin, Versicherung, Steuer, Arbeit, Familie,
  Konsumentenschutz und Mobilitaet?
- Welche Bundesland-/Gemeinde-/Provider-Overlays sind fuer einen oesterreich-
  weiten Produktclaim erforderlich?
- Welche AT-Begriffe sind nur Anzeige-Aliase und welche brauchen eine stabile
  globale semantische Dokumentvariante?
- Werden der generische Case, die acht optionalen Workflow-Muster und die
  sichtbaren Fachvorlagen akzeptiert oder muessen Muster kombiniert/getrennt
  werden?
- Welche sensiblen Facts duerfen zur Pack-Anwendbarkeit gespeichert werden?

## Stop Rules

Stop if:

- dieser Entwurf als vollstaendiges oder rechtsgeprueftes AT-Pack beworben wird;
- ein AT-Label zur globalen kanonischen ID wird;
- ein sichtbarer AT-Fachworkflow als neuer globaler Case-Typ implementiert wird,
  obwohl generischer Case plus optionales Muster, Vorlage und Pack ausreichen;
- Bundesland-, Gemeinde-, Provider- oder Institutionsunterschiede unter einem
  pauschalen Oesterreich-Workflow verborgen werden;
- Fristen, Ansprueche, Payer, Steuerregime oder Rechtsmittel aus schwacher
  Evidenz aktiviert werden;
- Record-led Kontexte als Case-Baeume dupliziert werden;
- ein Custom-Umbrella aus einem einzelnen Dokument erfunden wird;
- Pack-Aenderungen laufende Cases ohne Versionierung und Review umschreiben.
