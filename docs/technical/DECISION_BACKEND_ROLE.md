---
title: "Draft Decision - Backend Role and Self-hosted Server Stack"
description: "Vorläufiger Entwurf zur Rolle des DocMan Backends, PocketBase, Docker/Compose, MinIO, OCR und lokalen LLMs"
tags: [decision, draft, backend, self-hosted, docker, ocr, llm]
lastUpdated: "2026-05-11"
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

Die Dateiablage ist als austauschbarer Storage-Port entschieden. App-local nutzt
einen lokalen File Store. Der Home-Hub-/Server-Stack plant MinIO beziehungsweise
S3-kompatiblen Storage als Zieladapter, ohne diese Technologie in Domain oder UI
zu verankern.

Die konkrete Home-Hub-Backend-Technologie ist separat akzeptiert:
`DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md`. Ziel fuer die Planung ist ASP.NET
Core fuer die Home-Hub-API, PostgreSQL fuer Server-Metadaten und Sync-Journal,
MinIO/S3-kompatibler Storage fuer Dateien und Microcks fuer API-Mocks und
Contract Verification. Spaetere Worker starten bevorzugt als .NET Hosted
Services / Worker Services; OCR-/AI-Sidecars duerfen bei Bedarf eigene
Technologien verwenden.

## PocketBase-Rolle

PocketBase wird nach aktuellem Entwurf nicht als Zielarchitektur festgelegt.

PocketBase kann als frühe Idee, Referenz oder Spike gelten, aber nicht als Domain-Kern und nicht als harte App-Abhängigkeit. Die App soll fachlich gegen DocMan-eigene Domain-, Repository- und Sync-Abstraktionen arbeiten.

## Zielbild Server Stack

```text
DocMan Server Stack
  -> API / Sync Backend
  -> PostgreSQL metadata store
  -> S3-compatible file storage, likely MinIO for self-hosted Compose
  -> Job queue
  -> OCR / document parsing workers
  -> local LLM gateway
  -> optional search index
```

Früher Entwicklungs-/Home-Hub-Stack:

```text
ordna-homehub-api
postgres
minio
microcks
```

Dieser Stack ist Integrations- und Self-Hosted-Betriebsbasis. Er ist nicht
Voraussetzung fuer einfache App-local Entwicklung.

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
| Backend API | ASP.NET Core fuer Home Hub und spaeteren Server Stack |
| Metadaten | PostgreSQL |
| Dateispeicher | lokaler File Store app-local; S3-kompatibler Storage, z.B. MinIO, fuer Home Hub |
| Queue | zuerst PostgreSQL-basierte Jobs/Outbox; Redis, NATS oder RabbitMQ nur bei konkretem Bedarf |
| Worker | .NET Hosted Services / Worker Service zuerst; Python-Sidecars fuer OCR/AI moeglich |
| Textextraktion | Apache Tika, Docling oder vergleichbare lokale Parser |
| OCR | Tesseract, PaddleOCR oder vergleichbare lokale OCR |
| LLM Gateway | Ollama für einfachen Start, vLLM für stärkere GPU-Server |
| Suche | PostgreSQL Full Text, Meilisearch, Typesense oder OpenSearch nach Bedarf |

## Konsequenzen

- Der MVP bleibt klein und lokal, aber verwendet sync-fähige IDs und saubere Domain-Grenzen.
- Dokumente sollten von Anfang an als Originaldatei plus Metadaten gedacht werden.
- Upload-Queue, Review-Zustände und spätere Job-Ergebnisse brauchen Platz im Modell.
- Backend-SDKs dürfen nicht in Domain-Kontrakte leaken.
- MinIO/S3 darf nicht in Domain oder Presentation leaken; es ist ein Data-/Server-Adapter.
- PocketBase-spezifische Begriffe sollen nicht in Produktdokumentation, Domain-Modell oder UI wachsen.

## Noch zu entscheiden

- Wann beginnt der Server-Stack: vor, während oder nach dem lokalen Desktop-MVP?
- Welche Sync-Strategie wird verwendet: eigenes Änderungsjournal, bestehende Sync-Technologie oder Hybrid?
- Welche Daten dürfen zwischen Geräten synchronisiert werden?
- Wie wird Ende-zu-Ende- oder At-Rest-Verschlüsselung gehandhabt?
- Welche OCR-/LLM-Hardware steht real zur Verfügung?
- Braucht der erste Home Hub eine Admin-Weboberfläche?
- Welche konkreten Upload-Limits, Multipart-Grenzen und Cleanup-Jobs gelten fuer
  den ersten Home Hub?
