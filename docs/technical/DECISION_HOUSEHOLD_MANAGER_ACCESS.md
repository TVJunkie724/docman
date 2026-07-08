---
title: "Decision - Household Manager Access"
description: "Entscheidung zu Eltern-/Haushaltsmanager-Zugriff, Partnerdokumenten und Profilzugriff ohne Dokumentkopien"
tags: [decision, household, profiles, access, sharing, permissions, parents]
lastUpdated: "2026-06-04"
status: "accepted"
---

# Decision - Household Manager Access

## Status

Accepted.

R5-D4 ist entschieden. Frueh startet Mappm mit vertrauensbasiertem
Haushaltsmanager-Zugriff: die Eltern bzw. vollwertigen Haushaltsmanager haben
Zugriff auf alle Profile im Haushalt. Dokumente werden dafuer nicht kopiert.

## Entscheidung

Mappm trennt zwischen:

- Dokument-/Datenbesitz: welches Profil betrifft oder besitzt ein Dokument?
- Haushaltsmanager-Zugriff: wer darf im Haushalt Profile und deren Daten
  verwalten?

Fuer die fruehen Haushaltsphasen gilt:

- Eltern/Haushaltsmanager haben Zugriff auf alle Haushaltsprofile.
- Dieser Zugriff umfasst auch verwaltete Profile, Kinderprofile und spaeter
  Profile mit eigener Identity, solange sie im Haushalt entsprechend freigegeben
  oder verwaltet sind.
- Partnerdokumente werden nicht kopiert.
- Dokumente, Records, Vorgänge, Aufgaben, Fakten und Versicherungen bleiben dem
  fachlich betroffenen Profil zugeordnet.
- Zugriff entsteht durch Household-/Profile-Access, nicht durch Duplikate.

Damit kann ein Elternteil z. B. Dokumente fuer alle Kinder sehen und bearbeiten,
und beide Eltern koennen denselben Haushaltsbestand pflegen.

## Modellrichtung

Frueh reicht ein grobes Haushaltsmanager-Konzept:

```text
HouseholdAccessGrant
  householdId
  profileId
  kind: householdManager
  status: active | disabled | revoked
```

`ProfileManagementGrant` bleibt fuer explizite Verwaltung eines bestimmten
Profils nuetzlich. `HouseholdAccessGrant` beschreibt dagegen den breiteren
Haushaltsmanager-Zugriff.

## Keine Dokumentkopien

Ein Dokument soll nicht in mehrere Profile kopiert werden, nur weil mehrere
Personen Zugriff brauchen.

Beispiel:

```text
Profile: Kind A
  Document: Arztbrief

Household Manager: Elternteil A
Household Manager: Elternteil B

Beide Eltern sehen den Arztbrief wegen HouseholdAccessGrant.
Der Arztbrief gehoert weiterhin fachlich zu Kind A.
```

Das gleiche gilt fuer Partnerdokumente:

```text
Profile: Partner A
  Document: Versicherungsvertrag

Profile: Partner B
  Zugriff ueber HouseholdAccessGrant oder spaetere explizite Freigabe
```

## Fruehe Grenzen

R5 braucht noch keine feingranulare Rechteverwaltung:

- keine Dokument-fuer-Dokument-Rechtematrix.
- keine Viewer-/Editor-Rollen fuer jedes Dokument.
- keine externe Freigabe an Anwalt, Schule, Arzt oder Behoerde.
- keine automatische Freigabe ausserhalb des Haushalts.

Spaetere Milestones koennen differenzieren:

- private Dokumentbereiche.
- dokumentbezogene Rechte innerhalb des Haushalts.
- lokale Exportpakete fuer externe Personen.
- Rollen wie viewer/editor fuer Partner oder Haushaltsmitglieder.
- Audit-Regeln fuer Zugriffsaenderungen.

## Konsequenzen

- R5-D4 ist entschieden: Partner-/Haushaltszugriff erfolgt ueber Rechte, nicht
  ueber Dokumentkopien.
- Eltern/Haushaltsmanager haben frueh Zugriff auf alle Profile im Haushalt.
- Dokumente bleiben fachlich dem betroffenen Profil, Record oder Vorgang
  zugeordnet.
- Vollstaendige Rollenmatrix fuer Haushaltszugriff bleibt ein spaeteres Thema.
- Externe App-Freigabe an Personen ausserhalb des Haushalts ist nach R14-D1
  nicht geplant; stattdessen lokaler Export.
- R6 muss Sync/Auth gegen HouseholdAccessGrant und ProfileManagementGrant
  planen.

## Nicht entschieden

- ob es in spaeteren Milestones private Bereiche innerhalb eines Haushalts gibt.
- ob und wie ein volljaehriges Profil Haushaltsmanager-Zugriff einschraenken
  darf.
- konkrete Audit- und Benachrichtigungsregeln fuer Zugriffsaenderungen.
- konkrete Export-/ZIP-UX fuer Personen ausserhalb des Haushalts.
