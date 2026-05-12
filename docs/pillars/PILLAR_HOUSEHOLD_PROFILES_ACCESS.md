---
title: "Produkt-Säule - Household Profiles and Access"
description: "Produktbereich fuer Haushaltsprofile, Kinderprofile, Partnerzugriff, Profilzuordnung und spätere Rechte"
tags: [pillar, profiles, household, access, family, permissions]
lastUpdated: "2026-05-06"
version: "0.1"
status: "proposed"
---

# Produkt-Säule - Household Profiles and Access

## Zweck

DocMan soll für mehrere Personen im Haushalt funktionieren.

Eine Person kann eigene Dokumente verwalten, Kinderprofile mit einem Partner teilen und später auch Dokumente eines Partners sehen oder bearbeiten, wenn Rechte das erlauben.

## Zielbild

```text
Household
  -> Adult Profile
  -> Adult Profile
  -> Child Profile
  -> Child Profile
```

Dokumente, Vorgänge, Records, Tasks, Claims und Quick-Access-Einträge können einem Profil zugeordnet werden.

## MVP-Vorbereitung

MVP-light:

- ein Haushalt.
- ein aktives Profil.
- Profil-ID in den relevanten Modellen vorbereiten.
- Draft-Inbox kann Profilzuordnung korrigieren.
- Mobile Capture bewahrt den Profilkontext, falls vorhanden.

Noch nicht MVP:

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

## Beispiel: Arztbesuch Kind

Ein Arztbesuch fuer ein Kind kann so organisiert werden:

- Vorgang `Arztbesuch`.
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
- Sync/Auth liegt in `PILLAR_HOME_HUB_SYNC.md`.
- Security- und Privacy-Regeln liegen in technischen Entscheidungen und querschnittlichen Konzepten.

## Offene Folgefragen

- Welche Profildaten speichern wir bewusst nicht im MVP?
- Wie sichtbar sind Kinderprofile in Mobile Capture?
- Welche Rechte braucht Partnerzugriff zuerst?
