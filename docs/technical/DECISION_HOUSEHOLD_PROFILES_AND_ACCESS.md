---
title: "Decision - Household and Managed Subject Access"
description: "Zielmodell für Haushalte, verwaltete Personen und Organisationen, Zuordnung und spätere Berechtigungen"
tags: [decision, household, profiles, managed-subjects, organizations, family, access, permissions, sharing]
lastUpdated: "2026-07-24"
status: "accepted"
owner: "product-concept"
---
# Decision - Household and Managed Subject Access

## Status

Angenommen. Verwaltete Organisationen folgen ergänzend
`DECISION_MANAGED_SUBJECTS_BUSINESS_CONTEXTS.md`.

## Entscheidung

Mappm verwaltet Dokumente nicht nur für die angemeldete Person. Ein Account
kann einen Haushalt, weitere Personen ohne eigenen Login und eigene
Organisationen verwalten. Natürliche Personen und Organisationen verwenden
dasselbe Management-Prinzip, behalten aber getrennte Felder, Schutzregeln und
Länderlogik.

```text
Account / Household
  Managed Subject: Person
    optional eigene Identity
    Dokumente, Records, Cases, Facts und Submission Events
  Managed Subject: Organisation
    kein eigener Login erforderlich
    getrennte geschäftliche Dokumente, Records, Cases und Perioden
```

Ein Dokument oder fachliches Objekt kann:

- eine primär betroffene Person oder Organisation besitzen;
- weitere Beteiligte mit Rollen wie Empfänger, Zahler oder versicherte Person
  referenzieren;
- von mehreren berechtigten Personen verwaltet werden;
- später eigene Sicht- und Bearbeitungsrechte erhalten.

## Commercial-Core-Scope

- Der erste verkaufbare Scope unterstützt mindestens einen Haushalt, die
  Account-Person sowie verwaltete Personen und Organisationen im Datenmodell.
- Globales Capture beginnt in einem sichtbaren Managed-Subject-Kontext. Ein
  eindeutiges Profil darf vorausgewaehlt sein; bei mehreren Profilen erfolgt
  eine kompakte Auswahl/Bestaetigung oder der Kontext wird aus Profil/Case
  geerbt. Es entsteht kein allgemeines Profilformular.
- Der Managed-Subject-Kontext beschreibt, fuer wen beziehungsweise in welchem
  verwalteten Haushalts-/Organisationskontext die Nutzerin das Dokument fuehren
  will. Er muss nicht dem gedruckten Empfaenger oder einer genannten Person
  entsprechen.
- Core Assist prueft diesen Userkontext nicht semantisch und erzeugt aus Namen
  oder Empfaenger keinen Profilkonflikt. Extrahierte Parteien duerfen optionale
  Metadaten bleiben, aendern aber weder Subject noch Berechtigung oder Routing.
- Die aktuelle Reifestufe verlangt eine sichtbare, kompakte Subject-Auswahl
  beziehungsweise zeigt den geerbten Kontext; eine spaetere Korrektur bleibt
  moeglich.
- Implizite, bereits klare Informationen werden nicht wiederholt abgefragt.
- Capture-, Processing- und Review-Zustände dürfen den vorgeschlagenen oder
  bestätigten Profilkontext nicht verlieren.
- Vollständige gemeinsame Verwaltung, Rollen und Einladungen werden erst in
  einem freigegebenen späteren Slice umgesetzt; das Datenmodell darf sie nicht
  blockieren.

## Beispiel

```text
Managed Subject: Kind A

Record: Zusatzversicherung Kind A
Ruhiger Vertragskontext: Zusatzversicherung Kind A
Case: Kniebehandlung
  Dokumente: Überweisung, Befund, Arztbrief
  part_of-Case: Arztrechnung Dr. Mayer abrechnen
    verknüpfter Policy Record: Zusatzversicherung Kind A
```

Die Polizze bleibt ein Policy Record des Kindes und wird nicht in jeden
medizinischen Case kopiert. Ein tatsaechlicher Vertragsabschluss darf als
abgeschlossener Case mit dem Record als Ergebnis erhalten bleiben; ein
importierter Altvertrag braucht keinen erfundenen Abschluss-Case. Normale
Nachtraege und Versionen bleiben im ruhigen Vertragskontext.

Ein Managed Subject darf mehrere gleichzeitige oder historische
Sozialversicherungs-, Krankenfuersorge- und Zusatzversicherungsbeziehungen
besitzen. Je Managed Subject darf eine reine Sortierpraeferenz fuer
Sozialversicherung/Krankenfuersorge, ambulante Zusatzversicherung und
stationaere Zusatzversicherung gesetzt werden. Sie beweist keine Deckung,
Zustaendigkeit oder Einreichbarkeit und aktiviert keine Frist oder
Einreichung.

## Access-Zielmodell

Spätere Ausbaustufen dürfen unterstützen:

- verwaltete Profile ohne Account;
- nachträgliche Identity-Verknüpfung ohne Datenkopie;
- gemeinsame Verwaltung durch mehrere Personen;
- feinere Rollen wie `owner`, `manager`, `editor` und `viewer`;
- getrennte Grants für Haushalt, Profil, Organisation und einzelne Objekte;
- nachvollziehbaren Entzug, Export und Übergabe der Verwaltung.

Frühe Implementierungen erfinden keine halbfertige Rollenmatrix. Jede
Freigabestufe braucht explizite Authorization-, Audit-, Konflikt- und
Missbrauchstests.

## Security und Privacy

- Profil- und Organisationsdaten folgen
  `DECISION_PROFILE_SENSITIVE_DATA.md` und dem Security-/Privacy-Modell.
- Ausweis-, Sozialversicherungs-, Versicherungs-, medizinische, schulische,
  Steuer- und Geschäftsidentifikatoren sind hochsensibel.
- Identity, Login und fachliches Profil bleiben getrennte Konzepte.
- Rechte- oder Profilwechsel dürfen keine Daten unbeabsichtigt sichtbar machen.
- Exporte, Löschung, Suche, Telemetrie und Benachrichtigungen berücksichtigen
  die betroffenen Managed Subjects.
- Kinderprofile erhalten besonders zurückhaltende Defaults.
- ID Austria ist ein möglicher österreichischer Identity Provider innerhalb
  einer austauschbaren eIDAS-/EUDI-fähigen Identity-Schicht, keine
  fachliche Profilquelle.

## Offene Entscheidungen

Vor einer Freigabe gemeinsamer Verwaltung sind insbesondere Rollenmatrix,
Einladungs- und Entzugsablauf, Konfliktverhalten, Minderjährigenschutz sowie
profilbezogener Export und Löschung als eigene Implementation Contracts zu
entscheiden.
