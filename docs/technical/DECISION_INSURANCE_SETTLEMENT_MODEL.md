---
title: "Entscheidung - Versicherungsabwicklung"
description: "Akzeptiertes Mappm-Kernmodell fuer eine schlanke Versicherungsabwicklung als normaler Case mit wiederholbaren Einreichungen statt eigener Claim-Entitaet"
tags: [decision, product, insurance, cases, submissions, events, policies, matching]
lastUpdated: "2026-07-24"
status: "accepted-core"
owner: "product-concept"
---

# Entscheidung - Versicherungsabwicklung

## Status und Scope

Am 22. Juli 2026 wurde das allgemeine Versicherungsmodell im User-Workshop
akzeptiert. Mappm besitzt **keine eigene Claim-Entitaet**. Eine konkrete,
eigenstaendig verfolgte Abwicklung mit einem Versicherer ist ein normaler
`Case`; eine einzelne Einreichung oder Nachreichung ist ein wiederholbares
Ereignis beziehungsweise ein Workflow-Schritt in diesem Case.

Diese Decision besitzt die fachliche Grenze von `insurance_settlement`
(deutsch: **Versicherungsabwicklung**). Die Katalog-ID und ihr Status bleiben
in `DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` als alleiniger Katalog-SSOT.

Das Modell gilt fuer bestaetigte Versicherungsabwicklungen, insbesondere im
Zusammenhang mit Unfall oder Schaden. Die medizinische Standarderstattung bei
Sozial- und Zusatzversicherung bleibt bewusst als Ablauf im
`medical_cost_settlement` und erzeugt nicht automatisch einen weiteren
Versicherungs-Subvorgang. Medizin wurde nach dieser globalen Vereinfachung
fachlich bestaetigt. Unfall/Schaden bleibt unter OQ-014 im ausdruecklich
gewuenschten Re-Review; bis dahin darf keine entsprechende Implementation ueber
die hier akzeptierte Entitaets- und Kompositionsgrenze hinausgehen.

Polizzen-Record und Versicherungs-/Vertragskontext folgen
`DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md`. Regelbasierte Fristen
folgen `DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`.
Alle Analyse- und Matching-Aussagen folgen
`DECISION_INTELLIGENCE_SCOPE.md`: kleine beziehungsweise mittlere
General-Purpose-Modelle, OCR und Parser liefern grobe Kandidaten, aber keine
fachliche Wahrheit ueber Versicherungskontext, Case-Grenze, Einreichungsstatus,
Deckung, Frist oder Beziehung.

## Nutzerziel

Die Nutzerin soll Unterlagen, Aufgaben, Einreichungen, Rueckfragen und
Ergebnisse einer konkreten Versicherungsabwicklung zusammenhalten koennen,
ohne Claims, Einreichungspakete oder interne Referenzobjekte manuell anzulegen.

Der sichtbare Arbeitskontext kann beispielsweise heissen:

```text
Versicherungsabwicklung mit UNIQA
```

Backend/Core Assist schlaegt einen konservativen editierbaren Titel, grobe
Versicherer- und Referenzkandidaten sowie passende Case-Kandidaten vor.
Beziehungen und naechste Aktionen entstehen aus bestaetigtem Kontext,
konkreter Nutzeraktion oder gepruefter Regel; freie Modellvorschlaege dafuer
sind optional und immer bestaetigungspflichtig. Die Nutzerin bestaetigt oder
korrigiert materielle Zuordnungen.

## Case-Grenze

Es gilt grundsaetzlich **ein Versicherungs-Case pro Versicherer,
Schadens-/Leistungskontext und zusammengehoeriger Abwicklung**. Derselbe Case
darf mehrere Rechnungen, Zahlungsnachweise, Schreiben, Einreichungen,
Nachreichungen, Rueckfragen, Teilzahlungen und Entscheidungen ueber seine
gesamte Laufzeit enthalten.

Weder eine einzelne Rechnung noch jede Einreichung erzeugt einen weiteren
Case. Ein neuer Versicherungs-Case ist erst angebracht, wenn eine
eigenstaendige Abwicklung mit eigenem verstaendlichem Ziel und Ergebnis
bestaetigt ist, zum Beispiel:

- ein anderer Versicherer;
- ein anderes Schadenereignis oder ein anderer Leistungskontext;
- eine separate externe Referenz mit eigenstaendigem Verlauf und Ergebnis;
- eine eigenstaendige Abwicklung unter einer anderen Polizze.

Eine neue Referenznummer allein erzwingt noch keine Trennung. Das Ranking darf
Versicherer, usergesetzten Ausgangskontext, bestaetigte Referenzen, grobe
Dokumentklasse und zeitliche Kandidaten verwenden. Welche Signale der
vorgesehene Modell-/Parser-Stack verlaesslich liefert, prueft das
Backend-/Data-Team. Die materielle Case-Grenze wird in der aktuellen Reifestufe
immer von der Nutzerin bestaetigt.

## Komposition

Eine Versicherungsabwicklung verwendet ausschliesslich die allgemeinen
Mappm-Bausteine:

| Inhalt | Abbildung |
|---|---|
| Versicherungsabwicklung | normaler `Case` |
| Zugehoerigkeit zu Unfall/Schaden oder anderem Ausgangskontext | typisierter `CaseLink`, normalerweise `part_of` oder `related_to` |
| Polizze | langlebiger `Policy Record` mit Versionen und ruhigem Vertragskontext |
| historischer Vertragsabschluss | optionaler abgeschlossener, verknuepfter Abschluss-Case; bei importiertem Bestandsvertrag niemals erfinden |
| Versicherer | `ExternalParty` |
| Schaden-, Geschaefts- oder externe Claim-Nummer | provenienztragender Fact/externe Referenz |
| Einreichung oder Nachreichung | wiederholbares Ereignis/Workflow-Schritt mit Datum und Dokumentlinks |
| noch auszufuehrende Einreichung | Task |
| Rueckfrage, Entscheidung oder Zahlung | Dokument, Event und bestaetigte Facts |
| Rechnung oder Zahlungsnachweis | normales Dokument mit passender Grundart und Case-Beziehung |

Der Begriff `Claim` darf als externe Terminologie, OCR-Alias oder
Originalbezeichnung einer Referenz vorkommen. Er bezeichnet keine Mappm-
Entitaet, kein Matchingziel und keinen eigenen UI-Verwaltungsbereich.

Wenn die Versicherungsabwicklung in der Produktsicht als Subcase eines
Unfall-/Schadenfalls erscheint, bleibt sie technisch ein normaler Case mit
`part_of`-Beziehung. Es gibt weder eine separate Subcase-Entitaet noch eine
weitere Schachtelung pro Einreichung.

## Polizze und Vertragskontext

Eine Polizze ist weder nur ein loses Dokument noch nur ein Case:

- Der `Policy Record` ist die stabile fachliche Identitaet der
  Versicherungsbeziehung.
- Polizze und Nachtraege sind optionale Record-Versionsevidenz.
- Ein tatsaechlich in Mappm begleiteter Vertragsabschluss darf ein eigener
  endlicher Abschluss-Case sein, dessen Ergebnis der Policy Record ist.
- Nach Abschluss bleiben normale Updates, Praemien, Dokumentversionen,
  Fristen, Aufgaben und Kuendigung in einem ruhigen Versicherungs-/
  Vertragskontext.
- Ein importierter Altvertrag braucht keinen erfundenen Abschluss-Case.
- Ein Medical-, Unfall-/Schaden- oder Versicherungsabwicklungs-Case
  referenziert den Record, kopiert ihn aber nicht.

Ein Managed Subject darf mehrere Sozial-, Krankenfuersorge- und private
Versicherungsbeziehungen besitzen. Sichtbare Defaults sind reine
Sortierpraeferenzen; sie beweisen keine Deckung und erzeugen weder diesen Case
noch eine Einreichung oder Frist.

## Wiederholbare Einreichungen

Eine Versicherungsabwicklung darf beliebig viele bestaetigte Einreichungen und
Nachreichungen enthalten. Jede Einreichung ist ein Ereignis mit:

- Zeitpunkt beziehungsweise bekanntem Zeitfenster;
- Versicherer und Abwicklungskontext;
- optionalem bestaetigtem Kanal;
- Verweisen auf die dabei uebermittelten Dokumente;
- optionaler Eingangs- oder Versandbestaetigung;
- Provenienz aus Nutzerangabe, Dokument oder spaeter autorisierter Integration.

Es gibt keinen Case pro Einreichung und keine weitere sichtbare Schachtelung
unter dem Versicherungs-Case. Einreichungen duerfen in einer Timeline oder
einer anderen spaeter definierten ruhigen Darstellung erscheinen; diese
Decision legt keine UI fest.

Keine bestimmte Dokumentzusammenstellung ist erforderlich. Eine weitere
Rechnung oder Unterlage darf derselben Abwicklung nachgereicht werden. Mappm
dokumentiert die bestaetigte Handlung, behauptet aber nicht, dass der
Versicherer die Unterlage akzeptiert oder eine Leistung schuldet.

## Entstehung und Matching

Ein Versicherungs-Case entsteht nicht allein aus einer vorhandenen oder
moeglicherweise passenden Polizze. Er darf vorgeschlagen werden, wenn ein
realer Abwicklungsanlass von der Nutzerin bestaetigt oder als grober Kandidat
zur Bestaetigung vorgelegt wird, insbesondere:

- die Nutzerin will bei einem bestimmten Versicherer einreichen oder bestaetigt
  eine bereits erfolgte Einreichung;
- ein aus- oder eingehendes allgemeines Versicherungsdokument wird von der
  Nutzerin einem Ausgangs-Case zugeordnet oder nach grobem Ranking dafuer
  bestaetigt;
- eine stabile Schaden-/Geschaeftsnummer wird erkannt;
- eine bestehende Versicherungsabwicklung wird durch weitere Evidenz
  fortgesetzt.

Dokumentmatching richtet sich ausschliesslich auf Cases und Records. Es zeigt
gerankte Kandidaten fuer bestehende Versicherungsabwicklungen und immer eine
manuelle Such-/Neuanlageoption. Existiert noch keine bestaetigte passende
Abwicklung, darf Mappm einen neuen `insurance_settlement`-Case mit
konservativem Titel vorschlagen. Eine Beziehung ist ein optionaler,
bestaetigungspflichtiger Zusatzvorschlag. Es gibt kein separates
Claim-Matching.

Eine Polizze darf als moeglicher Record-Link vorgeschlagen werden. Weder
Polizzenbesitz, Laufzeit noch Provider-Matching beweisen Deckung,
Zustaendigkeit, Anspruch oder erwartete Zahlung. Historische Gueltigkeit zum
Ereigniszeitpunkt darf als seltenes Matching-Signal beruecksichtigt werden,
ohne die normale Interaktion zu ueberladen.

Eine passende Polizze kann bereits beim bestaetigten Unfall-/Schadenkontext
als moegliche Verknuepfung vorgeschlagen werden. Der
`insurance_settlement`-Case entsteht dennoch erst aus einem realen
Abwicklungsanlass oder ausdruecklicher Nutzerabsicht.

## Rechnungen, Kosten und Ergebnisse

Mehrere Rechnungen und Zahlungsnachweise duerfen direkt in einer
Versicherungsabwicklung gesammelt und in unterschiedlichen Einreichungen
verwendet werden. Sie erzeugen nicht automatisch jeweils einen
`damage_cost_settlement`-Case.

Ein separater Schadenkosten-Case bleibt nur dann sinnvoll, wenn eine konkrete
wirtschaftliche Verpflichtung unabhaengig von der Versicherungsabwicklung mit
eigenem Zahlungs-, Klaerungs- oder Abschlussziel verfolgt werden soll. Er kann
mit der Versicherungsabwicklung verknuepft werden; Dokumente werden dabei
nicht kopiert.

Rechnungszahlung, Einreichung, Versicherungsentscheidung, Erstattung und
Case-Lifecycle sind getrennte provenienztragende Zustaende beziehungsweise
Ereignisse. Teilzahlungen und mehrere Ergebnisse duerfen vorkommen. Mappm
berechnet keine Deckung, Leistung, Haftung, Erstattungsquote oder erwartete
Zahlung.

Jede provider- oder vertragsabhaengige Einreichungsfrist bleibt eine eigene
provenienztragende Fristinstanz. Mehrere Versicherungen erhalten keine
gemeinsame kuenstliche Frist; die frueheste bestaetigte offene Frist darf nur
als kompakter Attention-Wert erscheinen.

## Lifecycle

Eine Versicherungsabwicklung kann aktiv sein, auf Antwort warten, zur Pruefung
stehen, abgeschlossen oder archiviert sein. Einreichungen sind wiederholbar
und bilden keinen Einbahn-Workflow. Eine spaete Rechnung oder ein allgemeines
Versicherungsdokument darf dem bestehenden abgeschlossenen Case als Evidenz
hinzugefuegt werden. Die feinere Bedeutung als Nachforderung, Entscheidung
oder Zahlung und daraus folgende neue Arbeit wird erst durch Nutzeraktion,
kontextuellen Upload oder Review bestaetigt; erst dann entsteht ein
Wiedereroeffnungsvorschlag.

Ein normaler negativer Bescheid oder eine Rueckfrage bleibt in derselben
Versicherungsabwicklung. Erst ein eigenstaendiger Streit oder ein formelles
Verfahren mit eigenem Ziel und Ergebnis darf als verknuepfter Case entstehen.

## Dokumentklassifikation

Versicherungsschreiben, Schadenmeldung, Rueckfrage, Entscheidung, Gutachten,
Kostenvoranschlag oder andere fachlich erkennbare Unterlagen bleiben
grundsaetzlich allgemeine Dokumente mit konservativem Titel ohne Datum,
bestaetigten Facts, optionalen Parties,
Volltextindex und sparsamer Beziehungsrolle. Ein eigener Dokumenttyp entsteht
nur nach dem dauerhaften Produktwerttest aus
`DECISION_DOCUMENT_TYPE_CATALOG.md`.

`invoice_or_charge` und `payment_record` bleiben sinnvolle allgemeine Typen,
weil sie case-uebergreifend konkrete Zahlungs- und Pruefaktionen tragen. Dieses
Prinzip gilt dauerhaft und nicht nur fuer M1. Spaetere Produktdaten duerfen
weitere Typen begruenden; taxonomische Vollstaendigkeit ist kein Ziel.

## Beispiele

### Mehrere Nachreichungen bei einem Versicherer

```text
Case: Fahrzeugunfall
  Case: Versicherungsabwicklung mit UNIQA
    part_of -> Fahrzeugunfall
    12.07. Schaden gemeldet
    15.07. Werkstattrechnung eingereicht
    22.07. Abschlepprechnung nachgereicht
    28.07. Rueckfrage erhalten
    30.07. weitere Unterlage nachgereicht
    10.08. Teilzahlung erhalten
```

Die Datumszeilen sind Ereignisse, keine weiteren Cases.

### Zwei Versicherer

```text
Case: Fahrzeugunfall
  Case: Versicherungsabwicklung mit UNIQA
    part_of -> Fahrzeugunfall
  Case: Versicherungsabwicklung mit Allianz
    part_of -> Fahrzeugunfall
```

Eine bestaetigte Rechnung darf in beiden Abwicklungen referenziert werden,
ohne die Datei zu duplizieren.

## Noch offene Entscheidungen und Review-Grenze

Diese Decision legt keine konkreten oesterreichischen Provider-Kanaele,
Formulare, Fristen oder Pflichten fest. WF-01/WF-02 und aktuelle offizielle
Quellen bleiben Voraussetzung fuer entsprechende Produktversprechen.

Der gepruefte medizinische Austria-first-Basisscope steht in
`DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md`. Er darf nicht auf allgemeine
Schaden-/Versicherungsabwicklungen uebertragen werden.

Die Unfall-/Schadenfamilie und die medizinische Familie werden nach dieser
Vereinfachung erneut im User-Workshop geprueft. Dabei ist insbesondere zu
entscheiden, wann ein Schadenkosten-Case neben der Versicherungsabwicklung
tatsaechlich Produktwert besitzt und ob die bisherige medizinische Cost-Case-
Granularitaet bestehen bleibt. Das Claim-Modell selbst ist nicht mehr offen.

## Verifikation

Mindestens folgende synthetische Szenarien sind vor Implementation abzudecken:

- eine Versicherungsabwicklung mit keiner, einer und mehreren Rechnungen;
- mehrere zeitlich getrennte Einreichungen und Nachreichungen im selben Case;
- eingehendes Versicherungsschreiben vor bekannter Polizze;
- passende Polizze ohne entstehende Versicherungsabwicklung;
- importierte Polizze erzeugt Policy Record und ruhigen Vertragskontext, aber
  keinen erfundenen Abschluss-Case;
- tatsaechlicher Vertragsabschluss kann einen Policy Record als Ergebnis
  erzeugen;
- zwei Versicherer zum selben Ausgangs-Case;
- dieselbe Rechnung als Evidenz in mehreren bestaetigten Kontexten ohne Kopie;
- separate Referenz, die im selben Case bleibt, und bestaetigt eigenstaendige
  Abwicklung mit neuem Case;
- spaete Evidenz nach Abschluss und bestaetigbare Wiedereroeffnung;
- falscher Versicherer-, Referenz- oder Case-Vorschlag ist korrigierbar;
- generische Versicherungsschreiben bleiben ohne Spezialtyp voll nutzbar.
- mehrere Versicherer behalten getrennte Fristen; der kompakte frueheste Wert
  ueberschreibt keine andere Frist.

## Stop Rules

Stop, wenn:

- `Claim` als eigene Mappm-Entitaet, Repository, Matchingziel oder Pflichtfeld
  eingefuehrt wird;
- die Nutzerin einen Claim oder ein Einreichungspaket manuell strukturieren
  muss;
- pro Rechnung, Schreiben, Einreichung oder Nachreichung automatisch ein Case
  entsteht;
- eine Polizze allein eine Versicherungsabwicklung erzeugt oder Deckung
  behauptet;
- ein Polizzendokument fuer die Gueltigkeit eines Policy Record verpflichtend
  wird;
- ein importierter Bestandsvertrag einen erfundenen Abschluss-Case erhaelt;
- Providername oder Default eine Frist oder Einreichung aktiviert;
- ein kleines oder mittleres General-Purpose-Modell Versicherer,
  Case-Grenze, Einreichungsstatus, Deckung, Frist oder Beziehung als fachliche
  Wahrheit setzt;
- dieselbe externe Referenz ohne fachliche Grenzpruefung Cases zusammenfuehrt
  oder trennt;
- eine bestimmte Dokumentkombination Case-Gueltigkeit oder Einreichung
  technisch erzwingt;
- Mappm Deckung, Haftung, Anspruch oder erwartete Leistung berechnet;
- medizinische Standarderstattung ohne neue fachliche Entscheidung in
  Versicherungs-Subcases zerlegt wird.
