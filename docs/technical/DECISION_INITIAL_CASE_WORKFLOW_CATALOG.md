---
title: "Decision - Initial Case and Workflow Family Catalog"
description: "Aktueller Rahmen fuer Mappm-Fachvorlagen, Record-Kontexte, interne Branches und noch offene Produktbereiche"
tags: [decision, product, cases, workflows, catalog, records, claims, custom-cases]
lastUpdated: "2026-07-15"
status: "accepted-direction"
owner: "product-concept"
---

# Decision - Initial Case and Workflow Family Catalog

## Status und Zweck

Als aktueller Produktrahmen akzeptiert. Er beschreibt, was derzeit konkret ist,
was als Record-Kontext gefuehrt wird, was innerhalb eines anderen Case bleibt
und welche Produktbereiche noch Discovery benoetigen. Er ist kein finaler
Typkatalog: Der Dokument-/Case-Katalogreview darf Eintraege vor der
Implementierung zusammenfassen, umbenennen, trennen, ergaenzen oder entfernen.
Er ist auch keine Zusage fuer ein Commercial-1.0-Laenderpaket; WF-01/WF-02
bleiben Release Gates.

Alle Eintraege verwenden die eine `Case`-Entitaet aus
`DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`. Die Arbeitsnamen unten
bezeichnen sichtbare Fachvorlagen, nicht unterschiedliche globale Case-Typen.
Der R0.6-Normalisierungsentwurf verwendet einen generischen Case sowie optionale
Muster wie `incident`, `transaction`, `submission`, `resolution` und
`collection` plus Domainvorlagen.

## Aktuelle konkrete Fachvorlagen-Kandidaten

| Vorlagen-Arbeitsname | Nutzerziel und Grenze | Interne Stufen, Branches und Claims | Eigener verknuepfter Case nur, wenn |
|---|---|---|---|
| `accident_or_damage_settlement` | Unfall oder Schaden dokumentieren, melden, regulieren und mit bestaetigtem Ergebnis abschliessen | Beweise/Beteiligte; Polizei als bedingter Step/Event; Werkstatt/Reparatur als Branch; Versicherungs-Claims; Zahlungen; moegliche medizinische/rechtliche Folgen | ein formelles Verfahren oder eine andere Folgearbeit ein unabhaengiges Ziel/Lifecycle/Outcome erhaelt |
| `purchase_fulfilment_and_remedy` | Kauf von Bestellung/Lieferung bis akzeptiertem Produkt oder abgeschlossener Rueckabwicklung verfolgen | Bestellung, Rechnung, Lieferung, Zahlung, Rueckgabe, Garantie/Gewaehrleistung, Reklamation und Erstattung als States/Branches/Claims desselben Ziels | ein formeller Streit, Inkasso-/Gerichtsweg oder eigenstaendiger Folgeanspruch entsteht |
| `authority_application_or_submission` | Antrag/Einreichung vorbereiten, absenden, Rueckfragen beantworten und Entscheidung erhalten | Nachweise sammeln, einreichen, warten, nachreichen, Bescheid/Entscheidung, Zahlung/Erstattung soweit passend | Einspruch/Beschwerde ein eigenes Ziel, Fristen und Ergebnis besitzt |
| `objection_dispute_or_recovery` | eine konkrete Entscheidung, Forderung, Ablehnung oder Leistung anfechten bzw. rueckfordern | Begruendung, Nachweise, Einreichung, Gegenantworten, Fristen, Vergleich/Entscheidung/Zahlung | ein formelles Gerichts- oder Behoerdenverfahren als eigener Prozess beginnt |
| `tax_document_collection` | fuer Managed Subject, Rechtsraum, Regime und Periode Unterlagen sammeln, pruefen und kontrolliert uebergeben/exportieren | Kandidaten, Bestaetigung, fehlende Unterlagen, periodische Sammlung, Review, Export/Handoff; keine Steuerberechnung | Bescheid, Einspruch oder Pruefung ein unabhaengiges Ziel erzeugt |
| `record_acquisition_renewal_or_replacement` | langlebigen Nachweis beantragen, erneuern oder ersetzen | Antrag, Identitaets-/Evidenzpruefung, Termin, Gebuehr, Ausstellung, Empfang | Ablehnung, Verlust-/Missbrauchsfolge oder Rechtsmittel unabhaengig wird |

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

## Produktbereiche mit weiterer Discovery

Diese Bereiche wurden als sinnvoll benannt, aber noch nicht als konkreter
Golden Workflow spezifiziert. Zukuenftige Agents duerfen daraus keine
erfundenen States oder Laenderregeln ableiten:

- medizinische Versorgung/Nachsorge sowie medizinische
  Ausgaben/Erstattungen; `medical_care` und `medical_cost_settlement` sind die
  aktuellen, aber noch nicht akzeptierten Kandidatennamen aus
  `docs/discovery/MEDICAL_CASE_MODEL_DISCOVERY.md`, keine akzeptierten
  Katalogschluessel;
- Bildung/Betreuung;
- Arbeit/Einkommen;
- Wohnen ausserhalb bewusst angelegter Custom-/Vertragskontexte;
- Fahrzeug/Mobilitaet ausserhalb Unfall/Schaden und Contract/Record;
- Reise/Ausland ausserhalb eines Custom-Umbrella und konkreter Claims;
- weitere persoenliche/familiaere Lebensereignisse.

Jede Aktivierung braucht Ziel/Outcome, Case-Grenze, States/Branches/Claims,
erwartete Dokumentrollen, Rechtsraum, Quellen, Owner, Fixtures und Stop Rules.

## Nicht normative Discovery-Unterlagen

Die folgenden Entwuerfe vertiefen das Zielmodell, ohne neue Keys, Workflows oder
Release Scope zu akzeptieren:

- `docs/discovery/CASE_DOCUMENT_TAXONOMY_CANDIDATES.md` beschreibt einen
  generischen Case, acht optionale Workflow-Muster sowie ein getrenntes
  Dokument-, Alias- und Matching-Vokabular;
- `docs/discovery/AUSTRIA_CASE_WORKFLOW_COUNTRY_PACK_DRAFT.md` ordnet aktuelle
  Fachvorlagen vorlaeufig oesterreichischer Terminologie, Komposition und
  Pack-Abhaengigkeiten zu;
- `docs/discovery/DYNAMIC_DOMAIN_COUNTRY_PACK_MODEL_DRAFT.md` untersucht die
  Skalierung ueber stabile Ontologie, Module, signierte Country-/Provider-
  Definitionen und gepinnte Versionen statt hardcodierter Client-Zweige;
- `docs/discovery/AUSTRIA_TAX_CASE_CATALOG_DRAFT.md` ist der vertiefte, datierte
  Steuerentwurf und bleibt durch OQ-010/WF-01/WF-02 blockiert.

Agents duerfen Kandidaten-IDs aus diesen Entwuerfen nicht in Code oder
Contracts uebernehmen, bevor R0.6 die relevanten Achsen akzeptiert und
normalisiert.

## Was fuer sich allein kein Case ist

- ein Dokument, eine Rechnung oder ein Absender;
- ein Arztbesuch ohne dokumentiertes Handlungs-/Nachweisziel;
- Polizei, Werkstatt, Krankenhaus, Arzt, Versicherer oder Behoerde als Akteur;
- Einreichung, Antwort, Erstattung, Zahlung oder Kuendigung als einzelner Status;
- ein Claim gegen SV, Zusatzversicherung, Garantiegeber oder Behoerde;
- ein Workflow-Step, Event, Task oder bedingter Branch;
- Reisepass, Geburtsurkunde, Vertrag, Polizze oder Garantie als langlebiger Record;
- Tags, Spaces, Ordner oder Suchergebnisse.

Diese Elemente koennen einen Case ausloesen, belegen oder darin eine Rolle
tragen. Sie definieren nicht automatisch einen gefuehrten Case. Wenn nach
Capture weder Record noch bestehender/geführter Case passt, darf ein leichter
Custom Case den primaeren Kontext bilden, ohne erfundene Tasks oder Outcomes.

## Laender- und Release-Regel

Der Katalog trennt den einen generischen Case, optionale Workflow-Muster,
sichtbare Domainvorlage und veroeffentlichte Laendervariante.
Oesterreichische SV-/Zusatzversicherungs- und Steuerbeispiele sind Referenzen,
keine weltweit hardcodierten Regeln. Andere Laender erhalten eigene versionierte
Payer-, Frist-, Evidenz- und Terminologievarianten. Ohne freigegebenes Pack sind
nur neutrale Custom Cases oder generische Workflows ohne laender-, provider-
oder rechtsraumspezifische Produktbehauptung erlaubt.

## Stop Rules

Implementation und Freigabe stoppen, wenn:

- eine nicht konkretisierte Familie als fertiger Workflow implementiert wird;
- eine sichtbare Fachvorlage oder nationale Formularvariante ungeprueft zu
  einem neuen globalen Case-Typ oder Workflow-Grundmuster wird;
- Actor, Dokument, Claim, Branch oder Status als eigener Case-Typ modelliert wird;
- Contract-/Identity-/Policy-Records als Cases missbraucht werden;
- ein Custom Case weniger kann als ein Guided Case;
- ein Land, Provider, Anspruch oder eine Frist ohne WF-01/WF-02-Gate behauptet wird;
- diese Liste als abgeschlossenes Weltmarktversprechen statt als aktueller
  Produktkatalog behandelt wird.
- eine medizinische Kandidatenfamilie oder Case-Grenze vor Abschluss der
  Medical-Case-Discovery als akzeptiert behandelt wird;
- Backend/Core Assist fuer einen neuen leichten/geführten Case keinen Titel
  vorschlaegt.
