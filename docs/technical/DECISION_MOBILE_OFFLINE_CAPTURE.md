---
title: "Decision - Mobile Offline Capture and Processing Queue"
description: "Offline-feste mobile Erfassung mit dauerhaftem Dokumentmanifest, Vault-konformer Queue und späterer Assist-Verarbeitung"
tags: [decision, mobile, capture, offline, queue, processing, batch, vault]
lastUpdated: "2026-07-22"
status: "accepted"
owner: "product-concept"
---

# Decision - Mobile Offline Capture and Processing Queue

## Status

Angenommen. Frühere Desktop-/Home-Hub-Fallbacks und Vorab-Kontextauswahl sind
ersetzt.

## Entscheidung

Netzwerk- oder Assist-Verfügbarkeit blockiert niemals Capture. Mobile sichert
Originale, Seitenreihenfolge, Dokumentgrenzen und ausdrückliche Nutzerabsicht
dauerhaft und setzt Transfer sowie Verarbeitung fort, sobald der aktive
Vault-/Providerpfad verfügbar ist.

Offline unterstützt mindestens Dokumentenscan, Bildnachweis, mehrseitige und
mehrere nacheinander abgeschlossene Dokumente, Retake/Remove/Reorder/Cancel,
lokale Qualitätsprüfung, optionale bekannte Typ-/Subtyp-/Fact-/Subject-/Case-
Angaben, persistente Queue und privacy-sichere Statusanzeige. Keine dieser
Angaben ist vor dem Scan erforderlich oder schaltet automatische Analyse aus.
Userwerte werden dauerhaft mit Provenienz gespeichert und nicht still
ueberschrieben.

## Vault-Semantik

- Local Vault bleibt auf dem Gerät autoritativ; Assist wartet auf den separat
  akzeptierten Processing-Pfad.
- Cloud Vault bleibt pending, bis Mappm Cloud die Speicherung bestätigt.
- Processing-Beginn ist keine Cloud-Speicherbestätigung.
- Core Assist erzeugt für Local Vault keine stille Cloud-Ablage oder Sicherung.

## Zustandsfamilien

Der konkrete Contract wird im Implementation Slice definiert, muss aber lokale
Sicherung, Warten auf Verbindung, Transfer, Cloud-Bestätigung beziehungsweise
lokale Bereitschaft, Processing, Vorschlag, Review, wiederholbaren Fehler,
manuellen Fallback und Bestätigung unterscheiden.

Zustand, Idempotenz, Seitenreihenfolge und Retry überstehen Neustart,
doppelte Callbacks und Partial-Batch-Fehler.

## Ergebnis und Fallback

Die Nutzerin darf die App unmittelbar nach dauerhafter Sicherung verlassen.
OCR, Indexierung und Matching können Sekunden oder Minuten dauern.
Benachrichtigungen zeigen standardmäßig keine sensiblen Titel oder Inhalte.

Bleibt Assist nicht verfügbar, bleibt das Original zugänglich. Ein begrenzter
manueller Fallback darf den Mindest-Review abschließen, behauptet aber keine
gleichwertige Erkennungsqualität.

Stop, wenn Offline-Capture gecachte Cases/Profile voraussetzt, ein Neustart
Artefakte verliert, Cloud vor Bestätigung als abgeschlossen gilt, Teilfehler
erfolgreiche Dokumente verwerfen oder fehlender Assist das Original löscht.
