---
title: "Entscheidung - Medizinischer Behandlungsfall und Kostenabrechnung"
description: "Akzeptiertes Mappm-Kernmodell fuer medizinische Behandlungsverlaeufe, schlanke Dokumentklassifikation, evidenzbasierte Kosten-Subvorgaenge, Payer-Claims und medizinische Medienarchive"
tags: [decision, product, medical, healthcare, cases, reimbursement, claims, matching, media-archive]
lastUpdated: "2026-07-20"
status: "accepted-core"
owner: "product-concept"
---

# Entscheidung - Medizinischer Behandlungsfall und Kostenabrechnung

## Status und Scope

Am 20. Juli 2026 wurde das medizinische Kernmodell im User-Workshop
akzeptiert. Diese Decision besitzt die fachlichen Grenzen von:

- `medical_care` als medizinischem Behandlungsfall;
- `medical_cost_settlement` als `part_of`-Kostenabrechnungsvorgang je
  eigenstaendiger wirtschaftlicher Verpflichtung;
- Payer-Einreichungen als Claims innerhalb der Kostenabrechnung.

Die kanonischen IDs, deutschen Titel und Katalogstatus bleiben in
`DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` als alleiniger Katalog-SSOT. Diese
Decision besitzt ihre fachliche Komposition.

Zusaetzlich akzeptiert sind:

- Bewilligungsanfrage, Bewilligung, Ablehnung oder Kostenuebernahme fuer eine
  konkrete Behandlung sind Dokumente, Facts und gegebenenfalls
  Workflow-Schritte im passenden `medical_care`-Case. Sie begruenden allein
  keinen eigenen Case;
- die medizinische Dokumentklassifikation bleibt fuer M1 bewusst schlank;
- ein spaeterer medizinischer Beleg wird dokumentweise gegen bestehende und
  neue Care-Kandidaten gerankt. Bei belegter Kontinuitaet wird derselbe
  Behandlungsfall vorgeschlagen; ein eigenstaendiger verbundener Care-Case
  entsteht nur nach bewusster Nutzerbestaetigung;
- wiederkehrende Kontrollen sind kein eigener Case-Typ. Ein endlicher
  Behandlungsfall darf eine optionale Wiederholungs-/Serienplanung tragen;
- ein Managed Subject darf mehrere Sozialversicherungs-,
  Krankenfuersorge- und Zusatzversicherungsbeziehungen sowie einfache
  bevorzugte Payer je definierter Kategorie besitzen;
- Mappm prueft oder berechnet weder Versicherungsdeckung noch erwartete
  Leistung, Erstattung, Eigenanteil oder Anspruch;
- jeder bestaetigte Case ist unabhaengig von Anzahl und Art seiner Dokumente
  gueltig. Dokumente belegen oder schlagen Zustaende vor, sind aber keine
  Vollstaendigkeitsvoraussetzung;
- innerhalb eines bereits bestehenden und geoeffneten medizinischen
  Care-Vorgangs darf auf Desktop fuer M1 ein ausgewaehltes Speichermedium oder
  ein Ordner als ein unveraendertes ZIP-Medienpaket gesichert und wieder
  exportiert werden.

Damit ist OQ-012 fachlich geschlossen. Weiter offen bleiben der finale
Dokumentkatalog in OQ-011, die fuer Commercial 1.0 aktivierten
oesterreichischen Workflows in WF-01, deren fachliche Betriebsverantwortung in
WF-02 sowie konkrete UI- und technische Contracts.

## Akzeptierte Grundstruktur

```text
Medical Care Case
  medizinische Dokumente und bestaetigte Verlaufsereignisse

  Medical Cost Settlement Case A  part_of -> Medical Care Case
    wirtschaftliche Verpflichtung A
    zugehoerige Dokumente
    Claim je bestaetigtem Payer

  Medical Cost Settlement Case B  part_of -> Medical Care Case
    wirtschaftliche Verpflichtung B
    zugehoerige Dokumente
    Claim je bestaetigtem Payer
```

Ein Subvorgang ist weiterhin keine eigene Entitaet. Jeder
`medical_cost_settlement` ist ein normaler `Case`, dessen UI-Rolle durch
`CaseLink(relationType=part_of)` entsteht.

## Medizinischer Behandlungsfall

Ein `medical_care`-Case begleitet einen fachlich zusammenhaengenden
medizinischen Anlass, Kontrollzweck oder Behandlungsverlauf bis zu einem
verstaendlichen Ergebnis beziehungsweise einer bewussten Uebergabe.

Er kann belegte Abschnitte wie Abklaerung, Behandlung, Krankenhaus,
Therapie, Kontrolle und Nachsorge enthalten. Diese Abschnitte sind keine
eigenen globalen Case-Typen.

Folgendes trennt einen Behandlungsfall nicht automatisch:

- ein anderer Arzt, eine andere Einrichtung oder ein anderer Dokumentabsender;
- ambulante statt stationaere Versorgung;
- Diagnostik, Operation, Therapie oder Kontrolle als neuer Abschnitt;
- eine laengere Dauer;
- ein neues Dokument oder eine neue Rechnung.

Eine neue Care-Case-Grenze ist nur dann angebracht, wenn ein anderer
medizinischer Verlauf fuer die Nutzerin als eigenstaendiger Anlass mit eigenem
Ziel und Ergebnis verstaendlich ist und die Nutzerin diese Trennung
bestaetigt.

### Fortsetzung, Ankerdokument und Folge-Vorgang

Neue medizinische Dokumente werden gegen bestehende offene, abgeschlossene und
archivierte Behandlungsfaelle sowie einen moeglichen neuen verknuepften
Care-Case gerankt. Passt ein Dokument zum bisherigen Verlauf, schlaegt Mappm
die Ergaenzung desselben Care-Case vor. Spricht die Evidenz fuer einen
eigenstaendigen Verlauf, darf der neue verknuepfte Case zuerst gereiht werden.
Krankenhaus, Nachsorge, Kontrolle, Therapie oder Rehabilitation erzeugen allein
keinen neuen Case.

Die Nutzerin darf einen eigenen Care-Case anlegen:

- als bewusste Absicht waehrend Capture/Review, wobei der neue Case mit einem
  vorhandenen Case verknuepft werden kann;
- spaeter aus einem einzelnen bestaetigten Ankerdokument. Backend/Core Assist
  schlaegt Titel, Beziehung, optionalen Workflow und weitere passende
  Dokumentkandidaten vor.

M1 bietet keine freie Mehrfachauswahl **In Subvorgang umwandeln** und verlangt
keine vollstaendige Dokumentgruppe. Jedes Dokument bleibt eigenstaendig und
wird einzeln zugeordnet. Weitere bereits vorhandene Dokumente duerfen nach
Erstellung des neuen Case einzeln vorgeschlagen und bestaetigt werden. Eine
spaetere Sammelbestaetigung mehrerer sichtbarer Vorschlaege ist nur eine
Interaktionsabkuerzung; fachlich bleiben es einzelne `DocumentCaseLink`-
Entscheidungen.

Mappm darf eine solche Trennung vorschlagen, aber in der aktuellen Reifestufe
nicht selbst finalisieren. Die Relation folgt der bestaetigten Bedeutung:

- `follow_up_to`, wenn der neue Verlauf fachlich nach Abschluss oder Uebergabe
  des frueheren Verlaufs fortsetzt;
- `related_to`, wenn nur ein relevanter Zusammenhang bestaetigt ist;
- `caused_by`, wenn die Kausalitaet ausdruecklich bestaetigt ist;
- `part_of` nur fuer einen bewusst gebildeten uebergeordneten Kontext.

Ein Abschnitt, Workflow-Branch oder Reha-Schritt wird dadurch nicht zu einem
besonderen Subcase-Typ. Die bestaetigte Anlage erzeugt einen normalen `Case`;
Korrektur aendert Links, ohne Dokumente zu verschieben, zu kopieren oder zu
loeschen.

### Erster Beleg und neutraler Titel

Das erste bestaetigte medizinische Dokument findet einen bestehenden
Behandlungsfall oder schlaegt einen neuen vor. Eine Diagnose oder ein
gesonderter Befund ist dafuer nicht erforderlich.

Eine Rechnung allein ist ausreichend, um einen neutralen medizinischen
Behandlungsfall zu begruenden. Backend/Core Assist muss einen editierbaren,
belegbaren Titel vorschlagen, etwa:

```text
Behandlung bei Dr. Mayer, Juni 2026
```

Wenn nur Rechnungsmonat oder Ausstellungsdatum belegt sind, darf der Titel
keinen exakten Behandlungstag oder eine Diagnose erfinden. Zeitangaben folgen
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`.

Ein langlebiger medizinischer Nachweis ohne konkreten Behandlungsverlauf darf
stattdessen einen passenden Record als primaeren Kontext verwenden.

### Bewilligungen bleiben im Behandlungsfall

Eine Bewilligung ist kein eigener Case-Typ und fuer M1 keine notwendige
Dokumentgrundart. Unterlagen zu einer konkreten Behandlung bleiben im
zugehoerigen `medical_care`-Case, insbesondere:

- eine Anfrage oder ein Antrag auf Bewilligung;
- angeforderte oder nachgereichte Unterlagen;
- eine Bestaetigung, Bewilligung, Kostenuebernahme oder Ablehnung;
- belegte Gueltigkeit, Auflagen oder erwartete Antwort.

Diese Unterlagen duerfen bestaetigte Facts, einen ruhigen Workflow-Status,
eine Aufgabe, eine Frist oder eine erwartete Antwort aktualisieren. Der Nutzer
muss dafuer keinen eigenen Vorgang verwalten. Ein eigener Case entsteht nur
fuer ein anderes bereits akzeptiertes fachliches Ziel, etwa die
Kostenabrechnung einer eigenstaendigen Rechnung oder eine von der Nutzerin
bestaetigte Hochstufung eigenstaendiger Arbeit.

### Wiederkehrende Kontrollen

Eine konkrete jaehrliche oder periodische Kontrolle bildet einen kleinen,
endlichen Behandlungsfall fuer ihren jeweiligen Durchlauf. Kontrollen innerhalb
eines laufenden Behandlungsverlaufs bleiben dort.

Mappm erzeugt keinen endlosen Behandlungsfall fuer alle zukuenftigen
Kontrollen und keinen eigenen Case-Typ `wiederkehrendes medizinisches
Ereignis`. Stattdessen darf der aktuelle endliche Care-Case eine optionale
Wiederholungs-/Serienplanung tragen, zum Beispiel `jaehrlich`, einen
erwarteten naechsten Zeitraum und eine bestaetigte Erinnerungsregel.

Der naechste tatsaechliche Durchlauf wird erst durch Nutzerabsicht oder neue
Evidenz zu einem neuen endlichen Care-Case. Er kann fuer eine spaetere
Serienansicht denselben bestaetigten Wiederholungskontext tragen und mit dem
vorherigen Durchlauf `related_to` verknuepft werden. `follow_up_to` wird nur
verwendet, wenn wirklich eine fachliche Behandlungsfortsetzung und nicht nur
dieselbe Periodik vorliegt. Die konkrete Persistenz- und UI-Darstellung gehoert
in Data-/Contract- beziehungsweise UI-Implementation-Contracts.

## Kostenabrechnung und Erstattung

Ein `medical_cost_settlement`-Case besitzt das eigenstaendige administrative
und finanzielle Ziel, eine konkrete wirtschaftliche Verpflichtung zu pruefen,
zu bezahlen, gegebenenfalls einzureichen und bis zum nachvollziehbaren
Erstattungs-/Eigenanteilsergebnis abzustimmen.

Die Case-Grenze folgt der **wirtschaftlichen Verpflichtung**, nicht der Anzahl
der Dateien.

Der Case darf aus jedem hinreichenden Anker entstehen: Rechnung,
Zahlungsnachweis, Payer-Antwort, ausdrueckliche Nutzerabsicht oder andere
bestaetigte Evidenz. Kein Dokument und keine Dokumentkombination ist fuer seine
Gueltigkeit verpflichtend. Eine fehlende Rechnung, ein fehlender
Zahlungsnachweis oder eine fehlende Antwort wird hoechstens als unbekannt,
erwartet oder hilfreich behandelt, niemals als ungueltiger Case.

Im selben Kostenabrechnungsvorgang koennen insbesondere bleiben:

- Originalrechnung;
- korrigierte Rechnung;
- Gutschrift oder Storno;
- Zahlungsbeleg;
- Einreichungs- oder Versandbestaetigung;
- Rueckfrage oder Nachreichung;
- Entscheidung und Erstattungsbeleg eines Payers;
- bestaetigter Restbetrag beziehungsweise Eigenanteil.

Eine zweite unabhaengige Rechnung bildet grundsaetzlich einen zweiten
Kostenabrechnungsvorgang, auch wenn beide Rechnungen zum selben medizinischen
Behandlungsfall gehoeren. Eine Rechnung ueber mehrere zusammengehoerende
Leistungen bleibt dagegen eine wirtschaftliche Verpflichtung.

Mehrere Rechnungen duerfen gemeinsam uebermittelt werden, verlieren dadurch
aber nicht ihre getrennten Kostenabrechnungsidentitaeten.

## Beziehung zwischen Behandlung und Kosten

Jeder medizinische Kostenabrechnungsvorgang ist mittels `part_of` Bestandteil
des passenden Behandlungsfalls.

- Care und Kostenabrechnung besitzen eigene Lifecycle-Status.
- Schliessen, Archivieren oder Loeschen kaskadiert nicht.
- Dokumente und Facts koennen in beiden Kontexten sichtbar sein, ohne Datei-
  oder Datenkopie.
- Finanzielle Zusammenfassungen deduplizieren ueber stabile
  `FinancialEntry`-Identitaeten.
- Die Oberflaeche darf die technische Zweiteilung als ruhige gemeinsame
  Behandlungszusammenfassung darstellen.

Eine medizinische Rechnung bleibt nach bestaetigtem Review nicht ohne
medizinischen Care-Anker.

## Payer und Claims

Sozialversicherung, Krankenfuersorge und private/Zusatzversicherung werden
nicht allein wegen ihrer Beteiligung zu Subvorgaengen.

Eine konkrete Einreichung bei einem bestaetigten Payer ist ein Claim
beziehungsweise Ablaufzweig innerhalb des Kostenabrechnungsvorgangs.

```text
Medical Cost Settlement Case
  Claim: Sozialversicherung
  Claim: Zusatzversicherung A
  Claim: Zusatzversicherung B
```

Es gibt keine verpflichtende Vorabkonfiguration wie:

- nur Sozialversicherung;
- nur Zusatzversicherung;
- zuerst Sozialversicherung, danach Zusatzversicherung;
- parallel einreichen.

### Mehrere Payer und einfache Defaults

Ein Managed Subject kann gleichzeitig oder historisch mehrere
Sozialversicherungen, Krankenfuersorgeanstalten und private Versicherungen
besitzen. Mappm darf pro Managed Subject hoechstens einen ausdruecklich
gesetzten bevorzugten Payer in diesen Kategorien speichern:

- Sozialversicherung beziehungsweise Krankenfuersorge;
- ambulante Zusatzversicherung;
- stationaere Zusatzversicherung.

Weitere Leistungsbereiche werden erst nach eigener fachlicher Entscheidung
erganzt. Andere Versicherungen bleiben erhalten und auswaehlbar. Ein Default
ist nur eine persoenliche Sortierpraeferenz: Wenn die Nutzerin eine Einreichung
startet, darf er zuerst vorgeschlagen werden. Er beweist keine Deckung,
Zustaendigkeit, Erstattungsfaehigkeit oder Anspruchsberechtigung und darf
weder automatisch einen Claim erzeugen noch eine Einreichung absenden.

Claims werden erst aus einer konkreten Nutzeraktion oder eintreffender
Dokumentevidenz aktiviert. Ein Payer, eine Reihenfolge, ein Anspruch oder eine
Erstattung darf nicht ohne Nutzerbestaetigung als wahr behandelt werden. Mappm
nimmt keine fachliche Pruefung vor, ob eine Polizze zu einer Leistung passt.

### Zustaende, Evidenz und generischer Erstattungsablauf

Dokumente sind Evidenz; Zustaende beschreiben, was bestaetigt passiert ist.
Deshalb bleiben mindestens drei Dimensionen fachlich getrennt:

- generischer Case-Lifecycle, etwa `active`, `waiting`, `done`, `archived`;
- Zahlungszustand der wirtschaftlichen Verpflichtung, etwa `unknown`, `open`,
  `paid`, `reversed`;
- je Payer-Claim ein Einreichungszustand, etwa `not_started`, `submitted`,
  `waiting`, `additional_information`, `settled`, `rejected`.

Die Namen sind konzeptionell; exakte Domain-/API-Enums werden spaeter
freigegeben. Ein Zustand besitzt immer Provenienz aus bestaetigtem Dokument,
ausdruecklicher Nutzerangabe oder spaeter einer autorisierten Integration.
Backend/Core Assist schlaegt dokumentbasierte Aenderungen vor, finalisiert sie
im aktuellen Reifegrad aber nicht allein.

Der schlanke Austria-first-Normalablauf ist:

```text
wirtschaftliche Verpflichtung erkannt oder bestaetigt
  -> Zahlung bekannt oder unbekannt
  -> bei gewaehlter Sozialversicherung/Krankenfuersorge eingereicht
     oder ausdruecklich als bereits eingereicht bestaetigt
  -> auf Ergebnis warten
  -> Abrechnung/Erstattung oder Ablehnung bestaetigen
  -> bei vorhandener Zusatzversicherung Einreichung vorschlagen
  -> auf deren Ergebnis warten
  -> Kostenabrechnung bewusst abschliessen
```

Nur ein bestaetigtes abschliessendes Ergebnis der Sozialversicherung, also
Abrechnung/Erstattung oder Ablehnung, aktiviert im normalen Ablauf den
Vorschlag fuer den naechsten Zusatzversicherungs-Schritt. Eingangsbestätigung,
Rueckfrage oder Nachforderung halten den SV-Claim offen. Die Nutzerin darf eine
Zusatzversicherung bewusst frueher oder direkt verwenden; Mappm konfiguriert
das weder vorab noch leitet es still aus Wartezeit oder Polizzendaten ab.

Besondere vertragliche Versicherungsleistungen werden in M1 nicht durch
medizinische Sondertypen oder eigene Spezialworkflows ausmodelliert. Ihre
Dokumente koennen generisch im passenden Medical-/Versicherungskontext landen;
eine spaetere Spezialisierung benoetigt nachgewiesenen Produktwert und eine
eigene Entscheidung. Mappm loest keine Polizzenformel auf und berechnet oder
prognostiziert keine Deckung, Leistung, Erstattung oder Eigenanteile. Es darf
nur bestaetigte Betraege aus Dokumenten speichern und kontextuell
zusammenfassen.

## Capture-first Matching

Globales Capture bleibt der normale Einstieg. Die Nutzerin muss den
medizinischen Vorgang nicht vor dem Scan suchen.

Bei einem hinreichenden ersten Kostenhinweis, etwa Rechnung, Zahlungsnachweis,
Payer-Antwort oder ausdruecklicher Nutzerabsicht, erzeugt Backend/Core Assist
einen gemeinsamen, kompakten Vorschlag:

1. neutral benannter neuer oder bestehender `medical_care`-Case;
2. neuer oder bestehender `medical_cost_settlement`-Case fuer die
   wirtschaftliche Verpflichtung;
3. `part_of`-Beziehung;
4. Dokumenttitel, relevante Facts sowie aus Nutzerdefaults oder
   Dokumentevidenz stammende Payer-/Claim-Kandidaten;
5. nur belegte Aufgaben, Termine, Fristen oder erwartete Antworten.

Der Nutzer bestaetigt oder korrigiert die materiellen Zuordnungen im aktuellen
Reifegrad. Die UI muss nicht zwei technische Formulare oder eine grosse
medizinische Taxonomie zeigen.

Ein spaeter eintreffender Befund oder Bericht wird gegen den Care-Case gerankt,
nicht gegen den rein finanziellen Subvorgang. Ein spaeterer Zahlungsnachweis,
eine Einreichungsbestaetigung, Rueckfrage, Abrechnung oder Ablehnung wird
dokumentweise gegen bestehende Cost-/Claim-Kontexte gerankt. Eine Korrektur
kann Beziehungen aendern, ohne Dokumente zu kopieren oder bestaetigte Struktur
still zu ueberschreiben.

Ein bereits abgeschlossener Care-Case bleibt ein Matching-Kandidat. Ein
spaeteres Dokument kann als weitere Evidenz verknuepft werden, ohne den Case
automatisch wieder zu oeffnen. Erzeugt es neue Arbeit oder aendert das
bestaetigte Ergebnis materiell, schlaegt Mappm eine nachvollziehbare
Wiedereroeffnung oder einen neuen verknuepften Case vor. Die allgemeinen Regeln
stehen in `DECISION_CASE_DOCUMENT_RECORD_MODEL.md`.

## Dokument- und Zeitgrenzen

- Eine mobile Scan-Einheit enthaelt genau ein logisches Dokument mit optional
  mehreren Seiten.
- Rechnung, Zahlungsbeleg, Befund und Versicherungsantwort werden als getrennte
  Dokumente erfasst.
- M1 muss mit `allgemeines Dokument` beziehungsweise einem breiten
  `medizinisches Dokument` als Fallback voll funktionsfaehig sein. Eine
  fehlende Feinklassifikation darf Capture, Matching, Suche oder Case-Zuordnung
  nicht blockieren.
- Die Rechnung ist produktverhaltensrelevant, weil sie eine wirtschaftliche
  Verpflichtung und damit einen Cost-Case ausloesen kann.
- Ueberweisung und Befund/Bericht sind sinnvolle klassische
  Medical-Erkennungen, aber fuer M1 Nice-to-have statt Pflicht. Sie werden nur
  als genauere Typen beziehungsweise Varianten gefuehrt, wenn dies den
  Produktwerttest aus `DECISION_DOCUMENT_TYPE_CATALOG.md` besteht und die
  Erkennung ausreichend belegt ist; andernfalls gilt der generische Fallback.
- Bewilligung, Ablehnung, Reha-Antrag, Entlassungsbrief, Labor- oder
  Radiologiedetail werden nicht allein wegen ihres Namens zu eigenen
  M1-Dokumenttypen. Titel, Domain, Facts, Volltextindex und Case-/Workflow-Link
  duerfen die konkrete Bedeutung ausdruecken.
- Formulare fuer Reha, Psychotherapie, Bewilligung, Fahrtkosten oder andere
  Sonderfaelle duerfen als allgemeines beziehungsweise medizinisches Dokument
  mit spezifischem Titel und sparsamer interner Link-/Workflow-Rolle erkannt
  werden. Ein Formularname erzwingt weder einen globalen Dokumenttyp noch einen
  eigenen Case.
- Ein Labor-, Radiologie- oder anderer medizinischer Detailbegriff wird nicht
  allein deshalb zur globalen Dokumentvariante. Der vollstaendige
  Dokumentkatalog bleibt OQ-011.
- Zeit-Facts wie Ausstellung, Leistung, Aufenthalt, Faelligkeit, Termin und
  Erstattung bleiben semantisch getrennt.
- Ein Arztbesuch ist kein Dokumenttyp. Ein medizinisches Ereignis darf nur aus
  ausreichender Evidenz vorgeschlagen werden.

## Medizinisches Speichermedium als M1-Medienpaket

Roentgen-, CT-, MRT- oder andere medizinische Bilddaten koennen auf CD, DVD,
USB-Speicher oder in einem exportierten Ordner eintreffen. Ein solcher
Dateibaum kann DICOM-Daten, eine `DICOMDIR`, Hilfsdateien und mitgelieferte
Viewer-Software enthalten. M1 muss diese Inhalte weder fachlich aufspalten
noch innerhalb von Mappm anzeigen.

Der Nutzer darf diese seltene Aktion auf einer unterstuetzten
Desktop-Plattform nur innerhalb eines bereits bestehenden, bestaetigten und
geoeffneten `medical_care`-Case starten. Sie ist weder globaler Capture-Kanal
noch allgemeiner Dateiupload. Ohne bestaetigten Care-Case muss der Nutzer
zuerst den normalen Capture- oder Case-Flow abschliessen.

Mappm:

1. uebernimmt den geoeffneten Care-Case als festen Primaerkontext und fuehrt
   kein globales Case-/Record-Matching fuer das Paket aus;
2. zeigt vor dem Import mindestens Quelle, Dateianzahl und Gesamtgroesse;
3. verlangt einen manuell vergebenen Titel und bietet hoechstens
   `Untersuchungsdatum (optional)` als fachliches M1-Zusatzfeld an;
4. archiviert alle zugaenglichen regulaeren Dateien mit erhaltener relativer
   Verzeichnisstruktur als ein ZIP;
5. speichert dieses ZIP als einen logischen Medienpaket-Eintrag mit
   Importprovenienz, Groesse, Dateianzahl, Manifest und Integritaetspruefung;
6. verknuepft das Medienpaket direkt mit dem geoeffneten Care-Case;
7. gibt spaeter exakt das gespeicherte ZIP wieder aus, statt es aus
   veraenderten Einzeldateien neu zu erzeugen.

Das Paket ist fuer M1 ein Document-/File-Artefakt mit technischer
Quelle/Containerart, etwa `media_archive`, keine neue medizinische Case-Familie
und kein Katalog aus Bildgebungs-Dokumenttypen. Der exakte persistierte Key
bleibt der Taxonomie-/Data-Freigabe vorbehalten. Der Nutzer vergibt in M1 einen
neutralen Titel, etwa `MRT Knie`, selbst. Ein Untersuchungsdatum kann optional
manuell erfasst werden und wird als nutzereingegebenes
Leistungs-/Ereignisdatum mit eigener Provenienz gespeichert. Ist diese
Bedeutung nicht passend oder nicht bekannt, bleibt es leer. Es gibt fuer
diesen Randfall in M1 keine automatische Titel- oder Datumserkennung und kein
Formular fuer weitere fachliche Metadaten. Quelle, Importzeit, Groesse,
Dateianzahl, Hash, Manifest und technische Provenienz werden automatisch
erfasst.

Mitgelieferte Viewer-Programme und Hilfsdateien bleiben als inerte Bytes im
Originalarchiv enthalten. Mappm fuehrt sie weder beim Import noch bei Vorschau,
Indexierung oder Export automatisch aus. Nach dem Export kann der Nutzer das
ZIP vollstaendig entpacken; ob die fremde Software auf dem Zielsystem
funktioniert, ist nicht garantiert.

M1 indexiert nur bestaetigte Paketmetadaten und den manuell vergebenen Titel.
Es entpackt den Dateibaum nicht fuer OCR, Assist oder Volltextsuche. Eine
spaetere optionale Erkennung von Titel oder Datum benoetigt einen eigenen
Privacy-, Security-, Format-, Evidence- und UX-Scope; sie darf den
bestaetigten Case-Link nicht aendern und keine Untersuchung oder Diagnose
erfinden.

Mobile M1 bietet keinen Medienpaket-Import, auch nicht fuer ein bereits
vorhandenes ZIP. Ein schon im geoeffneten Care-Case gespeichertes Paket darf
mobil nur angezeigt beziehungsweise heruntergeladen/exportiert werden, wenn
eine spaetere konkrete Plattform- und Security-Policy dies freigibt.

M1 baut keinen DICOM-Viewer, keine medizinische Bildinterpretation und kein
forensisch exaktes ISO-Abbild des physischen Datentraegers. Ein spaeterer
Viewer benoetigt eine eigene gepruefte Format-/Plattformmatrix und darf die
Originaldaten nicht ersetzen.

## Beispiele

### Jaehrliche Kontrolle mit einer Rechnung

```text
Case: Hautkontrolle 2026
  Befund, falls vorhanden

  Case: Rechnung Dr. Mayer abrechnen
    part_of -> Hautkontrolle 2026
    Arztrechnung
    Zahlungsbeleg
    Payer-Claims, falls von der Nutzerin bestaetigt
```

### Nur Rechnung, kein Befund

```text
Case: Behandlung bei Dr. Mayer, Juni 2026

  Case: Rechnung Dr. Mayer abrechnen
    part_of -> Behandlung bei Dr. Mayer, Juni 2026
    Arztrechnung
```

Beide Cases werden als ein kompakter Vorschlag erzeugt. Eine Diagnose wird
nicht verlangt oder erfunden.

### Nur Zahlungsnachweis, keine Rechnung

```text
Case: Behandlung bei Dr. Mayer, Juni 2026

  Case: Behandlungskosten Dr. Mayer klaeren
    part_of -> Behandlung bei Dr. Mayer, Juni 2026
    Zahlungsnachweis
    paymentState: paid
```

Auch dieser Kosten-Case ist gueltig. Die Rechnung kann spaeter hinzukommen,
als hilfreiche Unterlage erwartet werden oder dauerhaft fehlen. Ihr Fehlen
erzeugt keinen ungueltigen oder technisch unvollstaendigen Case.

### Behandlung ohne Rechnung

```text
Case: Kniebehandlung 2026
  Ueberweisung
  Befund
  medizinisches Dokument
  Kontrolltermin
```

Ohne wirtschaftliche Verpflichtung entsteht kein
`medical_cost_settlement`-Case.

### Rehabilitation mit Bewilligung und Rechnung

```text
Case: Kniebehandlung 2026
  Reha-Unterlagen
  Bewilligungsanfrage
  Bewilligung
  Entlassungsbericht

  Case: Reha-Rechnung abrechnen
    part_of -> Kniebehandlung 2026
    Rechnung
    Zahlungsbeleg
    Payer-Claims, falls von der Nutzerin bestaetigt
```

Bewilligungsunterlagen bleiben im Care-Case. Die eigenstaendige wirtschaftliche
Verpflichtung, hier durch die Rechnung belegt, begruendet den
Kostenabrechnungsvorgang. Reha und Nachsorge bleiben bei belegter Kontinuitaet
im bestehenden Care-Case. Die Nutzerin kann ein Ankerdokument beim
Capture/Review bewusst einem neuen verknuepften Case zuordnen; `follow_up_to`
gilt nur bei bestaetigter fachlicher Fortsetzung nach Abschluss oder Uebergabe.

### Bildgebung auf Speichermedium

```text
Case: Kniebehandlung 2026
  Befund
  Medienpaket: MRT Knie vom 14.06.2026
    Originalmedium.zip
```

Das ZIP darf DICOM-Dateien, `DICOMDIR`, Viewer und Hilfsdateien enthalten. Es
bleibt ein zusammengehoeriges, exportierbares Paket und wird fuer M1 nicht in
Dokument-Subtypen zerlegt.

## Noch offene Entscheidungen

Diese Decision entscheidet bewusst nicht:

- welche medizinischen Workflows Commercial 1.0 in Oesterreich bewirbt;
- ob spaetere provider-spezifische Hinweise oder Einreichungslinks ueber den
  generischen Erstattungsablauf hinaus belegbaren Produktwert besitzen;
- den finalen medizinischen Dokumenttypen-/Variantenkatalog;
- die genaue UI-Darstellung, Gesten und progressive Offenlegung;
- konkrete Domain-/API-/Drift-Typen fuer Wiederholungsplanung,
  Payer-Praeferenz, Zahlungs- und Claim-Zustaende.

Diese Punkte bleiben OQ-011, WF-01, WF-02 und den spaeteren
Implementation-Contracts zugeordnet. Der generische M1-Ablauf benoetigt keine
provider-spezifischen Formulare. Spaetere Provider-Hinweise werden nur bei
nachgewiesenem Mehrwert aus offiziellen, datierten Quellen fachlich geprueft,
versioniert und fuer einen freigegebenen Austria-first-Scope veroeffentlicht.

## Implementation und Release Gates

Die fachliche Kernstruktur ist akzeptiert, autorisiert aber keinen ungeprueften
medizinischen Workflow-Release.

- Domain/Data/API planen die eine generische `Case`-Entitaet, `CaseLink`,
  Claims, Dokumentlinks und Facts; keine Medical-Sonderentitaet und keinen
  separaten Subcase-Typ.
- Ein Implementation Contract muss Local-/Cloud-Fakes, Microcks-relevante
  Contract-Grenzen, Migration, Privacy, Accessibility und synthetische
  Fixtures festlegen.
- OQ-011 bleibt fuer die vollstaendige Dokument-/Workflow-Taxonomie
  implementierungsblockierend.
- WF-01/WF-02 und fachliche oesterreichische Pruefung blockieren konkrete
  provider-spezifische Payer-/Frist-/Anspruchs- und Release-Claims, nicht den
  generischen dokumentbasierten Erstattungsablauf.
- OQ-012 ist geschlossen. Spaetere abweichende Medical-Spezialisierungen
  benoetigen eine neue ausdrueckliche Produktentscheidung.

## Verifikation

Mindestens folgende synthetische Szenarien muessen abgedeckt werden:

- Rechnung als erster Beleg erzeugt Care plus Cost Settlement;
- Zahlungsnachweis als erster Beleg kann einen gueltigen Care-/Cost-Vorschlag
  erzeugen, ohne eine Rechnung zu verlangen;
- Befund als erster Beleg erzeugt nur Care;
- spaeterer Befund matcht den Care-Case;
- Korrekturrechnung und Zahlungsbeleg bleiben bei derselben Verpflichtung;
- zweite unabhaengige Rechnung erzeugt zweiten Cost-Case;
- ein Payer, mehrere Payer oder kein Payer;
- Payer-Claims werden nicht zu Subvorgaengen;
- jaehrliche Kontrolle bleibt endlicher Case;
- Wiederholungsplanung erzeugt keinen eigenen Case-Typ und der naechste
  Durchlauf entsteht erst aus Nutzerabsicht oder neuer Evidenz;
- anderer Arzt oder Krankenhausabschnitt spaltet nicht automatisch;
- Reha-/Nachsorgebeleg wird bei belegter Kontinuitaet dem bestehenden Care-Case
  vorgeschlagen; bei eigenstaendigem Verlauf darf ein neuer verknuepfter Case
  zuerst gereiht werden;
- Nutzer kann aus einem einzelnen Ankerdokument einen neuen verknuepften Case
  bestaetigen; weitere Dokumente werden einzeln vorgeschlagen und zugeordnet;
- M1 bietet keine freie Mehrfachauswahl zum Umwandeln einer Dokumentgruppe in
  einen Subvorgang;
- spaeterer Beleg matcht auch einen abgeschlossenen Case und loest nur bei
  neuer Arbeit eine bestaetigte Wiedereroeffnung aus;
- Bewilligungsanfrage und Bewilligung bleiben im Care-Case und erzeugen keinen
  eigenen Case;
- Reha-Rechnung erzeugt einen Cost-Case, nicht die vorangehende Bewilligung;
- mehrere Sozial-/Zusatzversicherungen je Managed Subject, optionale Defaults
  fuer Sozial/Krankenfuersorge, ambulant und stationaer sowie Korrektur dieser
  Defaults;
- ein Default sortiert nur und behauptet weder Deckung noch Zustaendigkeit;
- Eingangsbestätigung, Rueckfrage und Nachforderung halten den SV-Claim offen;
  nur bestaetigte Abrechnung/Erstattung oder Ablehnung schlagen im Normalablauf
  den Zusatzversicherungs-Schritt vor;
- Zahlung, SV-Claim, Zusatzversicherungs-Claim und Case-Lifecycle bleiben
  getrennte, provenance-tragende Zustaende;
- ein bestaetigter Case bleibt bei null, einem oder mehreren Dokumenten gueltig;
- spezielle medizinische Formulare funktionieren mit generischem Dokumenttyp,
  konkretem Titel und sparsamer interner Rolle;
- kontextueller Desktop-Speichermedium-/Ordnerimport ist nur im geoeffneten
  bestaetigten Care-Case sichtbar und erzeugt dort ein ZIP-Medienpaket mit
  erhaltener relativer Struktur, Manifest und Integritaetsnachweis;
- erforderlicher Titel wird manuell vergeben; optionales Untersuchungsdatum
  fehlt oder wird als nutzereingegebenes Leistungs-/Ereignisdatum gespeichert;
- globaler Desktop-Capture, nichtmedizinische Cases und Mobile zeigen keinen
  Medienpaket-Import;
- enthaltene Viewer-Software bleibt gespeichert, wird aber niemals automatisch
  ausgefuehrt;
- exportiertes Medienpaket ist bytegleich zum gespeicherten ZIP;
- falscher Parent-, Kosten- oder Payer-Vorschlag ist korrigierbar;
- keine Diagnose, Frist oder Erstattungsberechtigung aus schwacher Evidenz;
- keine Datei- oder Finanzdoppelzaehlung ueber Care-/Cost-Links;
- ein logisches Dokument pro abgeschlossener Scan-Einheit.

## Stop Rules

Stop, wenn:

- eine medizinische Rechnung ohne Care-Anker akzeptiert wird;
- jedes Rechnungsdokument statt jede wirtschaftliche Verpflichtung einen neuen
  Cost-Case erzeugt;
- Sozial- oder Zusatzversicherer automatisch zu Subvorgaengen werden;
- die Nutzerin vor dem Dokumenteingang eine Payer-Strategie konfigurieren muss;
- ein Dokumenttyp oder eine Dokumentkombination fuer die Gueltigkeit eines
  Case vorausgesetzt wird;
- ein bestaetigter Case als `invalid` oder wegen fehlender Dokumente als
  technisch unvollstaendig persistiert wird;
- eine freie Mehrfachauswahl zur Umwandlung von Dokumenten in einen
  medizinischen Subvorgang fuer M1 vorausgesetzt wird;
- Arzt, Krankenhaus, Diagnostik oder Dauer allein den Care-Case spalten;
- Bewilligung, Ablehnung oder Kostenuebernahme allein einen eigenen
  medizinischen Case oder M1-Dokumenttyp erzeugt;
- Assist Diagnose, Behandlungstag, Kausalitaet, Anspruch, Frist oder
  Payer-Reihenfolge ohne belastbare Evidenz behauptet;
- Mappm Polizzendeckung, Anspruch, erwartete Erstattung oder Eigenanteil
  berechnet oder prognostiziert;
- Reha, Nachsorge, Kontrolle, Providerwechsel oder spaeteres Dokument
  automatisch einen neuen Care-Case erzeugt;
- Wiederkehr als eigener sichtbarer Medical-Case-Typ oder endloser Mega-Case
  modelliert wird;
- ein Payer-Default einen Claim automatisch erzeugt, eine Einreichung
  ausloest oder Eignung/Deckung behauptet;
- eine blosse Eingangsbestätigung, Rueckfrage, Nachforderung oder Wartezeit den
  Zusatzversicherungs-Schritt automatisch aktiviert;
- spezielle Formulare ohne belegten Produktwert zu globalen Dokument- oder
  Case-Typen werden;
- Archive beim Import automatisch ausgefuehrt, unkontrolliert extrahiert oder
  ohne vollstaendiges Fehler-/Ausschlussprotokoll als vollstaendig bestaetigt
  werden;
- ein exportiertes Medienpaket still andere Bytes oder eine andere
  Verzeichnisstruktur als das gespeicherte ZIP enthaelt;
- der Medienpaket-Import global, mobil, ohne bestaetigten Care-Case oder in
  einem nichtmedizinischen Case angeboten wird;
- M1 fuer das Medienpaket OCR/Assist, automatische Titel-/Datumserkennung oder
  ein umfangreiches Metadatenformular voraussetzt;
- Custom-/Generic-Case-Faehigkeiten fuer Medical dupliziert werden;
- country-/provider-spezifische Regeln ohne WF-01/WF-02 und datierte
  fachliche Freigabe ausgeliefert werden.
