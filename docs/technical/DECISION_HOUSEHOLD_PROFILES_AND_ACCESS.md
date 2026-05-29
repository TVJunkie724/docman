---
title: "Decision - Household Profiles and Access"
description: "Entscheidung zum Zielmodell fuer Haushaltsmitglieder, Kinderprofile, gemeinsame Verwaltung, Profilzuordnung und spätere Berechtigungen"
tags: [decision, household, profiles, family, access, permissions, sharing]
lastUpdated: "2026-05-29"
status: "accepted"
---

# Decision - Household Profiles and Access

## Status

Accepted.

## Entscheidung

DocMan wird als Haushalts-Dokumentenmanagement geplant.

M2 startet minimal mit einem Haushalt und expliziter Zuordnung zu einer
betroffenen Person / einem Haushaltsprofil. Es gibt keine Annahme, dass ein
Dokument meistens der aktuell nutzenden Person gehoert. Das Zielmodell bleibt
mehrpersonenfaehig: Familienmitglieder werden als eigene Profile verwaltet,
Kinderprofile koennen von Erwachsenen gemeinsam gesehen und bearbeitet werden,
und spaeter kommen Rollen, Rechte und Sync/Identity dazu.

## Zielmodell

```text
Household
  Members / Profiles
    Erwachsene
    Kinder
    weitere verwaltete Personen optional später

Profile
  eigene Dokumente
  eigene Records/Nachweise
  eigene Vorgänge
  eigene Facts/Claims
```

Ein Dokument, Record, Vorgang, Fact oder Claim kann:

- primaer einem Profil gehoeren.
- mehrere Profile betreffen.
- von bestimmten Haushaltsmitgliedern verwaltet werden.
- spaeter eigene Sicht-/Bearbeitungsrechte tragen.

## M2

In M2 gilt:

- ein Haushalt.
- betroffene Person / Haushaltsprofil ist beim Review-Abschluss verpflichtend.
- Dokumente, Vorgänge, Drafts und Records bereiten mehrpersonenfaehige Profilzuordnung vor.
- Draft-Inbox und Mobile Capture muessen Personenkontext setzen oder nachtraeglich korrigierbar machen.
- Kinder-/Partner-Sharing wird noch nicht vollständig umgesetzt.

M2 soll also nicht die volle Rechteverwaltung bauen, aber auch nicht so tun, als
gäbe es nur eine anonyme Einzelperson.

## Spätere Milestones

R5/R6 bauen aus:

- mehrere Profile in einem Haushalt.
- Kinderprofile ohne eigene Accounts.
- Erwachsene als Manager fuer Kinderprofile.
- Partner kann freigegebene Profile/Dokumente sehen oder bearbeiten.
- spaetere Rollen wie `owner`, `manager`, `editor`, `viewer`.
- Sync/Auth verbindet Personen, Geraete und Haushaltsrechte.

## Draft-Inbox und Scan

Beim Scan oder Draft Review braucht DocMan langfristig diese Zuordnungen:

- Profil: z. B. Kind A.
- primaerer Vorgang: z. B. Arztbesuch Kind A.
- optional neuer Vorgang oder Subvorgang.
- optional spaeter verknuepfte Records: z. B. Zusatzversicherung Kind A.
- optional spaeter Claims/Facts: z. B. SV-Erstattung oder Zusatzversicherung.

M2:

- betroffene Person waehlen oder nachtraeglich setzen.
- primaeren Vorgang waehlen oder neuen Vorgang/Subvorgang erstellen.
- Dokument bleibt primaer einem Vorgang zugeordnet.

Spaeter:

- Dokumente mehreren Vorgängen, Claims oder Records mit Rollen zuordnen.
- verknuepfte Records wie Polizzen anzeigen, ohne sie in jeden Arztbesuch zu duplizieren.
- Claims und Financial Facts direkt aus Draft Review erzeugen.

## Beispiel: Kind Beim Arzt

```text
Profile: Kind A

Record: Zusatzversicherung Kind A
  current version: Polizze 2026

Case: Arztbesuch Kind A
  primaryProfile: Kind A
  documents:
    - Arztbrief
    - Arztrechnung
    - Apothekenrechnung
  linkedRecords:
    - Zusatzversicherung Kind A
  claims:
    - SV Erstattung
    - Zusatzversicherung Erstattung

Optionaler Subvorgang: Apotheke / Rezept
  parentCase: Arztbesuch Kind A
  documents:
    - Rezept
    - Apothekenrechnung
```

Die Polizze wird nicht in den Arztbesuch kopiert. Sie bleibt ein Record des Kindes und wird kontextuell verknüpft.

## Security und Privacy

Haushaltsprofile enthalten sensible Daten.

Regeln:

- Kinderprofile brauchen besonders vorsichtige Defaults.
- Medizinische, schulische, Ausweis- und Versicherungsdaten sind hochsensibel.
- Rechte- und Profilwechsel duerfen nicht dazu fuehren, dass Dokumente versehentlich sichtbar werden.
- Sharing und Sync brauchen Audit-/Telemetry-Regeln ohne Inhaltsdaten.
- Exporte und Loeschungen muessen profilbezogen planbar sein.

## Konsequenzen

- R5 Assisted Review and Household Profiles wird wichtiger als reine Komfortphase.
- R4 muss Profilzuordnung vorbereiten.
- Draft-Inbox darf Profilkontext nicht verlieren.
- F10/F14/F17 muessen Profil-/Haushaltskontext berücksichtigen.
- Vollstaendige Rollenmatrix bleibt ein spaeterer Milestone, aber das Datenmodell darf sie nicht blockieren.

## Nicht entschieden

- exaktes Rollenmodell.
- ob Erwachsene im Haushalt initial automatisch alle Kinderprofile sehen.
- wie Konflikte geloest werden, wenn zwei Erwachsene dasselbe Dokument bearbeiten.
- wie externe Freigabe an Anwalt, Arzt, Schule oder Behörde spaeter funktioniert.
