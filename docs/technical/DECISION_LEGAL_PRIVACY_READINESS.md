---
title: "Decision - Legal and Privacy Readiness Gate"
description: "Entscheidung zur rechtlichen und datenschutzbezogenen Readiness vor oeffentlicher Distribution von Ordna"
tags: [decision, compliance, legal, privacy, distribution, gdpr, app-store]
lastUpdated: "2026-06-10"
status: "accepted"
---

# Decision - Legal and Privacy Readiness Gate

## Status

Accepted.

R10-D2 ist entschieden. Ordna wird privat/self-hosted weiter geplant und gebaut,
aber Privacy-, Security-, Store- und Rechtsanforderungen werden bei der
Implementierung immer mitgedacht. Vor oeffentlicher Distribution oder Store-
Release braucht Ordna ein separates Legal-/Privacy-Readiness-Gate.

## Entscheidung

Private/self-hosted Nutzung darf frueher entstehen als oeffentliche
Distribution.

Oeffentliche Distribution ist erst erlaubt, wenn eine eigene rechtliche und
datenschutzbezogene Pruefung abgeschlossen ist.

Das gilt fuer:

- Apple App Store.
- Google Play.
- Microsoft Store.
- oeffentliche Desktop-Downloads.
- gehostete oder fremd betriebene Varianten.
- produktive Nutzung ausserhalb des privaten Haushaltskontexts.

## Implementierungsleitplanke

Jede Implementierung muss Datenschutz und spaetere Review-Faehigkeit mitdenken:

- keine versteckten externen Dienste.
- keine echten privaten Dokumente in Tests, Demos, Fixtures oder Review-Daten.
- keine Logs mit Dokumentinhalten, OCR-Rohtexten, Secrets oder sensiblen
  personenbezogenen Details.
- minimale Plattform-Permissions.
- klare Datenklassen fuer Dokumente, Metadaten, OCR/AI-Ergebnisse, Secrets und
  Diagnosedaten.
- Loeschung, Export, Backup und Restore nicht durch Datenmodell-Entscheidungen
  verbauen.
- KI/OCR/LLM-Verarbeitung nur hinter expliziten Trust-Boundaries.
- Store-/Review-Modus muss spaeter mit synthetischen Daten moeglich sein.

## Legal-/Privacy-Gate Vor Public Release

Vor Store-Release oder oeffentlicher Distribution braucht Ordna mindestens:

- DSGVO/GDPR-Review fuer Dokumente, Gesundheitsdaten, Versicherungsdaten,
  Kinderdaten und Identitaetsdokumente.
- Datenschutzerklaerung.
- Datenfluss- und Trust-Boundary-Beschreibung.
- Loesch-, Export- und Auskunftsmodell.
- Permission-Begruendung fuer Kamera, Dateien, Netzwerk und Benachrichtigungen.
- App-Store-Policy-Matrix fuer Apple, Google und Microsoft.
- Demo-/Review-Zugang mit synthetischen Daten.
- Open-Source- und Lizenzpruefung.
- Support-, Kontakt-, Impressums- und Disclaimer-Entscheidungen.

## Warum

Ordna verwaltet extrem sensible Haushaltsdokumente: Arztbriefe, Rechnungen,
Versicherungen, Ausweise, Nachweise, Dokumente von Kindern und spaeter
extrahierte Fakten. Deshalb duerfen Datenschutz und Sicherheit nicht erst kurz
vor Release aufgesetzt werden.

Gleichzeitig soll die private/self-hosted Produktentwicklung nicht blockiert
werden, solange keine fremden Nutzer, keine fremde Cloud und keine oeffentliche
Distribution betroffen sind.

## Konsequenzen

- R10-D2 ist entschieden.
- Private/self-hosted bleibt der erste Distributionspfad.
- Jede Implementierung behandelt Privacy/Legal/Store-Readiness als
  Architekturleitplanke.
- Public/Store Release bekommt ein hartes Gate.
- Dieses Dokument ist Produktplanung und keine Rechtsberatung.

## Nicht entschieden

- konkrete Rechtsberatung oder Ansprechperson.
- konkreter Store-Release-Zeitpunkt.
- konkrete Privacy-Policy-Formulierung.
- ob Ordna jemals oeffentlich oder gehostet angeboten wird.
