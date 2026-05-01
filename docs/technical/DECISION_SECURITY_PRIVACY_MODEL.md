---
title: "Decision - Security and Privacy Model"
description: "Entscheidung zum Security-/Privacy-Grundmodell fuer sensible Dokumente, Home Hub und spaetere Cloud-faehige Betriebsformen"
tags: [decision, accepted, security, privacy, encryption, backup, e2ee, zero-knowledge]
lastUpdated: "2026-05-01"
status: "accepted"
---

# Decision - Security and Privacy Model

## Status

Accepted.

DocMan behandelt Dokumente, extrahierte Inhalte und viele Metadaten als sensible Daten. Die erste Betriebsform ist private/self-hosted Home-Hub-Synchronisation. Die Architektur muss aber von Anfang an so geschnitten sein, dass spaetere self-hosted cloudartige Setups oder optionale Managed-Varianten mit starker clientseitiger Verschluesselung und Zero-Knowledge-Faehigkeit moeglich bleiben.

## Entscheidung

DocMan verfolgt **Security-by-Design in Stufen**:

- MVP/Home Hub bleibt private, selbst kontrollierte Infrastruktur.
- Secrets liegen ausschliesslich in Secure Storage.
- Dokumentdateien, OCR-Text und sensible Metadaten gelten als schuetzenswerte Nutzdaten.
- Logs enthalten keine Dokumentinhalte, Tokens, Pairing-Codes, OCR-Texte oder sensiblen Metadaten.
- Sync- und Storage-Grenzen werden so geplant, dass spaetere clientseitige Ende-zu-Ende-Verschluesselung moeglich bleibt.
- Server, Home Hub oder spaetere Cloud-Komponenten duerfen langfristig nicht als zwingende Klartext-Owner der Dokumente modelliert werden.

Der MVP muss noch keine vollstaendige App-Level-Verschluesselung fuer lokale Datenbank und Dateiablage implementieren. Er darf aber keine Architekturentscheidung treffen, die clientseitige Verschluesselung, Key Management, Recovery oder Zero-Knowledge-Sync spaeter verhindert.

## Schutzgueter

DocMan schuetzt nicht nur Secrets.

| Datenklasse | Beispiele | Regel |
|---|---|---|
| Secrets | Pairing-Token, Session-Token, Recovery Keys | nur Secure Storage, nie SQLite, nie Logs |
| Dokumentdateien | Scans, PDFs, Fotos, Arztbriefe, Vertrage, Ausweise | lokale Dateiablage, Home-Hub nur privat/self-hosted, spaeter verschluesselbarer Payload |
| OCR-/LLM-Ergebnisse | extrahierter Text, Klassifikation, Formularvorschlaege | nicht MVP; spaeter lokal/self-hosted oder explizit freigegeben, reviewbar |
| Strukturierte Metadaten | Titel, Absender, Datum, Betrag, Status, Tags, Case-Zuordnung | SQLite/Drift, sync-vorbereitet, Sensitivitaet mitdenken |
| Hochsensible Metadaten | Ausweisnummern, medizinische Details, Versicherungsnummern | vermeiden, minimieren oder explizit als sensitiv markieren |
| Sync-/Upload-State | Queue, Remote-ID, Revision, Tombstone, Konfliktstatus | noetig fuer Robustheit, keine Geheimnisse enthalten |
| Logs/Diagnose | Fehlerklassen, Sync-Status, technische Ereignisse | keine Inhalte, keine Tokens, keine personenbezogenen Details |

## Cloud-Verstaendnis

"Cloud" bedeutet fuer DocMan nicht automatisch fremde SaaS.

Moegliche spaetere Betriebsformen:

- privater Home Hub im Heimnetz.
- self-hosted Server auf NAS, Heimserver oder VPS.
- self-hosted cloudartiges Setup mit extern erreichbarem privaten Server.
- optional spaeter eine Managed-Variante.

Die Regeln gelten fuer alle Varianten:

- Server duerfen als Storage-/Sync-Komponenten betrachtet werden, nicht automatisch als vertrauenswuerdige Klartext-Verarbeiter.
- Eine spaetere Cloud- oder self-hosted-cloudartige Variante muss Dokumente und sensible Nutzdaten verschluesselt speichern koennen.
- Verarbeitung von Klartext, etwa OCR oder LLM, braucht eine explizite Trust Boundary und Nutzerfreigabe.
- Export, Loeschung und Recovery muessen planbar bleiben.

## MVP-Minimum

Im MVP gilt:

- keine Drittanbieter-Cloud-Abhaengigkeit.
- Sync nur zur privaten Home-Hub-Umgebung.
- Pairing-/Session-Secrets nur in Secure Storage.
- Dokumentdateien lokal im App-Dateispeicher.
- strukturierte Daten in SQLite/Drift.
- keine Dokumentinhalte, OCR-Texte, Tokens oder Pairing-Codes in Logs.
- Upload Queue verliert lokale Dateien nicht still.
- widerrufene oder abgelaufene Tokens erzeugen Review-/Re-Pairing-Zustaende.
- Backups und Exporte passieren bewusst, nicht still in fremde Dienste.

## Verschluesselung

MVP:

- Betriebssystemschutz und App-Sandbox werden genutzt.
- Secure Storage schuetzt Secrets.
- App-Level-Verschluesselung fuer komplette SQLite-Datenbank und Dateiablage ist nicht MVP-Pflicht.

Architekturpflicht:

- Dokument-Storage wird abstrahiert, damit verschluesselte Payloads spaeter moeglich sind.
- Sync-Payloads duerfen spaeter clientseitig verschluesselt werden.
- Domain- und Repository-Grenzen duerfen keine Klartext-Verarbeitung auf dem Server erzwingen.
- OCR/LLM-Pipeline wird als optionale Klartext-Verarbeitung mit eigener Trust Boundary geplant.
- Key Management, Recovery und Geraetewechsel werden als eigene Konzepte behandelt.

Langfristig zu pruefen:

- verschluesselte Dokumentdateien at rest.
- verschluesselte lokale Datenbank oder sensible Spalten.
- clientseitige Content Keys pro Haushalt oder Datenraum.
- Key Wrapping fuer mehrere Geraete.
- Recovery-Key oder Recovery-Kit.
- Zero-Knowledge-faehiger Sync fuer spaetere Cloud-/Self-hosted-Cloud-Varianten.

## Logging und Diagnose

Logs duerfen helfen, Probleme zu finden, aber nicht private Inhalte rekonstruierbar machen.

Erlaubt:

- technische Fehlerklasse.
- Komponente.
- Zeitpunkt.
- nicht-sensitive Statuscodes.
- anonymisierte oder lokale Korrelationen.

Nicht erlaubt:

- Dokumenttitel, wenn sie private Inhalte verraten koennen.
- Dateinamen oder vollstaendige lokale Pfade mit privaten Informationen.
- OCR-Text.
- Chat-/LLM-Prompts mit Dokumentinhalt.
- Pairing-Code, Token, Secret, Recovery Key.
- Ausweisnummern, Versicherungsnummern, medizinische Details.

## Backup, Export, Loeschung

Backup und Export sind Produktfunktionen, keine Nebeneffekte.

MVP-Regel:

- keine automatische Fremd-Cloud-Sicherung.
- Export/Backup muss bewusst ausgeloest werden.
- Export muss Nutzerin klar zeigen, welche Daten enthalten sind.
- Loeschung muss lokale Daten, Upload Queue und spaeter Sync-/Home-Hub-Kopien beruecksichtigen.

Spaeter:

- verschluesselte Backups pruefen.
- Recovery-Konzept fuer Geraeteverlust.
- Household-/Owner-basierte Export- und Loeschrechte.

## Auswirkungen auf Home Hub und spaetere Server

Home Hub darf im MVP pragmatisch sein, aber nicht zum langfristigen Klartext-Zwang werden.

Regeln:

- Home Hub ist erste private Sync-/Upload-Grenze.
- Home Hub kann Dateien speichern und in die Draft Inbox uebernehmen.
- Home Hub darf fuer spaetere OCR/LLM Klartext nur innerhalb einer explizit akzeptierten Trust Boundary verarbeiten.
- Server-APIs werden so geplant, dass verschluesselte Dateien und verschluesselte Metadaten spaeter moeglich sind.
- Eine Managed- oder extern gehostete Variante darf nicht voraussetzen, dass der Betreiber Dokumentinhalte lesen kann.

## Nicht entschieden

Diese Entscheidung legt die Richtung fest, aber nicht die genaue Kryptografie.

Noch offen:

- konkrete Verschluesselungsbibliotheken.
- Key-Derivation-Parameter.
- Recovery-UX.
- verschluesselte Suche.
- Detailmodell fuer geteilte Haushalte und Rollen.
- konkrete Cloud-/Managed-Produktpolitik.

## Konsequenzen fuer R2

R2 muss:

- sensible Datenklassen in Planung und Tests beruecksichtigen.
- Secrets strikt von SQLite/Dateispeicher trennen.
- Log-Regeln in F7 und Implementation-Plan aufnehmen.
- Dateiablage abstrahieren.
- keine Server-Klartextpflicht in Domain- oder API-Grenzen einbauen.
- OCR/LLM ausserhalb des MVP halten, aber als spaetere Trust Boundary vormerken.

## Akzeptanz

Die Entscheidung ist akzeptiert, wenn:

- Issue #3 geschlossen ist.
- `docs/ROADMAP_REBUILD.md` R2-D6 als erledigt markiert.
- `docs/technical/TECHNICAL_FOUNDATION_PLAN.md` diese Security-/Privacy-Baseline als R2-Vorgabe behandelt.
- F9 Legal/Privacy, F12 Secure Storage und `DECISION_PRIVACY_SYNC_SCOPE.md` nicht widersprechen.
