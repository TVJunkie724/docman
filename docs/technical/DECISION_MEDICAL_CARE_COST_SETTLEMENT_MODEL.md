---
title: "Entscheidung - Medizinischer Behandlungsfall und Kostenabrechnung"
description: "Mappm-Kernmodell fuer medizinische Behandlungsverlaeufe, einen Kosten-Case je eigenstaendiger Rechnung, Payer-Einreichungen, Fristen, Haushaltsfinanzen und medizinische Medienarchive"
tags: [decision, product, medical, healthcare, cases, reimbursement, submissions, deadlines, finance, matching, media-archive]
lastUpdated: "2026-07-25"
status: "accepted"
owner: "product-concept"
---

# Entscheidung - Medizinischer Behandlungsfall und Kostenabrechnung

## Status und Scope

Am 20. Juli 2026 wurde das medizinische Basismodell im User-Workshop
dokumentiert, am 22. Juli nach der Vereinfachung des Versicherungsmodells
korrigiert und am 24. Juli 2026 gegen den globalen Case-Family-Vertrag
abschliessend fachlich konsolidiert. Diese Decision besitzt die akzeptierten
fachlichen Grenzen von:

- `medical_care` als medizinischem Behandlungsfall;
- `medical_cost_settlement` als `part_of`-Kostenabrechnungsvorgang je
  zugrunde liegender eigenstaendig ausgestellter medizinischer
  Rechnung/Honorarnote, auch wenn das Rechnungsdokument selbst noch fehlt;
- Payer-Einreichungen als wiederholbare Events/Workflow-Schritte innerhalb der
  Kostenabrechnung; es gibt keine Claim-Entitaet.

Die kanonischen IDs, deutschen Titel und Katalogstatus bleiben in
`DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` als alleiniger Katalog-SSOT. Diese
Decision besitzt ihre fachliche Komposition.

Zusaetzlich akzeptiert sind:

- Bewilligungsanfrage, Bewilligung, Ablehnung oder Kostenuebernahme fuer eine
  konkrete Behandlung sind Dokumente, Facts und gegebenenfalls
  Workflow-Schritte im passenden `medical_care`-Case. Sie begruenden allein
  keinen eigenen Case;
- die medizinische Dokumentklassifikation bleibt fuer M1 bewusst schlank,
  wobei schlank weder Subtypen ausschliesst noch gegen sie spricht; sinnvolle
  Typen und Varianten bleiben erhalten, wenn sie den Produktwert tragen;
- ein spaeterer medizinischer Beleg wird dokumentweise gegen bestehende und
  neue Care-Kandidaten gerankt. Bei belegter Kontinuitaet wird derselbe
  Behandlungsfall vorgeschlagen; ein eigenstaendiger verbundener Care-Case
  entsteht nur nach bewusster Nutzerbestaetigung;
- wiederkehrende Kontrollen sind kein eigener Case-Typ. Ein endlicher
  Behandlungsfall darf eine optionale Wiederholungs-/Serienplanung tragen;
- ein Managed Subject darf mehrere Sozialversicherungs-,
  Krankenfuersorge- und Zusatzversicherungsbeziehungen sowie einfache
  bevorzugte Payer je definierter Kategorie besitzen;
- jede bestaetigte Versicherungsbeziehung darf einen stabilen Policy Record
  und ruhigen Vertragskontext besitzen; Polizzendokument und historischer
  Abschluss-Case sind keine Pflicht;
- Mappm prueft oder berechnet weder Versicherungsdeckung noch erwartete
  Leistung, Erstattung, Eigenanteil oder Anspruch;
- `Medizinischer Unfall` ist eine sichtbare Einstiegs-/Routingvariante direkt
  zu `medical_care`. Ohne eigenstaendige nichtmedizinische Unfallregulierung
  entsteht kein zusaetzlicher Unfall-/Schaden-Wrapper;
- `medical_cost_settlement` bleibt wegen seiner optionalen, getrennten
  Sozialversicherungs- und Zusatzversicherungsablaeufe fachlich von
  `damage_cost_settlement` getrennt. Gemeinsame technische Primitiven machen
  daraus keinen universellen Kosten-Case;
- jeder bestaetigte Case ist unabhaengig von Anzahl und Art seiner Dokumente
  gueltig. Dokumente belegen oder schlagen Zustaende vor, sind aber keine
  Vollstaendigkeitsvoraussetzung;
- Zahlung, gesetzlicher Payer und jede Zusatzversicherung sind getrennte
  Workflow-, Finanz- und Fristspuren innerhalb desselben medizinischen
  Cost-Case;
- eine externe Einreichung darf null, ein oder mehrere Dokumente referenzieren
  und derselbe Cost-Case darf mehrere Einreichungen/Nachreichungen besitzen.
  Provider-Apps duerfen trotzdem eine Rechnung je externer Einreichung
  verlangen, ohne die Domain-Grenze zu veraendern;
- eine unbezahlte Rechnung ist eine offene Verpflichtung, aber noch keine
  tatsaechliche Ausgabe. Bestaetigte Zahlungen und Erstattungen bilden die
  private Haushalts-/Zahlungsuebersicht;
- mehrere Payer-Fristen bleiben getrennt. Die frueheste bestaetigte offene
  Frist darf nur als kompakte naechste kritische Frist erscheinen;
- innerhalb eines bereits bestehenden und geoeffneten medizinischen
  Care-Vorgangs darf auf Desktop fuer M1 ein ausgewaehltes Speichermedium oder
  ein Ordner als ein unveraendertes ZIP-Medienpaket gesichert und wieder
  exportiert werden.

Die globale Entfernung der Claim-Entitaet und die Abbildung als
Einreichungsereignisse ist am 22. Juli 2026 akzeptiert. Der medizinische
Behandlungs- und Cost-Case-Zuschnitt, seine Dokumentfreiheit, typische
Inhaltsvorschlaege und unabhaengigen Lifecycles wurden am 24. Juli 2026
fachlich bestaetigt. Ein Implementation Contract benoetigt weiterhin den
finalen Dokumentkatalog sowie die normalen Domain-/Backend-/UI-Handoffs.

Damit sind OQ-012 und der medizinische Teil von OQ-014 fachlich geschlossen.
Weiter offen bleiben der finale Dokumentkatalog in OQ-011, die fuer
Commercial 1.0 aktivierten
oesterreichischen Workflows in WF-01, deren fachliche Betriebsverantwortung in
WF-02 sowie konkrete UI- und technische Contracts.

Regelbasierte Fristen und Reminder folgen
`DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`. Der gepruefte Austria-first-
Payerstand folgt `DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md`.
Haushaltsfinanzen folgen
`DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md`; Policy Records und
Versicherungsvertragskontexte folgen
`DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md`.

## Akzeptierte Grundstruktur

```text
Medical Care Case
  medizinische Dokumente und bestaetigte Verlaufsereignisse

  Medical Cost Settlement Case A  part_of -> Medical Care Case
    eigenstaendig ausgestellte Rechnung/Honorarnote A
    zugehoerige Dokumente
    wiederholbare Einreichungs-/Antwortereignisse je bestaetigtem Payer

  Medical Cost Settlement Case B  part_of -> Medical Care Case
    eigenstaendig ausgestellte Rechnung/Honorarnote B
    zugehoerige Dokumente
    wiederholbare Einreichungs-/Antwortereignisse je bestaetigtem Payer
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

Ein medizinisch versorgter Unfall folgt derselben Grenze. Ist nur der
medizinische Verlauf relevant, bildet `medical_care` selbst den sichtbaren
Vorgang, etwa `Schnittverletzung an der Hand`. Ein Unfall-/Schaden-Case wird nur
bei spaeterer eigenstaendiger nichtmedizinischer Regulierung ergaenzt; dann ist
Medical Care ueber `caused_by` verknuepft und bleibt eigenstaendig.

### Fortsetzung, Ankerdokument und Folge-Vorgang

Neue medizinische Dokumente werden gegen bestehende offene, abgeschlossene und
archivierte Behandlungsfaelle sowie einen moeglichen neuen verknuepften
Care-Case gerankt. Das Ranking arbeitet mit groben, technisch realistischen
Signalen und bleibt eine unverbindliche Kandidatenliste. Es darf denselben
Care-Case oder einen neuen Case zuerst reihen, entscheidet aber weder
Verlaufskontinuitaet noch fachliche Trennung. Krankenhaus, Nachsorge, Kontrolle,
Therapie oder Rehabilitation erzeugen allein keinen neuen Case.

Die Nutzerin darf einen eigenen Care-Case anlegen:

- als bewusste Absicht waehrend Capture/Review, wobei der neue Case mit einem
  vorhandenen Case verknuepft werden kann;
- spaeter aus einem einzelnen bestaetigten Ankerdokument. Backend/Core Assist
  schlaegt einen konservativen Titel und Case-Kandidaten vor. Eine Beziehung
  ist ein optionaler, bestaetigungspflichtiger Zusatzvorschlag und kein
  garantierter Core-Assist-Output. Der Workflow folgt nach Bestaetigung der
  gewaehlten Case-Familie, nicht einer freien Modellinterpretation.

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
Behandlung bei Dr. Mayer
```

Automatisch vorgeschlagene Titel enthalten standardmaessig kein Datum und
duerfen weder Behandlungstag noch Diagnose erfinden. Zeitangaben bleiben
getrennte Kandidaten beziehungsweise bestaetigte Facts und folgen
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

Diese Unterlagen duerfen nach ausdruecklicher Nutzerbestaetigung oder einer
bereits eindeutig benannten kontextuellen Nutzeraktion Facts, einen ruhigen
Workflow-Status, eine Aufgabe, eine Frist oder eine erwartete Antwort
aktualisieren. Das Modell allein darf diese Bedeutung nicht festlegen. Der
Nutzer muss dafuer keinen eigenen Vorgang verwalten. Ein eigener Case entsteht
nur fuer ein anderes bereits akzeptiertes fachliches Ziel, etwa die
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

Der naechste tatsaechliche Durchlauf wird erst durch Nutzerabsicht oder eine
von der Nutzerin als neuer Durchlauf bestaetigte Evidenz zu einem neuen
endlichen Care-Case. Er kann fuer eine spaetere
Serienansicht denselben bestaetigten Wiederholungskontext tragen und mit dem
vorherigen Durchlauf `related_to` verknuepft werden. `follow_up_to` wird nur
verwendet, wenn wirklich eine fachliche Behandlungsfortsetzung und nicht nur
dieselbe Periodik vorliegt. Die konkrete Persistenz- und UI-Darstellung gehoert
in Data-/Contract- beziehungsweise UI-Implementation-Contracts.

## Kostenabrechnung und Erstattung

Ein `medical_cost_settlement`-Case besitzt das eigenstaendige administrative
und finanzielle Ziel, genau eine zugrunde liegende eigenstaendig ausgestellte
medizinische Rechnung/Honorarnote zu pruefen, zu bezahlen, gegebenenfalls
einzureichen und bis zum nachvollziehbaren
Erstattungs-/Nettoaufwandsergebnis abzustimmen.

Die Case-Grenze folgt der **einzelnen eigenstaendig ausgestellten Rechnung**,
nicht der Anzahl der Dateien oder Einreichungen. Das Rechnungsdokument selbst
darf fehlen: Die Nutzerin kann denselben Kosten-Case aus Zahlungsnachweis,
Payer-Antwort oder ausdruecklicher Absicht bestaetigen. Fachlich bleibt die
Abrechnungseinheit die eine zugrunde liegende Rechnung/Honorarnote; ihr
Dokument darf noch fehlen oder dauerhaft nicht in Mappm vorliegen.

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

Eine zweite eigenstaendig ausgestellte Rechnung bildet immer einen zweiten
Kostenabrechnungsvorgang, auch wenn beide Rechnungen zum selben medizinischen
Behandlungsfall gehoeren. Eine Rechnung mit mehreren zusammengehoerenden
Positionen bleibt ein Kostenabrechnungsvorgang.

Korrigierte Rechnung, Duplikat, Gutschrift oder Storno der gleichen
Rechnungsidentitaet bleiben im selben Kostenabrechnungsvorgang. Werden mehrere
eigenstaendige Rechnungen in einer externen Batch-Aktion uebermittelt,
verlieren sie ihre getrennten Kostenabrechnungsidentitaeten nicht. Eine
spaetere Batch-Aktion darf mehrere Cost-Cases referenzieren/aktualisieren, ohne
sie zusammenzufuehren; der exakte Contract ist spaeter zu entscheiden.

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

## Typische Inhalte und kontextuelle Vorschlaege

Die Medical-Familie darf kontextuell typische Inhalte vorschlagen:

- Ueberweisung;
- Befund oder Bericht;
- medizinische Rechnung;
- Zahlungsnachweis;
- allgemeines medizinisches Dokument;
- bei geoeffnetem Care-Case auf Desktop ein manuell beschriebenes
  medizinisches Medienpaket.

Das sind weder Pflichtdokumente noch eine abschliessende Dokumenttypenliste.
`medical_invoice` ist wegen des stabilen Cost-/Payer-Verhaltens eine
produktrelevante semantische Variante. Ueberweisung und Befund/Bericht bleiben
akzeptierte Kandidaten des finalen Dokumentkatalogs; alle nicht hinreichend
produktrelevanten Spezialbegriffe bleiben generische medizinische Dokumente
mit vorgeschlagenem Titel, Facts, Suche und gegebenenfalls sparsamer Rolle.

Ein kontextueller Vorschlag darf eine passende Capture-Aktion oder einen
naechsten Schritt anbieten. Er erzeugt nie `3 von 7 Unterlagen`, einen
Vollstaendigkeitsstatus oder einen ungueltigen Case.

## Payer und wiederholbare Einreichungen

Sozialversicherung, Krankenfuersorge und private/Zusatzversicherung werden
nicht allein wegen ihrer Beteiligung zu Subvorgaengen.

Eine konkrete Einreichung bei einem bestaetigten Payer ist ein
provenienztragendes Ereignis beziehungsweise ein Ablaufzweig innerhalb des
Kostenabrechnungsvorgangs. Sie ist kein Claim und kein eigener Case.

```text
Medical Cost Settlement Case
  Einreichungsereignisse: Sozialversicherung
  Einreichungsereignisse: Zusatzversicherung A
  Einreichungsereignisse: Zusatzversicherung B
```

Es gibt keine verpflichtende Vorabkonfiguration wie:

- nur Sozialversicherung;
- nur Zusatzversicherung;
- zuerst Sozialversicherung, danach Zusatzversicherung;
- parallel einreichen.

### Einreichungsereignis und Dokumentmenge

Eine Einreichung oder Nachreichung ist ein eigenstaendiges,
provenienztragendes Event innerhalb eines bestaetigten Payer-Ablaufs. Sie kann:

- null Dokumente referenzieren, wenn die Nutzerin eine bereits extern
  ausgefuehrte Einreichung nur bestaetigt;
- genau ein Dokument referenzieren;
- mehrere Dokumente referenzieren, etwa Rechnung plus Zahlungsnachweis,
  Abrechnung oder weitere Unterlage.

Der globale Domain-/Contract-Entwurf darf daher weder eine Datei pro
Einreichung noch eine Einreichung pro Cost-Case hardcodieren.
Provider-spezifische Kanaele duerfen trotzdem eine Rechnung je externer
Einreichung verlangen. Das ist eine Overlay-/Integrationsregel und erzeugt
weder einen weiteren Case noch eine globale Dokumentpflicht.

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
weder automatisch einen Einreichungszustand erzeugen noch eine Einreichung
absenden.

Die dauerhafte private Versicherungsbeziehung wird als Policy Record mit
ruhigem Vertragskontext referenziert. Ein vorhandenes Polizzendokument ist
hilfreiche versionierte Evidenz, aber keine Voraussetzung. Ohne Dokument darf
ein minimaler bestaetigter Policy Record bestehen; daraus wird keine
automatische Deckung oder private Frist abgeleitet.

Einreichungsereignisse und -zustaende entstehen erst aus einer konkreten
Nutzeraktion, einer bereits eindeutig benannten kontextuellen Upload-Aktion
oder einer nach Analyse bestaetigten Dokumentzuordnung. Ein eintreffendes
Dokument allein aendert keinen Zustand. Ein Payer, eine Reihenfolge, ein
Anspruch oder eine Erstattung darf nicht ohne Nutzerbestaetigung als wahr
behandelt werden. Mappm nimmt keine fachliche Pruefung vor, ob eine Polizze zu
einer Leistung passt.

### Zustaende, Evidenz und generischer Erstattungsablauf

Dokumente sind Evidenz; Zustaende beschreiben, was bestaetigt passiert ist.
Deshalb bleiben mindestens drei Dimensionen fachlich getrennt:

- generischer Case-Lifecycle, etwa `active`, `waiting`, `done`, `archived`;
- Zahlungszustand der wirtschaftlichen Verpflichtung, etwa `unknown`, `open`,
  `paid`, `reversed`;
- je bestaetigtem Payer-Ablauf ein Einreichungszustand, etwa `not_started`, `submitted`,
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
Rueckfrage oder Nachforderung halten den SV-Einreichungsablauf offen. Die Nutzerin darf eine
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

## Lifecycle und Inaktivitaet

Der medizinische Behandlungsfall wird von der Nutzerin bewusst abgeschlossen.
Backend/Core Assist darf einen Abschluss vorschlagen, beispielsweise bei
langem plausiblen Stillstand oder spaeter bei belastbarer Abschluss-Evidenz,
finalisiert ihn aber nie allein.

Der Kostenabrechnungsvorgang bleibt unabhaengig:

- Er darf aktiv bleiben, obwohl sein Care-Parent bereits `done` ist.
- Mappm darf den Abschluss vorschlagen, wenn Zahlung/Verpflichtung und alle
  tatsaechlich begonnenen Payer-Ablaufe ein bestaetigtes terminales Ergebnis
  besitzen oder von der Nutzerin bewusst beendet/zurueckgezogen wurden.
- Auch dann erfordert der Case-Abschluss immer Nutzerbestaetigung.
- Nicht begonnene Payer-Ablaufe muessen nicht kuenstlich gestartet oder
  abgeschlossen werden.
- Ein einzelnes spaeteres Dokument darf einem abgeschlossenen Care- oder
  Cost-Case als Evidenz hinzugefuegt werden, ohne ihn wieder zu oeffnen.
- Loest das Dokument neue Arbeit aus, wird eine Wiedereroeffnung oder ein neuer
  verknuepfter Case vorgeschlagen und bestaetigt.

Nach sechs Monaten ohne relevante Aktivitaet darf eine allgemeine
Aktivitaetspruefung fragen, ob der Case noch aktiv ist. Wiederkehrende
Kontrollen, bekannte Termine, Fristen, erwartete Payer-Antworten,
Wiederholungsplanung oder andere plausible Zukunft unterdruecken
beziehungsweise verschieben diese Pruefung.

## Fristen und Reminder

Ein `medical_cost_settlement` darf mehrere unabhaengige Fristen besitzen:

- die bestaetigte Frist des gewaehlten gesetzlichen
  Krankenversicherungstraegers oder der Krankenfuersorge;
- je bestaetigter Zusatzversicherung eine eigene Einreichungs-/
  Verjaehrungsfrist;
- eine manuell gesetzte organisatorische Nutzerfrist.

Jede Frist behaelt Payer, Startanker, Regel, Quelle, Version, Berechnung,
Bestaetigung und Reminder. Mappm verschmilzt mehrere
Zusatzversicherungsfristen nicht. Als kompakte Aufmerksamkeit darf nur die
frueheste bestaetigte, anwendbare und offene Frist abgeleitet werden.

Fuer Oesterreich duerfen gepruefte gesetzliche Regeln aus
`DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md` vorgeschlagen werden. Fehlt das
bestaetigte Leistungsdatum, wird kein exaktes Einreichungsdatum erfunden.
Private Fristen entstehen nur aus exakt passender gepruefter Provider-/
Tarifregel, reviewtem Polizzen-/Bedingungsvorschlag oder manueller Angabe.

Automatische Reminder zeigen Herkunft, Regelstand, Quelle/Fundstelle,
Berechnung, Bestaetigungsstatus und naechsten Quellenreview. Sie bleiben
editierbar. Eine Frist erzeugt nicht automatisch eine laute Notification.

## Haushaltsfinanzen im Cost-Case

Der Cost-Case fuehrt keine Buchhaltung, aber eine klare private
Zahlungs-/Kostenuebersicht:

```text
Rechnung noch unbezahlt
  Verpflichtung                         180 EUR
  offen                                 180 EUR
  tatsaechlich bezahlt                    0 EUR
  bestaetigte Erstattungen                0 EUR
  aktueller Netto-Cashflow                 0 EUR

Rechnung bezahlt, zwei Erstattungen
  tatsaechlich bezahlt                  180 EUR
  SV-Erstattung                          65 EUR
  Zusatzversicherungs-Erstattung         90 EUR
  aktueller bestaetigter Nettoaufwand    25 EUR
```

Statusfelder aendern keine Betraege. Rechnung, Zahlung, Gutschrift, Storno und
Erstattung werden als einzelne provenienztragende Finanz-Facts/Ereignisse
bestaetigt; Status und Zusammenfassungen werden daraus abgeleitet. Mappm
berechnet keine erwartete Erstattung, Deckung oder Steuerwirkung.

## Capture-first Matching

Globales Capture bleibt der normale Einstieg. Die Nutzerin muss den
medizinischen Vorgang nicht vor dem Scan suchen.

Bei einem grob erkannten oder von der Nutzerin angegebenen Kostenhinweis, etwa
Rechnung, Zahlungsnachweis oder ausdruecklicher Kostenkontext, darf
Backend/Core Assist einen gemeinsamen, kompakten Vorschlag erzeugen:

1. neutral benannter neuer oder bestehender `medical_care`-Case;
2. neuer oder bestehender `medical_cost_settlement`-Case fuer die
   einzelne zugrunde liegende Rechnung/Honorarnote;
3. `part_of`-Beziehung als Teil des bestaetigten Medical-Cost-Produktmusters;
4. konservativer Dokumenttitel, grobe Dokumentklasse beziehungsweise Domain,
   Ausstellerkandidat, ein relevanter Gesamtrechnungsbetrag, fuer
   `medical_invoice`/Medical relevante vorausgefuellte Datumsfelder mit
   Top-Kandidat/Alternativen/manuellem Fallback und stabile
   Referenzkandidaten;
5. bestaetigte Payer-Defaults oder Policy Records als sortierte Auswahl.

Einreichungsstatus, Payer-Zustaendigkeit, aktive Fristen, Aufgaben, erwartete
Antworten und weitere Case-Beziehungen sind keine verlaesslich finalisierten
freien Modelloutputs. Typrelevante Datumsbedeutungen duerfen sichtbar
vorausgefuellt werden. Wirksam werden sie und ihre Folgen erst aus dem
kompakten Review, der bestaetigten Case-/Workflow-Auswahl, einer konkreten
Nutzeraktion oder einer geprueften Regel.

Der Nutzer bestaetigt oder korrigiert die materiellen Zuordnungen im aktuellen
Reifegrad. Die UI muss nicht zwei technische Formulare oder eine grosse
medizinische Taxonomie zeigen.

Ein spaeter eintreffender Befund oder Bericht darf grob gegen Care-Cases
gerankt werden. Ein spaeterer Zahlungsnachweis oder ein allgemeines
Versicherungsdokument darf gegen bestehende Cost-Cases gerankt werden. Eine
feinere Rolle wie Einreichungsbestaetigung, Rueckfrage, Abrechnung oder
Ablehnung wird erst durch Nutzeraktion beziehungsweise Review verbindlich. Eine
Korrektur kann Beziehungen aendern, ohne Dokumente zu kopieren oder bestaetigte
Struktur still zu ueberschreiben.

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
- `medical_invoice` beziehungsweise Arztrechnung ist eine sinnvolle
  produktverhaltensrelevante Rechnungsvariante, weil sie eine wirtschaftliche
  Verpflichtung und damit den medizinischen Cost-Case mit Zahlungs- und
  moeglichem Payer-Einreichungsverlauf ausloesen kann. Arzt/Klinik, Payer, Land,
  bezahlt/offen und Einreichstatus bleiben getrennte Datenachsen und erzeugen
  keine kombinierte Variantenexplosion.
- Eine eigenstaendig ausgestellte weitere Arztrechnung erzeugt nach
  bestaetigter Zuordnung einen weiteren Cost-Case. Der Subtyp darf dieses
  Verhalten ausloesen; Rechnungsnummer, Provider, Jahr, Payer und Status
  bleiben Facts/Achsen statt neuer Subtypen.
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
  mit konservativem Titel und nach Review sparsamer interner
  Link-/Workflow-Rolle gefuehrt werden. Ein Formularname erzwingt weder einen
  globalen Dokumenttyp noch einen eigenen Case.
- Ein Labor-, Radiologie- oder anderer medizinischer Detailbegriff wird nicht
  allein deshalb zur globalen Dokumentvariante. Der vollstaendige
  Dokumentkatalog bleibt OQ-011.
- Zeit-Facts wie Ausstellung, Leistung, Aufenthalt, Faelligkeit, Termin und
  Erstattung bleiben semantisch getrennt.
- Ein Arztbesuch ist kein Dokumenttyp. Ein medizinisches Ereignis darf nur aus
  Nutzerabsicht oder als bestaetigungspflichtiger grober Vorschlag entstehen;
  das Modell entscheidet keinen Lebenssachverhalt.

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
Case: Hautkontrolle
  Befund, falls vorhanden

  Case: Rechnung Dr. Mayer abrechnen
    part_of -> Hautkontrolle
    Arztrechnung
    Zahlungsbeleg
    Payer-Einreichungen, falls von der Nutzerin bestaetigt
```

### Nur Rechnung, kein Befund

```text
Case: Behandlung bei Dr. Mayer

  Case: Rechnung Dr. Mayer abrechnen
    part_of -> Behandlung bei Dr. Mayer
    Arztrechnung
```

Beide Cases werden als ein kompakter Vorschlag erzeugt. Eine Diagnose wird
nicht verlangt oder erfunden.

### Nur Zahlungsnachweis, keine Rechnung

```text
Case: Behandlung bei Dr. Mayer

  Case: Behandlungskosten Dr. Mayer klaeren
    part_of -> Behandlung bei Dr. Mayer
    Zahlungsnachweis
    paymentState: paid
```

Auch dieser Kosten-Case ist gueltig. Die Rechnung kann spaeter hinzukommen,
als hilfreiche Unterlage erwartet werden oder dauerhaft fehlen. Ihr Fehlen
erzeugt keinen ungueltigen oder technisch unvollstaendigen Case.

### Behandlung ohne Rechnung

```text
Case: Kniebehandlung
  Ueberweisung
  Befund
  medizinisches Dokument
  Kontrolltermin
```

Ohne wirtschaftliche Verpflichtung entsteht kein
`medical_cost_settlement`-Case.

### Rehabilitation mit Bewilligung und Rechnung

```text
Case: Kniebehandlung
  Reha-Unterlagen
  Bewilligungsanfrage
  Bewilligung
  Entlassungsbericht

  Case: Reha-Rechnung abrechnen
    part_of -> Kniebehandlung
    Rechnung
    Zahlungsbeleg
    Payer-Einreichungen, falls von der Nutzerin bestaetigt
```

Bewilligungsunterlagen bleiben im Care-Case. Die eigenstaendige wirtschaftliche
Verpflichtung, hier durch die Rechnung belegt, begruendet den
Kostenabrechnungsvorgang. Reha und Nachsorge bleiben bei belegter Kontinuitaet
im bestehenden Care-Case. Die Nutzerin kann ein Ankerdokument beim
Capture/Review bewusst einem neuen verknuepften Case zuordnen; `follow_up_to`
gilt nur bei bestaetigter fachlicher Fortsetzung nach Abschluss oder Uebergabe.

### Bildgebung auf Speichermedium

```text
Case: Kniebehandlung
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
- welche der bereits geprueften Austria-first-Payerregeln nach professionellem
  Review tatsaechlich aktiviert werden und welche KFA-/Privatprovider-Overlays
  Commercial 1.0 benoetigt;
- ob spaetere provider-spezifische Einreichungslinks ueber den generischen
  Erstattungsablauf hinaus belegbaren Produktwert besitzen;
- den finalen medizinischen Dokumenttypen-/Variantenkatalog;
- die genaue UI-Darstellung, Gesten und progressive Offenlegung;
- konkrete Domain-/API-/Drift-Typen fuer Wiederholungsplanung,
  Policy Record, Payer-Praeferenz, Zahlungs-, Einreichungs-, Frist- und
  Finanzzustaende sowie eine optionale spaetere Batch-Einreichungsaktion.

Diese Punkte bleiben OQ-011, WF-01, WF-02 und den spaeteren
Implementation-Contracts zugeordnet. Der generische M1-Ablauf benoetigt keine
provider-spezifischen Formulare. Spaetere Provider-Hinweise werden nur bei
nachgewiesenem Mehrwert aus offiziellen, datierten Quellen fachlich geprueft,
versioniert und fuer einen freigegebenen Austria-first-Scope veroeffentlicht.

## Implementation und Release Gates

Die fachliche Kernstruktur ist akzeptiert, autorisiert aber keinen ungeprueften
medizinischen Workflow-Release.

- Domain/Data/API planen die eine generische `Case`-Entitaet, `CaseLink`,
  wiederholbare Einreichungsereignisse, Dokumentlinks und Facts; keine
  Claim-, Medical- oder separate Subcase-Sonderentitaet.
- Ein Implementation Contract muss Local-/Cloud-Fakes, Microcks-relevante
  Contract-Grenzen, Migration, Privacy, Accessibility und synthetische
  Fixtures festlegen.
- OQ-011 bleibt fuer die vollstaendige Dokument-/Workflow-Taxonomie
  implementierungsblockierend.
- WF-01/WF-02 und fachliche oesterreichische Pruefung blockieren konkrete
  provider-spezifische Payer-/Frist-/Anspruchs- und Release-Claims, nicht den
  generischen dokumentbasierten Erstattungsablauf.
- OPS-09 blockiert die Aktivierung jeder regelbasierten Frist, solange
  Quellenmonitoring, halbjaehrlicher Review, Owner und Release-Gate fehlen.
- OQ-012 ist geschlossen. Spaetere abweichende Medical-Spezialisierungen
  benoetigen eine neue ausdrueckliche Produktentscheidung.

## Verifikation

Mindestens folgende synthetische Szenarien muessen abgedeckt werden:

- Rechnung als erster Beleg darf einen gemeinsamen Care-plus-Cost-Vorschlag
  erzeugen; die Nutzerin bestaetigt die materielle Struktur;
- Zahlungsnachweis als erster Beleg kann einen gueltigen Care-/Cost-Vorschlag
  erzeugen, ohne eine Rechnung zu verlangen;
- Befund als erster Beleg darf einen Care-Vorschlag erzeugen;
- spaeterer Befund rankt Care-Kandidaten und bleibt korrigierbar;
- Korrekturrechnung und Zahlungsbeleg bleiben bei derselben Verpflichtung;
- zweite unabhaengige Rechnung erzeugt zweiten Cost-Case;
- mehrere eigenstaendige Rechnungen in einer externen Batch-Aktion bleiben
  getrennte Cost-Cases;
- Korrekturrechnung, Duplikat, Gutschrift und Storno der gleichen Rechnung
  bleiben im selben Cost-Case;
- ein Payer, mehrere Payer oder kein Payer;
- Payer-Einreichungen werden weder Claims noch Subvorgaenge;
- eine Einreichung mit null, einem und mehreren Dokumentverweisen sowie
  mehrere Einreichungen/Nachreichungen im selben Cost-Case;
- provider-spezifisch eine Rechnung je externer App-Einreichung verengt den
  globalen Contract nicht;
- jaehrliche Kontrolle bleibt endlicher Case;
- Wiederholungsplanung erzeugt keinen eigenen Case-Typ und der naechste
  Durchlauf entsteht erst aus Nutzerabsicht oder als neuer Durchlauf
  bestaetigter Evidenz;
- anderer Arzt oder Krankenhausabschnitt spaltet nicht automatisch;
- Reha-/Nachsorgebeleg rankt bestehende Care-Cases und einen neuen Case; die
  Nutzerin bestaetigt Kontinuitaet, Trennung und eine optionale Beziehung;
- Nutzer kann aus einem einzelnen Ankerdokument einen neuen verknuepften Case
  bestaetigen; weitere Dokumente werden einzeln vorgeschlagen und zugeordnet;
- M1 bietet keine freie Mehrfachauswahl zum Umwandeln einer Dokumentgruppe in
  einen Subvorgang;
- spaeterer Beleg matcht auch einen abgeschlossenen Case und loest nur bei
  neuer Arbeit eine bestaetigte Wiedereroeffnung aus;
- Care kann manuell `done` sein, waehrend mindestens ein Cost-Case aktiv
  bleibt; Statusaenderungen kaskadieren nicht;
- Cost-Abschluss wird nach terminalen Ergebnissen aller tatsaechlich begonnenen
  Payer-Ablaufe vorgeschlagen, aber niemals ohne Nutzerbestaetigung
  finalisiert;
- sechsmonatiger Inaktivitaetsreview schliesst nie automatisch und wird bei
  Wiederkehr, Termin, Frist oder erwarteter Antwort unterdrueckt;
- typische Inhalte werden kontextuell vorgeschlagen, aber nie als Pflicht-,
  Vollstaendigkeits- oder Gueltigkeitsliste behandelt;
- Bewilligungsanfrage und Bewilligung bleiben im Care-Case und erzeugen keinen
  eigenen Case;
- bestaetigte Reha-Rechnung erzeugt einen Cost-Case, nicht die vorangehende
  Bewilligung;
- mehrere Sozial-/Zusatzversicherungen je Managed Subject, optionale Defaults
  fuer Sozial/Krankenfuersorge, ambulant und stationaer sowie Korrektur dieser
  Defaults;
- ein Default sortiert nur und behauptet weder Deckung noch Zustaendigkeit;
- Policy Record mit und ohne Polizzendokument; importierter Altvertrag ohne
  erfundenen historischen Abschluss-Case;
- mehrere Payer-Fristen, frueheste bestaetigte offene Frist und Erhalt aller
  spaeteren Fristen;
- fehlendes Leistungsdatum erzeugt kein erfundenes Einreichungsdatum;
- ungepruefter Privatprovider/-tarif erzeugt keine automatische Frist;
- automatische Reminder zeigen Regelstand, Quelle und Reviewstatus;
- Eingangsbestätigung, Rueckfrage und Nachforderung halten den
  SV-Einreichungsablauf offen;
  nur bestaetigte Abrechnung/Erstattung oder Ablehnung schlagen im Normalablauf
  den Zusatzversicherungs-Schritt vor;
- Zahlung, SV-Einreichung, Zusatzversicherungs-Einreichung und Case-Lifecycle bleiben
  getrennte, provenance-tragende Zustaende;
- offene Rechnung mit Auszahlung 0 sowie bezahlte Rechnung, Teilzahlung,
  Gutschrift und mehrere bestaetigte Erstattungen;
- Statusaenderung mutiert keinen Betrag; Summen entstehen aus bestaetigten
  Finanz-Facts;
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
- keine erwartete Deckung, Erstattung oder Steuerwirkung in
  Haushaltsfinanzsummen;
- keine Datei- oder Finanzdoppelzaehlung ueber Care-/Cost-Links;
- ein logisches Dokument pro abgeschlossener Scan-Einheit.

## Stop Rules

Stop, wenn:

- eine medizinische Rechnung ohne Care-Anker akzeptiert wird;
- Korrektur, Duplikat, Gutschrift oder Storno derselben Rechnungsidentitaet
  einen neuen Cost-Case erzeugt;
- mehrere eigenstaendig ausgestellte Rechnungen in einen Cost-Case
  zusammengezogen werden;
- der globale Submission-Contract genau eine Datei oder genau eine
  Einreichung pro Cost-Case erzwingt;
- Sozial- oder Zusatzversicherer automatisch zu Subvorgaengen werden;
- ein rein medizinischer Unfall einen leeren Unfall-/Schaden-Wrapper erzeugt;
- `medical_cost_settlement` und `damage_cost_settlement` fachlich verschmolzen
  oder ihre unterschiedlichen Payer-/Einreichungsverlaeufe gleichgesetzt werden;
- die Nutzerin vor dem Dokumenteingang eine Payer-Strategie konfigurieren muss;
- ein Dokumenttyp oder eine Dokumentkombination fuer die Gueltigkeit eines
  Case vorausgesetzt wird;
- schlanke Klassifikation als Ausschluss sinnvoller medizinischer Subtypen
  verstanden oder `medical_invoice` trotz seines Cost-/Einreichungsverhaltens
  pauschal in eine rein generische Rechnung zurueckgestuft wird;
- ein bestaetigter Case als `invalid` oder wegen fehlender Dokumente als
  technisch unvollstaendig persistiert wird;
- eine freie Mehrfachauswahl zur Umwandlung von Dokumenten in einen
  medizinischen Subvorgang fuer M1 vorausgesetzt wird;
- Arzt, Krankenhaus, Diagnostik oder Dauer allein den Care-Case spalten;
- Bewilligung, Ablehnung oder Kostenuebernahme allein einen eigenen
  medizinischen Case oder M1-Dokumenttyp erzeugt;
- Assist Diagnose, Behandlungstag, Kausalitaet, Anspruch, Frist,
  Payer-Reihenfolge oder eine fachliche Beziehung allein aus einem kleinen
  beziehungsweise mittleren General-Purpose-Modell als Wahrheit behauptet;
- Mappm Polizzendeckung, Anspruch, erwartete Erstattung oder Eigenanteil
  berechnet oder prognostiziert;
- eine unbezahlte Rechnung als tatsaechliche Ausgabe gezaehlt wird oder
  Statusfelder Finanzbetraege mutieren;
- Mappm die private Kostenuebersicht als formale
  Einnahmen-Ausgaben-Rechnung bezeichnet;
- Reha, Nachsorge, Kontrolle, Providerwechsel oder spaeteres Dokument
  automatisch einen neuen Care-Case erzeugt;
- Wiederkehr als eigener sichtbarer Medical-Case-Typ oder endloser Mega-Case
  modelliert wird;
- ein Payer-Default einen Einreichungszustand automatisch erzeugt, eine Einreichung
  ausloest oder Eignung/Deckung behauptet;
- ein Providername, Default oder minimaler Policy Record allein eine private
  Frist aktiviert;
- mehrere Payer-Fristen verschmolzen oder durch die frueheste Frist
  ueberschrieben werden;
- ein fehlender Startanker durch Scan-/Importdatum ersetzt wird;
- eine Rule-Aenderung bestehende Fristen oder Reminder still verschiebt;
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
