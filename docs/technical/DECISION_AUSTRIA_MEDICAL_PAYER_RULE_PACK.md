---
title: "Entscheidung - Oesterreichisches Regelpaket fuer medizinische Payer"
description: "Datiertes Austria-first-Basismodell fuer Sozialversicherung, Krankenfuersorge, Zusatzversicherung, Einreichungen und medizinische Erstattungsfristen"
tags: [decision, product, austria, medical, payers, insurance, deadlines, country-pack, provider-pack]
lastUpdated: "2026-07-23"
status: "accepted-researched-baseline-professional-review-required"
owner: "product-concept/domain/compliance"
sourceCheckedAt: "2026-07-23"
nextRequiredReview: "2027-01-23"
---

# Entscheidung - Oesterreichisches Regelpaket fuer medizinische Payer

## Status und Grenze

Dieses Dokument besitzt den am **23. Juli 2026** anhand offizieller
beziehungsweise provider-eigener Quellen geprueften Austria-first-Basisscope
fuer medizinische Payer. Die Produktstruktur ist akzeptiert. Das Dokument ist
keine Rechtsberatung und noch kein freigegebenes produktives Pack.

Vor Aktivierung sind ein benannter fachlicher Owner, professionelle
medizinisch-versicherungsrechtliche Pruefung, synthetische Fixtures, der
WF-01-/WF-02-Gate und der Betriebsvertrag aus
`docs/ops/OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md` erforderlich.

Die allgemeine Frist-/Remindersemantik steht in
`DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`. Die medizinische Case-
Komposition steht in `DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`.

## Pack-Schnitt

Das medizinische Austria-Pack besteht konzeptionell aus:

```text
at.health.core
  oesterreichische Terminologie und Payer-Kategorien

at.health.payer.public
  gepruefte Regeln fuer gesetzliche Krankenversicherungstraeger

at.health.payer.kfa.<provider>
  einzeln gepruefte Krankenfuersorgeanstalten

at.health.payer.private.<provider>.<tariff-version>
  nur bei exakt geprueftem Provider-/Tarifscope
```

Payer sind Registry-Eintraege und External Parties, keine globale geschlossene
Flutter-/Domain-Enum. Ein nutzerdefinierter Provider bleibt moeglich.

## Oesterreichische Payer-Landschaft

### Gesetzliche Krankenversicherungstraeger

Der gepruefte Basisscope kennt:

| Provider | Produktrolle | Stand |
|---|---|---|
| OeGK | gesetzlicher Krankenversicherungstraeger | Registry + gepruefte Wahlarzt-Frist |
| SVS | gesetzlicher Krankenversicherungstraeger | Registry + gepruefte Wahlarzt-Frist |
| BVAEB | gesetzlicher Krankenversicherungstraeger | Registry + gepruefte Wahlarzt-Frist |

### Krankenfuersorgeanstalten

Der Dachverband fuehrt im am 8. Juli 2026 ausgewiesenen ABS-Handbuch folgende
technischen KV-Traeger/Krankenfuersorgeanstalten:

| Registry-Arbeitsname | Offizielle Bezeichnung laut Quelle |
|---|---|
| KFA Wien | Krankenfuersorgeanstalt der Bediensteten der Stadt Wien |
| MKF Linz | Krankenfuersorge fuer die Beamten der Landeshauptstadt Linz |
| KFG Oberoesterreich | Krankenfuersorge fuer oberoesterreichische Gemeindebeamte |
| KFL Oberoesterreich | Kranken- und Unfallfuersorge fuer oberoesterreichische Landesbeamte |
| LKUF Oberoesterreich | Oberoesterreichische Lehrer-Kranken- und Unfallfuersorge |
| KFA Steyr | Krankenfuersorgeanstalt fuer Beamte des Magistrates Steyr |
| KFA Wels | Krankenfuersorge fuer die Beamten der Stadt Wels |
| KFA Graz | Krankenfuersorgeanstalt fuer die Beamten der Landeshauptstadt Graz |
| KFA Villach | Krankenfuersorgeanstalt fuer die Beamten der Stadt Villach |
| KFA Salzburg | Krankenfuersorgeanstalt der Magistratsbeamten der Landeshauptstadt Salzburg |
| KUF Tirol Gemeinden | Kranken- und Unfallfuersorge der Tiroler Gemeindebeamten |
| KUF Tirol Land | Kranken- und Unfallfuersorge der Tiroler Landesbeamten |
| KUF Tirol Landeslehrer | Kranken- und Unfallfuersorge der Tiroler Landeslehrer |

Diese Liste ist eine Provider-Registry-Baseline, keine Aussage ueber
Einreichungsfrist, Einreichkanal, Anspruch oder aktuelle Teilnahme am
e-card-System. Jede KFA benoetigt vor einer aktiven Regel ein eigenes
Provider-Review.

### Private Zusatzversicherungen

Private Kranken-/Zusatzversicherer werden ueber eine erweiterbare
Provider-Registry und optionalen Custom Provider abgebildet. Providername
allein reicht nicht fuer eine Fristregel. Soweit eine private Regel
tarifabhaengig ist, muss das Overlay Provider, Tarif/Bedingung, Version,
Gueltigkeitszeitraum und Quelle exakt benennen.

### AUVA

Die AUVA ist fuer Arbeitsunfall-/Unfallversicherungskontexte relevant, aber
kein allgemeiner Default-Payer fuer die normale medizinische
Wahlarzt-Kostenerstattung. Sie darf nur aus passendem bestaetigtem
Unfallkontext vorgeschlagen werden.

## Gepruefte oeffentliche Einreichungsfristen

Am 23. Juli 2026 sind nur folgende 42-Monats-Regeln fuer das Austria-Pack
fachlich zur Aktivierung vorgesehen:

| Rule-Arbeits-ID | Payer | Regel | Startanker | Primaerquelle |
|---|---|---|---|---|
| `at.health.oegk.wahlarzt.submit.42m` | OeGK | Einreichung innerhalb von 42 Monaten | Leistungsdatum | [OeGK - Wahlaerztinnen und Wahlaerzte](https://www.oegk.at/cdscontent/?contentid=10007.870516) |
| `at.health.svs.wahlarzt.submit.42m` | SVS | Anspruch verfaellt nach 42 Monaten | Inanspruchnahme der Leistung | [SVS - Arztwahl](https://www.svs.at/cdscontent/?contentid=10007.816748&switchContrastMode=true) |
| `at.health.bvaeb.wahlarzt.submit.42m` | BVAEB | Erstattung nur bei Einreichung innerhalb von 42 Monaten | Inanspruchnahme der Leistung | [BVAEB - Kostenerstattung](https://www.bvaeb.at/cdscontent/?contentid=10007.840464&portal=bvaebbportal&viewmode=content) |

Regeln:

- Ohne bestaetigten Payer und belastbaren Startanker wird kein exaktes
  Fristdatum berechnet.
- OeGK, SVS und BVAEB bleiben getrennte Providerregeln, auch wenn der aktuelle
  Zeitraum gleich ist.
- Fuer keine KFA wird die 42-Monats-Regel pauschal geerbt.
- Eine spaetere Aenderung einer Regel veraendert laufende oder historische
  Fristen nicht still.
- Die Regelversion wird mit jeder erzeugten Fristinstanz gepinnt.

## Mehrfachversicherung

Ein Managed Subject darf mehrere gleichzeitige oder historische
Sozialversicherungs-/Krankenfuersorgebeziehungen besitzen. Die geprueften
Quellen zeigen fuer den normalen Wahlarztpfad:

- Bei Mehrfachversicherung wird eine Wahlarztrechnung nur bei **einem**
  Krankenversicherungstraeger beziehungsweise einer Krankenfuersorgeanstalt
  zur Kostenerstattung eingereicht.
- Die Nutzerin waehlt beziehungsweise bestaetigt den Payer.
- Ein gesetzter Default sortiert nur; er sendet nichts, aktiviert keine Frist
  und behauptet keine Zustaendigkeit.

Mappm berechnet weder, bei welchem Traeger eine Einreichung vorteilhafter waere,
noch die zu erwartende Erstattung.

## Private Fristen und Polizzen

§ 12 VersVG nennt fuer Ansprueche aus dem Versicherungsvertrag grundsaetzlich
drei Jahre und eine Hemmung nach Anmeldung bis zur schriftlichen Entscheidung.
Der konkrete Beginn, individuelle Vertragsbedingungen und Providerpraxis
muessen fuer den jeweiligen Fall geprueft werden. Deshalb wird daraus **keine
pauschale private Einreichungsfrist allein anhand des Versicherernamens**.

Providerquellen belegen unterschiedliche sichtbare Regeln:

- UNIQA weist auf Verjaehrung nach drei Jahren hin und beschreibt im
  Normalpfad zuerst die Sozialversicherung, danach SV-Antwort plus
  Rechnungskopie an UNIQA.
- Wiener Staedtische nennt fuer ihren geprueften App-/Vertragskontext das
  aktuelle Kalenderjahr plus maximal zwei Vorjahre und verlangt in der App
  jede Rechnung einzeln.
- Allianz beschreibt im geprueften Wahlarztpfad zuerst die gesetzliche
  Krankenversicherung und danach Abrechnung plus Rechnung/Honorarnote.

Eine private Frist darf daher nur entstehen aus:

1. einem professionell geprueften, exakt passenden Provider-/Tarifoverlay;
2. einem reviewten Vorschlag aus Polizze/Versicherungsbedingungen mit
   Dokument- und Seitenprovenienz;
3. einer manuellen, bestaetigten Nutzerangabe.

Bei mehreren Zusatzversicherungen fuehrt jede Versicherung ihre eigene Frist.
Die frueheste bestaetigte offene Frist darf als naechste kritische Frist
erscheinen; alle anderen bleiben erhalten.

## Policy Record, Vertragskontext und Defaults

Ein Managed Subject kann mehrere Sozialversicherungs-,
Krankenfuersorge- und private Versicherungsbeziehungen besitzen. Fuer private
Versicherung gilt:

- Die langlebige Beziehung ist ein `Policy Record`.
- Der Abschluss kann als eigener Abschluss-Case beginnen und danach in einem
  ruhigen Vertrags-/Versicherungskontext weitergefuehrt werden.
- Polizze und Nachtraege sind optionale Record-Versionsevidenz.
- Ein importierter Altvertrag darf als minimaler Policy Record plus
  Vertragskontext angelegt werden, ohne einen historischen Abschluss-Case zu
  erfinden.
- Normaler medizinischer Kostenersatz erzeugt keinen allgemeinen
  `insurance_settlement`-Case; er bleibt Payer-Ablauf im
  `medical_cost_settlement`.

Ein minimaler Policy Record darf ohne Polizzendokument mindestens Provider,
Polizzennummer/Referenz, Managed Subject, Kategorie, bestaetigten Status und
optionale Gueltigkeit enthalten.

Pro Managed Subject darf eine ausdrueckliche Praeferenz bestehen fuer:

- Sozialversicherung beziehungsweise Krankenfuersorge;
- ambulante Zusatzversicherung;
- stationaere Zusatzversicherung.

Die Praeferenz ist keine Deckungs-, Tarif- oder Anspruchspruefung.

## Rechnung, Cost Case und Einreichung

Die Austria-Regeln aendern die globale Medical-Komposition nicht:

- Eine eigenstaendig ausgestellte Arztrechnung/Honorarnote fuehrt genau einen
  `medical_cost_settlement`-Case.
- Korrekturrechnung, Gutschrift, Zahlungsnachweis, Einreichung, Antwort,
  Nachreichung und Erstattung bleiben bei diesem Kosten-Case.
- Eine weitere eigenstaendige Rechnung erzeugt einen weiteren Kosten-Case.
- Kein Dokument ist fuer Case-Gueltigkeit verpflichtend.
- Eine Einreichung ist ein Event mit null, einem oder mehreren
  Dokumentverweisen; der Domain-Contract darf nicht hart auf eine Datei
  begrenzt werden.
- Providerkanaele duerfen provider-spezifisch eine Rechnung je externer
  Einreichung verlangen. Das aendert weder Case-Grenze noch globales
  Einreichungsmodell.
- Ein Kosten-Case darf mehrere Einreichungs- und Nachreichungsereignisse je
  bestaetigtem Payer besitzen.

Von Quellen genannte Unterlagen sind **kontextuelle Erwartungen**, keine
Mappm-Vollstaendigkeitsbedingungen. Rechnung, Zahlungsnachweis, SV-Abrechnung
oder Verordnung duerfen vorgeschlagen werden; ihr Fehlen macht den Case nicht
ungueltig und beweist keinen fehlenden Anspruch.

## Finanzielle Grenzen

Das Pack darf bestaetigte Rechnung, Zahlung und Erstattung als
provenienztragende Finanz-Facts klassifizieren. Es darf nicht:

- Deckung, Erstattungsquote oder erwartete Auszahlung berechnen;
- aus einer Polizze eine Versicherungsleistung simulieren;
- einen erwarteten Eigenanteil als bestaetigten Betrag darstellen;
- formale Buchhaltung oder Steuerwirkung behaupten.

Die Haushalts-/Zahlungsuebersicht folgt
`DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md`.

## Quellenstand

Alle folgenden Quellen wurden am **23. Juli 2026** geprueft:

- [OeGK - Wahlaerztinnen und Wahlaerzte](https://www.oegk.at/cdscontent/?contentid=10007.870516)
- [SVS - Arztwahl](https://www.svs.at/cdscontent/?contentid=10007.816748&switchContrastMode=true)
- [BVAEB - Kostenerstattung](https://www.bvaeb.at/cdscontent/?contentid=10007.840464&portal=bvaebbportal&viewmode=content)
- [RIS - Versicherungsvertragsgesetz § 12](https://www.ris.bka.gv.at/eli/bgbl/1959/2/P12/NOR40138454)
- [Dachverband - ABS-Handbuch, Stand 08.07.2026](https://www.sozialversicherung.at/cdscontent/load?contentid=10008.808500&version=1783320121)
- [Gesundheitsportal - Sozialversicherungstraeger](https://www.gesundheit.gv.at/service/gesundheitssuche/sozialversicherungstraeger/)
- [oesterreich.gv.at - Versicherungstraeger im Detail](https://www.oesterreich.gv.at/de/themen/menschen_mit_behinderungen/rehabilitation/1/Seite.1170120)
- [UNIQA - Arzt- und Medikamentenrechnungen einreichen](https://www.uniqa.at/versicherung/gesundheit/wie-rechnungen-einreichen)
- [Wiener Staedtische - FAQ losleben](https://www.wienerstaedtische.at/service/faq-zu-services/faq-losleben.html)
- [Allianz - Privatarzt-Versicherung und Rechnungseinreichung](https://www.allianz.at/de_AT/privatkunden/vorsorge-gesundheit/krankenversicherung/privatarzt-versicherung.html)

Naechster fachlicher Pflichtreview: **spaetestens 23. Januar 2027** sowie sofort
bei erkannter Quellenaenderung und zwingend vor jeder Pack-Veroeffentlichung.

## Verifikation

Synthetische Pack-Fixtures decken mindestens ab:

- OeGK, SVS und BVAEB mit bestaetigtem und fehlendem Startanker;
- jede KFA als Registry-Eintrag ohne geerbte 42-Monats-Regel;
- mehrere gesetzliche Beziehungen und Auswahl genau eines Payers pro Rechnung;
- mehrere private Versicherungen mit getrennten Fristen;
- privater Providername ohne Tarifregel erzeugt keine Frist;
- Policy Record mit und ohne Dokument;
- Default-Payer sortiert nur;
- eine Rechnung pro Medical Cost Case;
- mehrere Dokumente und mehrere Events in einer Einreichungsabwicklung;
- provider-spezifisch eine Rechnung je externer App-Einreichung ohne
  Domainverengung;
- bestaetigte Zahlung und Erstattung ohne erwartete Deckungsberechnung;
- Pack-Update ohne stille Aenderung bestehender Cases/Fristen.

## Stop Rules

Stop, wenn:

- Payer als geschlossene globale Enum hardcodiert werden;
- die 42-Monats-Regel ungeprueft auf KFA oder private Versicherungen
  uebertragen wird;
- Providername oder Default eine private Frist, Deckung oder Einreichung
  aktiviert;
- mehrere gesetzliche Traeger fuer dieselbe Wahlarztrechnung automatisch
  eingereicht werden;
- aus einer privaten allgemeinen Dreijahresregel ohne exakten Scope eine
  scheinbar sichere individuelle Frist berechnet wird;
- Provider-App-Grenzen das globale Case-/Submission-Modell verengen;
- erwartete Unterlagen zu Case-Pflichten werden;
- AUVA als normaler Wahlarzt-Default-Payer erscheint;
- ein Policy Record ohne Abschluss-Case nicht importierbar ist;
- Mappm Erstattungs-, Deckungs- oder Eigenanteilsprognosen berechnet;
- das Pack ohne benannten Owner, aktuelle Quellen, professionelle Freigabe,
  Fixtures oder OPS-09-Betrieb aktiviert wird.
