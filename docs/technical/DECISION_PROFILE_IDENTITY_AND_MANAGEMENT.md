---
title: "Decision - Profile Identity and Management"
description: "Entscheidung zur Trennung von Login-/Identity-Faehigkeit, verwalteten Personen/Organisationen und Management-Beziehungen"
tags: [decision, profiles, managed-subjects, persons, organizations, household, identity, login, management, permissions]
lastUpdated: "2026-07-14"
status: "accepted-rebaseline"
---

# Decision - Profile Identity and Management

## Status

Accepted and extended on 2026-07-14 through
`DECISION_MANAGED_SUBJECTS_BUSINESS_CONTEXTS.md`.

R5-D2 ist entschieden. Login-/Identity-Faehigkeit und Verwaltung eines Profils
sind zwei getrennte Achsen. R5-D3 regelt gemeinsame Verwaltung ohne fruehe
Rollenmatrix in `DECISION_PROFILE_SHARED_MANAGEMENT.md`.

## Entscheidung

Ein verwaltetes Personenprofil kann eine eigene Login-/Identity-Anbindung haben, ohne dass dadurch
automatisch bestehende Verwaltungsbeziehungen verschwinden.

Umgekehrt kann eine Person oder Organisation verwaltet werden, ohne selbst
einen Login zu haben. Verwaltung ist eine Berechtigungsbeziehung, kein
Profiltyp und kein Altersstatus. Ein eigenes Unternehmen folgt damit demselben
Management-Prinzip wie ein Kinderprofil, besitzt aber organisationsspezifische
Felder und Compliance-Regeln.

Damit gibt es fachlich vier sinnvolle Kombinationen:

| Fall | Login/Identity | Verwaltet durch andere | Beispiel |
|---|---:|---:|---|
| selbststaendiges Profil | ja | nein | eigenes Profil einer erwachsenen Person |
| verwaltetes Profil ohne Login | nein | ja | kleines Kind oder Angehoeriger ohne eigenen Zugang |
| verwaltetes Profil mit Login | ja | ja | Teenager mit eigenem Zugang, Eltern verwalten weiterhin mit |
| vorbereitetes Profil | nein | nein | selten, z. B. unvollstaendig angelegtes Profil ohne Freigabe |

Die normale Haushaltslogik soll die ersten drei Faelle unterstuetzen.

## Modellrichtung

ManagedSubject, Login/Identity und Management Grants werden getrennt modelliert:

```text
ManagedSubject
  id
  displayName
  subjectType: person | organization
  contextId

ProfileIdentity
  subjectId
  provider: local | google | microsoft | idAustria | ...
  email optional
  status: active | pending | disabled

ProfileManagementGrant
  managedSubjectId
  managerSubjectId
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
- `ManagedSubject` bleibt die fachliche Person oder Organisation, der
  Dokumente, Vorgänge, Records, Fakten, Aufgaben und Versicherungen zugeordnet
  sind.
- Externe Ärzte, Behörden, Versicherer oder Anbieter sind `ExternalParty` und
  nicht automatisch verwaltete Organisationsprofile.

## Umwandlung

Ein Profil kann spaeter eine Identity erhalten.

Beispiele:

- Ein Kind bekommt spaeter einen eigenen Login.
- Ein Partner bekommt spaeter Zugriff auf sein Profil.
- Eine verwaltete Person soll bestimmte Dokumente selbst sehen oder bearbeiten.
- Eine Organisation bekommt später mehrere berechtigte Manager oder eine
  eigene Administrationsform.

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
- Private und geschäftliche Profile dürfen nicht allein aufgrund derselben
  verwaltenden Person zusammengeführt werden.
- R6 muss Identity, Sessions, Sync und Rechte gegen diese Trennung planen.
- `DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md` und REG-04 konkretisieren die spaetere
  Identity-Schicht: ID Austria ist ein sinnvoller erster oesterreichischer
  Provider, muss aber ueber eine generische eIDAS-/EUDI-faehige
  `TrustedIdentityProvider`-Grenze austauschbar bleiben. Identity beantwortet,
  wer eine Person ist; Key Management beantwortet, welche Daten entschluesselt
  werden duerfen.
- R5-D3 baut auf `ProfileManagementGrant` mit einfacher gemeinsamer Verwaltung
  auf.
- R5-D4 klaert Partner-/Haushaltszugriff ohne Dokumentkopien.

## Nicht entschieden

- exakte spaetere Rollenmatrix.
- ob ein minderjaehriges Profil seine eigene Verwaltung selbst widerrufen darf.
- welche Zustimmung fuer Umwandlung in ein Login-Profil noetig ist.
- konkrete Identity Provider und Reihenfolge.
- konkrete Audit-Anforderungen fuer Grant-Aenderungen.
- Commercial-1.0-Aktivierung von Organisationsprofilen und deren
  länderspezifische Aufbewahrungs-/Steuergrenzen.
