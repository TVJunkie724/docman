---
title: "Decision - Household Manager Access"
description: "Haushalts- und Profilzugriff über Grants statt Dokumentkopien"
tags: [decision, household, profiles, access, sharing, permissions, parents]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "product-concept/security"
---
# Decision - Household Manager Access

## Status

Angenommen als Zielrichtung. Eine produktive gemeinsame Verwaltung wird erst
mit freigegebenem Authorization-, Audit-, Consent- und Revocation-Contract
aktiviert.

## Entscheidung

Mappm trennt fachliche Betroffenheit/Eigentum von Zugriffsrechten. Dokumente,
Records, Cases, Aufgaben, Facts und Versicherungen bleiben dem betroffenen
Managed Subject zugeordnet. Mehrere berechtigte Personen greifen über
`HouseholdAccessGrant` oder `ProfileManagementGrant` darauf zu; Daten werden
nicht für jede berechtigte Person kopiert.

Frühe gemeinsame Haushaltsverwaltung darf mit einer verständlichen Manager-
Rolle starten. Sie ist trotzdem keine implizite Allzugriffsannahme: besonders
sensible Bereiche, volljährige Profile, Organisationskontexte und
Rechtsraumregeln benötigen vor Aktivierung klare Defaults und Zustimmung.

## Modellrichtung

```text
HouseholdAccessGrant
  householdId
  granteeSubjectId
  role: manager
  status: pending | active | disabled | revoked
  createdAt
  revokedAt optional

ProfileManagementGrant
  managedSubjectId
  managerSubjectId
  status: pending | active | disabled | revoked
```

Spätere feinere Rollen werden ergänzt, ohne Dokumentidentitäten oder
fachliche Zuordnungen zu verändern.

## Scope-Grenzen

- Keine Dokument-für-Dokument-Matrix im ersten Haushalts-Slice.
- Keine automatische Freigabe außerhalb des Haushalts.
- Account-zu-Account-Sharing und zeitlich begrenzte Freigaben sind geplant,
  aber ein eigener Security-/Privacy-/Contract-Slice.
- Bewusster lokaler Export ist kein verstecktes Account-Sharing.
- Grant-Entzug, Geräte-/Session-Widerruf und Offline-Cache-Bereinigung müssen
  vor produktiver Freigabe getestet sein.

## Verifikation und offene Punkte

Tests decken Einladung, Annahme, Ablehnung, Entzug, Sessionwechsel, Offline-
Cache, mehrere Manager, volljähriges Profil, Kinderprofil, Organisation,
Tenant-Isolation und fehlende Rechte ab. Audit-Daten enthalten keine
Dokumentinhalte.

Offen bleiben die spätere Rollenmatrix, Consent-/Minderjährigenregeln,
private Bereiche innerhalb eines Haushalts, Notification-Policy und der genaue
Secure-Sharing-Vertrag. Keine dieser Funktionen wird aus diesem Dokument
implizit freigegeben.
