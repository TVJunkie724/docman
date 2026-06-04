---
title: "Decision - Profile Shared Management"
description: "Entscheidung zur gemeinsamen Verwaltung eines Profils durch mehrere Profile ohne fruehe Rollenmatrix"
tags: [decision, profiles, household, management, permissions]
lastUpdated: "2026-06-04"
status: "accepted"
---

# Decision - Profile Shared Management

## Status

Accepted.

R5-D3 ist entschieden. Mehrere Profile duerfen ein anderes Profil gemeinsam
verwalten, aber fruehe Milestones brauchen noch keine feingranulare
Viewer-/Editor-Rollenmatrix.

## Entscheidung

Verwaltung ist in fruehen Phasen binaer:

- Ein Profil kann durch null, ein oder mehrere andere Profile verwaltet werden.
- Eine aktive Verwaltungsbeziehung erlaubt die Verwaltung der im aktuellen
  Produktumfang vorgesehenen Profil-, Dokument-, Vorgangs-, Aufgaben- und
  Faktendaten.
- Verwaltung ist separat von Login/Identity.
- Ein Profil mit eigener Identity kann weiterhin verwaltet werden.
- Verwaltung kann deaktiviert oder entfernt werden.

Damit koennen z. B. beide Eltern dasselbe Kinderprofil verwalten, ohne dass
Ordna sofort eine komplexe Rechte- und Rollenmatrix braucht.

## Modellrichtung

```text
ProfileManagementGrant
  managedProfileId
  managerProfileId
  status: active | disabled | revoked
  createdAt
  revokedAt optional
```

Ein spaeteres Rollenfeld kann vorbereitet werden, wird aber fachlich nicht als
Rollenmatrix ausgespielt:

```text
role: manager
```

Wenn spaeter `viewer`, `editor`, dokumentbezogene Rechte oder externe
Freigaben noetig werden, gehoeren sie in einen spaeteren R6/R14-Ausbau.

## Konsequenzen

- R5-D3 ist entschieden: mehrere Manager pro verwaltetem Profil sind erlaubt.
- Frueh gibt es nur aktive/inaktive/widerrufene Verwaltung.
- `viewer` und `editor` sind fuer den aktuellen Plan zu viel.
- Das Datenmodell darf spaetere Rollen nicht blockieren, aber UI und
  Produktlogik bleiben zuerst einfach.
- Externe Freigabe, dokumentbezogene Rechte und komplexe Rollen sind nicht Teil
  dieser Entscheidung.

## Nicht entschieden

- wer eine aktive Verwaltung entfernen darf.
- ob ein minderjaehriges Profil eigene Verwaltung widerrufen darf.
- welche Audit-Regeln fuer Grant-Aenderungen gelten.
- welche Rollen spaeter fuer externe Freigaben gebraucht werden.
