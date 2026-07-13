---
title: "Decision - Initial Case and Workflow Family Catalog"
description: "Vollstaendiger Katalog der bisher definierten Mappm-Vorgaenge, Record-Kontexte, internen Branches und noch unkonkretisierten Familien"
tags: [decision, product, cases, workflows, catalog, records, claims, custom-cases]
lastUpdated: "2026-07-14"
status: "accepted-direction"
owner: "product-concept"
---

# Decision - Initial Case and Workflow Family Catalog

## Status und Zweck

Accepted as the complete catalog of the product discussion through 2026-07-14.
It records what is already concretely defined, what is a Record-led context,
what remains inside another Case and which named families still need discovery.
It is not a Commercial-1.0 country-pack commitment; WF-01/WF-02 remain release
gates.

All entries use the single `Case` entity from
`DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`. Catalog keys classify a
Case or attach a workflow; they never introduce domain subtypes.

## Concretely Defined Guided Cases

| Catalog key | User goal / boundary | Internal stages, branches and Claims | Separate linked Case only when |
|---|---|---|---|
| `medical_expense_reimbursement` | eine Arzt-, Therapie-, Apotheken- oder vergleichbare Gesundheitsausgabe vollstaendig bezahlen, einreichen und abrechnen | Rechnung pruefen/bezahlen; primaerer SV-/Payer-Claim; Antwort/Erstattung; optionaler Zusatzversicherungs-Claim; Eigenanteil; Abschluss | eine laengerfristige Behandlung, ein formeller Streit oder ein anderes Ziel einen eigenen Lifecycle bekommt |
| `accident_or_damage_settlement` | Unfall oder Schaden dokumentieren, melden, regulieren und mit bestaetigtem Ergebnis abschliessen | Beweise/Beteiligte; Polizei als bedingter Step/Event; Werkstatt/Reparatur als Branch; Versicherungs-Claims; Zahlungen; erste medizinische/rechtliche Folgen | Behandlung langfristig wird, ein formelles Verfahren entsteht oder ein anderer Folgeprozess unabhaengig fortbesteht |
| `purchase_fulfilment_and_remedy` | Kauf von Bestellung/Lieferung bis akzeptiertem Produkt oder abgeschlossener Rueckabwicklung verfolgen | Bestellung, Rechnung, Lieferung, Zahlung, Rueckgabe, Garantie/Gewaehrleistung, Reklamation und Erstattung als States/Branches/Claims desselben Ziels | ein formeller Streit, Inkasso-/Gerichtsweg oder eigenstaendiger Folgeanspruch entsteht |
| `authority_application_or_submission` | Antrag/Einreichung vorbereiten, absenden, Rueckfragen beantworten und Entscheidung erhalten | Nachweise sammeln, einreichen, warten, nachreichen, Bescheid/Entscheidung, Zahlung/Erstattung soweit passend | Einspruch/Beschwerde ein eigenes Ziel, Fristen und Ergebnis besitzt |
| `objection_dispute_or_recovery` | eine konkrete Entscheidung, Forderung, Ablehnung oder Leistung anfechten bzw. rueckfordern | Begruendung, Nachweise, Einreichung, Gegenantworten, Fristen, Vergleich/Entscheidung/Zahlung | ein formelles Gerichts- oder Behoerdenverfahren als eigener Prozess beginnt |
| `tax_document_collection` | fuer Managed Subject, Rechtsraum, Regime und Periode Unterlagen sammeln, pruefen und kontrolliert uebergeben/exportieren | Kandidaten, Bestaetigung, fehlende Unterlagen, periodische Sammlung, Review, Export/Handoff; keine Steuerberechnung | Bescheid, Einspruch oder Pruefung ein unabhaengiges Ziel erzeugt |
| `record_acquisition_renewal_or_replacement` | langlebigen Nachweis beantragen, erneuern oder ersetzen | Antrag, Identitaets-/Evidenzpruefung, Termin, Gebuehr, Ausstellung, Empfang | Ablehnung, Verlust-/Missbrauchsfolge oder Rechtsmittel unabhaengig wird |

## Record-led Contexts, Not Automatic Standalone Cases

| Context | Normal behavior | Possible linked Case |
|---|---|---|
| Vertrag/Abo | ein langlebiger `Record` mit Abschluss, Aktivierung, normaler Aenderung, Preispruefung, Kuendigung, Endabrechnung, Rechnungen, Tasks und Reminder in einem ruhigen Kontext | eigenstaendiger Streit, Rueckforderung oder formelles Verfahren |
| Identitaetsnachweis | Reisepass, Personalausweis, Fuehrerschein, Geburtsurkunde oder Meldeunterlage ist eine Unterlage/Record mit Versionen und Gueltigkeit | Beantragung, Erneuerung, Ersatz oder Streit nach obigem Case-Typ |
| Versicherungspolizze | langlebiger Record mit Deckung, Laufzeit, Praemie und Versionen | Schaden-/Erstattungs-Case oder eigenstaendiger Deckungsstreit |
| Asset/Garantie | langlebiger Record fuer Produkt, Kaufnachweis, Seriennummer und Garantie | Kauf-/Rueckgabe-/Garantie-Case bei konkretem Handlungsziel |

Eine eingehende Rechnung erzeugt nicht blind einen Case. Sie wird zuerst einem
bestehenden Contract-, Purchase-, Tax- oder Reimbursement-Kontext zugeordnet
oder schlaegt nach Review einen passenden neuen Case/Record vor.

## Explicit Manual/Custom Cases

Custom Cases haben dieselben Faehigkeiten wie Guided Cases. Bisher besprochene
Beispiele sind:

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

## Named Families Requiring Further Discovery

Diese Familien wurden als sinnvoll benannt, aber noch nicht als konkreter
Golden Workflow spezifiziert. Future agents duerfen daraus keine erfundenen
States oder Laenderregeln ableiten:

- Bildung/Betreuung;
- Arbeit/Einkommen;
- Wohnen ausserhalb bewusst angelegter Custom-/Vertragskontexte;
- Fahrzeug/Mobilitaet ausserhalb Unfall/Schaden und Contract/Record;
- Reise/Ausland ausserhalb eines Custom-Umbrella und konkreter Claims;
- weitere persoenliche/familiaere Lebensereignisse.

Jede Aktivierung braucht Ziel/Outcome, Case-Grenze, States/Branches/Claims,
erwartete Dokumentrollen, Rechtsraum, Quellen, Owner, Fixtures und Stop Rules.

## Things That Are Not Cases by Themselves

- ein Dokument, eine Rechnung oder ein Absender;
- ein Arztbesuch ohne dokumentiertes Handlungs-/Nachweisziel;
- Polizei, Werkstatt, Krankenhaus, Arzt, Versicherer oder Behoerde als Akteur;
- Einreichung, Antwort, Erstattung, Zahlung oder Kuendigung als einzelner Status;
- ein Claim gegen SV, Zusatzversicherung, Garantiegeber oder Behoerde;
- ein Workflow-Step, Event, Task oder bedingter Branch;
- Reisepass, Geburtsurkunde, Vertrag, Polizze oder Garantie als langlebiger Record;
- Tags, Spaces, Ordner oder Suchergebnisse.

Diese Elemente koennen einen Case ausloesen, belegen oder darin eine Rolle
tragen. Ein eigener Case entsteht erst beim unabhaengigen Ziel-/Lifecycle-/
Outcome-Test.

## Country and Release Rule

Der Katalog trennt universelle Familie und veroeffentlichte Laendervariante.
Oesterreichische SV-/Zusatzversicherungs- und Steuerbeispiele sind Referenzen,
keine weltweit hardcodierten Regeln. Andere Laender erhalten eigene versionierte
Payer-, Frist-, Evidenz- und Terminologievarianten. Ohne freigegebenes Pack ist
nur der neutrale Custom Case erlaubt.

## Stop Rules

Stop if:

- eine nicht konkretisierte Familie als fertiger Workflow implementiert wird;
- Actor, Dokument, Claim, Branch oder Status als eigener Case-Typ modelliert wird;
- Contract-/Identity-/Policy-Records als Cases missbraucht werden;
- ein Custom Case weniger kann als ein Guided Case;
- ein Land, Provider, Anspruch oder eine Frist ohne WF-01/WF-02-Gate behauptet wird;
- diese Liste als abgeschlossenes Weltmarktversprechen statt als aktueller
  Produktkatalog behandelt wird.
