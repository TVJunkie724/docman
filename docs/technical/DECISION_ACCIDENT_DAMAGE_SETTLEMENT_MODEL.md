---
title: "Entscheidung - Unfall-, Schaden- und Schadenkostenregulierung"
description: "Mappm-Kernmodell fuer grobe Unfall-/Schadenvarianten, asynchrones Capture, optionale Schadenkosten, Versicherungsabwicklungen, Bildsammlungen und verknuepfte medizinische Folgen"
tags: [decision, product, accident, damage, theft, insurance, costs, matching, cases, media-collections]
lastUpdated: "2026-07-24"
status: "accepted-baseline-re-review-required"
owner: "product-concept"
---

# Entscheidung - Unfall-, Schaden- und Schadenkostenregulierung

## Status und Scope

Am 21. Juli 2026 wurde das Unfall-/Schaden-Basismodell nach dem vollstaendigen
User-Workshop zur Dokumentation freigegeben. Nach der Vereinfachung des
Versicherungsmodells am 22. Juli 2026 bleibt es die verbindliche
Arbeitsgrundlage, muss aber vor einem Implementation Contract nochmals
gemeinsam fachlich geprueft werden. Diese Decision besitzt bis dahin die
vorlaeufigen fachlichen Grenzen von:

- `accident_or_damage_settlement`: Unfall- oder Schadenregulierung;
- `damage_cost_settlement`: Schadenkostenabrechnung je eigenstaendiger
  wirtschaftlicher Verpflichtung im Unfall-/Schadenkontext;
- den groben fachlichen Varianten Unfall, Fahrzeugunfall, Sachschaden sowie
  Diebstahl/Verlust;
- `Medizinischer Unfall` als sichtbarer Einstieg in `medical_care`, nicht als
  eigener Unfall-Case;
- schadenbezogenen Polizzen- und Versicherungsabwicklungs-Vorschlaegen ohne
  Deckungsbehauptung.

Am 22. Juli 2026 wurde das allgemeine Claim-Modell verworfen. Eine konkrete
Versicherungsabwicklung ist nun ein normaler `insurance_settlement`-Case nach
`DECISION_INSURANCE_SETTLEMENT_MODEL.md`; Einreichungen und Nachreichungen
sind wiederholbare Ereignisse und keine Cases. Die Unfall-/Schadenfamilie wird
nach dieser Vereinfachung auf Wunsch der Nutzerin nochmals fachlich geprueft
und darf vorher nicht als Implementation Contract verwendet werden.

Die kanonischen IDs, deutschen Titel und Katalogstatus bleiben in
`DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` als alleiniger Katalog-SSOT. Dieses
Dokument besitzt das akzeptierte fachliche Verhalten. Konkrete
Oesterreich-/Provider-Workflows, globale Dokumenttypen und UI-Komposition
bleiben ihren eigenen Gates vorbehalten.

Alle Analyse-, Matching- und Vorschlagsaussagen folgen
`DECISION_INTELLIGENCE_SCOPE.md`: Zielplattform sind kleine beziehungsweise
mittlere General-Purpose-Modelle plus OCR/Parser. Sie liefern grobe Kandidaten,
keine fachliche Wahrheit ueber Lebenssachverhalt, Person, Case-Grenze,
Kausalitaet, Workflow-Zustand oder Beziehung.

## Nutzerziel

Nach einem Unfall, einer Schadensentdeckung oder einem Diebstahl soll die
Nutzerin nicht selbst Dokumente nach Polizei, Werkstatt, Versicherung,
Rechnungen und Antworten sortieren muessen. Mappm soll:

- neue Unterlagen ohne Wartepflicht dauerhaft erfassen;
- bekannte Informationen der Nutzerin sofort verwerten;
- Kandidaten fuer einen gemeinsamen Anlass und passende bestehende Kontexte
  vorschlagen;
- Schadenkosten, Versicherungsabwicklungen, Reparatur und erwartete Antworten nachvollziehbar
  verbinden;
- moegliche medizinische oder formelle Folgen zur bestaetigbaren Verknuepfung
  vorschlagen;
- nur die relevanten Zuordnungen und Folgen zur Bestaetigung vorlegen.

Mappm ersetzt weder Notruf, Unfallhilfe, Polizei, Rechtsberatung,
Schadenbegutachtung noch Versicherungsentscheidung. Es berechnet keine Schuld,
Kausalitaet, Haftungsquote, Deckung oder erwartete Versicherungsleistung.

## Ein generischer Case und wenige grobe Varianten

Technisch bleibt jeder Vorgang der generische `Case`. Die folgenden Varianten
sind optionale Fach-/Routingvarianten, keine neuen Domain-Entitaeten und kein
grosser verpflichtender Case-Typ-Picker:

| Fachliche Variante | Abdeckung | Keine weitere eigene Variante fuer |
|---|---|---|
| Unfall | allgemeiner Personen-, Sport-, Haushalts-, Arbeits- oder sonstiger Unfall, soweit der Unfall selbst verwaltet wird | Messerverletzung, Sturz, Sportunfall oder andere konkrete Ursache allein |
| Fahrzeugunfall | Unfall oder Schaden mit Auto, Motorrad, Fahrrad oder anderem Fahrzeugbezug | Parkschaden, Auffahrunfall oder bestimmtes Fahrzeugmodell |
| Sachschaden | Wasser-, Feuer-, Sturm-, Vandalismus-, Haftpflicht- oder sonstiger physischer Schaden | Rohrbruch, Kuechenbrand, Hagel oder konkrete Schadenursache |
| Diebstahl oder Verlust | Gegenstand fehlt; Nachweis, Meldung, Sperre, Ersatz und gegebenenfalls Versicherungsabwicklung | konkrete Gegenstandsart oder Tatbezeichnung |

Wenn keine Variante verlaesslich passt oder die Nutzerin keine waehlt, bleibt
der allgemeine Unfall-/Schaden-Case vollstaendig gueltig. Konkrete Ursachen,
Orte, Gegenstaende und Ereignisarten duerfen Titel, Facts, Parties,
Suchvokabular und spaeter gepruefte Workflowmodule sein, ohne die Varianten zu
vervielfachen.

## Medizinischer Unfall ohne Unfall-Wrapper

`Medizinischer Unfall` ist eine verstaendliche sichtbare Einstiegs- und
Routingvariante des medizinischen Behandlungsfalls. Sie erzeugt standardmaessig
keinen eigenen Unfall-/Schaden-Case.

Beispiel:

```text
Sichtbarer Einstieg: Medizinischer Unfall

Medical Care: Schnittverletzung an der Hand
  Anlass/Cause Fact: Unfall
  Ereignisdatum, soweit bestaetigt
  Arztbrief/Befund
  optional: medical_cost_settlement fuer eine Arztrechnung
```

Das medizinische Kostenmodell bleibt vollstaendig unter
`DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`. Es wird nicht zu einem
generischen Kostenmodell und nicht mit `damage_cost_settlement` verschmolzen.
Sein spezifischer Payer-Verlauf erlaubt insbesondere Sozialversicherung und
Zusatzversicherung als getrennte optionale Einreichungsablaeufe; keine Stufe ist pauschal
verpflichtend.

Ein zusaetzlicher Unfall-/Schaden-Case entsteht erst, wenn der Unfall selbst
einen relevanten eigenstaendigen Verlauf erhaelt, etwa:

- nichtmedizinische Versicherungsmeldung oder bestaetigte
  Versicherungsabwicklung;
- Arbeitsunfallmeldung oder anderer bestaetigter Meldeverlauf;
- Sachschaden, Gegenpartei, Polizei oder eigenstaendige Evidenzsammlung;
- ausdrueckliche Absicht der Nutzerin, den Unfall selbst zu verwalten.

Dann wird der bereits bestehende `medical_care`-Case ueber `caused_by` mit dem
Unfall-/Schaden-Case verknuepft. Er wird nicht verschoben, dupliziert oder in
einen Wrapper umgewandelt.

## Case-Grenze: ein Anlass, ein Regulierungsrahmen

Der fachliche Anker ist ein Unfall-/Schadenanlass. Das ist:

- ein bekanntes Ereignis;
- die erste bestaetigte Entdeckung eines Schadens, wenn Ursache oder genauer
  Zeitpunkt unbekannt sind;
- eine bestaetigte Behauptung, dass die Nutzerin, eine verwaltete Person oder
  Organisation einen Schaden verursacht oder erlitten hat;
- ein bestaetigter Diebstahl-/Verlustkontext mit eigenem Recovery-Verlauf.

Der Case ist auch dann gueltig, wenn Ursache, Schuld, Deckung, Schadenhoehe oder
exakter Ereigniszeitpunkt unbekannt beziehungsweise strittig sind. Diese Daten
sind keine Case-Invarianten und duerfen nicht erfunden werden.

Mehrere betroffene Personen, Gegenparteien, Assets, Schadenpositionen,
Versicherer, Schadenkosten, Versicherungsabwicklungen, Angebote, Reparaturen und Zahlungen bleiben
grundsaetzlich in demselben Regulierungsrahmen, wenn sie demselben Anlass
zugeordnet sind. Ein unabhaengiges spaeteres Ereignis erzeugt einen neuen Case.

Polizei, Werkstatt, Versicherer, Gutachter, Hausverwaltung, Vermieter,
Gegenpartei oder Krankenhaus sind External Parties beziehungsweise Actors und
nicht allein deshalb eigene Cases.

## Asynchrones Capture und optionale Vorabinformationen

Der Normalweg beginnt global. Verarbeitung kann Sekunden oder Minuten dauern;
die Nutzerin darf die App nach dauerhafter Erfassung verlassen und weitere
Dokumente erfassen. Capture blockiert nie auf OCR, Klassifikation, Matching
oder Titelgenerierung.

Automatische Analyse und Matching bleiben immer aktiv. Optional darf die
Nutzerin vor Abschluss der Erfassung bereits bekannte Informationen mitgeben:

- Dokumentgrundart und sinnvoller Subtyp beziehungsweise semantische Variante;
- bestaetigte Facts, etwa `bezahlt` oder eine gewuenschte Steuerpruefung;
- Managed Subject beziehungsweise verwaltete Organisation;
- ausdrueckliche Absicht fuer einen neuen Case;
- bewusste Zuordnung zu einem bestehenden Case;
- groben fachlichen Kontext beziehungsweise Routingvariante.

Diese Kategorien sind Produktdatenachsen, keine Vorgabe fuer Bezeichnung,
Controls oder konkrete Screenstruktur. Die spaetere UI darf sie kompakt und
kontextuell darstellen, aber weder ein Pflichtformular noch einen grossen
Taxonomie-Picker daraus machen.

Usergesetzte Werte tragen User-Provenienz und sind fuer den gewaehlten
Verwaltungskontext autoritativ. Assist darf unabhaengige grobe Kandidaten
ergaenzen, aber keine semantische Widerspruchs-, Falschprofil-,
Falschdokument- oder Falsch-Case-Pruefung behaupten. Eine ausdrueckliche
neue-Case-Absicht verhindert weder Analyse noch bestehende und zusaetzliche
Matching-Vorschlaege.

## Case-Entstehung und Matching

Ein Unfall-/Schaden-Case benoetigt kein bestimmtes erstes Dokument. Er kann
entstehen aus:

- ausdruecklicher neuer-Case-Absicht mit Unfall-/Schadenkontext;
- einem bestaetigten starken Dokument- oder Bildnachweis;
- einem nach Verarbeitung bestaetigten neuen Case-Vorschlag;
- spaeterer Bottom-up-Komposition, wenn mehrere bereits erfasste Kontexte einen
  gemeinsamen Schadenanlass belegen.

Geplante Matching-Signale sind insbesondere:

- Schaden-, Geschaefts-, Akten-, Polizei- oder andere stabile Referenznummer;
- bestaetigtes Ereignis-/Entdeckungsdatum zusammen mit Asset, Adresse,
  Kennzeichen oder Beteiligten;
- explizite Referenz auf einen bestehenden Schaden, eine
  Versicherungsabwicklung oder eine Polizze;
- konsistente Gegenpartei-, Werkstatt-, Gutachter- oder Versichererangaben;
- Inhalt, der einen erwarteten Versicherungs-, Schadenkosten- oder Reparaturschritt
  fortsetzt.

Welche dieser Signale auf dem vorgesehenen Modell-/Parser-Stack verlaesslich
extrahiert und gewichtet werden koennen, ist vor Implementation vom
Backend-/Data-Team mit synthetischen und realistischen Fixtures zu pruefen.
Nicht verfuegbare Signale verschlechtern nur das Ranking; sie machen Capture
oder den Case nicht ungueltig.

Zeitliche Naehe, derselbe Versicherer, dieselbe Werkstatt, eine generische
Rechnung, ein Foto ohne Kontext oder dasselbe Asset beweisen allein keinen
gemeinsamen Unfall-/Schaden-Case. Eine Werkstattrechnung beweist keinen Unfall.

Assist zeigt auch bei niedriger Confidence die besten Kandidaten und laesst
neuen beziehungsweise bestehenden Case waehlen. In der aktuellen Reifestufe
bestaetigt die Nutzerin materielle Zuordnungen. Spaetere Automatisierung folgt
den allgemeinen klassenbezogenen Quality-, Abstention- und Undo-Gates.

Backend/Core Assist schlaegt einen neutralen editierbaren Titel vor, zum
Beispiel:

- `Fahrzeugunfall`;
- `Wasserschaden in der Kueche`;
- `Schnittverletzung an der Hand` fuer den direkten Medical Care;
- `Diebstahl des Fahrrads`.

Automatisch vorgeschlagene Titel enthalten standardmaessig kein Datum und
duerfen keine unbestaetigte Ursache, Schuld, Deckung oder Schadenhoehe
behaupten.

## Komposition und Beziehungen

### Im Unfall-/Schaden-Case

Folgende Inhalte bleiben Steps, Branches, Tasks, Events, Facts,
Dokumentlinks oder Schadenkosten und erzeugen nicht allein einen Case:

- Unfallaufnahme und Ereignisevidenz;
- bedingte Polizeibeteiligung;
- Gegenparteien und Zeugen;
- Schadenmeldung, Rueckfrage und Nachreichung;
- Besichtigung, Gutachten und Kostenvoranschlag;
- Reparatur, Ersatz und Wiederherstellung;
- Versicherungsentscheidung, Zahlung und Abschlussbestaetigung.

Eine eigenstaendig verfolgte Abwicklung mit einem Versicherer darf dagegen
ein normaler `insurance_settlement`-Case `part_of` dieses Unfall-/Schaden-Case
werden. Mehrere Einreichungen oder Nachreichungen bleiben Ereignisse in diesem
Versicherungs-Case und erzeugen keine weitere Schachtelung.

### `part_of`: Schadenkosten

Jeder `damage_cost_settlement`-Case ist ein normaler Case und ueber `part_of`
Bestandteil des Unfall-/Schaden-Case. Er besitzt eine eigenstaendige
wirtschaftliche Verpflichtung und einen eigenen Zahlungs-/Regulierungsverlauf.

### `caused_by`: medizinische Folgen

Ein eigenstaendiger medizinischer Behandlungsfall wird ueber `caused_by`
verknuepft. Nur bestaetigte Evidenz oder ausdrueckliche Absicht rechtfertigt die
Kausalbeziehung; zeitliche Naehe allein reicht nicht.

### Weitere eigenstaendige Folgen

Ein formelles Behoerden-/Gerichtsverfahren, ein bewusst begonnener
Deckungs-/Haftungsstreit oder ein langfristiges eigenstaendiges
Wiederherstellungsprojekt darf als verknuepfter Case entstehen, wenn es ein
eigenes verstaendliches Ziel, einen eigenen Lifecycle und ein eigenes Ergebnis
besitzt. Normale Ablehnung, Rueckfrage oder Reparatur bleiben zunaechst im
bestehenden Case beziehungsweise Workflow-Branch.

Abschluss, Archivierung oder Wiedereroeffnung kaskadiert nie zwischen
verknuepften Cases.

## Schadenkostenabrechnung

`damage_cost_settlement` bleibt fachlich getrennt von
`medical_cost_settlement`. Ein normaler `part_of`-Schadenkosten-Case kann je
eigenstaendiger wirtschaftlicher Verpflichtung im Unfall-/Schadenkontext
entstehen, wenn ihr Zahlungs-, Einreichungs-, Erstattungs- oder
Klaerungsverlauf separat nachvollzogen werden soll.

Beispiele sind:

- Abschlepprechnung;
- Werkstatt- oder Reparaturrechnung;
- Mietwagenrechnung;
- Installateur-, Trocknungs- oder Malerrechnung;
- Ersatz- oder Wiederherstellungskosten mit eigenem Beleg und Verlauf.

Mehrere Dokumente koennen dieselbe Verpflichtung belegen:

```text
Damage Cost Settlement: Installateurrechnung
  Rechnung
  Zahlung oder Direktzahlung, soweit vorhanden
  Zahlungsnachweis
  Korrektur/Gutschrift
  Versicherungsentscheidung und zugeordnete Erstattung
```

Ein Schadenkosten-Case ist immer gueltig und setzt weder eine Rechnung noch
Zahlung, Versicherungsabwicklung oder Erstattung als Pflichtdokument voraus. Dokumente liefern
Evidenz; Zustaende werden jedoch erst durch Userbestaetigung, eine bereits
eindeutig benannte kontextuelle Nutzeraktion oder eine autorisierte Integration
mit Provenienz gesetzt. Ein spaeteres Dokument allein aendert keinen Zustand.

Nicht jede Rechnung in Mappm erzeugt einen Schadenkosten-Case. Periodische
Abo-/Vertragsrechnungen bleiben im Vertrags-Record-Kontext. Eine
Schadenkostenabrechnung setzt den bestaetigten Unfall-/Schadenkontext und die
eigenstaendige wirtschaftliche Verpflichtung voraus.

## Polizzen, Versicherungsabwicklungen und mehrere Kosten

Polizzen bleiben langlebige Records. Bei Fahrzeugunfall, Sachschaden,
Diebstahl/Verlust oder anderem Schaden darf Mappm passende Polizzen und bereits
existierende Versicherungsabwicklungen vorschlagen anhand von:

- Managed Subject beziehungsweise verwalteter Organisation;
- Asset, Fahrzeug, Adresse oder Gegenstand;
- Ereignis-/Entdeckungszeitraum;
- Provider und bestaetigten Referenznummern;
- explizit gepflegten Defaults oder bestehenden Beziehungen.

Aktuell aktive Polizzen werden im Normalfall priorisiert. Die Gueltigkeit zum
bestaetigten oder vermuteten Ereigniszeitpunkt bleibt als seltenerer
Hintergrundfall matchbar, damit ein inzwischen beendeter Vertrag fuer einen
aelteren Schaden nicht verloren geht. Diese Logik darf die normale Interaktion
nicht mit historischen Details ueberladen.

Jeder Vorschlag ist nur eine moegliche Beziehung. Er behauptet weder
Zustaendigkeit noch Deckung oder erwartete Leistung. Mehrere Polizzen und
mehrere bestaetigte Versicherungsabwicklungen sind erlaubt; ein User-Default
sortiert nur.

Eine Versicherungsabwicklung kann mehrere Rechnungen und mehrere optionale
Schadenkostenabrechnungen betreffen. Sie wird nicht pro Rechnung oder
Einreichung dupliziert:

```text
Case: Wasserschaden
  part_of: Schadenkosten Installateur
  part_of: Schadenkosten Trocknung
  part_of: Schadenkosten Maler

  Case: Versicherungsabwicklung mit Haushaltsversicherung
    part_of -> Wasserschaden
    betrifft alle drei bestaetigten Schadenkosten
```

Einreichungsereignisse, Zahlung der Rechnung, Versicherungsentscheidung,
Erstattung und Case-Lifecycle bleiben getrennte provenienztragende Zustaende.

## Lifecycle und Zustandsdimensionen

Unfall, Fahrzeugunfall, Sachschaden und Diebstahl/Verlust besitzen keinen
starren gemeinsamen Einbahn-Workflow. Getrennt zu halten sind:

- Case-Lifecycle: `active`, `waiting`, `review`, `done`, `archived`;
- Anlass-Facts: Ereignis/Entdeckung, Ort, Beteiligte und betroffene Assets;
- Versicherungsabwicklung: aktiv, wartend, zur Pruefung, abgeschlossen oder
  archiviert; darin wiederholbare Einreichungs-/Nachreichungsereignisse;
- Reparatur/Wiederherstellung: Pruefung, Angebot, beauftragt, in Arbeit,
  abgeschlossen oder bewusst nicht ausgefuehrt;
- Schadenkosten: Verpflichtung, Zahlung, Erstattung und verbleibender Betrag;
- Tasks, Fristen, Termine und erwartete Antworten.

Ein Case kann auf eine Versicherungsantwort warten, waehrend die Reparatur
abgeschlossen und eine Rechnung bereits bezahlt ist. Keine Dimension ersetzt
alle anderen.

Die Nutzerin darf den Case bewusst abschliessen, wenn keine fuer sie relevante
Arbeit mehr offen ist. Optionale Abschlussgruende koennen reguliert, selbst
erledigt, nicht weiterverfolgt oder an eigenstaendige Folgen uebergeben sein.
Abschluss und Archivierung bleiben reversibel.

Spaet eintreffende Evidenz darf nach Review ohne Wiedereroeffnung verknuepft
werden, wenn sie nur den Verlauf bestaetigt. Neue Arbeit fuehrt zu einem
bestaetigbaren Vorschlag fuer Wiedereroeffnung oder einen neuen verknuepften
Case.

## Dokumenttypen, Subtypen und Rollen

Die dauerhafte Grundregel ist minimal ausreichende Klassifikation, nicht eine
M1-Uebergangsloesung. Sinnvolle Subtypen/Varianten bleiben erhalten, wenn sie
Matching, Workflow, Aufgaben, Zustaende, spaetere Nutzung oder Handoff
materiell verbessern. Erkennbare Begriffe werden aber nicht allein deshalb zu
Typen.

Fuer den aktuellen Unfall-/Schadenkern gilt:

| Inhalt | Disposition |
|---|---|
| Rechnung | `invoice_or_charge`; traegt case-uebergreifende Zahlungs-, Pruef- und Einreichungsaktionen |
| Zahlungsnachweis | `payment_record`; traegt case-uebergreifende Zahlungs- und Abgleichsaktionen |
| Unfallbericht, Schadenmeldung, Polizeidokument, Versicherungsentscheidung, Gutachten, Kostenvoranschlag, Diebstahls-/Verlustanzeige | allgemeines Dokument mit generiertem Titel, Facts, Parties, Volltextindex und sparsamer Case-Rolle; spaetere Spezialisierung nur nach Produktwerttest |
| Reparaturrechnung | normale `invoice_or_charge` mit konkretem Titel und Schadenkontext; `repair_invoice` ist aktuell kein eigener Typ |
| Unfall-/Schadenfotos | unveraenderte Bildquellen in einer optionalen benannten Case-lokalen Bildsammlung; kein Dokumenttyp pro Bild |

Weitere Typen werden waehrend der Case-Familienreviews einzeln ergaenzt, wenn
der dauerhafte Produktwert nachgewiesen ist. Es gibt weder eine pauschale
Subtyp-Sperre noch das Ziel, jede fachliche Bezeichnung zu persistieren.

## Benannte Bildsammlung

Zusammengehoerige Unfall-/Schadenbilder duerfen als benannte, editierbare
Case-lokale Galerie beziehungsweise Bildsammlung dargestellt werden. Die
Originalbilder bleiben eigenstaendige unveraenderte Quellen; die Sammlung
dupliziert sie nicht und blaest nicht jedes Bild zu einem sichtbaren Dokument
auf.

Die Sammlung ist weder Case noch Subcase noch Dokumenttyp. Eine bewusst
gemeinsam aufgenommene Serie darf sofort als Sammlung behandelt werden.
Backend/Core Assist darf fuer global erfasste Bilder Titel und Gruppierung
vorschlagen, wenn der Backend-Feasibility-Gate dies traegt. Die Nutzerin kann
Bilder hinzufuegen, entfernen, neu zuordnen und exportieren. Das Aufloesen
einer Sammlung loescht keine Originale.

Eine bewusst gemeinsam aufgenommene Serie ist ein starkes Gruppierungssignal.
Bei global erfassten Bildern darf Mappm eine Sammlung vorschlagen; zeitliche
Naehe allein finalisiert sie nicht. Standort-, Zeit- und Geraetedaten sind
sensible Facts und beweisen nicht automatisch Ereignisort oder -zeit. Der
technische Contract entscheidet spaeter, ob die Persistenz als eigene
Media-Collection oder als gruppierte Sicht ueber normale Links erfolgt.

Das Muster ist auch fuer Wasserschaden, Wohnungsuebergabe, beschaedigte
Lieferung sowie Vorher-/Nachher-Dokumentation wiederverwendbar.

## Aufgaben und Zeit

Aufgaben entstehen nur aus einer bestaetigten Proposition, einer
ausdruecklichen beziehungsweise kontextuellen Nutzeraktion oder einem
geprueften Country-/Provider-Pack. Ein Dokument allein aktiviert keine
fachliche Aufgabe. Beispiele:

- Schaden melden oder Einreichung vervollstaendigen;
- fehlende Evidenz oder Kostenvoranschlag beschaffen;
- auf Rueckfrage antworten oder Unterlagen nachreichen;
- Besichtigung oder Reparaturtermin wahrnehmen;
- Rechnung bezahlen beziehungsweise Zahlung pruefen;
- Entscheidung und Erstattung einer Schadenkostenabrechnung zuordnen;
- nach bestaetigtem medizinischem Dokument einen Medical Care pruefen.

Ereigniszeit, Entdeckungszeit, Dokumentdatum, Frist, Besichtigung,
Reparaturtermin, Faelligkeit, Zahlung und Erstattung bleiben getrennte
zeitliche Facts. Gesetzliche oder vertragliche Fristen werden nur aus
Userangabe oder aktuellem versioniertem Country-/Provider-Pack behauptet.

## Laender- und Providergrenze

Der universelle Kern umfasst Anlass, Evidenz, Parties, Assets,
Versicherungsabwicklungen, Schadenkosten, Reparatur/Wiederherstellung, Tasks
und verknuepfte Folgen. Er
kennt keine weltweit einheitliche Polizei-, Versicherungs-, Behoerden- oder
Fristenpflicht.

Oesterreichische Varianten fuer Verkehrsunfall, Arbeitsunfall, Haushalts-,
Haftpflicht-, Sachschaden, Diebstahl oder Verlust werden erst nach WF-01/WF-02
mit aktuellen offiziellen Quellen aktiviert. Country-/Provider-Packs duerfen
Terminologie, belegte Pflichten, Kanaele, Fristen und erwartete Antworten
definieren. Sie duerfen keinen neuen globalen Case-Typ nur fuer Formular,
Versicherung, Ursache oder Behoerde erzeugen.

## Trust, Sicherheit und Produktgrenzen

Unfall-/Schadenfaelle koennen Standortdaten, Kennzeichen, Gesundheitsbezug,
Polizeidokumente, Kontaktdaten Dritter, Bankdaten, Fotos privater Raeume und
rechtlich sensible Aussagen enthalten. Dateien, Metadaten, Vorschlaege und
Beziehungen folgen den akzeptierten Vault-, Assist-, Privacy- und
Berechtigungsgrenzen.

Mappm darf insbesondere nicht:

- Notfall- oder Sicherungsmassnahmen als verlaesslich erledigt behaupten;
- Schuld, Kausalitaet oder Haftungsquote feststellen;
- Versicherungsdeckung, Anspruch oder erwartete Leistung berechnen;
- Meldung, Anerkennung, Abfindung, Zahlung oder externe Einreichung ohne
  ausdrueckliche Freigabe absenden;
- medizinische, polizeiliche oder rechtliche Folgen nur aus zeitlicher Naehe
  erzeugen;
- fremde Kontaktdaten zweckwidrig wiederverwenden;
- sensible Titel oder Details ungeprueft in Benachrichtigungen, Logs oder
  Telemetrie ausgeben.

## Beispiele

### Medizinischer Unfall ohne Wrapper

Eine Schnittverletzung wird als `medical_care` mit Unfall-Fact gefuehrt. Eine
Arztrechnung erzeugt den medizinischen `medical_cost_settlement`. Ohne
eigenstaendige Unfallabwicklung entsteht kein Unfall-/Schaden-Case.

### Fahrzeugunfall mit Reparatur und Behandlung

```text
Case: Fahrzeugunfall
  Bildsammlung: Unfallfotos
  Case: Versicherungsabwicklung mit Kaskoversicherung
    part_of -> Fahrzeugunfall
    Rechnung Abschleppdienst
    Rechnung Werkstatt
    mehrere Einreichungs-/Nachreichungsereignisse
  caused_by-link von: Medical Care Knieverletzung
    part_of: Medical Cost Settlement Arztrechnung
```

Polizei, Werkstatt und Versicherer bleiben Parties. Die medizinische
Kostenabrechnung wird nicht in eine Schadenkostenabrechnung umgewandelt.

### Wasserschaden mit mehreren Rechnungen

```text
Case: Wasserschaden
  Bildsammlung: Schaden in Kueche und Vorraum
  Case: Versicherungsabwicklung mit Haushaltsversicherung
    part_of -> Wasserschaden
    Rechnung Installateur
    Rechnung Trocknung
    Rechnung Maler
    mehrere Einreichungs-/Nachreichungsereignisse
```

Die Ursache `Rohrbruch` bleibt Fact/Titel und erzeugt keinen eigenen Case-Typ.

### Spaet erkannter gemeinsamer Anlass

Zuerst wird eine bezahlte Installateurrechnung erfasst. Spaeter trifft ein
Versicherungsschreiben ein. Nach Analyse darf Mappm einen gemeinsamen
Sachschaden-Case, eine Versicherungsabwicklung und einen optionalen
Polizzenlink vorschlagen. Ein Schadenkosten-Case wird nur zusaetzlich
vorgeschlagen, wenn die wirtschaftliche Verpflichtung unabhaengig verfolgt
werden soll. Die Nutzerin bestaetigt die materielle Struktur.

### Diebstahl oder Verlust

Anzeige, Eigentumsnachweis, Sperrbestaetigung und Ersatzunterlagen bleiben in
einem Diebstahl-/Verlust-Case. Eine eigenstaendige Versicherungsabwicklung
wird als normaler verknuepfter Case gefuehrt. Identitaetsmissbrauch oder
Kontobetrug mit eigenem Security-/Recovery-Ziel wird nicht allein wegen eines
gestohlenen Gegenstands in diese Familie gezwungen.

## Implementation und Release Gates

Der fachliche Kern ist akzeptiert. Vor Implementation bleiben erforderlich:

- OQ-011 fuer finale Dokumentgrundarten und Varianten einschliesslich
  Unfallbericht, Schadenmeldung, Reparaturrechnung und weitere Kandidaten;
- WF-01/WF-02 fuer konkrete Austria-first- und Provider-Workflows;
- Domain-/Data-/Contract-Entscheidung fuer `damage_cost_settlement`,
  `insurance_settlement`, wiederholbare Einreichungsereignisse,
  Polizzenkandidaten, Bildsammlung und Provenienz;
- Phase-as-Implementation-Contract fuer konkrete UI, State, Offline-
  Verhalten, Accessibility, Tests und Handoff;
- synthetische Fixtures, keine privaten Echtdokumente.

## Verifikation

Vor Implementation werden mindestens synthetisch geprueft:

- medizinischer Unfall ohne Unfall-Wrapper;
- spaeter entstehender Unfall-Case mit Link zum bestehenden Medical Care;
- Fahrzeugunfall mit und ohne Polizei;
- Sachschaden mit unbekannter Ursache und unbekanntem Ereignisdatum;
- Diebstahl/Verlust mit Meldung, Sperre, Ersatz und optionaler
  Versicherungsabwicklung;
- ein Anlass mit mehreren Assets, Parteien, Polizzen und
  Versicherungsabwicklungen;
- eine Versicherungsabwicklung mit mehreren Rechnungen und wiederholten
  Einreichungen/Nachreichungen;
- mehrere Versicherungsabwicklungen fuer denselben Ausgangs-Case ohne
  Dokumentduplikation;
- Rechnung, Zahlungsnachweis, Gutschrift und Erstattung fuer eine Verpflichtung;
- reine Reparaturrechnung ohne bestaetigten Schadenbezug;
- optionale Userwerte fuer Typ/Subtyp, bezahlt und neuen/bestehenden Case
  bleiben autoritativ; Assist darf weitere Kandidaten zeigen, aber keinen
  semantischen Widerspruch behaupten;
- App-Verlassen und Neustart waehrend mehrminuetiger Verarbeitung;
- aktuelle Polizze sowie seltener historischer Gueltigkeitsfall;
- normale Versicherungsablehnung versus eigenstaendiger Streit;
- spaete Evidenz nach Abschluss;
- falsches Matching durch gleiche Werkstatt, Versicherung oder zeitliche Naehe;
- generischer Unfall-/Schaden-Case ohne genauer Variante.

## Stop Rules

Stop, wenn:

- `Medizinischer Unfall` einen leeren Unfall-Wrapper erzeugt, obwohl nur der
  medizinische Verlauf verwaltet wird;
- `medical_cost_settlement` und `damage_cost_settlement` zu einem fachlich
  generischen Kosten-Case verschmolzen werden;
- der medizinische SV-/Zusatzversicherungsablauf auf Schadenkosten oder ein
  schadenbezogener Versicherungsablauf auf medizinische Kosten uebertragen wird;
- pro Polizei, Werkstatt, Dokument, Rechnung oder Einreichung ein Case entsteht;
- fuer denselben Versicherer und dieselbe zusammengehoerige Abwicklung ein
  Versicherungs-Case pro Rechnung oder Nachreichung dupliziert wird;
- jede Rechnung in Mappm statt nur eine bestaetigte eigenstaendige
  Schadenverpflichtung im Schadenkontext einen `damage_cost_settlement` erzeugt;
- Dokumenttyp, Rechnung, Zahlung, Versicherungsabwicklung oder Erstattung fuer Case-Gueltigkeit
  verpflichtend wird;
- Unfall-, Fahrzeug-, Sachschaden- und Diebstahlvarianten in Park-, Feuer-,
  Wasser-, Sturm- oder andere Kleinsttypen explodieren;
- sinnvolle Dokumentsubtypen mit Verweis auf eine kleine Taxonomie pauschal
  entfernt oder unnuetze Kombinationstypen aus Provider/Land/Status erzeugt
  werden;
- eine Polizzenverknuepfung Deckung, Zustaendigkeit oder Leistung behauptet;
- ein historischer Polizzen-Randfall die normale Interaktion ueberlaedt;
- Userwerte still durch Assist ueberschrieben werden;
- ein kleines oder mittleres General-Purpose-Modell Person, Case-Grenze,
  Kausalitaet, Workflow-Zustand, Frist oder Beziehung als fachliche Wahrheit
  setzt;
- Capture auf OCR/Assist wartet oder optionale Vorabinformationen zu einem
  Pflichtformular werden;
- Polizei-, Melde- oder Fristenregeln ohne aktuellen Country-/Provider-Nachweis
  global gelten;
- offene Contract-, Dokumentkatalog-, AT-Pack- oder UI-Details durch diese
  Fachentscheidung implizit festgelegt werden.
