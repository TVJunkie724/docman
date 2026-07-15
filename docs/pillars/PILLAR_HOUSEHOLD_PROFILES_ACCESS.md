---
title: "Produkt-Säule - Managed Profiles and Access"
description: "Produktbereich fuer Haushaltsprofile, Kinderprofile, verwaltete Organisationen, Partnerzugriff und spätere Rechte"
tags: [pillar, profiles, managed-subjects, organizations, household, access, family, permissions]
lastUpdated: "2026-07-15"
version: "0.3"
status: "proposed"
owner: "product-concept"
---

# Produkt-Säule - Household Profiles and Access

## Zweck

Mappm soll für mehrere Personen im Haushalt und optional für eigene verwaltete
Organisationen funktionieren.

Eine Person kann eigene Dokumente verwalten, Kinderprofile mit einem Partner teilen und später auch Dokumente eines Partners sehen oder bearbeiten, wenn Rechte das erlauben.

## Zielbild

```text
Household
  -> Adult Profile
  -> Adult Profile
  -> Child Profile

Managed Context
  -> Organization Profile (for example own business)
     -> no own login required
  -> Child Profile
```

Dokumente, Vorgänge, Records, Tasks, Claims und Quick-Access-Einträge können
einem Personen- oder Organisationsprofil zugeordnet werden. Externe Anbieter
bleiben `ExternalParty` und werden nicht mit eigenen Organisationen vermischt.

## C1/C3-Vorbereitung

Schlanker Commercial-Core-Slice:

- ein Haushalt.
- Managed Subject durch Core Assist vorschlagen und bei Unsicherheit oder
  materieller Folge korrigierbar machen.
- Personen-/Profil-ID in den relevanten Modellen vorbereiten.
- Capture Review kann die Managed-Subject-Zuordnung korrigieren.
- Mobile Capture bewahrt den Personenkontext, falls vorhanden.

Spaetere Slices:

- mehrere echte Nutzeraccounts.
- Partnerfreigabe.
- vollständige Rollenmatrix.
- externe Freigaben.

## Zielrechte

Spätere Rollen:

- owner.
- manager.
- editor.
- viewer.

Kinderprofile haben früh keine eigenen Accounts. Erwachsene können Kinderprofile gemeinsam verwalten.
Eigene Unternehmen folgen demselben Management-Prinzip ohne eigenen Login,
brauchen aber getrennte Privat-/Geschäftsansichten, eigene Felder und
länderspezifische Compliance.

## Beispiel: Behandlung und Arztrechnung Kind

Ein dokumentgestuetzter Behandlungs-/Abrechnungsvorgang fuer ein Kind kann so
organisiert werden:

- Vorgang `Behandlung und Arztrechnung abrechnen`.
- Profil: Kind.
- Dokumente: Rechnung, Arztbrief, Rezept, Apothekenrechnung.
- Claims: SV, Zusatzversicherung.
- Record-Link: Versicherungspolizze des Kindes.
- Tasks: einreichen, warten, Zusatzversicherung einreichen.
- externe Aktionslinks: SV-Portal, Zusatzversicherung.

Dokumente werden nicht kopiert. Zusammenhänge entstehen über Links und Profile.

## Abgrenzung

- Vorgangsstruktur liegt in `PILLAR_CASES_RECORDS.md`.
- Tasks und Reminder liegen in `PILLAR_TASKS_REMINDERS_QUICK_ACCESS.md`.
- Account/Cloud/Identity liegt in `PILLAR_CLOUD_IDENTITY_SYNC.md`.
- Steuer-/Business-Unterlagensammlung folgt
  `DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md`.
- Security- und Privacy-Regeln liegen in technischen Entscheidungen und querschnittlichen Konzepten.

## Offene Folgefragen

- Welche Profildaten speichern wir bewusst nicht im Commercial Core?
- Wie sichtbar sind Kinderprofile in Mobile Capture?
- Welche Rechte braucht Partnerzugriff zuerst?
- Werden Organisationsprofile in Commercial 1.0 aktiviert oder nur im
  Zielmodell vorbereitet?

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
