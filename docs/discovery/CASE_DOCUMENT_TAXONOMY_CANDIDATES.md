---
title: "Discovery Draft - Global Case and Document Taxonomy Normalization"
description: "Normalisierungsentwurf fuer den einen generischen Case, optionale Workflow-Muster, sichtbare Fachvorlagen, Record-Kontexte, Dokumentgrundarten, Varianten, Domains und Rollen"
tags: [discovery, draft, taxonomy, cases, records, documents, workflows, matching, internationalization]
lastUpdated: "2026-07-15"
status: "draft"
owner: "product-concept"
---

# Discovery Draft - Global Case and Document Taxonomy Normalization

## Status

Dieses Dokument beschreibt den aktuellen Normalisierungsentwurf fuer Cases,
Workflows, Records und Dokumente. Es bleibt ein **Discovery-Entwurf, kein
akzeptierter Katalog**. R0.6/OQ-011 muss das vorgeschlagene Zielmodell
gemeinsam mit dem User akzeptieren, aendern oder verwerfen.

Insbesondere sind der eine generische Case, optionale Workflow-Muster,
sichtbare Fachvorlage, Workflowmodul, Record-Kontext, Dokumentgrundart,
semantische Variante, Domain, Rolle, Quelle/Format und laenderspezifischer
Begriff getrennte Achsen. Dieses Inventar macht Grenzfaelle sichtbar; es darf
sie nicht durch fruehe IDs zementieren.

## Zentrale Normalisierung

Ein normaler Haushalt soll in Oesterreich einen Vorgang wie
**Pflegegeld beantragen** oder **Wahlarztrechnung einreichen** sehen. Das macht
`Pflegegeld` oder `Wahlarztrechnung` aber nicht zu globalen Case-Entitaeten.
Andere Laender besitzen meist dieselben groben Verfahrensgrammatiken mit
anderen Formularen, Institutionen, Voraussetzungen, Fristen, Payern und
Bezeichnungen.

Mappm trennt deshalb die generische Case-Struktur von optionaler fachlicher
Fuehrung:

```text
ein generischer Case
  + optionales wiederverwendbares Workflow-Muster
  + optionale sichtbare domainbezogene Fachvorlage
  + versioniertes Country-/Provider-Pack
  + konkrete Dokumente, Fakten, Records und bestaetigte Relationen
  = konkrete Case-Instanz des Users
```

Nicht normative Kompositionsbeispiele:

```text
generic Case + submission workflow pattern
  + benefit_application
  + at.social.pflegegeld@2026
  = "Pflegegeld fuer Maria beantragen"

generic Case + episode workflow pattern
  + medical_care
  + at.health.generic@2026
  = "Kniebehandlung 2026"

generic Case + settlement workflow pattern
  + medical_expense
  + at.health.oegk-and-private@2026
  = "Arztrechnung Dr. Beispiel vom 14.07.2026"
```

Flutter, Datenbank und API brauchen damit weder unterschiedliche Case-Klassen
noch einen grossen sichtbaren Case-Typ-Picker. Die Spezifitaet kommt aus
geprueften Definitionen und extrahierten Fakten. Ein Case darf jederzeit nur
aus vorgeschlagenem Titel, Managed Subject und einem Dokument bestehen.

## Kompositionsmodell

```text
Case instance
  = generic Case data
  + optional workflow pattern/modules
  + optional domain template
  + country/provider pack
  + managed-subject context
  + confirmed evidence

Document classification
  = base type
  + semantic variant
  + domain(s)
  + relationship role(s)
  + source/format
  + extracted facts
```

Beispiel: `OeGK-Arztrechnung fuer eine Kniebehandlung` ist kein einzelner
hardcodierter Dokumenttyp. Es ist eine Rechnung mit Medizin-Domain,
Kostenbelegrolle, oesterreichischem Payer-Kontext und Links zu medizinischem
Behandlungs- und Kostenabrechnungs-Case.

## Ein generischer Case und acht optionale Workflow-Muster

Der Case selbst ist der stabile Grundbaustein: eine benannte, durchsuchbare und
verknuepfbare Sammlung von Dokumenten und Kontext. Er kann zusaetzlich Facts,
Tasks, Termine, erwartete Dokumente, Claims, finanzielle Eintraege, Records und
Case-Links tragen. Nichts davon ist Voraussetzung fuer seine Existenz.

`Custom Case`, Umbrella und offene Dokumentensammlung sind deshalb keine
Case-Typen. Sie sind der normale generische Case ohne verpflichtenden
Workflow. Ein spaeter erkannter Zusammenhang darf eine Fachvorlage uebernehmen
oder wechseln, ohne den Case zu kopieren oder seine Identitaet zu aendern.

Der Entwurf beschreibt die prozessualen Gemeinsamkeiten vorlaeufig durch acht
**interne optionale Workflow-Muster**. Auch diese acht sind
R0.6-Entscheidungsinput, keine sichtbare Nutzerauswahl und keine unabhaengigen
Domainentitaeten.

Die Muster muessen nicht als exklusives Feld auf `Case` persistiert werden.
Eine Workflowdefinition kann mehrere Muster/Module komponieren, und ein Case
kann ganz ohne Definition bestehen. Die Liste ist zuerst eine Autoren-,
Governance-, Test- und Wiederverwendungshilfe fuer den Katalog.

| Workflow-Muster | Optional gefuehrtes Ziel | Typische Module | Kein eigenes Muster fuer |
|---|---|---|---|
| `submission` | bei einer externen Stelle etwas beantragen, melden, registrieren, erneuern oder als Claim geltend machen und den Output erhalten | vorbereiten, Evidenz, Formular, Einreichung, Eingang, Nachreichung, Entscheidung/Bestaetigung, Ausgabe | Pflegegeld, Visum, Studienplatz, Kredit, Pass oder Datenschutz-Auskunft als eigene Kernfamilie |
| `transaction` | einen Kauf, Verkauf, Auftrag, Service oder eine Uebergabe bis zum akzeptierten Ergebnis abschliessen | Angebot, Vereinbarung, Lieferung/Leistung, Abnahme, Rechnung, Zahlung, Rueckabwicklung | Immobilie, Reparatur, Miete oder Produktkauf als technische Spezialentitaet |
| `episode` | einen fachlich zusammenhaengenden Verlauf mit mehreren Begegnungen, Ergebnissen oder Abschnitten organisieren | Ereignisse/Begegnungen, Anordnungen, Befunde, Plaene, Verlauf, Abschluss | einzelne Termine, Beteiligte oder Dokumente als Cases; erster Kandidat ist `medical_care` |
| `incident` | ein unerwartetes Ereignis dokumentieren, Folgen begrenzen und regulieren | Ereignis, Evidenz, Meldung, Sofortmassnahmen, Schaden, Claims, Recovery | Polizei, Werkstatt, Fluglinie oder Versicherer als Case-Typ |
| `settlement` | eine abgegrenzte wirtschaftliche Verpflichtung und zugehoerige Zahlungen/Erstattungen abstimmen | Rechnung, Zahlung, Einreichungen/Claims, Antworten, Gutschriften, Restbetrag, Abschluss | jede normale oder wiederkehrende Rechnung als Case; erster Kandidat ist medizinische Kostenabrechnung |
| `resolution` | eine konkrete Abweichung, Ablehnung, Forderung oder Entscheidung klaeren, anfechten oder rueckfordern | Reklamation, Nachweise, Gegenantwort, Eskalation, Vergleich/Entscheidung, Recovery | Warranty, Chargeback, Payroll Issue oder Appeal als eigene Kernfamilie |
| `proceeding` | ein formal eroeffnetes, extern geregeltes Verfahren beantworten oder bis zum formellen Ergebnis verfolgen | Aktenzeichen, Parteien, Anordnungen, Termine, Evidenz, Stellungnahmen, Entscheidung | jedes Schreiben eines Gerichts oder einer Behoerde als neuer Case |
| `collection` | Unterlagen fuer einen definierten Zweck, Subject, Rechtsraum und Zeitraum vollstaendig sammeln, pruefen und uebergeben | Kandidaten, Vollstaendigkeit, fehlende Evidenz, Review, Export/Handoff | beliebige Ordner; erster Kandidat ist die Steuer-Unterlagensammlung |

Das Workflow-Muster `submission` besitzt keine universelle Annahme, dass immer ein Formular oder
eine Ermessensentscheidung existiert. Eine Variante beschreibt mindestens den
Intent `request`, `claim`, `authorization`, `acquisition`, `renewal`,
`registration`, `notification` oder `cancellation` sowie den erwarteten Output
`decision`, `acknowledgement`, `payment`, `service`, `placement`, `Record` oder
`no_formal_output`. So kann derselbe Kern Antraege in verschiedenen Laendern
abbilden, ohne fachliche Unterschiede zu verschweigen.

## Record-led Kontexte, die nicht zu Case-Familien werden sollen

- Identitaets- und Personenstandsnachweise;
- Vertraege und Abonnements;
- Versicherungspolizzen;
- Bankkonten, Depots, Kredite und Finanzierungsvertraege;
- Immobilie, Mietverhaeltnis, Fahrzeug und sonstige Assets;
- Garantie-/Gewaehrleistungsnachweis als Teil eines Asset-/Purchase-Records;
- Arbeitsverhaeltnis;
- Bildungsabschluss, Berechtigung und Zertifikat;
- steuerliche/behoerdliche Identifikatoren;
- wiederkehrende Pflege-, Vorsorge- oder Serviceplaene, sofern sie keinen
  offenen Case-Outcome besitzen.

## Dokumentmodell - reduzierter Kandidatensatz

Ein Dokument wird nicht nach seinem kompletten Anwendungsfall benannt. Eine
`OeGK-Wahlarztrechnungs-Erstattungsunterlage` waere eine unwartbare Kombination
aus Grundart, Domain, Rolle, Payer, Land und Workflowzustand. Stattdessen gilt:

```text
Document
  primaryBaseType
  semanticVariant?
  domains[]
  recordTargetKind?
  caseLinks[{caseId, roles[]}]
  parties[]
  facts[]
  jurisdiction/provider context?
  source/format
```

### Kandidaten fuer globale Dokumentgrundarten

| Grundart | Globale Bedeutung | Beispiele fuer Varianten oder lokale Aliase |
|---|---|---|
| `application_or_filing` | nach aussen gerichteter Antrag, Claim, Meldung, Beschwerde, Kuendigung oder sonstige Einreichung | Antrag, Leistungsantrag, Steuererklaerung, Einspruch, Datenschutz-Auskunftsantrag |
| `form` | auszufuellender oder ausgefuellter strukturierter Frage-/Erhebungsbogen | Antragsformular, Anamnese-/Untersuchungsbogen, Formularerklaerung |
| `declaration_or_consent` | rechtserhebliche Erklaerung, Einwilligung, Vollmacht, Mandat oder Abtretung | Einwilligung, Vollmacht, Lastschriftmandat, Abfindungserklaerung |
| `correspondence` | freies oder halbstrukturiertes Anschreiben bzw. Nachrichtendokument | allgemeines Anschreiben, Stellungnahme, Rechtsanwaltsschreiben |
| `notice_or_request` | Information, Aufforderung, Nachforderung, Mahnung, Ladung oder Fristsetzung | Ergaenzungsersuchen, Versicherungsrueckfrage, Zahlungsaufforderung |
| `acknowledgement` | Eingang, Empfang, Zustellung, Abschluss oder sonstigen Vorgang bestaetigen | Einreichbestaetigung, Zustellnachweis, Kuendigungsbestaetigung |
| `decision_or_order` | formelle oder vertragliche Entscheidung, Anordnung, Bewilligung oder Ablehnung | Bescheid, Claim-Entscheidung, Urteil, Genehmigung, Auflage |
| `credential_or_certificate` | Identitaet, Status, Qualifikation, Berechtigung oder Tatsache nachweisen | Reisepass, Geburtsurkunde, Diplom, Versicherungsnachweis |
| `registry_extract` | Daten aus einem Register oder gefuehrten Bestand wiedergeben | Grundbuchauszug, Firmenbuchauszug, Strafregisterbescheinigung |
| `contract_or_policy` | Rechte und Pflichten zwischen Parteien oder Deckung/Terms festlegen | Kauf-, Miet-, Arbeits-, Versicherungs- oder Kreditvertrag, AGB-Version |
| `offer_or_quote` | vorgeschlagene Leistung, Ware, Finanzierung oder Kosten vor Bindung beschreiben | Angebot, Kostenvoranschlag, Schadenschaetzung |
| `order_or_booking` | Bestellung, Beauftragung, Reservierung oder Termin verbindlich/operativ festhalten | Auftrag, Bestellbestaetigung, Reparaturauftrag, Buchungsbestaetigung |
| `delivery_or_handover` | Lieferung, Uebergabe, Rueckgabe, Abnahme oder Zustand beim Transfer dokumentieren | Lieferschein, Uebergabeprotokoll, Abnahmeprotokoll, Ruecksendenachweis |
| `invoice_or_charge` | Zahlungspflicht oder abgerechnete Leistung ausweisen | Rechnung, Honorarnote, Gebuehrenvorschreibung, Praemienvorschreibung |
| `credit_or_adjustment` | eine Forderung oder Abrechnung berichtigen/mindern | Gutschrift, Rabatt-/Bonusabrechnung, Korrekturabrechnung |
| `payment_record` | eine konkrete Zahlung, Belastung oder Zahlungsanweisung dokumentieren | Kassenbeleg, Ueberweisungsbestaetigung, Kautionsnachweis |
| `financial_statement` | finanzielle Aktivitaeten, Salden oder eine Periode zusammenfassen | Kontoauszug, Gehaltsabrechnung, Betriebskosten-/Jahresabrechnung, Steuerreporting |
| `report_or_assessment` | Untersuchung, Leistung, Zustand, Ergebnis oder fachliche Bewertung dokumentieren | Befund, Entlassungsbrief, Gutachten, Service-/Pruefbericht |
| `plan_or_instruction` | beabsichtigte Schritte, Behandlung, Nutzung oder Vorbereitung festlegen | Therapie-, Pflege-, Reha-, Medikations-, Reise- oder Bauplan |
| `referral_or_prescription` | eine Leistung, Untersuchung, Behandlung, Ware oder Medikation fachlich anordnen/empfehlen | Ueberweisung, Einweisung, Rezept, Hilfsmittelverordnung |
| `record_or_log` | Ereignisse, Messungen, Sitzungen oder einen Verlauf protokollieren | Unfallbericht, Ereignisprotokoll, Fahrtenbuchauszug, Sitzungsprotokoll |
| `ticket_or_entitlement` | zeitlich oder sachlich begrenzte Nutzung, Teilnahme, Reise oder Zutritt belegen | Ticket, Boardingpass, Parkberechtigung, Vignette |

Diese Grundarten sind absichtlich semantisch und laenderneutral. R0.6 muss
noch pruefen, ob etwa `registry_extract`, `delivery_or_handover` oder
`ticket_or_entitlement` eine eigene Grundart oder nur eine stabile Variante
benoetigen. Eine erste Implementierung darf diese Tabelle nicht ungeprueft als
Enum uebernehmen.

`proof`, `evidence`, `attachment` und `supporting_document` sind bewusst keine
Grundarten. Sie beschreiben die Rolle eines Dokuments in einem konkreten Case
oder Claim. Ein Foto traegt Quelle/Format `image` und beispielsweise die Rolle
`evidence`; eine Zeugenangabe ist `declaration_or_consent`; ein
Eigentumsnachweis ist je Inhalt `credential_or_certificate`,
`contract_or_policy` oder eine andere semantische Grundart.

### Zulassungstest fuer semantische Varianten

Ein Begriff wird nur dann globale `semanticVariant`, wenn er:

1. ueber mehrere Laender und Provider hinweg dieselbe fachliche Bedeutung hat;
2. ein sichtbar anderes Dokument fuer normale Nutzer bezeichnet;
3. ein anderes Extraktionsschema oder wesentliches Matching-Signal braucht;
4. nicht bereits aus Domain, Rolle, Record-Art, Party, Facts oder Pack ableitbar ist;
5. ohne landesspezifische Rechtsbehauptung stabil versioniert werden kann.

Beispiele fuer plausible Varianten sind `credit_note`, `discharge_summary`,
`laboratory_report`, `imaging_report`, `appeal_submission` oder
`payment_reminder`. Dagegen sind `medical_invoice`, `recurring_invoice`,
`OeGK_invoice`, `Austrian_invoice_2026` und `paid_invoice` Kombinationen aus
Domain, Wiederholungsfakt, Provider, Pack und Status, keine Subtypen.

### Review der gesamten Begriffskluster

| Fachliches Cluster | Primaere Normalisierung | Was aus der Subtyp-Achse entfernt wird |
|---|---|---|
| Identitaet und Personenstand | meist `credential_or_certificate` oder `registry_extract` plus spezifischer langlebiger Record-Kind | Land, ausstellende Behoerde, Gueltigkeit und Status |
| Vertraege und Policen | `contract_or_policy`, `offer_or_quote`, `application_or_filing`, `acknowledgement` oder `declaration_or_consent`; Vertrag/Polizze selbst wird Record | Vertragsdomain, Anbieter, Tarif, Kuendigungsstatus |
| Rechnung und Zahlung | finanzielle Grundarten; Teil-/Schluss-/Korrekturbezug als Variante/Facts, periodisch als Recurrence Fact | Medizin/Steuer/Vertrag, Payer, bezahlt/offen, Monat/Jahr |
| Medizin und Pflege | allgemeine Grundarten plus wenige global sinnvolle Medical-Varianten wie Referral, Prescription, Finding/Report, Discharge Summary und Care Plan | Arzt/Klinik, Diagnose, SV, Land, Workflowstep |
| Versicherung, Unfall und Schaden | Policy als Record; Meldung/Claim als `application_or_filing`; Bericht/Evidenz/Entscheidung/Zahlung ueber Grundarten und Case-Rollen | Versicherungssparte, Schadennummer, Provider und Claim-Status |
| Kauf, Lieferung, Rueckgabe und Service | Transaction-Dokumente ueber Angebot, Bestellung, Uebergabe, Rechnung, Report, Evidenz und Bestaetigung | Produktkategorie, Shop, Warranty-/Return-Workflowstate |
| Wohnen, Immobilien, Energie und Assets | dieselben Grundarten plus Property/Utility Domain und Asset-/Contract-Record | Adresse, Zaehler, Gemeinde, Asset-Typ und Rechtsraum |
| Behoerde, Recht und Verfahren | `application_or_filing`, `notice_or_request`, `acknowledgement`, `decision_or_order`, `correspondence`, `record_or_log` | konkrete Behoerde, Rechtsmittelname, Verfahrensstand und nationale Formnummer |
| Steuer, Unternehmen und Arbeit | Submission/Decision/Financial Statement/Certificate/Report plus Tax-, Business- oder Employment-Domain | Steuerregime, Periode, Arbeitgeber, Rechtsraum und behauptete Absetzbarkeit |
| Bildung, Familie und Betreuung | Submission/Decision/Credential/Contract/Financial Evidence plus Education/Family/Care Domain | Bundesland, Institution, Leistungsname und Subject-Beziehung |
| Mobilitaet und Reise | Credential/Record fuer Fahrzeug und Visa, Transaction-/Ticket-/Incident-Dokumente fuer Reise und Service | Zielland, Verkehrstraeger, Anbieter und Claim-Regel |
| Datenschutz und Sicherheit | Request/Complaint als Submission, Antwort als Correspondence/Decision, Incident-Evidenz ueber Report/Proof/Acknowledgement | DSGVO-Artikel, nationale Aufsicht, Incident-/Recovery-Status |

Damit sind die nachfolgend dokumentierten Begriffsgruppen eingeordnet.
Die Einzelbegriffe bleiben als Alias-, Training-, OCR- und Matching-Vokabular
erhalten. Erst der R0.6-Katalogreview entscheidet, welche davon wirklich eine
globale semantische Variante, eine laenderspezifische Alias-ID, eine Record-Art
oder nur einen extrahierten Fact benoetigen.

## Fachsprachliches Alias- und Matching-Vokabular

Die folgenden Begriffe sind **keine Liste geplanter Subtypen**. Sie bilden den
langen sprachlichen und fachlichen Rand ab, gegen den die obige Normalisierung,
Assist-Matching und spaetere synthetische Fixtures geprueft werden.

### Identitaet und Personenstand

- Reisepass, Personalausweis, Fuehrerschein, Aufenthaltstitel,
  Staatsbuergerschaftsnachweis, Geburtsurkunde, Heiratsurkunde,
  Partnerschaftsurkunde, Scheidungsurkunde/-beschluss, Sterbeurkunde,
  Adoptionsnachweis, Obsorge-/Vormundschaftsnachweis, Namensaenderungsnachweis,
  Meldebestaetigung, Strafregisterbescheinigung, Behindertenpass,
  e-card-/Versicherungsnachweis und amtlicher Lichtbildausweis.

### Vertraege, Policen und rechtsgeschaeftliche Grundlagen

- Vertragsangebot, Kostenvoranschlag, Auftrag, Bestellbestaetigung,
  Kaufvertrag, Mietvertrag, Pachtvertrag, Dienstleistungsvertrag,
  Werkvertrag, Arbeitsvertrag, Versicherungsantrag, Versicherungspolizze,
  Kreditvertrag, Darlehensvertrag, Leasingvertrag, Abo-/Mitgliedschaftsvertrag,
  Betreuungsvertrag, Schul-/Ausbildungsvertrag, Reisevertrag,
  Vollmacht, Einwilligungserklaerung, Abtretungserklaerung,
  Datenschutzerklaerung/Informationsblatt, AGB-Version, Vertragsnachtrag,
  Vertragsaenderungsbestaetigung, Kuendigung und Kuendigungsbestaetigung.

### Rechnung, Zahlung und finanzielle Evidenz

- Rechnung, Teilrechnung, Abschlagsrechnung, Sammelrechnung, Schlussrechnung,
  wiederkehrende Rechnung, Korrekturrechnung, Honorarnote, Gebuehrenvorschreibung,
  Praemienvorschreibung, Betriebskostenabrechnung, Jahresabrechnung,
  Endabrechnung, Gutschrift, Rabatt-/Bonusabrechnung, Kassenbeleg,
  Zahlungsbestaetigung, Ueberweisungsbestaetigung, Lastschriftmandat,
  Kontoauszug, Kreditkartenabrechnung, Zahlungsaufforderung, Mahnung,
  Inkassoschreiben, Ratenplan, Saldenbestaetigung, Zinsbescheinigung,
  Depotauszug/Steuerreporting und Erstattungsbestaetigung.

### Medizin, Gesundheit und Pflege

- aerztliche Ueberweisung/Zuweisung, Einweisung, Verordnung, Rezept,
  Behandlungsschein, aerztlicher Befund, Laborbefund, Radiologiebefund,
  Pathologiebefund, Bilddiagnostik, Arztbrief, ambulanter Kurzbericht,
  aerztlicher Entlassungsbrief, pflegerischer Entlassungsbrief,
  Operationsbericht, Anamnese-/Untersuchungsbogen, Therapieplan,
  Medikationsplan, Rehabilitationsplan, Pflegeplan, Impfpass/Impfnachweis,
  Vorsorge-/Untersuchungsnachweis, Krankenstandsbestaetigung,
  Arbeitsfaehigkeits-/Gesundheitszeugnis, Aufenthaltsbestaetigung,
  Terminbestaetigung, medizinische Einwilligung/Aufklaerung,
  Heilbehelfs-/Hilfsmittelverordnung, medizinischer Kostenvoranschlag,
  medizinische Leistungsabrechnung, Kostenuebernahmeantrag,
  Bewilligung/Ablehnung einer Gesundheitsleistung und Erstattungsabrechnung.

### Versicherung, Unfall und Schaden

- Polizzenblatt, Deckungsuebersicht, Versicherungsbestaetigung,
  Praemieninformation, Schadenmeldung, Unfallbericht, Europaeischer
  Unfallbericht, Polizeibericht/-bestaetigung, Ereignisprotokoll,
  Fotodokumentation, Zeugenangabe, Sachverstaendigengutachten,
  Schadenschaetzung, Reparaturfreigabe, Deckungszusage, Deckungsablehnung,
  Leistungsantrag, Claim-Eingangsbestaetigung, Versicherungsrueckfrage,
  Regulierungsangebot, Abfindungserklaerung, Leistungsabrechnung,
  Erstattungsbescheid und Schadenabschlussbestaetigung.

### Kauf, Lieferung, Rueckgabe, Garantie und Service

- Produktangebot, Bestelluebersicht, Auftragsbestaetigung, Versandbestaetigung,
  Lieferschein, Zustellnachweis, Uebergabeprotokoll, Abnahmeprotokoll,
  Seriennummern-/Eigentumsnachweis, Garantiekarte, Garantieerklaerung,
  Maengelanzeige, Reklamation, Ruecksendeetikett, Ruecksendenachweis,
  Ruecknahmebestaetigung, Austauschbestaetigung, Reparaturauftrag,
  Serviceauftrag, Servicebericht, Wartungsbericht, Pruefprotokoll,
  Ersatzteilnachweis und Rueckerstattungsbestaetigung.

### Wohnen, Immobilie, Energie und Assets

- Mietanbot, Wohnungsbewerbung, Kautionsnachweis, Einzugsprotokoll,
  Auszugsprotokoll, Inventarliste, Maengelprotokoll, Mietvorschreibung,
  Betriebskostenbelege, Heizkostenabrechnung, Zaehlerstandsnachweis,
  Energieabrechnung, Netzzugangs-/Anschlussbestaetigung, Anbieterwechsel-
  bestaetigung, Energieausweis, Grundbuchauszug, Kaufanbot Immobilie,
  Immobilienkaufvertrag, Treuhandbestaetigung, Bauplan, Baubewilligung,
  Fertigstellungsanzeige, Benutzungsbewilligung, Hausverwaltungsabrechnung,
  Eigentuemerversammlungsprotokoll, Grundsteuer-/Gemeindeabgabenbescheid,
  Reparatur-/Sanierungsnachweis und Asset-Uebergabeprotokoll.

### Behoerde, Recht und Verfahren

- Antrag, Formularerklaerung, Einreichbestaetigung, Empfangsbestaetigung,
  Aktenzeichenmitteilung, Verfahrensinformation, Ergaenzungsersuchen,
  Nachforderung von Unterlagen, Ladung, Terminverstaendigung,
  Fristsetzung, Fristverlaengerungsantrag, Behoerdenmitteilung, Bescheid,
  Bewilligung, Genehmigung, Ablehnung, Auflage, Strafverfuegung,
  Organstrafverfuegung, Zahlungsauftrag, Beschwerde, Berufung/Einspruch,
  Stellungnahme, Gegenstellungnahme, Verhandlungsprotokoll,
  Zustellnachweis, Rechtskraftbestaetigung, Vergleich, Gerichtsbeschluss,
  Urteil, Exekutions-/Vollstreckungsdokument, Rechtsanwaltsschreiben,
  Notariatsakt und Verfahrensabschlussbestaetigung.

### Steuer, Unternehmen und Arbeit

- Arbeitnehmerveranlagungsunterlage, Einkommensteuererklaerungsunterlage,
  Umsatzsteuervoranmeldung, Umsatzsteuerjahreserklaerung,
  Koerperschaftsteuererklaerung, Feststellungserklaerung,
  Zusammenfassende Meldung, Lohnzettel, Gehaltsabrechnung,
  Jahreslohnkonto/-aufstellung, Arbeitgeberbestaetigung,
  Dienstgebermeldung, Arbeitszeitnachweis, Urlaubs-/Abwesenheitsnachweis,
  Reisekostenabrechnung, Spesenabrechnung, Fahrtenbuchauszug,
  Spendenbestaetigung, Kirchenbeitragsnachweis, Fortbildungsnachweis,
  Betriebsausgabenbeleg, Einnahmennachweis, Steuerbescheid,
  Vorauszahlungsbescheid, Buchungsmitteilung/Abgabenkontoauszug,
  Pruefungsauftrag, Pruefbericht, Gewerbeanmeldung, Firmenbuchauszug,
  UID-/Steuernummernbestaetigung und Jahresabschluss/Bilanz.

### Bildung, Familie und Betreuung

- Einschreibebestaetigung, Aufnahmeentscheidung, Schulbesuchsbestaetigung,
  Studienbestaetigung, Inskriptionsbestaetigung, Zeugnis, Semesterzeugnis,
  Abschlusszeugnis, Diplom, Zertifikat, Transcript/Leistungsnachweis,
  Pruefungsanmeldung, Pruefungsergebnis, Kursbestaetigung,
  Studien-/Schulgebuehrenvorschreibung, Stipendien-/Beihilfenantrag,
  Beihilfenentscheidung, Kindergarten-/Betreuungsplatzzusage,
  Betreuungsbestaetigung, Familienbeihilfenunterlage,
  Kinderbetreuungsgeldunterlage, Unterhaltsvereinbarung,
  Unterhaltszahlungsnachweis und Pflegegeld-/Betreuungsentscheidung.

### Mobilitaet und Reise

- Zulassungsschein, Typenschein/CoC, Fahrzeugkaufnachweis,
  Begutachtungsplaketten-/Pruefbericht, Serviceheft/-nachweis,
  Maut-/Vignettennachweis, Parkberechtigung, Strafzettel,
  Bahn-/Bus-/Flugticket, Buchungsbestaetigung, Boardingpass,
  Hotel-/Unterkunftsbestaetigung, Reiseplan, Visa-/Einreisegenehmigung,
  Verspaetungs-/Annullierungsbestaetigung, Ersatzbefoerderungsnachweis,
  Gepaeckverlust-/Beschaedigungsbericht, Mietwagenvertrag,
  Rueckgabeprotokoll Mietwagen und Fahrgast-Claim-Entscheidung.

### Datenschutz, Sicherheit, allgemeine Korrespondenz und Evidenz

- Datenschutz-Auskunftsantrag, Berichtigungsantrag, Loeschungsantrag,
  Einschraenkungs-/Widerspruchsantrag, Datenexport, Antwort auf Betroffenenrecht,
  Datenschutzverletzungsmitteilung, Datenschutzbeschwerde,
  Betrugsanzeige, Identitaetsmissbrauchsmeldung, Karten-/Kontosperrbestaetigung,
  Sicherheitswarnung, Wiederherstellungsbestaetigung, allgemeines Anschreiben,
  Erinnerung, Bestaetigung, Sachverhaltsdarstellung, Erklaerung,
  Protokoll, Gutachten, Checkliste und Evidenzpaket/Anlagenverzeichnis.

## Nicht als Subtyp modellieren

- PDF, JPEG, Papier, Scan, E-Mail, Portaldownload und Screenshot sind
  Quelle/Format, keine fachlichen Subtypen;
- OeGK, Gemeinde, Bank, Arzt oder Anbieter sind ExternalParty/Provider;
- `submission`, `response`, `decision`, `payment_proof`, `supporting_evidence`
  sind Linkrollen/Workflow-Slots;
- Medizin, Steuer, Wohnen und Arbeit sind Domains;
- offen, bezahlt, eingereicht, abgelehnt und erledigt sind Status/Events;
- Oesterreich 2026 ist eine Jurisdiction-/Pack-Version, kein Subtyp.

Die gleichlautende Rolle `submission` bezeichnet ausschliesslich, **wie** ein
Dokument mit einem Case/Claim verbunden ist. Sie ist weder das optionale
Workflow-Muster `submission` noch die Dokumentgrundart
`application_or_filing`.

## Externe Struktur-Evidenz

Die Normalisierung uebernimmt keine fremde Fachontologie, ist aber mit
etablierten internationalen Mustern vereinbar:

- Die EU Single Digital Gateway Regulation gruppiert grenzueberschreitende
  Verfahren nach Lebensereignissen und beschreibt je konkretem Verfahren einen
  erwarteten Output wie Empfangsbestaetigung, Entscheidung, Registrierung oder
  Nachweis. Das stuetzt Fachvorlagen auf gemeinsamen Prozessmustern statt einer
  Kernklasse pro nationalem Formular:
  <https://eur-lex.europa.eu/eli/reg/2018/1724/2024-06-29/eng>.
- Das britische, aus mehreren Verwaltungsservices abgeleitete Apply Pattern
  trennt Vorbereitung, Einreichung, unterstuetzende Evidenz und Warten auf den
  Ausgang und behandelt Nachreichung, Ruecknahme und Kanalwechsel als
  Varianten:
  <https://design-patterns.service.justice.gov.uk/service-patterns/apply/>.
- HL7 FHIR trennt im Gesundheitsbereich Definitionen, Requests und Events sowie
  Encounter, Episode of Care, Claim und Dokumentreferenz. Konkrete Antworten
  und Verknuepfungen werden durch Code, Workflowdefinition und lokale
  Konvention bestimmt:
  <https://hl7.org/fhir/R5/workflow.html>.
- FHIR Claim verwendet dieselbe Claim-Struktur fuer Erstattung,
  Vorabgenehmigung und Vorabpruefung und laesst Jurisdiktionen die konkreten
  Claim-Typen erweitern. Das stuetzt einen gemeinsamen Submission-/Claim-Kern
  mit Country-/Payer-Varianten:
  <https://hl7.org/fhir/claim.html>.
- OASIS Universal Business Language standardisiert wiederverwendbare
  Geschaeftsdokumente wie Order, Invoice und Credit Note, statt jede
  Branchen-/Laenderkombination zu einer eigenen Dokumentgrundart zu machen:
  <https://docs.oasis-open.org/ubl/os-UBL-2.3/UBL-2.3.pdf>.

## Reviewfragen fuer R0.6

- Sind die acht optionalen internen Workflow-Muster die richtige minimale
  Prozessgrammatik oder koennen/muessen einzelne noch kombiniert oder getrennt
  werden?
- Welche sichtbaren Fachvorlagen brauchen eine stabile globale ID, obwohl sie
  kein Case-Typ sind?
- Welche Begriffe sind nur oesterreichische Aliase?
- Welche Eintraege sind Record-Arten statt semantische Dokumentvarianten?
- Welche Eintraege sind Rollen/Slots statt Subtypen?
- Wo braucht ein Dokument mehrere Domains oder mehrere Case-Links?
- Welche der vorgeschlagenen Dokumentgrundarten und semantischen Varianten sind
  fuer Extraktion, Matching und User-Verstaendnis wirklich unterscheidbar?
- Welche sichtbaren Begriffe versteht ein normaler Haushalt ohne Fachwissen?

## Stop Rules

Stop if:

- dieses Inventar ungeprueft als Enum-/Datenbankschema implementiert wird;
- sichtbare Fachvorlagen oder Workflow-Muster als unterschiedliche
  Case-Entitaeten oder sichtbarer Pflicht-Typ-Picker implementiert werden;
- jede Kombination einen neuen Subtyp oder Case-Key erzeugt;
- Domain, Rolle, Provider, Format oder Status in einem Subtyp versteckt werden;
- Record-led Kontexte als Cases dupliziert werden;
- Laenderbegriffe als globale kanonische IDs dienen;
- fehlende Katalogabdeckung verhindert, dass ein Custom Case oder neutraler
  Dokumenttyp den Inhalt sicher aufnehmen kann.
