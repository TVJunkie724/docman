---
title: "Entscheidung - Case- und Workflow-Katalog (SSOT)"
description: "Einzige Katalogquelle fuer Mappm-Workflow-Muster, Fachvorlagen-IDs, deutsche Titel, Reifegrad, Disposition und Case-Familien-Subkonzept-Ownership"
tags: [decision, product, cases, workflows, catalog, records, submissions, custom-cases]
lastUpdated: "2026-07-25"
status: "accepted-direction"
owner: "product-concept"
---

# Entscheidung - Case- und Workflow-Katalog (SSOT)

## Status und Zweck

Dieses Dokument ist die **alleinige Source of Truth fuer den Case- und
Workflow-Katalog**. Nur hier werden gepflegt:

- IDs, deutsche Titel und Bedeutung der internen Workflow-Muster;
- IDs, deutsche Titel, Katalogstatus und Disposition aller besprochenen
  Fachvorlagen-Kandidaten;
- die Disposition verworfener, kombinierter oder nur als Variante geeigneter
  aktuell besprochener Kandidaten;
- die Coverage und das Owning Artifact der fachlichen Case-Familien-
  Subkonzepte;
- die Abgrenzung zu Custom Cases, Records, Steps, Einreichungen und nationalen
  Varianten.

Discovery-, Medical-, Country-/Provider- und Pillar-Dokumente duerfen diese
Eintraege vertiefen oder bestehende IDs mappen. Sie duerfen **keine parallele
Liste, neue kanonische ID, Umbenennung oder abweichenden Katalogstatus**
definieren. Ein neuer Kandidat wird zuerst oder im selben Change in dieses
Register aufgenommen. Bei einem Widerspruch gilt fuer Katalog-ID, Titel,
Status und Disposition ausschliesslich dieses Dokument.

Ein Country-/Provider-Pack darf einen namespaced, versionierten lokalen
Varianten-Key fuehren, wenn jede Variante explizit auf eine hier registrierte
kanonische ID gemappt ist. Solche Pack-Keys sind keine weiteren
Fachvorlagen-IDs und duerfen nicht ausserhalb ihres Packs als globale Taxonomie
verwendet werden.

Der Dokumentstatus `accepted-direction` akzeptiert diese SSOT- und
Governance-Regel sowie den dokumentierten Stand. Er macht nicht jeden
Discovery-Eintrag release- oder implementationsbereit. Dafuer gelten der
Katalogstatus der jeweiligen Zeile, R0.6/OQ-011, ein freigegebenes
Country-/Provider-Pack, WF-01/WF-02 und ein Implementation Contract.

Alle Eintraege verwenden die eine `Case`-Entitaet aus
`DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`. Fachvorlagen sind
optionale gefuehrte Konfigurationen und Matchingziele, keine unterschiedlichen
globalen Case-Datentypen und keine grosse sichtbare Nutzerauswahl.

## Katalogebenen

| Ebene | Umfang | SSOT und Bedeutung |
|---|---:|---|
| Case-Entitaet | 1 | `DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`; stabiler generischer Vorgang |
| Workflow-Muster | 8 | die folgende Tabelle; interne komponierbare Prozessgrammatiken, kein Nutzer-Picker |
| Besprochene Registereintraege | 47 | 43 Fachvorlagen-/Variantenkandidaten und vier ausdrueckliche Kein-Template-Dispositionen in einer Liste |
| Case-Familien-Subkonzepte | je fachlich abgestimmter und ausdruecklich zur Dokumentation freigegebener Familie genau ein Owning Artifact | dieselbe SSOT pflegt unten Coverage und Owner; das Subkonzept besitzt Verhalten, nicht Katalog-ID/-Titel/-Status |
| Country-/Provider-Varianten | offen und versioniert | referenzieren Katalog-IDs; definieren lokale Begriffe, Institutionen, Payer, Evidenz, Fristen und Regeln |

## Case-Familien-Subkonzeptvertrag

Der vollstaendige globale Definitions-, Matching-, Lifecycle-, Handoff- und
Reviewvertrag steht in
`DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md`. Dieses Katalogdokument besitzt
weiterhin ausschliesslich Identitaet, deutschen Titel, Status, Disposition und
Owning-Coverage; der globale Vertrag besitzt das wiederverwendbare Raster.
Projektlokale Agents verwenden `case-concept`, `document-concept`,
`country-pack-concept` und `case-concept-review`.

### Verbindliche Struktur

Jede Case-Familie erhaelt nach ihrem dedizierten fachlichen User-Workshop,
vollstaendigem Chat-Abgleich und ausdruecklicher Freigabe zur Dokumentation
genau ein lebendes Subkonzept-Artefakt. Fuer neu angelegte Familien-Decisions
gilt das Standard-Namensmuster:

```text
docs/technical/DECISION_<CASE_FAMILY>_MODEL.md
```

Eine bereits bestehende, semantisch eindeutige Decision darf als Owner
registriert und gegen den Pflichtinhalt erweitert werden. Sie wird nicht nur
fuer eine Dateiumbenennung dupliziert oder ersetzt. Entscheidend sind ein
einziger Owner, vollstaendige Coverage und keine parallele aktuelle Wahrheit.

Ein Subkonzept darf mehrere eng gekoppelte Katalogeintraege derselben
Fachfamilie besitzen, wenn ihre Trennung und Beziehung gerade Gegenstand des
gemeinsamen Modells sind. Das akzeptierte Medical-Subkonzept besitzt deshalb
`medical_care` und `medical_cost_settlement`. Jeder Katalogeintrag darf aber
hoechstens ein fachliches Owning Subkonzept besitzen.

Das Subkonzept ist eine fachliche Decision, keine neue Case-Klasse und keine
zweite Katalogliste:

- dieses Dokument bleibt alleinige SSOT fuer ID, deutschen Titel,
  Katalogstatus, Disposition und Subkonzept-Owner;
- das Subkonzept besitzt Ziel, Grenzen, Verhalten, Komposition, Beispiele,
  Verifikation und Stop Rules seiner Familie;
- Country-/Provider-Packs besitzen nur lokale Terminologie, Institutionen,
  belegte Regeln, Quellen und Varianten;
- Dokumenttypen und Rollen folgen
  `DECISION_DOCUMENT_TYPE_CATALOG.md` und werden im Subkonzept nur
  dispositioniert, nicht neu katalogisiert;
- technische Domain-/API-/Drift-Details bleiben spaeteren
  Implementation-Contracts vorbehalten.

Es werden keine leeren Dateien fuer Discovery-Kandidaten oder laufende
Fachdiskussionen erzeugt. Im Workshop werden bestehende Entscheidungen,
Vorschlaege, offene Punkte und verworfene Alternativen im Gespraech klar
getrennt und jeweils nur eine Entscheidung weitergefuehrt. Erst nachdem der
Agent die vollstaendige Familienentscheidung im Chat zusammengefasst und der
User sie ausdruecklich zur Dokumentation freigegeben hat, wird das Owning
Subkonzept im selben Change angelegt oder fortgeschrieben und hier in der
Coverage registriert. Unfreigegebene Gespraechsvorschlaege duerfen weder als
Decision noch als parallele aktuelle Wahrheit persistiert werden.

### Pflichtinhalt jedes Subkonzepts

| Block | Verbindlich zu entscheiden oder explizit offen zu halten |
|---|---|
| Identitaet | referenzierte Katalog-IDs, deutscher Familienname, Status, Owner und Scope |
| Nutzerziel | welches verstaendliche Ziel die Nutzerin verfolgt und welchen Produktwert Mappm liefert |
| Case-Grenze | wann ein Case beginnt, was darin bleibt und wann ein normaler verknuepfter Case entsteht |
| Komposition | Steps, Branches, Tasks, Events, wiederholbare Einreichungen, Records und `CaseLink`-Beziehungen statt neuer Cases |
| Lifecycle | aktive/wartende/abgeschlossene Zustaende, Abschluss, Archivierung, spaete Evidenz, Wiedereroeffnung und gegebenenfalls Wiederkehr |
| Capture und Assist | globale Erfassung, Matching-Signale, Kandidatenranking, Titelvorschlag, Bestaetigung, Korrektur und Automatisierungsgrenze |
| Dokumentdisposition | jedes Szenario-Dokument als bestehender/breiter Typ, Titel/Alias, Fact/Party, Rolle/Slot, Record oder Source/Format nach minimal ausreichender Klassifikation |
| Fachliche Daten | relevante Facts, Parties, Records, externe Referenzen und getrennte Zustandsdimensionen ohne erfundene Pflichtfelder |
| Aufgaben und Zeit | nur produktrelevante Aufgaben, Fristen, erwartete Antworten, Termine, Reminder und deren Provenienz |
| Laendergrenze | universeller Kern versus Country-/Provider-Pack, aktuelle Quellenpflicht und nicht unterstuetzte Varianten |
| Trust und Sicherheit | sensible Daten, Berechtigungen, externe Aktionen, Berechnungs-/Beratungsgrenzen und Auditbedarf |
| Beispiele | normale, minimale, alternative, mehrdeutige und spaet eintreffende Evidenz sowie Korrekturpfade |
| Delivery | Abhaengigkeiten, offene Entscheidungen, Roadmap-Gates, synthetische Fixtures, Verifikation, Stop Rules und Handoff |

Konkrete Screenstruktur, Gesten und visuelle UI-Details gehoeren erst in ein
darauf aufbauendes UI-Konzept beziehungsweise einen Phase-as-Implementation-
Contract. Das Fachsubkonzept muss aber alle sichtbaren Folgen und
Korrekturmoeglichkeiten benennen, die eine spaetere UI abbilden muss.

### Reifegrad-Gate

1. Diskussion und fachlicher Workshop finden ohne neue Decision-Datei statt,
   bis der User den vollstaendigen Abgleich ausdruecklich freigibt.
2. Ein Katalogkandidat darf ohne Subkonzept `Discovery` oder
   `Variantenpruefung` bleiben.
3. `normalisierter Kern` bedeutet nur eine plausible zusammengefuehrte
   Familiengrenze; ohne Subkonzept ist das Verhalten nicht fachlich akzeptiert.
4. Vor `fachlich akzeptierter Kern`, WF-01-Auswahl, Implementation Contract,
   Contract-/Schema-Arbeit oder Produktclaim muss das Subkonzept vollstaendig
   reviewed, in der Coverage verlinkt und widerspruchsfrei sein.
5. Eine spaetere wesentliche Grenz- oder Verhaltensaenderung aktualisiert
   Subkonzept, Katalog-Coverage, Traceability und betroffene Country Packs im
   selben Change.

### Aktuelle Subkonzept-Coverage

Diese Tabelle ist innerhalb der Katalog-SSOT die einzige Owner-/Coverage-Liste.
Nicht aufgefuehrte Discovery-/Variantenkandidaten besitzen noch kein
Subkonzept und duerfen nicht als fachlich akzeptiert gelesen werden.

| Case-Familie | Registrierte Eintraege | Owning Subkonzept | Coverage/naechster Gate |
|---|---|---|---|
| Generischer/Custom Case | keine Template-ID, Custom-/Umbrella-Dispositionen | `DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md` | akzeptierte generische Mechanik; kein fachlicher Guided Workflow |
| Medizin | `medical_care`, `medical_cost_settlement`, Kein-Template-Disposition medizinische Bewilligung | `DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md` | fachlich akzeptierter Kern seit 2026-07-24; Care-/Cost-Grenze, typischer Inhalt, dokumentweises Matching, unabhaengiger Lifecycle, Abschluss und spaete Evidenz sind geschlossen; OQ-011/WF-01/WF-02 sowie technische/UI-Handoffs begrenzen Katalogdetails und Umsetzung |
| Versicherungsabwicklung | `insurance_settlement` | `DECISION_INSURANCE_SETTLEMENT_MODEL.md` | fachlich akzeptierter Kern seit 2026-07-22; keine Claim-Entitaet; Medical ist darauf abgestimmt, Unfall/Schaden wird auf dieser Grundlage nochmals fachlich geprueft |
| Steuer-Unterlagensammlung | `tax_document_collection` | `DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md` | vorlaeufiger eindeutiger Owner; vor fachlicher Kernakzeptanz gegen den vollstaendigen Familienvertrag pruefen und erweitern; OQ-010/WF-01/WF-02 blockieren konkrete Packs und Release-Versprechen |
| Unfall und Schaden | `accident_or_damage_settlement`, `damage_cost_settlement`, Kein-Template-Disposition medizinischer Unfall | `DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md` | bisheriger Kern dokumentiert; Versicherungsabwicklung am 2026-07-22 neu komponiert; Familien-Re-Review vor Implementation erforderlich |
| Kauf und Maengelbehebung | `purchase_fulfilment_and_remedy` | ausstehend | eigenes Subkonzept vor fachlicher Akzeptanz erforderlich |
| Antrag und behoerdliche Einreichung | `authority_application_or_submission` | ausstehend | eigenes Subkonzept vor fachlicher Akzeptanz erforderlich |
| Einspruch, Klaerung und Rueckforderung | `objection_dispute_or_recovery` | ausstehend | eigenes Subkonzept vor fachlicher Akzeptanz erforderlich |
| Nachweis beantragen/erneuern/ersetzen | `record_acquisition_renewal_or_replacement` | ausstehend | eigenes Subkonzept vor fachlicher Akzeptanz erforderlich |

`DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md` besitzt den separaten
Record-basierten Vertrags-/Abo-Kontext. Er ist kein Ersatz fuer ein fehlendes
Case-Familien-Subkonzept eines eigenstaendigen Vertragsstreits oder einer
anderen Case-Familie.

## Workflow-Muster

Workflow-Muster sind wiederverwendbare Prozessgrammatiken. Sie sind weder
Case-Typen noch die vollstaendige Liste fachlicher Vorgangsarten. Eine
Workflowdefinition kann mehrere Muster und Module komponieren; ein Case kann
auch ganz ohne Muster bestehen.

| Workflow-Muster-ID | Deutscher Titel | Optional gefuehrtes Ziel | Typische Module | Kein eigenes Muster fuer |
|---|---|---|---|---|
| `submission` | Einreichung und Antrag | bei einer externen Stelle etwas beantragen, melden, registrieren, erneuern oder einen Anspruch geltend machen und den Output erhalten | vorbereiten, Evidenz, Formular, Einreichung, Eingang, Nachreichung, Entscheidung/Bestaetigung, Ausgabe | Pflegegeld, Visum, Studienplatz, Kredit, Pass oder Datenschutz-Auskunft als eigene Kernfamilie |
| `transaction` | Transaktion und Leistung | einen Kauf, Verkauf, Auftrag, Service oder eine Uebergabe bis zum akzeptierten Ergebnis abschliessen | Angebot, Vereinbarung, Lieferung/Leistung, Abnahme, Rechnung, Zahlung, Rueckabwicklung | Immobilie, Reparatur, Miete oder Produktkauf als technische Spezialentitaet |
| `episode` | Fachlicher Verlauf | einen fachlich zusammenhaengenden Verlauf mit mehreren Begegnungen, Ergebnissen oder Abschnitten organisieren | Ereignisse/Begegnungen, Anordnungen, Befunde, Plaene, Verlauf, Abschluss | einzelne Termine, Beteiligte oder Dokumente als Cases |
| `incident` | Ereignis und Schaden | ein unerwartetes Ereignis dokumentieren, Folgen begrenzen und regulieren | Ereignis, Evidenz, Meldung, Sofortmassnahmen, Schaden, Versicherungsabwicklung, Recovery | Polizei, Werkstatt oder Fluglinie als Case-Typ |
| `settlement` | Abrechnung und Erstattung | eine abgegrenzte wirtschaftliche Verpflichtung und zugehoerige Zahlungen/Erstattungen abstimmen | Rechnung, Zahlung, wiederholbare Einreichungen, Antworten, Gutschriften, Restbetrag, Abschluss | jede normale oder wiederkehrende Rechnung als Case |
| `resolution` | Klaerung und Anfechtung | eine konkrete Abweichung, Ablehnung, Forderung oder Entscheidung klaeren, anfechten oder rueckfordern | Reklamation, Nachweise, Gegenantwort, Eskalation, Vergleich/Entscheidung, Recovery | Warranty, Chargeback, Payroll Issue oder Appeal als eigene Kernfamilie |
| `proceeding` | Formelles Verfahren | ein formal eroeffnetes, extern geregeltes Verfahren beantworten oder bis zum formellen Ergebnis verfolgen | Aktenzeichen, Parteien, Anordnungen, Termine, Evidenz, Stellungnahmen, Entscheidung | jedes Schreiben eines Gerichts oder einer Behoerde als neuer Case |
| `collection` | Unterlagensammlung | Unterlagen fuer einen definierten Zweck, Subject, Rechtsraum und Zeitraum vollstaendig sammeln, pruefen und uebergeben | Kandidaten, Vollstaendigkeit, fehlende Evidenz, Review, Export/Handoff | beliebige Ordner oder Spaces |

Das Muster `submission` setzt weder ein Formular noch eine
Ermessensentscheidung voraus. Varianten koennen etwa Request,
Versicherungsabwicklung,
Authorization, Acquisition, Renewal, Registration, Notification oder
Cancellation mit einem erwarteten Output kombinieren.

## Fachvorlagen- und Dispositionsregister

Diese **eine Liste** enthaelt alle derzeit besprochenen fachlichen
Registereintraege. `normalisierter Kern` bedeutet eine bereits
zusammengefuehrte Produktrichtung, nicht automatische Releasefreigabe.
`Discovery` bleibt offen. `Kein Template` bewahrt eine besprochene Idee mit
ihrer bewussten Disposition und besitzt deshalb keine produktive Vorlagen-ID.

| Bereich | Katalog-ID oder Disposition | Deutscher Titel | Katalogstatus | Ziel, Grenze und Gate |
|---|---|---|---|---|
| Schaden | `accident_or_damage_settlement` | Unfall- oder Schadenregulierung | dokumentierte Baseline; Re-Review ausstehend | ein Anlass und Regulierungsrahmen mit optionalen groben Varianten Unfall, Fahrzeugunfall, Sachschaden und Diebstahl/Verlust; Ereignisevidenz, Bildsammlung, Meldung und Reparatur bleiben darin, eigenstaendige Folgen und Versicherungsabwicklungen werden verknuepft |
| Schaden | `damage_cost_settlement` | Schadenkostenabrechnung und Erstattung | dokumentierte Baseline; Re-Review ausstehend | optional je eigenstaendig verfolgter wirtschaftlicher Verpflichtung; nicht pro Rechnung erzwungen und mit einer Versicherungsabwicklung verknuepfbar |
| Medizin/Schaden | keine ID: medizinischer Unfall | Medizinischer Unfall | kein Template | sichtbare Einstiegs-/Routingvariante direkt zu `medical_care`; kein Unfall-Wrapper, solange nur der medizinische Verlauf verwaltet wird |
| Kauf | `purchase_fulfilment_and_remedy` | Kauf, Lieferung und Maengelbehebung | normalisierter Kern | Bestellung, Lieferung, Rechnung, Zahlung, Rueckgabe, Garantie/Gewaehrleistung, Reklamation und Erstattung bleiben im Kaufziel; formeller Streit kann eigener Case werden |
| Behoerde | `authority_application_or_submission` | Antrag oder behoerdliche Einreichung | normalisierter Kern | Nachweise, Einreichung, Rueckfragen, Nachreichung und Entscheidung; Rechtsmittel nur bei eigenem Ziel und Ergebnis als verknuepfter Case |
| Recht/Klaerung | `objection_dispute_or_recovery` | Einspruch, Klaerung oder Rueckforderung | normalisierter Kern | Entscheidung, Forderung, Ablehnung oder Leistung klaeren/anfechten; formelles Gerichts- oder Behoerdenverfahren kann eigener Case werden |
| Steuer | `tax_document_collection` | Steuer-Unterlagensammlung | normalisierter Kern | fuer Subject, Rechtsraum, Regime und Periode sammeln, pruefen und uebergeben; keine Steuerberechnung oder Absetzbarkeitszusage |
| Nachweis | `record_acquisition_renewal_or_replacement` | Nachweis beantragen, erneuern oder ersetzen | normalisierter Kern | Ausstellung, Erneuerung oder Ersatz eines langlebigen Records; Ablehnung, Missbrauchsfolge oder Rechtsmittel nur bei eigenem Outcome separat |
| Custom/Umbrella | keine ID: generischer Case | Eigener Vorgang oder privates Projekt | kein Template | normaler generischer Case ohne Pflichtworkflow; keine eigene Vorlagen-ID implementieren |
| Custom/Umbrella | keine ID: Custom-Umbrella | Umzug | kein Template | bewusst angelegter Sammelvorgang aus Dokumenten, Records und Cases; nicht automatisch aus einer einzelnen Kuendigung ableiten |
| Behoerde/Leistung | `entitlement_or_benefit_application` | Leistung, Beihilfe oder Foerderung beantragen | Discovery | Submission-Kandidat; Country-/Provider-Pack und WF-01/WF-02 erforderlich |
| Behoerde/Register | `registration_change_or_notification` | Anmeldung, Abmeldung oder Aenderungsmeldung | Discovery | Register und Rechtsraum duerfen nicht zu einer globalen Regel vermischt werden |
| Recht/Behoerde | `formal_proceeding` | Formelles Behoerden- oder Gerichtsverfahren | Discovery | spezialisiertes Proceeding; fachliche und rechtliche Freigabe erforderlich |
| Recht/Compliance | `audit_or_compliance_response` | Pruefung oder Auskunftsverfahren beantworten | Discovery | specialist/later; Scope, Evidenz und Handoff muessen fachlich definiert werden |
| Zahlung/Behoerde | `payment_relief_or_debt_resolution` | Stundung, Ratenzahlung oder Schuldenregelung | Discovery | eigener Request nur bei bestaetigter Forderung und eigenem Outcome |
| Sicherheit | `fraud_identity_or_security_incident` | Betrug, Identitaetsmissbrauch oder Sicherheitsvorfall | Discovery | Incident-/Recovery-Kandidat; Bank, Polizei oder Provider nur nach bestaetigter Evidenz |
| Medizin | `medical_care` | Medizinischer Behandlungsfall | fachlich akzeptierter Kern | zusammenhaengender medizinischer Anlass/Kontrollzweck; erstes bestaetigtes medizinisches Dokument erzeugt neutralen Care-Anker; Provider, Setting, Dauer, Reha/Nachsorge oder spaeterer Beleg spalten nicht automatisch; Wiederkehr ist optionale Planung, kein Case-Typ |
| Medizin | `medical_cost_settlement` | Medizinische Kostenabrechnung und Erstattung | fachlich akzeptierter Kern | je eigenstaendig ausgestellter Rechnung/Honorarnote ein `part_of`-Case unter Medical Care; Korrektur/Gutschrift/Beleg, getrennte Payer-Fristen sowie wiederholbare Einreichungs-/Antwortereignisse bleiben darin; kein Dokument ist Pflicht und es gibt keine Claim-Entitaet |
| Medizin | keine ID: medizinische Bewilligung | Medizinische Bewilligung oder Kostenuebernahme | kein Template | Anfrage, Nachreichung, Bewilligung, Ablehnung und bestaetigte Auflagen bleiben Dokumente/Facts/Schritte im `medical_care`; allein daraus keinen Case oder M1-Dokumenttyp erzeugen |
| Versicherung | `insurance_settlement` | Versicherungsabwicklung | fachlich akzeptierter Kern | ein normaler Case pro Versicherer und zusammengehoeriger Abwicklung; mehrere Rechnungen und wiederholbare Einreichungen/Nachreichungen bleiben darin; Polizze bleibt Record; keine Claim-Entitaet |
| Versicherung/Reise | `travel_insurance_settlement` | Reiseversicherungsfall | Variantenpruefung | moegliche Country-/Provider-/Domainvariante von `insurance_settlement`, nicht automatisch eigene globale Vorlage |
| Kauf | `return_or_refund` | Rueckgabe oder Rueckerstattung | Variantenpruefung | normalerweise Branch von `purchase_fulfilment_and_remedy`; eigener Case nur bei unabhaengigem Verlauf |
| Service | `repair_or_service_resolution` | Reparatur oder Serviceabwicklung | Discovery | eigenstaendig oder Branch eines Kauf-, Garantie- oder Schadenfalls; Grenze noch pruefen |
| Verbraucherrecht | `warranty_or_guarantee_remedy` | Gewaehrleistungs- oder Garantiefall | Discovery | Rechts-/Vertragsgrundlage und sichtbare Terminologie muessen getrennt bleiben |
| Zahlung | `payment_or_chargeback` | Zahlungsproblem oder Rueckbuchung | Discovery | Zahlungsprovider-/Bank-Overlay; Security Incident bei Missbrauch verknuepfen |
| Finanzierung | `financing_or_credit_application` | Finanzierung oder Kredit beantragen | Discovery | Vertrag wird nach Abschluss Record; keine Finanzberatung |
| Forderung | `debt_collection_or_repayment_arrangement` | Forderung, Mahnung oder Inkasso klaeren | Discovery | Bestreiten und Zahlungsvereinbarung sind unterschiedliche Branches/Outcomes |
| Wohnen | `rental_start_handover_or_end` | Mietbeginn, Uebergabe oder Mietende | Discovery | Mietverhaeltnis bleibt Record; offene Transaktion bildet den Case |
| Immobilie | `property_purchase_or_sale` | Immobilie kaufen oder verkaufen | Discovery | Vertrag, Finanzierung, Treuhand, Register und Uebergabe; specialist Country Pack |
| Wohnen/Projekt | `construction_or_renovation` | Bau oder Renovierung | Discovery | Guided-/Custom-Umbrella; Auftraege, Abnahmen, Rechnungen und Bewilligungen verknuepfen |
| Versorgung | `utility_connection_switch_or_issue` | Versorgung anschliessen, wechseln oder klaeren | Discovery | Vertrag bleibt Record; Anschluss, Wechsel oder Streit kann Case werden |
| Arbeit | `job_application_or_onboarding` | Bewerbung und Onboarding | Discovery | nach Abschluss Employment Record; sensible Bewerbungsdaten beachten |
| Arbeit | `employment_change_leave_or_end` | Arbeitsverhaeltnis aendern, unterbrechen oder beenden | Discovery | Employment Record als Anker; medizinische Details nicht unnoetig kopieren |
| Arbeit | `payroll_or_compensation_issue` | Lohn- oder Gehaltsproblem klaeren | Discovery | Resolution-Kandidat; Steuer ist nur zusaetzlicher Kontext |
| Bildung | `education_admission_or_enrollment` | Aufnahme oder Einschreibung | Discovery | Institution und Rechtsraum bestimmen konkrete Variante |
| Bildung | `exam_or_certification` | Pruefung oder Zertifizierung | Discovery | Ergebnis oder Zertifikat wird langlebiger Record |
| Bildung | `scholarship_or_education_support` | Bildungsfoerderung oder Stipendium beantragen | Discovery | Benefit-/Submission-Kandidat mit Education Domain |
| Familie/Betreuung | `childcare_placement_or_support` | Betreuungsplatz oder Kostenhilfe | Discovery | Platz und Foerderung koennen getrennte Outcomes/Cases besitzen |
| Familie | `family_or_parental_benefit` | Familien- oder Elternleistung | Discovery | antragslose und antragsbeduerftige Varianten unterscheiden |
| Personenstand/Familie | `civil_or_family_status_procedure` | Personenstands- oder Familienverfahren | Discovery | hochsensibel; Urkunden als Records, Verfahren als Cases |
| Nachlass | `estate_or_death_administration` | Todesfall und Nachlass organisieren | Discovery | bewusster Umbrella; formelles Verlassenschafts-/Gerichtsverfahren separat verknuepfen |
| Migration | `immigration_residence_or_citizenship` | Aufenthalt, Niederlassung oder Staatsbuergerschaft | Discovery | hochsensibler Specialist-Kandidat; Country-/EU-/Herkunftskontext zwingend |
| Fahrzeug | `vehicle_acquisition_or_registration` | Fahrzeug kaufen oder zulassen | Discovery | Fahrzeug bleibt Asset/Record; Zulassungsprozess kann Case sein |
| Fahrzeug | `vehicle_inspection_or_service` | Fahrzeugpruefung, Wartung oder Reparatur | Discovery | Serviceereignis im Asset-Kontext; eigener Case nur bei offenem Outcome |
| Reise | `travel_authorization_or_visa` | Reisegenehmigung oder Visum | Discovery | Zielland-/EU-Pack; Reisedokumente bleiben Records |
| Reise | `travel_disruption_or_passenger_rights` | Reisestoerung oder Fahrgastrechte | Discovery | Anbieter-/Rechtsraum-Pack; Folgecase nur bei unabhaengiger Eskalation |
| Datenschutz | `privacy_or_data_subject_request` | Datenschutzrechtliches Begehren | Discovery | Auskunft, Berichtigung, Loeschung, Portabilitaet oder Widerspruch; Legal Gate erforderlich |

## Record-basierte Kontexte, nicht automatisch eigene Cases

| Kontext | Normales Verhalten | Moeglicher verknuepfter Case |
|---|---|---|
| Vertrag/Abo | ein langlebiger `Record` mit Abschluss, Aktivierung, normaler Aenderung, Preispruefung, Kuendigung, Endabrechnung, Rechnungen, Tasks und Reminder in einem ruhigen Kontext | eigenstaendiger Streit, Rueckforderung oder formelles Verfahren |
| Identitaetsnachweis | Reisepass, Personalausweis, Fuehrerschein, Geburtsurkunde oder Meldeunterlage ist eine Unterlage/Record mit Versionen und Gueltigkeit | Beantragung/Erneuerung/Ersatz als `submission`-Vorlage oder Streit als `resolution` |
| Versicherungspolizze | langlebiger Record mit Deckung, Laufzeit, Praemie und Versionen | Schaden-/Erstattungs-Case oder eigenstaendiger Deckungsstreit |
| Asset/Garantie | langlebiger Record fuer Produkt, Kaufnachweis, Seriennummer und Garantie | Kauf-/Rueckgabe-/Garantie-Case bei konkretem Handlungsziel |

Eine eingehende Rechnung erzeugt nicht blind einen Case. Sie wird zuerst einem
bestehenden Contract-, Purchase-, Tax- oder Reimbursement-Kontext zugeordnet
oder schlaegt nach Review einen passenden neuen Case/Record vor.

## Manuelle und Custom Cases

Custom Cases haben dieselben Faehigkeiten wie gefuehrte Cases. Aktuelle
Beispiele sind:

- ein vom Capture erzeugter leichter Custom Case mit vorgeschlagenem Titel,
  Managed Subject und zunaechst nur einem Dokument; spaetere Dokumente koennen
  matchen und ein kompatibler Guided Workflow kann nach Bestaetigung uebernommen
  werden;

- `Umzug 2027` als bewusst angelegter Umbrella-Case, der ausgewaehlte Dokumente
  und eigenstaendige Vertrags-/Wohn-/Versorgungs-Cases via `part_of` verbindet;
  eine einzelne Kuendigungsbestaetigung beweist keinen Umzug;
- `Garten im Fruehjahr herrichten` zum Sammeln von Rechnungen, Aufgaben, Terminen
  und einfachen bestaetigten Kosten;
- Renovierung, Hochzeit, Reise oder privates Kaufprojekt, wenn der Nutzer den
  gemeinsamen Kontext selbst festlegt.

Custom Cases koennen top-down erstellt oder bottom-up aus Dokumenten, Records,
Tasks und bestehenden Cases komponiert werden. Aufloesen einer Beziehung
loescht oder kopiert keine Inhalte.

## Dokumentgrenzen und Verlinkung

| Dokument | Einzige Verantwortung | Darf nicht |
|---|---|---|
| dieses Dokument | Workflow-Muster, Fachvorlagen-/Variantenkandidaten, deutsche Titel, Katalogstatus, Disposition und Subkonzept-Ownership/Coverage | medizinische, rechtliche oder nationale Detailregeln behaupten |
| `DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md` | generische Case-Entitaet, CaseLink-Semantik und Split-/Kompositionsregel | Fachvorlagen-IDs oder Country-Varianten inventarisieren |
| `DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md` | Care-/Cost-Komposition mit einer eigenstaendig ausgestellten Rechnung je Cost-Case, dokumentweises Matching und Ankerdokument-Regel, Wiederkehr, Payer-Praeferenzen, Einreichungs-/Frist-/Finanzzustaende ohne Claim-Entitaet, unabhaengiger Lifecycle, typische optionale Inhalte, Bewilligungsgrenze, schlanke Medical-Dokumentregel und case-lokaler Desktop-Medienarchiv-Randfall | AT-Regelquellen duplizieren, Versicherungsberechnungen, Dokumentpflichten oder UI-Details implizit entscheiden |
| `DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md` | Unfall-/Schadengrenze, grobe Varianten, medizinisches Routing, optionale Schadenkosten, Bildsammlung, Versicherungsabwicklungs-/Polizzenvorschlaege und asynchrones Capture-Verhalten | Deckung, Haftung, Country-/Provider-Regeln, finale Dokumenttypen oder UI-Details implizit entscheiden; Familien-Re-Review ueberspringen |
| `DECISION_INSURANCE_SETTLEMENT_MODEL.md` | normaler Versicherungs-Case, Case-Grenze, wiederholbare Einreichungen/Nachreichungen, Polizzen-Record, Rechnungs-/Kostenbezug und Abschaffung der Claim-Entitaet | pro Einreichung einen Case erzeugen, Deckung behaupten oder medizinische Payer-Ablaufe ohne Familienreview zerlegen |
| `DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md` | Publikations-, Versions-, Review-, Withdrawal- und Country-Pack-Governance | eine zweite Muster-/Fachvorlagenliste fuehren |
| `DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md` | mehrere unabhaengige Fristinstanzen, Quellen-/Versions-/Anker-Provenienz, typabhaengige Datumsfeldvorschlaege, Bestaetigung, Ableitung der naechsten kritischen Frist und sichtbarer Reminder-Vertrag | konkrete AT-Providerfristen inventarisieren oder einen Modellvorschlag ohne Review/Regel als aktive Frist behandeln |
| `DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md` | datierter AT-Medical-Payer-Bestand, freigegebene Fristregeln, KFA-/Private-Provider-Grenze, Default- und Release-Semantik | globale Frist-/Case-Semantik oder Versicherungsdeckung definieren |
| `../ops/OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md` | Quellenmonitoring, periodischer menschlicher Review, Developer-Reminder, Eskalation, Withdrawal und Release-Gates | fachliche Regeln oder Rechtsauskuenfte selbst festlegen |
| `DECISION_DOCUMENT_TYPE_CATALOG.md` und `docs/discovery/CASE_DOCUMENT_TAXONOMY_CANDIDATES.md` | Dokumentachsen sowie offener Dokumentgrundarten-/Variantenentwurf | Case-/Workflow-IDs oder deren Status definieren |
| Medical-, Tax-, Country- und Provider-Drafts | Szenarien, Detailgrenzen und explizite Mappings auf registrierte IDs | globale IDs, Titel oder Katalogstatus neu erfinden |

## Nicht normative Discovery-Unterlagen

Die folgenden Entwuerfe vertiefen das Zielmodell, ohne neue Keys, Workflows oder
Release Scope zu akzeptieren:

- `docs/discovery/CASE_DOCUMENT_TAXONOMY_CANDIDATES.md` vertieft ausschliesslich
  das Dokument-, Alias-, Rollen- und Matching-Vokabular und verweist fuer
  Cases/Workflows auf diese SSOT;
- `docs/discovery/AUSTRIA_CASE_WORKFLOW_COUNTRY_PACK_DRAFT.md` ordnet aktuelle
  Fachvorlagen vorlaeufig oesterreichischer Terminologie, Komposition und
  Pack-Abhaengigkeiten zu;
- `docs/discovery/DYNAMIC_DOMAIN_COUNTRY_PACK_MODEL_DRAFT.md` untersucht die
  Skalierung ueber stabile Ontologie, Module, signierte Country-/Provider-
  Definitionen und gepinnte Versionen statt hardcodierter Client-Zweige;
- `docs/discovery/AUSTRIA_TAX_CASE_CATALOG_DRAFT.md` ist der vertiefte, datierte
  Steuerentwurf fuer lokale Varianten von `tax_document_collection` und bleibt
  durch OQ-010/WF-01/WF-02 blockiert.

Diese Entwuerfe duerfen keine eigene kanonische Case-/Workflow-ID definieren.
Agents duerfen Discovery-Kandidaten aus diesem Register nicht in Code oder
Contracts uebernehmen, bevor R0.6 die relevanten Achsen akzeptiert und
normalisiert.

## Was fuer sich allein kein Case ist

- ein Dokument, eine Rechnung oder ein Absender;
- ein Arztbesuch ohne dokumentiertes Handlungs-/Nachweisziel;
- Polizei, Werkstatt, Krankenhaus, Arzt, Versicherer oder Behoerde als Akteur;
- Einreichung, Antwort, Erstattung, Zahlung oder Kuendigung als einzelner Status;
- ein Einreichungs-/Erstattungsablauf gegenueber SV, Zusatzversicherung,
  Garantiegeber oder Behoerde;
- ein Workflow-Step, Event, Task oder bedingter Branch;
- Reisepass, Geburtsurkunde, Vertrag, Polizze oder Garantie als langlebiger Record;
- Tags, Spaces, Ordner oder Suchergebnisse.

Diese Elemente koennen einen Case ausloesen, belegen oder darin eine Rolle
tragen. Sie definieren nicht automatisch einen gefuehrten Case. Wenn nach
Capture weder Record noch bestehender/geführter Case passt, darf ein leichter
Custom Case den primaeren Kontext bilden, ohne erfundene Tasks oder Outcomes.

## Laender- und Release-Regel

Der Katalog trennt den einen generischen Case, optionale Workflow-Muster,
sichtbare Domainvorlage und veroeffentlichte Laendervariante. Commercial 1.0
ist Oesterreich-first; welche oesterreichischen Golden Workflows tatsaechlich
enthalten sind, bleibt bis zur finalen WF-01-Disposition offen.
Oesterreichische SV-/Zusatzversicherungs- und Steuerbeispiele werden deshalb
nicht automatisch zu Release-Scope oder weltweit hardcodierten Regeln.

Der deutschsprachige Raum ist die geplante naechste Expansionsrichtung. Jedes
Land beziehungsweise jeder Rechtsraum erhaelt eigene versionierte Payer-,
Frist-, Evidenz-, Provider- und Terminologievarianten. Gemeinsame deutsche
Lokalisierung beweist keine gemeinsame Rechtslage. Ohne freigegebenes Pack sind
nur neutrale Custom Cases oder generische Workflows ohne laender-, provider-
oder rechtsraumspezifische Produktbehauptung erlaubt.

## Stop Rules

Implementation und Freigabe stoppen, wenn:

- eine nicht konkretisierte Familie als fertiger Workflow implementiert wird;
- vor vollstaendigem Chat-Abgleich und ausdruecklicher User-Freigabe ein neues
  Workshop-/Draft-Subkonzept angelegt wird;
- nach ausdruecklicher Dokumentationsfreigabe kein eindeutig registriertes
  Owning Subkonzept entsteht oder mehrere aktuelle Subkonzepte dieselbe ID
  besitzen;
- ein Katalogeintrag ohne vollstaendig reviewed Subkonzept als `fachlich
  akzeptierter Kern`, WF-01-Workflow, Contract-/Schema-Scope oder
  Implementation Contract behandelt wird;
- ein Country-/Provider-Pack, Pillar, Phase oder Issue das fehlende fachliche
  Subkonzept ersetzt oder eine parallele Case-Liste fuehrt;
- eine sichtbare Fachvorlage oder nationale Formularvariante ungeprueft zu
  einem neuen globalen Case-Typ oder Workflow-Grundmuster wird;
- Actor, Dokument, Einreichung, Branch oder Status als eigener Case-Typ
  modelliert wird;
- Contract-/Identity-/Policy-Records als Cases missbraucht werden;
- ein Custom Case weniger kann als ein Guided Case;
- ein Land, Provider, Anspruch oder eine Frist ohne WF-01/WF-02-Gate behauptet wird;
- diese Liste als abgeschlossenes Weltmarktversprechen statt als aktueller
  Produktkatalog behandelt wird;
- die bewusst verworfene eigene medizinische Bewilligungsvorlage,
  Wiederkehr als eigener Medical-Case-Typ oder automatische Reha-/Folge-Case-
  Abspaltung eingefuehrt wird;
- ein medizinischer Unfall ohne eigenstaendige nichtmedizinische Regulierung
  einen leeren Unfall-Wrapper erzeugt;
- `medical_cost_settlement` und `damage_cost_settlement` fachlich verschmolzen
  oder ihre Payer-/Versicherungsablaeufe aufeinander uebertragen werden;
- `Claim` als eigene Mappm-Entitaet oder Matchingziel eingefuehrt wird;
- Unfallvarianten in Park-, Wasser-, Feuer- oder andere Kleinsttypen
  vervielfacht werden;
- eine vorgeschlagene Polizze als bestaetigte Deckung, Zustaendigkeit oder
  Leistung gelesen wird;
- Mappm Versicherungsdeckung, erwartete Leistung oder Erstattung berechnet;
- Backend/Core Assist fuer einen neuen leichten/geführten Case keinen Titel
  vorschlaegt.
