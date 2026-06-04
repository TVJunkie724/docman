---
title: "Decision - Profile Identity and Management"
description: "Entscheidung zur Trennung von Login-/Identity-Faehigkeit und Verwaltung eines Profils"
tags: [decision, profiles, household, identity, login, management, permissions]
lastUpdated: "2026-06-04"
status: "accepted"
---

# Decision - Profile Identity and Management

## Status

Accepted.

R5-D2 ist entschieden. Login-/Identity-Faehigkeit und Verwaltung eines Profils
sind zwei getrennte Achsen. R5-D3 regelt gemeinsame Verwaltung ohne fruehe
Rollenmatrix in `DECISION_PROFILE_SHARED_MANAGEMENT.md`.

## Entscheidung

Ein Profil kann eine eigene Login-/Identity-Anbindung haben, ohne dass dadurch
automatisch bestehende Verwaltungsbeziehungen verschwinden.

Umgekehrt kann ein Profil verwaltet werden, ohne selbst einen Login zu haben.
Verwaltung ist eine Berechtigungsbeziehung, kein Profiltyp und kein Altersstatus.

Damit gibt es fachlich vier sinnvolle Kombinationen:

| Fall | Login/Identity | Verwaltet durch andere | Beispiel |
|---|---:|---:|---|
| selbststaendiges Profil | ja | nein | eigenes Profil einer erwachsenen Person |
| verwaltetes Profil ohne Login | nein | ja | kleines Kind oder Angehoeriger ohne eigenen Zugang |
| verwaltetes Profil mit Login | ja | ja | Teenager mit eigenem Zugang, Eltern verwalten weiterhin mit |
| vorbereitetes Profil | nein | nein | selten, z. B. unvollstaendig angelegtes Profil ohne Freigabe |

Die normale Haushaltslogik soll die ersten drei Faelle unterstuetzen.

## Modellrichtung

Profile, Login/Identity und Management Grants werden getrennt modelliert:

```text
Profile
  id
  displayName
  householdId

ProfileIdentity
  profileId
  provider: local | google | microsoft | idAustria | ...
  email optional
  status: active | pending | disabled

ProfileManagementGrant
  managedProfileId
  managerProfileId
  status: active | disabled | revoked
  createdAt
  revokedAt optional
```

Frueh ist Verwaltung binaer. Ein spaeteres Rollenfeld kann vorbereitet werden,
bleibt aber fachlich `manager`, bis ein spaeterer Milestone feinere Rechte
wirklich braucht. Wichtig ist die Trennung:

- `ProfileIdentity` beantwortet: Kann diese Person sich anmelden?
- `ProfileManagementGrant` beantwortet: Wer darf dieses Profil sehen,
  bearbeiten oder verwalten?
- `Profile` bleibt die fachliche Person, der Dokumente, Vorgänge, Records,
  Fakten, Aufgaben und Versicherungen zugeordnet sind.

## Umwandlung

Ein Profil kann spaeter eine Identity erhalten.

Beispiele:

- Ein Kind bekommt spaeter einen eigenen Login.
- Ein Partner bekommt spaeter Zugriff auf sein Profil.
- Eine verwaltete Person soll bestimmte Dokumente selbst sehen oder bearbeiten.

Regeln:

- Die Profil-ID bleibt stabil.
- Dokumente, Records, Vorgänge, Claims, Fakten und Versicherungen werden nicht
  kopiert.
- Bestehende Verwaltungsbeziehungen bleiben aktiv, bis sie explizit deaktiviert
  oder widerrufen werden.
- Verwaltung kann eingeschraenkt, deaktiviert oder entfernt werden.
- Die Umwandlung erzeugt keine automatische Vollfreigabe fuer fremde Profile.

## UI-Richtung

Die UI sollte diese Konzepte getrennt zeigen:

- Login/Account: "Dieses Profil kann sich anmelden."
- Verwaltung: "Dieses Profil wird verwaltet von ..."
- Rechte: "Diese Person darf sehen/bearbeiten/verwalten."

Ein Profil mit eigenem Login darf weiterhin sichtbar als verwaltet markiert
sein, wenn eine aktive Verwaltungsbeziehung existiert.

## Konsequenzen

- R5-D2 ist entschieden: verwaltete Profile brauchen in fruehen Phasen keinen
  eigenen Login, koennen aber spaeter eine Login-/Identity-Anbindung erhalten.
- Ein Login entfernt Verwaltung nicht automatisch.
- Verwaltung ist reversibel und separat steuerbar.
- Dokumente gehoeren fachlich zu Profilen, nicht zu Login-Accounts.
- R6 muss Identity, Sessions, Sync und Rechte gegen diese Trennung planen.
- R5-D3 baut auf `ProfileManagementGrant` mit einfacher gemeinsamer Verwaltung
  auf.
- R5-D4 klaert Partner-/Haushaltszugriff ohne Dokumentkopien.

## Nicht entschieden

- exakte spaetere Rollenmatrix.
- ob ein minderjaehriges Profil seine eigene Verwaltung selbst widerrufen darf.
- welche Zustimmung fuer Umwandlung in ein Login-Profil noetig ist.
- konkrete Identity Provider und Reihenfolge.
- konkrete Audit-Anforderungen fuer Grant-Aenderungen.
