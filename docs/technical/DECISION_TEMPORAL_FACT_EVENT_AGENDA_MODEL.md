---
title: "Entscheidung - Zeitangaben, Ereignisse, Fristen und Agenda"
description: "Verbindliches Mappm-Modell fuer typisierte Zeitwerte, Provenienz, Ereignisse, Aufgaben, Termine, Fristen, Erinnerungen und spaetere Kalenderfaehigkeit"
tags: [decision, product, temporal, dates, events, deadlines, agenda, calendar, intelligence, metadata]
lastUpdated: "2026-07-20"
status: "accepted-direction"
owner: "product-concept/data-architect"
---

# Entscheidung - Zeitangaben, Ereignisse, Fristen und Agenda

## Status und Zweck

Die Produktrichtung ist akzeptiert. Dieses Dokument ist die fachliche Source of
Truth fuer die Bedeutung, Herkunft, Bestaetigung und Verwendung von
Zeitangaben in Mappm. Exakte Domain-Typen, Persistenzschema, API-Felder,
Indexstruktur und UI-Komponenten werden erst in den jeweiligen
Implementation Contracts festgelegt.

Das Konzept bereitet die App von Beginn an auf eine fokussierte Agenda und eine
spaetere optionale Kalenderintegration vor, ohne im Commercial Core einen
allgemeinen Kalender zu bauen.

F29 besitzt die Regeln fuer Datum-/Zeit-Eingabekomponenten. Die
Tasks-/Reminder-Saeule besitzt Aufgaben, Reminder und Agenda-Verhalten. Dieses
Dokument besitzt die gemeinsame fachliche Zeitsemantik, auf die beide
verweisen.

## Kernentscheidung

Ein Dokument besitzt nicht einfach **das Datum**. Es kann mehrere fachlich
verschiedene Zeitangaben enthalten, beispielsweise:

- Ausstellungsdatum;
- Eingangs- oder Empfangsdatum;
- Leistungs-, Behandlungs- oder Ereignisdatum;
- Termin oder Terminfenster;
- Frist oder Faelligkeit;
- Gueltigkeitsbeginn und -ende;
- Abrechnungs-, Leistungs- oder Aufenthaltszeitraum;
- Einreichungs-, Entscheidungs- oder Zahlungsdatum.

Diese Werte duerfen nicht in ein universelles `documentDate`-Feld
zusammengefasst werden. Mappm speichert ihre Bedeutung, zeitliche Genauigkeit,
Quelle, Vorschlags-/Bestaetigungsstatus und gegebenenfalls Zeitzone.

Ein gefundenes Datum ist zunaechst nur ein Zeitkandidat. Es wird erst dann zu
einem Ereignis, Termin, einer Frist, Aufgabe oder Erinnerung, wenn der
fachliche Kontext diese Bedeutung belegt oder die Nutzerin sie bestaetigt.

## Getrennte fachliche Begriffe

| Begriff | Bedeutung | Beispiel |
|---|---|---|
| Systemzeitstempel | technische Erfassung oder Aenderung; kein fachliches Lebensereignis | Scan am 20.07.2026 um 18:31 |
| Zeit-Fact | typisierte Aussage ueber einen fachlichen Zeitpunkt oder Zeitraum | Rechnung ausgestellt am 18.07.2026 |
| Ereignis | etwas, das fachlich stattgefunden hat oder als Verlaufspunkt erwartet wird | Behandlung am 14.07.2026 |
| Termin | vereinbartes Ereignis mit geplantem Zeitpunkt oder Fenster | Kontrolle am 03.08.2026 um 09:30 |
| Frist/Faelligkeit | Zeitpunkt, bis zu dem eine Handlung oder Leistung erwartet wird | Zahlung faellig bis 31.07.2026 |
| Aufgabe | Handlung der Nutzerin; kann eine Faelligkeit besitzen | Rechnung einreichen |
| Erwartete Antwort | erwartetes externes Ergebnis mit Zeitpunkt oder Zeitfenster | Antwort der Versicherung bis etwa 20.08.2026 |
| Reminder | bewusst konfigurierte Erinnerung an ein Zielobjekt | sieben Tage vor Faelligkeit erinnern |
| Wiederholung | Regel fuer mehrere geplante Vorkommen; nicht selbst ein Dokumentdatum | jaehrliche Vertragspruefung |

Diese Begriffe koennen technisch gemeinsame Value Objects verwenden, bleiben
aber fachlich unterscheidbar. Insbesondere gilt:

- ein Zeit-Fact erzeugt nicht automatisch eine Aufgabe;
- eine Frist erzeugt nicht automatisch eine laute Benachrichtigung;
- ein Termin ist kein Dokumenttyp;
- ein Reminder ist nicht die Frist selbst;
- ein Systemzeitstempel darf kein fehlendes Ereignisdatum ersetzen.

## Semantische Zeitarten

Die folgenden Kategorien beschreiben den benoetigten stabilen Produktumfang.
Ihre exakten Code-Keys bleiben dem Domain-/Contract-Entwurf vorbehalten.

| Kategorie | Bedeutung | Typische Quellen |
|---|---|---|
| ausgestellt | Dokument oder Nachweis wurde ausgestellt | Rechnung, Bescheid, Brief, Zertifikat |
| empfangen | fachlicher Eingang, soweit bekannt | Posteingang, E-Mail-Import, manuelle Angabe |
| erbracht/aufgetreten | Leistung, Behandlung oder Ereignis fand statt | Rechnung, Bericht, Bestaetigung |
| eingereicht | Antrag, Claim oder Unterlage wurde uebermittelt | Einreichbestaetigung, Versandnachweis |
| entschieden | externe Entscheidung wurde getroffen | Bescheid, Versicherungsentscheidung |
| faellig | Handlung oder Zahlung ist bis zu einem Datum erforderlich | Rechnung, Vertrag, gepruefte Workflowregel |
| gueltig | Unterlage, Vertrag, Deckung oder Berechtigung gilt in einem Zeitraum | Pass, Polizze, Vertrag |
| geplant | Termin oder geplantes Zeitfenster | Einladung, Terminbestaetigung, manuelle Angabe |
| erwartet | Antwort, Dokument oder Ergebnis wird in einem Zeitraum erwartet | Workflow, Eingangsbestaetigung |
| abgerechnet | Leistung, Nutzung oder Deckung bezieht sich auf einen Zeitraum | Rechnung, Abrechnung, Leistungsnachweis |

Ein Country-/Provider-Pack darf diese Semantik praezisieren, aber keine
unbelegte Frist, Anspruchsregel oder Ereignisbedeutung erfinden.

## Zeitwert und Genauigkeit

Mappm muss mindestens folgende Formen fachlich ausdruecken koennen:

- reines Kalenderdatum ohne Uhrzeit;
- lokaler Zeitpunkt mit Uhrzeit und Zeitzone;
- Datums- oder Zeitintervall;
- offener Beginn oder offenes Ende, wenn fachlich zulaessig;
- nur Monat/Jahr oder nur Jahr, wenn die Quelle nicht genauer ist;
- ungefaehrer oder unsicherer Zeitpunkt;
- ganztaegiges Ereignis;
- wiederkehrende Regel und daraus abgeleitete einzelne Vorkommen.

Regeln:

- Ein reines Datum wird nicht als UTC-Mitternacht gespeichert und darf bei
  Zeitzonenwechsel nicht auf den Vortag springen.
- Eine Uhrzeit wird nie erfunden, wenn die Quelle nur ein Datum nennt.
- Fuer echte Zeitpunkte werden lokaler Wert, IANA-Zeitzone und, soweit
  aufloesbar, der zugehoerige Instant erhalten.
- Sommerzeitwechsel, Zeitzonenaenderungen und Reisen duerfen Termine nicht
  still verschieben.
- Teilgenauigkeit bleibt erhalten. `Juni 2026` wird nicht zu
  `01.06.2026 00:00`.
- Start-/Endgrenzen und ihre Inklusivitaet muessen fachlich eindeutig sein.
- Locale und Originalschreibweise duerfen fuer Erklaerbarkeit erhalten werden,
  die Domain speichert Zeitwerte aber nie nur als lokalisierten String.

## Provenienz und Bestaetigung

Jeder vorgeschlagene oder bestaetigte fachliche Zeitwert muss nachvollziehbar
sein. Das Konzept verlangt mindestens:

- stabile ID;
- semantische Zeitart;
- Wert, Intervall und Genauigkeit;
- Quelle: Dokument, Record, Case, Claim, Workflowdefinition, Nutzerangabe oder
  Systemvorgang;
- bei Dokumenten nach Moeglichkeit Dokument-ID, Seite und Text-/Bildstelle;
- Extraktionsquelle wie OCR, deterministische Regel, Modell oder
  Country-/Provider-Pack samt Version;
- Confidence beziehungsweise Abstention-Grund, soweit automatisch erzeugt;
- Status `proposed`, `confirmed`, `corrected`, `rejected` oder `superseded`;
- Erstellungs-, Aenderungs- und Review-Provenienz.

Rohtext, Bounding Boxes und Modellmetadaten sind sensibel und folgen der
Retention-/Diagnose-Policy. Sie duerfen nicht unkontrolliert in Logs oder
Telemetrie gelangen.

Mehrere widerspruechliche Datumsangaben duerfen nebeneinander als Kandidaten
existieren. Eine Korrektur ueberschreibt nicht still die Herkunft oder
Historie. Eine abgeleitete Frist verweist sowohl auf ihren Ausgangs-Fact als
auch auf die versionierte, gepruefte Regel, aus der sie berechnet wurde.

## Assist-Extraktion und Review

Backend/Core Assist versucht bei geeigneten Dokumenten, relevante
Zeitkandidaten zu erkennen. Es muss abstain koennen und darf nicht versprechen,
aus jedem Dokument ein fachliches Ereignisdatum zu gewinnen.

Die Verarbeitung kann beispielsweise erkennen:

- Rechnungsdatum, Leistungsdatum und Faelligkeit in derselben Rechnung;
- Aufnahme- und Entlassungsdatum als Aufenthaltszeitraum;
- Termin und Uhrzeit in einer Einladung;
- Einreichungsdatum in einer Bestaetigung;
- Gueltigkeitszeitraum eines Records.

Sie darf nicht:

- Scan-/Importzeit als fehlendes fachliches Datum ausgeben;
- aus einem Ausstellungsdatum allein einen Arztbesuch behaupten;
- aus zeitlicher Naehe Kausalitaet ableiten;
- eine rechtliche oder vertragliche Frist ohne gepruefte Quelle berechnen;
- aus einem unsicheren Datum still eine Aufgabe, Notification oder externe
  Kalenderaktion erzeugen;
- eine unklare Tages-/Monatsreihenfolge ohne Locale-/Kontextpruefung
  finalisieren.

Materielle Folgen wie Termin, Frist, Faelligkeit, Reminder, externe Aktion oder
Case-/Claim-Status muessen im aktuellen Reifegrad sichtbar bestaetigt werden.
Andere extrahierte Zeitwerte duerfen als Vorschlaege erhalten bleiben, ohne den
Review in ein Metadatenformular zu verwandeln.

## Dokumente, Ereignisse und medizinisches Beispiel

Ein Dokument belegt Zeit-Facts. Ein fachliches Ereignis wird nur erzeugt, wenn
dies fuer Verlauf, Matching, Suche oder Agenda einen echten Wert besitzt und
die Evidenz seine Bedeutung traegt.

Beispiel Arztrechnung:

```text
Dokument
  ausgestellt: 18.07.2026
  Leistung erbracht: 14.07.2026
  faellig: 31.07.2026
  erfasst: 20.07.2026 18:31 Europe/Vienna

Moegliches bestaetigtes Ereignis
  Behandlung am 14.07.2026
  belegt durch diese Rechnung
```

Nur das Leistungsdatum kann hier einen Behandlungskontakt belegen. Das
Ausstellungsdatum beschreibt das Dokument, das Erfassungsdatum nur Mappm.
Fehlt ein belastbares Leistungsdatum, darf der vorgeschlagene Titel
beispielsweise `Arztrechnung Dr. Mayer, Juli 2026` lauten, ohne einen exakten
Behandlungstag zu behaupten.

Weitere Beispiele:

| Dokument/Kontext | Zeit-Facts | Moegliche Folge |
|---|---|---|
| Entlassungsbrief | Ausstellungsdatum, Aufnahme-/Entlassungszeitraum, Kontrolltermin | Aufenthaltsereignis und bestaetigter Termin |
| Rechnung | Ausstellungs-, Leistungs-, Faelligkeits- und Zahlungsdatum | Kostenverlauf; Aufgabe nur wenn Zahlung/Einreichung offen ist |
| Vertrag/Polizze | Abschluss, Gueltigkeit, Mindestlaufzeit, Kuendigungsgrenze | Record-Zeitleiste und bestaetigte Pruefaufgabe |
| Bescheid | Ausstellungs-/Zustelldatum, Entscheidungsdatum, gepruefte Rechtsmittelfrist | Entscheidung und gegebenenfalls Frist |
| Terminbestaetigung | Termin oder Zeitfenster, Ort/Provider | Termin in der Mappm-Agenda |

## Agenda und Timeline

Mappm unterscheidet:

- **Timeline:** bestaetigte fachliche Ereignisse und relevante historische
  Zeit-Facts eines Case/Record;
- **Agenda:** offene oder bevorstehende Aufmerksamkeit wie Aufgaben, Fristen,
  Termine, erwartete Antworten, Ablauf-/Erneuerungsbedarf und Reminder.

Nicht jedes Datum erscheint in der Agenda. Insbesondere gehoeren
Ausstellungs-, Scan- und reine Verlaufsdaten nicht ohne Handlungsrelevanz
dorthin.

Die Agenda ist kein allgemeiner Kalender. Sie zeigt nur Mappm-bezogene,
kontextualisierte Aufmerksamkeit. Wiederkehrende Aufgaben und Reminder werden
bewusst aktiviert; eine wiederkehrende Rechnung erzeugt nicht automatisch
jeden Monat eine laute Erinnerung.

## Spaetere Kalenderintegration

Eine externe Kalenderintegration bleibt spaeter, optional und
consent-pflichtig. Das Domainmodell wird jedoch so vorbereitet, dass sie keine
Migration von untypisierten Datumsstrings benoetigt.

Vor einer Integration muss ein eigener Contract festlegen:

- welche bestaetigten Termine, Aufgaben oder Fristen exportierbar sind;
- ob die Verbindung ein- oder wechselseitig ist;
- stabile externe IDs, Idempotenz, Update-, Konflikt- und Loeschverhalten;
- Zeitzone, Ganztag, Wiederholung und Erinnerungsabbildung;
- Account-/Vault-/Managed-Subject- und Berechtigungsgrenzen;
- explizite Auswahl statt pauschalem Export aller sensiblen Metadaten;
- standardmaessig redigierte Titel und Beschreibungen;
- Widerruf, Disconnect, Tokenloeschung und Verhalten bereits exportierter
  Eintraege;
- Offline-, Retry-, Partial-Failure- und Providerfehler;
- Google-/Apple-/Microsoft- beziehungsweise Plattform-Policy und Security.

Ein Dokumentdatum wird nie allein deshalb exportiert, weil eine
Kalenderverbindung besteht.

## Suche, Matching und Titel

- Suche und Filter muessen Zeitart und Zeitraum unterscheiden koennen.
- Eine Suche nach `Behandlung im Juni` darf Leistungsdaten verwenden, waehrend
  `Rechnungen aus Juni` je nach sichtbarem Filter Ausstellungs- oder
  Abrechnungsdaten nutzt.
- Unbestaetigte Vorschlaege bleiben als solche erkennbar und duerfen nicht wie
  bestaetigte Fakten gerankt werden.
- Matching darf mehrere Zeit-Facts kombinieren, aber Session- oder zeitliche
  Naehe beweist keinen gemeinsamen Case.
- Titel duerfen den passendsten belegten Zeitkontext verwenden. Sie erzeugen
  dadurch kein universelles Hauptdatum und duerfen keine hoehere Genauigkeit
  vortaeuschen als die Quelle besitzt.

## Daten-, Contract- und Sync-Anforderungen

Ein spaeterer Domain-/Data-/Contract-Entwurf muss mindestens sicherstellen:

- stabile IDs und versionierbare Zeit-Facts/Ereignisse;
- typisierte Werte statt freier Datumsstrings;
- getrennte Systemzeitstempel und fachliche Zeitwerte;
- Provenienz, Bestaetigungsstatus und Korrekturhistorie;
- viele Quellen fuer einen bestaetigten Fact und mehrere Facts pro Dokument;
- Local-/Cloud-Vault-konsistente Authority, Pending- und Konfliktsemantik;
- deterministische Clock-/Timezone-Fixtures;
- rebuildbare Suchindizes;
- Loeschung, Export und Retention gemeinsam mit den belegenden Objekten;
- keine DTO-, Drift- oder Provider-Typen im Domain-/Presentation-Layer.

Die konkrete Tabellenanzahl oder Klassenhierarchie wird hier nicht
vorweggenommen. Es ist zulaessig, gemeinsame Temporal Value Objects zu nutzen,
solange die fachlichen Bedeutungen und Lebenszyklen getrennt bleiben.

## Privacy und Sicherheit

Zeitangaben koennen Gesundheit, Aufenthaltsort, Reise, Arbeit,
Versicherungsstatus oder rechtliche Verfahren offenlegen und sind daher
mindestens so sensibel wie ihr Quellkontext.

- Keine sensiblen Titel, Zeitwerte oder Orte in normalen Logs/Telemetrie.
- Notifications und externe Kalender verwenden privacy-sichere Defaults.
- Such-, Export- und Kalenderzugriff folgen Vault-, Profil- und
  Berechtigungsgrenzen.
- Country-/Provider-Fristen benoetigen datierte Quellen, Version, Reviewer und
  Withdrawal-/Korrekturpfad.
- Modellkorrekturen sind kein Training-Consent.

## Roadmap-Verankerung

| Slice | Verpflichtung |
|---|---|
| C2 / R4.9 / R5.2 | Zeitkandidaten mit Provenienz extrahieren und in kompakten Vorschlaegen transportieren |
| C3 / R4.10 | Aufgaben, Faelligkeiten und fokussierte Agenda auf typisierten Zeitwerten aufbauen |
| C3 / R4.11 | strukturierte Zeitfilter und nachvollziehbare Suchtreffer vorbereiten |
| R8.4 | Gueltigkeiten, Fristen, Zeitraeume und Konflikte als bestaetigte Facts ausbauen |
| R9.3 | weitere Assist-Vorschlaege qualitaets- und privacy-gegatet aktivieren |
| R13.3 | optionale externe Kalenderadapter erst nach eigenem Consent-/Security-/Sync-Contract |

## Verifikation

Synthetische Tests und Fixtures decken mindestens ab:

- Dokument mit mehreren unterschiedlichen Datumsarten;
- reines Datum ohne Uhrzeit und ohne Zeitzonenverschiebung;
- Termin mit IANA-Zeitzone und Sommerzeitwechsel;
- Zeitraum, offenes Ende und Monat-/Jahr-Genauigkeit;
- mehrdeutiges lokalisiertes Datum;
- fehlendes oder nicht belastbar erkennbares Ereignisdatum;
- widerspruechliche Vorschlaege und bestaetigte Korrektur;
- Reprocessing ohne Ueberschreiben bestaetigter Werte;
- abgeleitete Frist mit versionierter Regelquelle;
- keine Agenda-Zeile fuer reines Ausstellungs-/Erfassungsdatum;
- Reminder getrennt von Frist und Notification-Kanal;
- Local-/Cloud-Konflikt und Offline-Pending-Aenderung;
- redigierte Notification und spaeterer Kalenderexport;
- Suche nach Zeitart und Zeitraum;
- deterministische Tests mit injizierter Clock und Zeitzone.

## Stop Rules

Stop, wenn:

- ein universelles `documentDate` als einzige fachliche Zeitquelle eingefuehrt
  wird;
- Datum/Uhrzeit nur als lokalisierter String persistiert wird;
- UTC-Mitternacht ein reines Datum repraesentiert;
- Ausstellungs-, Leistungs-, Frist-, Gueltigkeits- und Erfassungsdatum
  vermischt werden;
- ein gefundenes Datum automatisch ein Ereignis, eine Aufgabe, Frist,
  Notification oder Kalenderaktion finalisiert;
- Assist eine fehlende Uhrzeit, Genauigkeit, Kausalitaet oder rechtliche Frist
  erfindet;
- Provenienz, Vorschlagsstatus oder Korrekturhistorie verloren gehen;
- Agenda jedes Dokumentdatum als Kalendereintrag zeigt;
- externe Kalenderintegration ohne expliziten Scope, Consent, Redaction,
  Security, Idempotenz und Disconnect-Verhalten umgesetzt wird;
- echte sensible Zeitdaten in Logs, Telemetrie oder Testfixtures gelangen.
