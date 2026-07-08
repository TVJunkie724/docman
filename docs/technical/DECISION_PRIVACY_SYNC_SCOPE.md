---
title: "Decision - Privacy and Sync Scope"
description: "Entscheidung zu Privacy-Klassen und Sync-Grenzen fuer Mappm Home Hub, Backup und spaetere Self-hosted-Synchronisation"
tags: [decision, privacy, sync, data-classification, self-hosted]
lastUpdated: "2026-06-06"
status: "accepted"
---

# Decision - Privacy and Sync Scope

## Status

Accepted.

## Entscheidung

Mappm synchronisiert zuerst in eine private, selbst kontrollierte Home-Hub-
Umgebung. R6-D2 ist entschieden: Remote-Sync wird nach einfachen Privacy-
Klassen geplant, nicht nach fachlich unterschiedlichen Regeln fuer LAN,
Tailscale/VPN oder private Server.

Eine Drittanbieter-Cloud- oder externe SaaS-Synchronisation ist nicht Teil der
fruehen Produktplanung. Self-hosted cloudartige Setups, etwa privater VPS oder
extern erreichbarer eigener Server, bleiben als spaetere Varianten moeglich und
muessen `docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md` einhalten.

## Datenklassen

| Klasse | Beispiele | Sync-Regel |
|---|---|---|
| `normal` | Anzeigename, Profil-ID, Vorgangsstatus, Tags, einfache Aufgaben | syncbar mit normaler Zugriffskontrolle |
| `sensitive` | Adresse/Meldeadresse, Geburtsdatum, Dokument-Metadaten, Anbieter, Fälligkeit, Beträge | syncbar im Home Hub; nicht in Logs/Push/externem Export ohne bewusste Auswahl |
| `highlySensitive` | Passnummer, Ausweisnummer, SV-/Versicherungsnummern, medizinische Details, Versicherungsbeziehungen, sensible Profil-Fakten | syncbar fuer privaten Home Hub/Backup, aber nie in normalen Listen/Logs/Telemetry; spaetere Feld-/Payload-Verschluesselung vorbereiten |
| `documentPayload` | Scans, PDFs, Bilder, Arztbriefe, Verträge, Ausweise | Home Hub erlaubt; ueber Storage-Port, Hash/Checksum, keine Inhalte in PostgreSQL-Logs, spaeter verschluesselbarer Payload |
| `ocrDerived` | OCR-Rohtext, Klassifikation, LLM-Vorschlaege, extrahierte Fakten | bestaetigte Vorschlaege/Fakten syncbar nach Schutzklasse; Roh-OCR/LLM nur mit separater Trust-Boundary |
| `secret` | Pairing Secret, Session Token, Device Token, OAuth Token, Recovery Key, presigned URL | nie als normale Sync-Daten; Secure Storage oder serverseitig zweckgebunden/hashed/kurzlebig |
| `diagnostic` | Fehlerklasse, Komponente, Zeitpunkt, Operation-ID, Sync-Status | nur inhaltsarm; keine Dokumenttitel, Pfade, OCR-Texte, Personen-IDs mit Klartext, Tokens oder sensiblen Werte |

## Netzwerk- und Deployment-Kontext

Die Privacy-Klasse ist unabhaengig davon, ob sich App und Home Hub im selben
Netzwerk befinden.

Unterschieden wird:

- Datenklasse: Was ist es und wie sensibel ist es?
- Transport-/Deployment-Kontext: LAN, Tailscale/VPN, privater Server,
  self-hosted cloudartig.

Die Datenklasse entscheidet, ob und wie ein Wert syncbar ist. Der
Transport-/Deployment-Kontext beeinflusst Setup, Warnungen, Health Checks,
TLS/Auth-Anforderungen und Performance, aber nicht die fachliche
Schutzklassifizierung.

Eine Passnummer, ein Arztbrief oder OCR-Rohtext bleibt also gleich sensibel,
egal ob der Home Hub im selben LAN, ueber Tailscale oder auf einem privaten VPS
erreichbar ist.

## Regeln

- Keine externen Dienste ohne neue Entscheidung.
- Keine Secrets in normaler lokaler DB.
- Keine Dokumentinhalte in Logs.
- Mobile Uploads duerfen an den Home Hub gehen, weil Mobile Capture geplant ist.
- Vollständiger Multi-Geräte-Sync nutzt dieselben Privacy-Klassen.
- Löschung, Export und Geräte-Entkopplung bleiben Produktanforderungen.
- Home Hub darf Sync und Backup fuer produktrelevante Daten tragen, aber nicht
  alle Daten werden gleich behandelt.
- Document Payloads gehoeren in den Storage-Port, nicht als DB-Blob-Default.
- Bestaetigte OCR-/AI-Vorschlaege werden nach ihrer fachlichen Schutzklasse
  behandelt.
- Roh-OCR, LLM-Prompts und LLM-Responses brauchen eine spaetere explizite
  Trust-Boundary-Entscheidung.
- Secrets und Credentials gehoeren nie in normale Sync-Journale oder
  Diagnoseereignisse.

## Konsequenzen

- F10/F12/F7/F11 sind verbindlich auf Privacy-Grenzen auszurichten.
- Sync-Modelle müssen Datenklassen berücksichtigen.
- Sensitive abgeleitete Daten wie OCR-Text werden später bewusst eingeführt, nicht nebenbei.
- R6-D2 ist entschieden: einfache Privacy-Klassen statt netzwerkabhaengiger
  Fachlogik.
- R6-D3 kann Konfliktregeln auf diesen Datenklassen aufbauen.
- R8 Facts/Claims/Financial Entries sind syncbar, muessen aber nach ihrer
  fachlichen Sensitivitaet klassifiziert werden.

## Nicht entschieden

- konkrete Verschluesselungsbibliothek.
- konkrete Feld- oder Payload-Verschluesselung je Datenklasse.
- Roh-OCR-/LLM-Speicherstrategie.
- spaetere Managed-Cloud-Produktpolitik.
