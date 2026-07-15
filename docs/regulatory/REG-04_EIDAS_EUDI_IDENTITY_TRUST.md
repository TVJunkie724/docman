---
title: "REG-04 eIDAS, EUDI und ID Austria Identity Trust"
description: "Provider-neutrale Identity-, Attribut-, Signatur- und Trust-Grenze"
tags: [regulatory, eidas, eudi, id-austria, identity, trust]
status: "accepted-governance-needs-legal-review"
owner: "identity/compliance"
lastUpdated: "2026-07-15"
jurisdiction: "EU/EEA, Oesterreich"
regulatoryAsOf: "2026-07-15"
sourcesCheckedAt: "2026-07-15"
nextReviewDue: "2026-08-15"
primarySources: ["docs/regulatory/REGULATORY_SOURCE_REGISTER.md"]
legalReviewer: "Legal/Identity-Compliance-Pruefung erforderlich"
---

# REG-04 eIDAS, EUDI und ID Austria Identity Trust

## Produktentscheidung

Mappm besitzt eine austauschbare Identity-Provider-Grenze. ID Austria ist ein
vertrauensstarker oesterreichischer Providerkandidat; die EUDI Wallet ist das
europaeische, auf nationalen eIDs aufbauende Wallet-Framework. Beide sind nicht
als technisch oder rechtlich identisch zu behandeln.

Der normale Mappm-Account funktioniert ohne verpflichtende staatliche eID.
Staatliche/europaeische eID kann spaeter Identitaet bestaetigen, Account binden,
Attribute selektiv nachweisen oder Signaturflows ermoeglichen.

## Verbindliche Entscheidungen

- Provider, Relying-Party-Vertrag und unterstuetzte Assurance Levels.
- exakter Zweck jedes angefragten Attributes; Nachweis statt Speicherung, wo
  moeglich.
- Account-Binding, Wiederverifikation, Providerwechsel, Revocation und Recovery.
- Unterschied zwischen Login, Identitaetsnachweis, Vertretungsbefugnis,
  Signatur, Siegel und Wallet-Credential.
- verwaltete Profile, Minderjaehrige, Organisationen und Bevollmaechtigte.
- Audit Trail, Nutzertransparenz und Datenloeschung.

## Architektur- und UX-Regeln

- Domain und UI haengen nicht an ID-Austria-spezifischen DTOs oder SDK-Typen.
- Mappm fragt nur fuer den konkreten Flow erforderliche Attribute ab.
- Ein verifiziertes Attribut ersetzt nicht automatisch Berechtigung auf Vault,
  Profil oder fremde Dokumente.
- Der Nutzer sieht Provider, Zweck, angefragte Attribute und Ergebnis; Mappm
  speichert keine vollstaendige Wallet-Praesentation, wenn ein minimierter
  Verifikationsnachweis reicht.
- Provider-Ausfall blockiert nur den konkreten Trust-Flow, nicht den sicheren
  Zugriff auf bereits zulaessige lokale Daten.

## Stop Rules

- Stop ohne Relying-Party-, Assurance-, Attributminimierungs-, Revocation- und
  Recovery-Entscheid.
- Stop, wenn ID Austria und EUDI als austauschbar ohne Adapter-/Capability-
  Pruefung implementiert werden.
- Stop, wenn Identitaetsnachweis stillschweigend als Zugriffsberechtigung oder
  Vertretungsvollmacht verwendet wird.
