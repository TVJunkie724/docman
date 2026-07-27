---
title: "Entscheidung - Regelbasierte Fristen und Erinnerungen"
description: "Verbindliches Mappm-Modell fuer mehrere unabhaengige Fristen, Regelprovenienz, Nutzerbestaetigung, Reminder und nachvollziehbare Regelupdates"
tags: [decision, product, deadlines, reminders, rules, provenance, country-packs, provider-packs]
lastUpdated: "2026-07-25"
status: "accepted-direction"
owner: "product-concept/domain/compliance"
---

# Entscheidung - Regelbasierte Fristen und Erinnerungen

## Status und Scope

Diese Produktrichtung wurde am 23. Juli 2026 akzeptiert. Das Dokument besitzt
die fachliche Semantik regelbasierter Fristen und der daraus abgeleiteten
Reminder. Es ergaenzt das allgemeine Zeitmodell aus
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`.

Das konkrete Domain-/API-/Persistenzschema, Notification-Kanaele und die
Darstellung in einer Phase-as-Implementation-Contract bleiben spaeteren
Contracts vorbehalten. Country-/Provider-Regeln und ihr Quellenstand werden
nicht hier dupliziert; fuer den ersten medizinischen Oesterreich-Stand gilt
`DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md`.

## Kernentscheidung

Ein Case, Record, Vertrag oder anderes Zielobjekt darf gleichzeitig mehrere
unabhaengige Fristen besitzen. Jede Frist behaelt:

- ihren eigenen fachlichen Zweck und betroffenen Ablauf;
- ihren eigenen Payer, Provider, Vertrag oder Rechtsraum;
- ihren eigenen Startanker und Berechnungsweg;
- ihre eigene Regel- und Quellenprovenienz;
- ihren eigenen Bestaetigungs-, Erledigungs- und Reviewstatus;
- ihre eigenen optionalen Reminder.

Mehrere Fristen werden niemals zu einer kuenstlichen gemeinsamen Frist
verschmolzen. Eine kompakte Produktsicht darf als
`nextCriticalDeadline` die **frueheste bestaetigte, anwendbare, offene Frist**
ableiten. Diese Zusammenfassung ersetzt oder loescht keine spaetere Frist.

## Getrennte fachliche Objekte

| Begriff | Verantwortung | Darf nicht |
|---|---|---|
| Regeldefinition | beschreibt, wann und wie eine Frist abgeleitet werden darf | privaten Fallzustand oder eine konkrete Nutzerfrist enthalten |
| Fristinstanz | konkrete, provenienztragende Frist fuer ein Zielobjekt | ihre Regelquelle oder Bestaetigung verlieren |
| Reminder | Zeitpunkt/Offset und Kanal, mit dem an eine Frist oder Aufgabe erinnert wird | als Frist oder Rechtsaussage behandelt werden |
| Notification | konkrete technische Zustellung eines Reminders | ohne Policy und Privacy-Default automatisch laut werden |

Konzeptionelle Namen autorisieren noch keine Code- oder Contract-Keys.

## Regel- und Fristprovenienz

Eine automatisch vorgeschlagene oder abgeleitete Frist muss mindestens
nachvollziehbar machen:

- Frist-ID, fachliche Fristart und Zielobjekt;
- betroffenen Managed Subject sowie Payer/Provider/Polizze, soweit relevant;
- Startanker und seine Evidenz, beispielsweise bestaetigtes Leistungsdatum;
- Berechnungsregel und berechnetes Datum;
- Rule-ID, Rule-Version, Pack-ID und Pack-Version;
- Rechtsraum, Provider-/Tarifscope und Anwendbarkeitsstatus;
- Fundstelle beziehungsweise Quell-URL;
- Quellenstand, `lastReviewedAt` und `nextReviewAt`;
- `proposed`, `confirmed`, `corrected`, `rejected`, `resolved`,
  `review_due`, `superseded` oder `withdrawn`;
- Erzeugungsart: Pack-Regel, Dokumentvorschlag, Nutzerangabe oder autorisierte
  Integration;
- Nutzerbestaetigung, Korrekturhistorie und verwendete Rule-Version.

Ein Fristvorschlag ist keine finale Frist. Er wird erst nach der fuer seine
Risikoklasse erforderlichen Bestaetigung aktiv.

## Anwendbarkeit und fehlende Fakten

Regeln liefern fachlich `applicable`, `not_applicable` oder `unknown`.

- Fehlt ein erforderlicher Startanker, darf Mappm kein exaktes Datum erfinden.
- Ist der Payer, Tarif, Rechtsraum oder Zeitraum nicht ausreichend bestaetigt,
  bleibt die Regel unbekannt oder vorgeschlagen.
- Ein Providername allein beweist weder die konkrete Polizze noch den Tarif
  oder die Anwendbarkeit einer Frist.
- Ein Default-Payer darf die Vorschlagsreihenfolge beeinflussen, aber keine
  Frist, Einreichung oder Deckungsbehauptung aktivieren.

Ein unbekannter Wert darf als ruhiger Reviewbedarf erscheinen. Er macht den
Case nicht ungueltig.

## Erlaubte Fristquellen

Eine Frist kann in absteigender fachlicher Kontrolltiefe stammen aus:

1. einer professionell geprueften, versionierten Country-/Provider-/
   Tarifregel mit exaktem Scope;
2. einem von der Nutzerin semantisch zugeordneten und bestaetigten Dokument-
   oder Record-Fact, etwa einer Vertragsfrist;
3. einer ausdruecklichen manuellen Nutzerangabe.

OCR darf Datumsstrings mit Seiten-/Textstellenprovenienz liefern. Die hybride
Pipeline darf fuer produktseitig definierte, typrelevante Felder eine
wahrscheinliche Bedeutung zur Bestaetigung vorausfuellen. Ein kleines
beziehungsweise mittleres General-Purpose-LLM finalisiert jedoch weder die
Datumsbedeutung noch eine aktive rechtliche/vertragliche Frist, Erinnerung oder
externe Handlung. Die Nutzerin sieht Vorschlag, Alternativen und bei
regelbasierten Fristen Quelle/Berechnung und bestaetigt oder korrigiert die
semantische Zuordnung.

## Mehrere Versicherungen und Fristen

Besitzt ein Managed Subject mehrere Zusatzversicherungen, fuehrt jeder
bestaetigte Payer-Ablauf seine eigene Frist. Mappm:

- berechnet oder speichert nicht pauschal die kleinste Frist als Eigenschaft
  der Rechnung;
- zeigt fuer die kompakte Aufmerksamkeit die frueheste bestaetigte offene
  Frist;
- behaelt alle weiteren Fristen und Reminder getrennt;
- laesst Payer-Ablaufe unabhaengig erledigen, korrigieren oder entfernen;
- behauptet aus der Frist keine Deckung, Leistung oder Einreichbarkeit.

Ohne Polizzendokument kann ein minimaler, bestaetigter Policy Record fuer
Provider, Polizzennummer und Kategorie bestehen. Daraus entsteht keine
automatische private Frist, solange weder eine exakt passende gepruefte
Provider-/Tarifregel noch eine bestaetigte manuelle Angabe vorliegt.

## Regelupdates und historische Stabilitaet

Eine bestaetigte Frist pinnt die verwendete Rule-Version. Spaetere Pack- oder
Quellenaenderungen schreiben historische oder laufende Fristen nicht still um.

Bei ueberfaelligem Review oder erkannter Quellenaenderung gilt:

- die bestehende Frist bleibt mit ihrer bisherigen Provenienz sichtbar;
- sie erhaelt einen Review-/Aenderungshinweis;
- eine neue Berechnung wird als eigener Vorschlag erzeugt;
- eine materielle Aenderung braucht den vorgesehenen Review und eine
  nachvollziehbare Transition;
- zurueckgezogene Regeln erzeugen keine neuen Fristen oder Automationen.

Die operative Pflege, Source-Checks und Release-Gates gehoeren
`docs/ops/OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md`.

## Reminder und Benachrichtigungen

Ein Reminder ist eine optionale Organisationshilfe. Er referenziert eine Frist
oder Aufgabe und besitzt mindestens Datum/Offset, Kanal, Aktivierungsgrund,
Status und Aenderungshistorie.

- Eine Frist erzeugt nicht automatisch eine laute Push-/OS-Notification.
- In-App-Agenda und ruhige Aufmerksamkeit duerfen nach bestaetigter
  Reminder-Policy automatisch vorbereitet werden.
- Laute Kanaele folgen Nutzerpraeferenzen, Quiet Hours, Privacy-Redaction und
  der freigegebenen Notification-Policy.
- Jeder automatisch erzeugte Reminder ist sichtbar, editierbar, deaktivierbar
  und als automatisch erzeugt erkennbar.
- Eine Rule-Aenderung verschiebt einen bestehenden Reminder nicht still.

## Transparenz fuer Nutzerinnen

Bei einer regelbasierten Frist muessen in einer kompakten oder vertieften Sicht
mindestens erreichbar sein:

- woraus die Frist abgeleitet wurde;
- fuer welchen Payer/Provider und Ablauf sie gilt;
- Stand und Version der Regel;
- Quelle beziehungsweise Fundstelle;
- verwendeter Startanker und Berechnung;
- Bestaetigungs- und Reviewstatus;
- Hinweis auf eine ueberfaellige oder geaenderte Regelquelle.

Die Nutzerkommunikation lautet sinngemaess:

> Mappm unterstuetzt bei der Organisation. Massgeblich bleiben die aktuell
> gueltigen offiziellen beziehungsweise vertraglichen Regeln und der
> individuelle Fall.

Mappm darf nicht behaupten, eine offizielle Frist sei unverbindlich. Es macht
transparent, dass die App Anwendbarkeit und Aktualitaet nicht garantiert.

## Medizinisches Beispiel

```text
Medical Cost Settlement
  Rechnung: 180 EUR
  Leistungsdatum: bestaetigt

  Frist A
    Payer: OeGK
    Regel: 42 Monate ab Leistungsdatum
    Quelle/Version: AT Medical Payer Pack
    Status: bestaetigt, offen

  Frist B
    Payer: Zusatzversicherung A
    Regel: bestaetigte Polizzen-/Tarifregel
    Status: bestaetigt, offen

  Frist C
    Payer: Zusatzversicherung B
    Regel: unbekannt
    Status: keine berechnete Frist

  nextCriticalDeadline
    frueheste bestaetigte offene Frist aus A und B
```

## Roadmap- und Handoff-Grenzen

| Slice | Verpflichtung |
|---|---|
| C2/C3 | Zeit-Facts, Regelprovenienz und Reviewstatus ohne stille Materialisierung transportieren |
| R8.4 | Fristinstanzen, Remindertrennung, Konflikt-/Reviewstatus und kompakte kritische Frist umsetzen |
| R8.8 | nur professionell gepruefte und betrieblich gepflegte Country-/Provider-Regeln aktivieren |
| R8.12 | medizinische Payer-Fristen auf Basis der akzeptierten Medical-Familie nur nach AT-Pack-/OPS-09-Gate verwenden |
| OPS-09 | Quellenmonitoring, Review, Withdrawal und Release-Gate betreiben |

## Verifikation

Synthetische Tests und Fixtures decken mindestens ab:

- keine, eine und mehrere Fristen fuer dasselbe Zielobjekt;
- frueheste offene Frist ohne Verlust spaeterer Fristen;
- fehlendes Leistungs-/Startdatum ohne erfundenes Enddatum;
- mehrere Zusatzversicherungen mit unterschiedlichen Fristen;
- Policy Record ohne Dokument und ohne automatische Privatfrist;
- OCR-/LLM-Vorschlag mit Seitenprovenienz und Nutzerkorrektur;
- Default-Payer sortiert nur und aktiviert keine Frist;
- ueberfaellige Regelreview und erkannte Quellenaenderung;
- keine stille Neuberechnung nach Pack-Update;
- historische Frist mit gepinnter Rule-Version;
- zurueckgezogene Regel erzeugt keine neuen Reminder;
- Reminder getrennt von Frist und Notification-Kanal;
- privacy-sichere Notification ohne sensiblen Titel.

## Stop Rules

Stop, wenn:

- mehrere Payer-Fristen in ein einziges unerklaerbares Datum geschrieben
  werden;
- die frueheste Frist andere Fristen ueberschreibt;
- ein fehlender Startanker durch Scan-, Import- oder Ausstellungsdatum ersetzt
  wird;
- Providername, Default oder Polizzennummer allein eine private Frist
  aktiviert;
- ein allgemeines OCR-/LLM-Ergebnis Datumsbedeutung oder eine rechtlich
  beziehungsweise finanziell relevante Frist final festlegt, statt nur
  Kandidaten und eine sichtbar korrigierbare semantische Feldvorbelegung fuer
  den Userreview zu liefern;
- Quelle, Version, Berechnung oder Nutzerbestaetigung verloren gehen;
- Pack-Updates laufende oder historische Fristen still veraendern;
- eine Frist automatisch eine laute Notification erzeugt;
- eine ueberfaellige oder zurueckgezogene Regel ohne sichtbaren Status weiter
  neue Fristen erzeugt;
- Mappm Deckung, Anspruch oder Rechtsberatung aus einer Frist ableitet.
