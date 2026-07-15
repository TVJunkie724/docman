---
title: "Decision - Household and Managed Subject Access"
description: "Zielmodell für Haushalte, verwaltete Personen und Organisationen, Zuordnung und spätere Berechtigungen"
tags: [decision, household, profiles, managed-subjects, organizations, family, access, permissions, sharing]
lastUpdated: "2026-07-15"
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
    Dokumente, Records, Cases, Facts und Claims
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
- Globales Capture verlangt keine Profilwahl vor dem Scan.
- Core Assist schlägt aus Inhalt und Kontext das wahrscheinlich betroffene
  Managed Subject vor.
- Die aktuelle Reifestufe verlangt nur dann eine sichtbare Bestätigung oder
  Korrektur, wenn die Zuordnung unsicher ist oder eine wesentliche Folge hat.
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
Case: Kniebehandlung 2026
  Dokumente: Überweisung, Befund, Arztbrief
  verknüpfter Case: Arztrechnung und Erstattung
  verknüpfter Record: Zusatzversicherung Kind A
```

Die Polizze bleibt ein Record des Kindes und wird nicht in jeden medizinischen
Case kopiert. Rechnungs-, Behandlungs- und Erstattungsbeziehungen werden durch
Case-Links und Rollen ausgedrückt.

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
