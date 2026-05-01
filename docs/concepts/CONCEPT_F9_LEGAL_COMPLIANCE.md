---
title: "Konzept F9 - Legal and Privacy"
description: "DocMan-spezifisches Privacy- und Compliance-Konzept für private Dokumente, Self-Hosted-Betrieb, lokale Daten, Export, Löschung und Logs"
tags: [concept, legal, privacy, gdpr, self-hosted, documents]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F9 - Legal and Privacy

## Status

Accepted.

Dieses Konzept ersetzt den importierten F9-Inhalt aus dem alten Projekt.

## Hinweis

Dieses Dokument ist Produkt- und Architekturplanung, keine Rechtsberatung.

## Zweck

DocMan verarbeitet sehr sensible private Dokumente. F9 definiert Privacy-Prinzipien, die App, Home Hub, Logs und spätere Intelligence-Flows einhalten müssen.

## Grundsatz

Private-first vor Funktionsfülle.

## Privacy-Regeln

- Keine Drittanbieter-Cloud- oder Cloud-SaaS-Abhängigkeit.
- Self-hosted cloudartige Betriebsformen bleiben möglich, müssen aber die Security-/Privacy-Baseline einhalten.
- Keine externen Requests ohne bewusste Entscheidung.
- Keine Dokumentinhalte in Logs.
- Keine Secrets in normalem Storage.
- Export und Löschung müssen langfristig möglich sein.
- KI/OCR lokal oder self-hosted planen.
- Nutzerin muss verstehen, wo Daten liegen.

## Datenklassen

| Klasse | Beispiele | Schutz |
|---|---|---|
| Hochsensibel | Medizin, Ausweise, Schule, Versicherungen | besondere Vorsicht |
| Sensibel | Rechnungen, Verträge, Bestellungen | Standard privat |
| Technisch | IDs, Status, Queue | keine Inhalte |
| Geheimnisse | Tokens, Pairing Secrets | F12 |

## Export und Löschung

DocMan muss langfristig unterstützen:

- Export von Dokumenten und Metadaten.
- Löschung lokaler Daten.
- Entfernen eines Geräts.
- Unpair vom Home Hub.
- später Haushalts-/Profil-Export.

## Intelligence

OCR/LLM-Ergebnisse können besonders sensibel sein, weil sie Inhalte leichter durchsuchbar machen.

Regeln:

- keine stille externe Verarbeitung.
- Vorschläge brauchen Review.
- abgeleitete Texte müssen löschbar sein.
- Logs enthalten keine OCR-/LLM-Inhalte.

## Definition of Done

F9 gilt als umgesetzt, wenn:

- Privacy-Regeln in F10/F12/F7/F11 berücksichtigt sind.
- Dokumentinhalte nicht in Logs oder Telemetrie landen.
- Export-/Löschbarkeit als Ziel geplant ist.
- lokale/self-hosted Verarbeitung als Produktprinzip sichtbar bleibt.

## Offene Folgefragen

- Welche Daten werden im MVP verschlüsselt?
- Welche Exportformate brauchen wir?
- Wie werden Profile/Haushalte bei Löschung behandelt?
