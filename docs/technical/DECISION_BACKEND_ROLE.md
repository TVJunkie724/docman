---
title: "Draft Decision - Backend Role and Self-hosted Server Stack"
description: "Vorläufiger Entwurf zur Rolle des DocMan Backends, PocketBase, Docker/Compose, OCR und lokalen LLMs"
tags: [decision, draft, backend, self-hosted, docker, ocr, llm]
lastUpdated: "2026-04-26"
status: "draft"
---

# Draft Decision - Backend Role and Self-hosted Server Stack

## Status

Draft.

Dieser Entwurf ist noch keine akzeptierte Architekturentscheidung. Er hält die aktuelle Richtung fest, damit spätere MVP-, Foundation- und Backend-Entscheidungen daran anschließen können.

## Vorläufige Richtung

DocMan wird nicht als Cloud-SaaS geplant. Die bevorzugte Backend-Betriebsform ist ein selbst gehosteter DocMan Server Stack auf vorhandener privater Infrastruktur, zum Beispiel NAS, Mini-Server oder größerer Heimserver.

Der Server soll langfristig als Docker-/Compose-Setup betreibbar sein.

DocMan startet trotzdem local-first. Der lokale Desktop-Kern darf ohne Backend funktionieren. Der beschlossene MVP mit Mobile Capture braucht jedoch einen minimalen Home-Hub-Anteil als Eingangskorb. Das spätere vollständige Backend wird grob vorausgeplant, damit Datenmodell, Dokumentablage, Sync-Journal, Upload-Queue und spätere Intelligence-Pipeline kompatibel bleiben.

## PocketBase-Rolle

PocketBase wird nach aktuellem Entwurf nicht als Zielarchitektur festgelegt.

PocketBase kann als frühe Idee, Referenz oder Spike gelten, aber nicht als Domain-Kern und nicht als harte App-Abhängigkeit. Die App soll fachlich gegen DocMan-eigene Domain-, Repository- und Sync-Abstraktionen arbeiten.

## Zielbild Server Stack

```text
DocMan Server Stack
  -> API / Sync Backend
  -> PostgreSQL metadata store
  -> S3-compatible file storage
  -> Job queue
  -> OCR / document parsing workers
  -> local LLM gateway
  -> optional search index
```

## Geplante Aufgaben des Backends

- Synchronisation zwischen Geräten.
- Zentrale Ablage der Originaldateien.
- Backup- und Exportfähigkeit.
- Auth, Sessions und Geräteverwaltung.
- Sync-Journal, Konfliktinformationen und Tombstones.
- OCR und Textextraktion.
- Dokumentklassifikation.
- Vorschläge für Metadaten, Formularfelder, Vorgänge und nächste Schritte.
- Health, Admin-Status und Wartungsjobs.

## Local-first Grenze

Das Backend ist wichtig, aber nicht Voraussetzung für Kernnutzung.

Die App muss lokal Dokumente erfassen, Vorgänge bearbeiten und eine Upload-/Sync-Queue führen können. Wenn das Backend nicht erreichbar ist, darf das nicht zu Datenverlust oder blockierten Kernflows führen.

## Intelligence-Pipeline

OCR, Parsing und lokale LLMs werden als asynchrone Pipeline geplant:

```text
Dokument speichern
  -> Text/OCR extrahieren
  -> Dokumenttyp erkennen
  -> Felder vorschlagen
  -> Vorgang/Formular vorschlagen
  -> Nutzerin prüft
  -> akzeptierte Vorschläge übernehmen
```

KI-Ergebnisse sind Vorschläge, keine stillen automatischen Änderungen. Jede automatische Extraktion oder Klassifikation braucht einen Review-Zustand, Confidence oder nachvollziehbare Herkunft, soweit fachlich sinnvoll.

## Mögliche Bausteine

Diese Bausteine sind Kandidaten, keine finale Auswahl:

| Bereich | Kandidaten |
|---|---|
| Metadaten | PostgreSQL |
| Dateispeicher | S3-kompatibler Storage, z.B. MinIO |
| Queue | Redis, PostgreSQL-basierte Queue oder anderer Compose-freundlicher Broker |
| Textextraktion | Apache Tika, Docling oder vergleichbare lokale Parser |
| OCR | Tesseract, PaddleOCR oder vergleichbare lokale OCR |
| LLM Gateway | Ollama für einfachen Start, vLLM für stärkere GPU-Server |
| Suche | PostgreSQL Full Text, Meilisearch, Typesense oder OpenSearch nach Bedarf |

## Konsequenzen

- Der MVP bleibt klein und lokal, aber verwendet sync-fähige IDs und saubere Domain-Grenzen.
- Dokumente sollten von Anfang an als Originaldatei plus Metadaten gedacht werden.
- Upload-Queue, Review-Zustände und spätere Job-Ergebnisse brauchen Platz im Modell.
- Backend-SDKs dürfen nicht in Domain-Kontrakte leaken.
- PocketBase-spezifische Begriffe sollen nicht in Produktdokumentation, Domain-Modell oder UI wachsen.

## Noch zu entscheiden

- Welche Backend-Sprache und welches Framework passen am besten?
- Wann beginnt der Server-Stack: vor, während oder nach dem lokalen Desktop-MVP?
- Welche lokale App-Datenbank ist Zielarchitektur?
- Welche Sync-Strategie wird verwendet: eigenes Änderungsjournal, bestehende Sync-Technologie oder Hybrid?
- Welche Daten dürfen zwischen Geräten synchronisiert werden?
- Wie wird Ende-zu-Ende- oder At-Rest-Verschlüsselung gehandhabt?
- Welche OCR-/LLM-Hardware steht real zur Verfügung?
- Braucht der erste Home Hub eine Admin-Weboberfläche?
