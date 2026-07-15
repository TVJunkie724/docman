---
title: "Decision - External Integrations First"
description: "Entscheidung zu externen Links, Exportaktionen und spaeterer Portalautomatisierung in Mappm"
tags: [decision, integrations, external-links, export, portals, sharing]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "product-concept/security"
---
# Decision - External Integrations First

## Status

Accepted.

R13-D1 ist entschieden. Mappm startet mit manuellen externen Links und
bewussten Export-/Oeffnen-Aktionen. Automatische Einreichung in externe Portale
ist keine fruehe Produktannahme und wird erst in einem spaeteren Milestone
geprueft.

## Entscheidung

Mappm integriert externe Dienste zuerst als manuelle Aktionsziele:

- Website oeffnen.
- App-/Deep-Link oeffnen, wenn verfuegbar.
- Dokument lokal oeffnen.
- Dokument exportieren oder herunterladen.
- Dokument drucken.
- Dokument lokal exportieren, drucken oder an ein vom Betriebssystem
  bereitgestelltes Ziel uebergeben.
- Link an Aufgabe, Vorgang, Claim, Record, Profil oder Dokument speichern.

Mappm speichert dafuer frueh keine fremden Zugangsdaten, Tokens,
Session-Cookies oder Portal-spezifischen Automatisierungsdaten.

## Beispiele

- Aufgabe: `Rechnung bei SV einreichen` mit Link zum SV-Portal.
- Claim: Link zur Zusatzversicherung.
- Vorgang: Unfallvorgang mit Link zum Versicherungsportal.
- Record: Versicherungspolizze mit Link zum Kundenportal.
- Profil: Schul-App oder Gesundheitsportal fuer ein Kind.
- Dokument: Portal oder Quelle, aus der das Dokument stammt.

## Automatische Portalaktionen

Automatische Einreichung, Web-Scraping, RPA, gespeicherte Portal-Logins oder
direkte API-Integrationen sind nicht Teil der fruehen Produktplanung.

Sie werden spaeter nur geprueft, wenn:

- ein Portal eine stabile und erlaubte API anbietet.
- Auth, Consent, Logging und Widerruf sicher geloest sind.
- keine fremden Credentials unsicher gespeichert werden.
- die Nutzung rechtlich und wartungsseitig vertretbar ist.
- Fehler und Teilzustaende fuer Nutzerinnen verstaendlich bleiben.

Es ist akzeptabel, wenn automatische Einreichung nie produktiv umgesetzt wird.
Mappm bleibt auch mit manuellen Links, Exporten und gut gefuehrten Aufgaben
wertvoll.

## UI-Richtung

Externe Aktionen gehoeren an den fachlichen Kontext:

- Aufgabe zeigt den naechsten konkreten Link, z. B. `SV-Portal oeffnen`.
- Vorgang zeigt relevante Links und Aktionshistorie.
- Dokumentdetail bietet Oeffnen, Export, Drucken und Teilen.
- Profil oder Record kann stabile Portale enthalten, z. B. Schul-App,
  Versicherungsportal oder Behoerdenportal.

Die Inbox bleibt Eingang und Review. Sie wird nicht mit einem allgemeinen
Outbox-Bereich ueberladen.

## Konsequenzen

- R13-D1 ist entschieden.
- Manuelle Links und Exportaktionen sind der erste Integrationspfad.
- Automatische Portalbedienung bleibt spaeteres Pruefthema, kein Versprechen.
- Externe Dienste bleiben ausserhalb der Mappm-Vertrauensgrenze.
- Fremd-Credentials brauchen vor Speicherung eine eigene Security-Entscheidung.

## Nicht entschieden

- konkrete Linktypen fuer den ersten UI-Slice.
- ob `ExportPackage` in der UI `Ausgabe`, `Export`, `Paket` oder anders heisst.
- ob und wann eine Portal-API tatsaechlich angebunden wird.
- konkrete ZIP-/Exportpaket-UX fuer ganze Vorgaenge.
