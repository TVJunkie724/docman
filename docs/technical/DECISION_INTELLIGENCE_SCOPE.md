---
title: "Decision - Intelligence Scope"
description: "Entscheidung zum KI-/OCR-/LLM-Scope: nicht im MVP, aber als lokale self-hosted Pipeline vorbereiten"
tags: [decision, intelligence, ocr, llm, mvp, self-hosted]
lastUpdated: "2026-04-27"
status: "accepted"
---

# Decision - Intelligence Scope

## Status

Accepted.

## Entscheidung

OCR, Dokumentklassifikation, Auto-Tagging und lokale LLMs sind nicht Teil des MVP.

DocMan bereitet diese Fähigkeiten aber architektonisch vor:

```text
Dokument speichern
  -> Text/OCR extrahieren
  -> Dokumenttyp erkennen
  -> Felder vorschlagen
  -> Vorgang/Formular vorschlagen
  -> Nutzerin prüft
  -> akzeptierte Vorschläge übernehmen
```

## Zielrichtung

- Verarbeitung lokal oder self-hosted.
- Keine Cloud-SaaS-Abhängigkeit.
- Vorschläge mit Review-Zustand.
- Keine stillen automatischen Statusänderungen.
- OCR-/LLM-Ergebnisse sind löschbar und privacy-sensibel.

## Konsequenzen

- MVP-Datenmodell lässt spätere Vorschläge und Review-Zustände zu.
- F9/F10/F11/F14/F17 berücksichtigen Intelligence als späteren Anschluss.
- Implementiert wird Intelligence erst nach stabiler Dokumentbasis, Home-Hub-Pipeline und realer Hardware-Entscheidung.

