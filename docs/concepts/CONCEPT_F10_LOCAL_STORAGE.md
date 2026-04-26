---
title: "Konzept F10 - Local Storage"
description: "DocMan-spezifisches Konzept für local-first Persistenz, lokale Datenbank, Datei-Cache, Draft-Inbox, Mobile-Upload-Queue und spätere Sync-Fähigkeit"
tags: [concept, foundation, local-storage, local-first, persistence, draft-inbox, mobile-capture, sync]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F10 - Local Storage

## Status

Accepted.

Dieses Konzept ersetzt den importierten F10-Inhalt aus dem alten Projekt. Der alte Inhalt ist nicht mehr Source of Truth für DocMan.

## Zweck

F10 definiert, welche lokalen Daten DocMan speichern muss, welche Verantwortungen die lokale Persistenz hat und welche Grenzen sie einhalten muss.

DocMan ist local-first. Lokale Persistenz ist deshalb nicht nur ein Cache für UI-Zustände, sondern das Arbeitsfundament der App.

## Verbindliche Entscheidungen

Dieses Konzept baut auf diesen Entscheidungen auf:

- Produktmodell: `Case` / Vorgang, `Event` / Ereignis.
- State Management und DI: Riverpod.
- Datenfluss: local-first mit generischem self-hosted Sync Backend.
- Backend-Rolle: eigener self-hosted Docker-/Compose-Stack als Draft-Zielbild; PocketBase nicht Zielarchitektur.
- MVP: Desktop-Verwaltung plus Mobile Capture mit minimalem Home-Hub-Eingangskorb.
- Mobile im MVP: capture-only, lokale Upload-Queue, optionale Vorgangszuordnung.

## Grundsatz

Die lokale Datenbank ist die primäre Arbeitsbasis der App.

Das bedeutet:

- Core-Workflows funktionieren ohne Netzwerk.
- Vorgänge, Dokument-Metadaten, Drafts und lokale Status werden lokal gespeichert.
- Mobile Capture darf Dokumente offline erfassen und später hochladen.
- Sync ist eine spätere Replikations- und Backup-Funktion, nicht Voraussetzung für Nutzung.
- Lokale Daten müssen strukturiert genug sein, um später sauber synchronisiert werden zu können.

## Datenkategorien

DocMan unterscheidet lokale Daten nach Zweck, Lebensdauer und Schutzbedarf.

| Kategorie | Zweck | Beispiele | MVP |
|---|---|---|---|
| Domain-Daten | Fachliche Arbeitsdaten | Cases, Documents, Profiles, Tasks, Events | Ja |
| Draft-Daten | Ungeprüfte Eingänge | Desktop-Drafts, mobile Uploads, Import-Zwischenstände | Ja |
| Queue-Daten | Noch nicht synchronisierte Arbeit | Mobile Upload Queue, Retry-Status, lokale Fehler | Ja |
| Datei-Referenzen | Verbindung zwischen Metadaten und Dateien | lokaler Pfad, Hash, MIME-Type, Größe | Ja |
| Datei-Cache | lokale Kopien oder Originale | gescannte Bilder, PDFs, Vorschaudateien | Ja |
| UI-State | App-Komfort | aktive Filter, zuletzt gewähltes Profil, Fensterzustand | Teilweise |
| Settings | App-Konfiguration | Home-Hub-Adresse, lokale Präferenzen | Ja |
| Secure Secrets | Sicherheitskritische Geheimnisse | Pairing Secret, Session Token, lokale Schlüssel | Über F12 |
| Sync-Metadaten | Replikation vorbereiten | entityId, version, updatedAt, tombstone, dirty flag | Vorbereiten |
| Intelligence-Ergebnisse | spätere Vorschläge | OCR-Text, Klassifikation, Feldvorschläge | Nicht MVP |

## MVP-Speicheranforderungen

Der MVP braucht lokale Persistenz für:

- einen Haushalt
- ein aktives Profil
- Vorgänge
- Dokument-Metadaten
- Draft-Inbox
- lokale Desktop-Dateiimporte
- mobile Capture-Uploads
- lokale Mobile-Upload-Queue
- optionale gecachte Liste offener Vorgänge auf Mobile
- Home-Hub-Verbindungsstatus und nicht geheime Einstellungen
- einfache Suche und Filter

## Lokale Datenbank

DocMan braucht eine strukturierte lokale Datenbank, nicht nur Key-Value Storage.

Die konkrete Technologie ist in diesem Konzept noch nicht endgültig entschieden. Der aktuelle Spike verwendet Isar. Die Foundation-Planung muss prüfen, ob Isar als Ziel bleibt oder ob eine andere lokale Datenbank besser zum langfristigen Sync-, Mobile- und Migrationsmodell passt.

### Anforderungen an die lokale DB

Die lokale DB muss:

- Desktop und Mobile unterstützen.
- strukturierte Abfragen für Cases, Documents, Drafts und Suche ermöglichen.
- Migrationen ohne Datenverlust unterstützen.
- reaktive Datenflüsse für Riverpod ermöglichen.
- Offline-Schreibvorgänge zuverlässig speichern.
- Sync-Metadaten pro Entity tragen können.
- Tests mit Fake- oder In-Memory-Implementierungen erlauben.
- keine Backend-SDK-Typen in Domain oder Presentation leaken.

### Nicht ausreichend

Reiner Key-Value Storage reicht nicht für:

- Vorgangslisten.
- Dokumentzuordnung.
- Draft-Inbox.
- Upload-Queue.
- lokale Suche.
- Konflikt- und Sync-Metadaten.

Key-Value Storage bleibt trotzdem sinnvoll für kleine, nicht fachliche Einstellungen.

## Dateiablage

DocMan speichert nicht nur Metadaten, sondern echte Dokumentdateien.

Die lokale Dateiablage muss diese Fälle unterstützen:

- Desktop importiert eine lokale Datei.
- Mobile nimmt Foto/Scan auf.
- Mobile hält Uploads lokal vor, bis der Home Hub erreichbar ist.
- Desktop kann Dokumente lokal öffnen oder als Vorschau anzeigen.
- Später kann der Home Hub Originale zentral speichern.

### Datei-Prinzipien

- Originaldateien werden nicht still verändert.
- Metadaten und Dateiinhalt bleiben getrennt.
- Jede Datei bekommt eine stabile lokale Referenz.
- Hashes sollen Duplikate, Integrität und späteren Sync unterstützen.
- Dateityp und Größe werden als Metadaten gespeichert.
- Vorschaudateien und Thumbnails sind abgeleitete Daten und dürfen neu erzeugt werden.

## Draft-Inbox

Die Draft-Inbox ist ein zentrales lokales Konzept.

Sie nimmt Dokumente auf, die noch nicht vollständig geprüft, beschrieben oder zugeordnet sind.

Quellen:

- Desktop-Dateiimport.
- Mobile Capture ohne Vorgangszuordnung.
- Mobile Capture mit unsicherer oder später ungültiger Vorgangszuordnung.
- spätere Scanner- oder Watch-Folder-Importe.
- spätere OCR-/LLM-Pipeline-Ergebnisse, die Review brauchen.

Drafts müssen lokal speicherbar sein, bevor ein Backend erreichbar ist.

## Mobile Upload Queue

Mobile Capture braucht eine lokale Queue.

Die Queue speichert:

- Datei-Referenz.
- Erfassungszeitpunkt.
- optionales Profil.
- optionale `caseId`.
- lokale Notiz.
- Upload-Status.
- Retry-Zähler.
- letzter Fehler.
- Ziel-Home-Hub, soweit konfiguriert.

Die Queue darf Uploads nicht verlieren, wenn:

- das Gerät offline ist.
- Tailscale/private Verbindung nicht erreichbar ist.
- die App beendet wird.
- der Home Hub temporär Fehler liefert.
- die gewählte Vorgangszuordnung nicht mehr gültig ist.

Wenn direkte Vorgangszuordnung scheitert, fällt der Upload in die Draft-Inbox zurück.

## Sync-Fähigkeit

Auch wenn vollständiger Sync nicht im MVP ist, müssen lokale Daten sync-fähig modelliert werden.

Jede relevante Entity sollte später tragen können:

- stabile lokale und globale ID.
- Erstellungszeit.
- Änderungszeit.
- Version oder Revision.
- Löschmarkierung statt hartem Sofort-Löschen, wo Sync relevant ist.
- lokale Änderungsmarkierung.
- Herkunft oder Gerät, soweit für Konfliktanalyse sinnvoll.

Dieses Konzept entscheidet noch nicht die endgültige Sync-Strategie. Es verhindert aber, dass der MVP Daten so speichert, dass Sync später nur mit Bruch möglich ist.

## Suchfähigkeit

Für den MVP reicht einfache lokale Suche.

Suchfelder:

- Vorgangstitel.
- Dokumenttitel.
- Tags.
- Sender oder Quelle.
- Datum.
- Profil.
- Draft-Status.

Volltextsuche über OCR-Text gehört nicht in den MVP, muss aber später ergänzbar bleiben.

## Secure Storage Abgrenzung

Sicherheitskritische Geheimnisse gehören nicht in die normale lokale Datenbank.

Beispiele:

- Session Tokens.
- Pairing Secrets.
- private Schlüssel.
- langfristige Auth-Geheimnisse.

Diese Daten gehören zu F12 Secure Storage. F10 darf nur nicht geheime Referenzen, Status und Konfiguration speichern.

## Privacy und Export

DocMan speichert potenziell sehr sensible Dokumente. Lokale Persistenz muss deshalb langfristig diese Anforderungen vorbereiten:

- verständlicher Speicherort.
- Exportierbarkeit von Metadaten und Dateien.
- Löschbarkeit.
- Backup-Fähigkeit.
- keine unnötige Duplikation sensibler Dateien.
- klare Trennung zwischen Originalen, Cache und abgeleiteten Daten.

Verschlüsselung und Schlüsselmanagement werden nicht in F10 entschieden. Sie müssen in F12 und in der späteren Backend-/Storage-Planung konkretisiert werden.

## Repository-Grenzen

App-Code spricht nicht direkt mit der lokalen Datenbank.

Zugriff läuft über DocMan-Domain-Repository-Verträge und Data-Implementierungen.

```text
Presentation / Riverpod
  -> Application / Domain Repository Contracts
      -> Data Repository Implementation
          -> Local DB / File Storage
```

Regeln:

- Domain kennt keine lokale DB.
- Presentation kennt keine lokale DB.
- Data übersetzt lokale Storage-Modelle in Domain-Typen.
- Tests können lokale Repositories ersetzen.
- Lokale Storage-Modelle dürfen sich von Domain-Entities unterscheiden, wenn Migration oder Sync das erfordern.

## Offene Folgeentscheidungen

F10 lässt bewusst mehrere technische Detailentscheidungen offen:

| ID | Frage | Richtung |
|---|---|---|
| F10-D1 | Bleibt Isar Zieltechnologie oder wechseln wir? | In R2 Technical Foundation entscheiden |
| F10-D2 | Wie werden lokale Dateipfade und App-Verzeichnisse pro Plattform organisiert? | In Implementation-Plan konkretisieren |
| F10-D3 | Wie sehen stabile IDs für lokale und spätere remote Entities aus? | Mit Sync-Konzept abstimmen |
| F10-D4 | Welche Daten werden lokal verschlüsselt? | Mit F12 und Privacy-Konzept abstimmen |
| F10-D5 | Wie lange hält Mobile lokale Uploads? | Mit F17 Mobile Capture abstimmen |
| F10-D6 | Wie werden Löschungen vor vollständigem Sync modelliert? | Mit späterem Sync-Konzept abstimmen |

## Definition of Done für F10

F10 gilt als umgesetzt, wenn:

- lokale Domain-Daten persistiert werden können.
- Draft-Inbox lokal zuverlässig funktioniert.
- Mobile Upload Queue offline sicher ist.
- Datei-Metadaten und Dateiinhalt getrennt verwaltet werden.
- Repository-Grenzen DB- und SDK-Leaks verhindern.
- einfache lokale Suche möglich ist.
- Sync-Metadaten vorbereitet sind.
- Secure Secrets nicht in der normalen lokalen DB liegen.

## Verwandte Konzepte

- F1 Project Structure.
- F2 State Management.
- F5 Error Handling.
- F11 API Integration.
- F12 Secure Storage.
- F17 Mobile Capture Plan.
- Decision: Local-first Data Flow and Self-hosted Sync Backend.
- Decision: MVP Scope.
