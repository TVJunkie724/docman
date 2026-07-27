---
title: "Entscheidung - Wiederkehrende Vertraege, Abos und Polizzenkontexte"
description: "Produktmodell fuer Vertraege, Abos, Polizzen, Abschluss-Cases, Record-Versionen, wiederkehrende Rechnungen, Fristen und ruhige Vertragskontexte"
tags: [decision, product, contracts, subscriptions, records, invoices, reminders, insights]
lastUpdated: "2026-07-24"
status: "accepted"
owner: "product-concept"
---

# Entscheidung - Wiederkehrende Vertraege, Abos und Polizzenkontexte

## Status

Als Produktrichtung am 14. Juli 2026 akzeptiert und am 23. Juli 2026 um die
explizite Beziehung zwischen Vertragsabschluss-Case, dauerhaftem Record und
ruhigem Vertragskontext ergaenzt. Exakte Commercial-1.0-Kategorien sowie
laender-, provider- und tarifabhaengige Fristregeln bleiben phasen- und
packgebunden.

## Entscheidung

Ein wiederkehrender Vertrag oder ein Abo ist ein erstklassiger `Record` mit
einem ruhigen Produktkontext, der aktuelle Facts, Versionen, wiederkehrende
Rechnungen, Verlauf, Aufgaben und Workflow-Fortschritt zusammenfuehrt.
Nutzerinnen erhalten nicht fuer jede Rechnung oder gewoehnliche
Lebenszyklusaktion einen neuen Case.

Die UI zeigt ein gemeinsames Vertrags-/Abo-Detail, auch wenn das Modell
darunter trennt:

- den langlebigen `Record` und seine Versionen;
- bei Bedarf einen laenger laufenden Case-/Workflow-Kontext;
- Dokumente und wiederkehrende Rechnungen;
- Aufgaben, Reminder, Events und Finanz-Facts;
- eigenstaendig bedeutende Streit-/Folgeverfahren als verknuepfte Cases.

Abschluss, Aktivierung, gewoehnliche Aenderungen, Preisaenderungspruefung,
Kuendigung und Endabrechnung sind Phasen oder Zweige desselben
Vertragskontexts. Ein separater verknuepfter Case entsteht erst, wenn ein
Streit oder eine andere Arbeit ein eigenes Ziel und einen eigenen Lebenszyklus
erhaelt.

## Vertragsabschluss, Record und ruhiger Kontext

Record und Case schliessen einander nicht aus:

```text
Case: Zusatzversicherung abschliessen
  Angebot
  Antrag
  Gesundheitsfragen
  Annahme
  Polizze

  Ergebnis -> Policy Record

Ruhiger Versicherungs-/Vertragskontext
  aktueller Policy Record
  Polizzenversionen und Nachtraege
  Praemien, Aufgaben, Fristen und Reminder
  gewoehnliche Aenderungen
  spaetere Kuendigung und Endabrechnung
```

Der Abschluss-Case besitzt das endliche Ziel, den Vertrag abzuschliessen oder
bewusst nicht abzuschliessen. Der daraus entstehende Record besitzt die
dauerhafte fachliche Identitaet des Vertrags beziehungsweise der Polizze.

Nach Abschluss:

- bleibt der Record mit stabiler ID bestehen;
- darf der abgeschlossene Abschluss-Case als Historie verknuepft bleiben;
- landen normale Nachtraege, Deckblatt-/Tarifupdates, Praemieninformationen und
  Adressaenderungen im selben ruhigen Vertragskontext;
- erzeugt nicht jedes Update einen neuen Case;
- entsteht ein neuer verknuepfter Case nur fuer eigenstaendig bedeutende
  Arbeit wie Streit, formelles Verfahren oder eine getrennte
  Versicherungsabwicklung.

Wird ein bereits bestehender Vertrag erstmals in Mappm importiert, werden ein
minimaler Record und ein ruhiger Vertragskontext angelegt. Mappm erfindet
keinen historischen Abschluss-Case, der nie in der App stattgefunden hat.

## Policy Record

Eine Polizze folgt demselben Grundmodell wie andere Vertraege, erhaelt aber
einen `Policy Record` als langlebige Versicherungsidentitaet. Er kann
mindestens halten:

- Provider/Versicherer und Managed Subject;
- Polizzennummer beziehungsweise stabile Referenz;
- Versicherungs-/Leistungsbereich;
- bestaetigten Status und optionale Gueltigkeit;
- aktuelle und historische Polizzen-/Nachtragsversionen;
- Verknuepfung zum ruhigen Vertragskontext und zu relevanten Cases.

Ein Polizzendokument ist optionale Evidenz, keine Gueltigkeitsvoraussetzung.
Ohne Dokument darf ein minimaler, nutzerbestaetigter Policy Record bestehen.

Ein medizinischer Kosten-Case, Unfall-/Schaden-Case oder eine allgemeine
Versicherungsabwicklung referenziert den stabilen Policy Record. Er kopiert
die Polizze nicht und aendert den Record nicht ohne einen bestaetigten
Updatevorgang.

## Unterstuetzte Kategorien

- Streaming, Medien und Software;
- Mobilfunk, Internet und Telekommunikation;
- Energie und Haushaltsdienste;
- Versicherungen und Mitgliedschaften;
- Fitness, Freizeit, Bildung und Betreuung;
- Miete, Leasing und andere wiederkehrende Leistungen.

Kategoriespezifische Facts sind optional und werden progressiv offengelegt.
Mappm zeigt keine buchhaltungsartige Konfigurationsoberflaeche.

## Kern-Facts

Das Modell darf halten:

- Provider und Managed Subject;
- Produkt/Tarif und Kundenreferenz;
- Beginn, Mindestlaufzeit und Status;
- Abrechnungsrhythmus: monatlich, quartalsweise, jaehrlich oder frei;
- Verlaengerungsregel und naechste Verlaengerung;
- Kuendigungsfrist und naechstmoeglicher Kuendigungstermin;
- erwarteter Abrechnungszeitraum;
- aktuell bestaetigter wiederkehrender Betrag;
- Land/Jurisdiktion und Quelldokumente.

Zusaetzliche Facts wie Leistungsadresse, Telefonnummer, Anschluss, Geraet oder
Zaehler gehoeren in Kategorie-Erweiterungen. Sie werden manuell gepflegt oder
nur nach einem fuer die konkrete Dokumentklasse belegten Parser als pruefbare
Kandidaten angeboten. Ein allgemeines kleines/mittleres Modell muss sie nicht
verlaesslich verstehen, und sie werden nicht allein deshalb verpflichtend,
weil eine Kategorie sie unterstuetzt.

## Rechnungs-Routing

Der normale Pfad beginnt mit dem ersten nuetzlichen Dokument:

```text
Rechnung erfassen
  -> usergewaehlten Managed Subject beibehalten
  -> Rechnung und grobe Domain klassifizieren
  -> Providerkandidat und bestehende Vertrags-/Abo-Kontexte ranken
  -> nach Review Rolle recurring_invoice und Abrechnungszeitraum zuordnen
  -> bestaetigen oder korrigieren
```

Existiert kein Kontext, darf Mappm ab der ersten ausreichend informativen
Rechnung `Vertrag/Abo anlegen` vorschlagen. Wiederholung ueber mehrere
Perioden ist ein Fallback-Signal fuer zuvor unklassifizierte Dokumente, keine
Voraussetzung.

Erst in einer spaeter qualitaetsgegateten Automationsstufe duerfen nach einer
von der Nutzerin bestaetigten stabilen Matching-Regel spaetere Rechnungen
vorlaeufig mit sichtbarem Review-/Undo-Pfad zugeordnet werden. Fehlende oder
abweichende bestaetigte Referenzsignale und technische Dubletten fuehren
zurueck in den Review. Freie Modellinterpretation behauptet weder einen
unerwarteten Vertrag noch eine semantische Falschzuordnung.

## Tasks and Reminders

Tasks and reminders are linked to the contract context and may be triggered by
confirmed facts or workflow rules:

- review or pay an invoice;
- review a detected price change;
- cancel, renew or switch before a deadline;
- return equipment;
- verify a final invoice;
- expect a confirmation or refund.

Reminder policy separates date, offset and channel:

- quiet: agenda, badge or in-app reminder;
- notifying: privacy-safe OS/push notification;
- one or more offsets where the workflow requires them;
- user quiet hours and channel preference.

Mappm does not generate a noisy monthly cancellation reminder by default. A
review reminder is activated by user choice, a published workflow rule or a
material detected event such as a confirmed price change.

Regelbasierte Fristen und Reminder folgen
`DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`. Ein Providername oder eine
Polizzennummer allein darf keine Vertrags-, Kuendigungs- oder
Einreichungsfrist aktivieren. Country-/Provider-/Tarifregeln muessen exakt
passen, versioniert und geprueft sein.

## Schlankes Rechnungsdiagramm

Das Vertragsdetail darf ein kleines Liniendiagramm zeigen, wenn mindestens
zwei bestaetigte periodische Rechnungsbetraege vorliegen.

- X-Achse: Abrechnungszeitraum.
- Y-Achse: bestaetigter Rechnungsbetrag.
- Desktop-Hover, Mobile-Tap und Tastaturfokus zeigen Zeitraum und Betrag.
- Eine bestaetigte materielle Aenderung darf eine zurueckhaltende Markierung
  erhalten.
- Assistive Technologien erhalten eine zugaengliche textuelle Alternative.

Use **Preisentwicklung** only for a truly fixed recurring price. Use
**Rechnungsverlauf** for variable services such as energy or usage-dependent
telecom bills. Mappm does not infer that a higher total is a tariff increase.

Das sichtbare Produkt ergaenzt keine Buchhaltungsdashboards, Jahresprognosen,
komplexen Durchschnitte, Rabattanalyse, Verbrauchsabrechnung oder
konfigurierbaren Diagramm-Panels. Das Detail behaelt nur das ruhige Diagramm
und die naechste relevante Aktion, beispielsweise
`Kuendbar bis 29. Juli - Erinnerung aktiv`.

## Stop Rules

Stop, wenn:

- jede wiederkehrende Rechnung einen neuen Case erzeugt;
- jeder Polizzennachtrag oder jedes Vertragsupdate einen neuen Case erzeugt;
- Record und Abschluss-Case zu einer Entitaet verschmolzen werden;
- ein importierter Bestandsvertrag einen erfundenen historischen
  Abschluss-Case erfordert;
- ein Policy Record ohne Polizzendokument ungueltig ist;
- gewoehnliche Kuendigung oder Tarifwechsel den Vertrag in unverbundene UI
  zerteilt;
- Wiederholung pauschal als monatlich angenommen wird;
- Rechnungssumme und fixer Tarifpreis ohne Evidenz gleichgesetzt werden;
- ein Diagramm fuer einen einzelnen Betrag oder einen leeren Finanzzustand
  erscheint;
- Mappm zu Buchhaltungs-, Prognose- oder Verbrauchsanalyse-Software wird;
- eine erkannte Abo- oder Kuendigungsregel ohne Review finalisiert wird;
- Providername oder Polizzennummer allein eine materielle Frist oder
  Deckungsbehauptung aktiviert.
