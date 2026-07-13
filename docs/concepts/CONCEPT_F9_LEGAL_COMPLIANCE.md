---
title: "Konzept F9 - Legal and Privacy"
description: "Mappm Privacy/Compliance fuer Local/Cloud Vaults, processors, export, cancellation, retention, deletion and sensitive documents"
tags: [concept, legal, privacy, gdpr, cloud, documents, subscriptions]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F9 - Legal and Privacy

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Vault/Cloud Rebaseline

Local and Cloud processing purposes, roles, legal bases, retention and deletion
must be documented separately. Cloud requires current hosting/residency,
processor/subprocessor, transfer, incident, account, billing and DSAR review.
Cancellation, Vault deletion and account deletion are separate. Export and safe
Cloud-to-Local migration remain available according to accepted policy.

Dieses Konzept ersetzt den importierten F9-Inhalt aus dem alten Projekt.

## Hinweis

Dieses Dokument ist Produkt- und Architekturplanung, keine Rechtsberatung.

## Legacy Detail Baseline (non-normative)

The remaining imported detail is retained only for migration context and useful
feature-specific examples. It must not authorize Home Hub, Tailscale, customer
self-hosting, universal local-first authority, old milestone scope or QR server
pairing. Where it differs, the rebaseline above,
`DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`,
`DECISION_COMMERCIAL_CORE_SCOPE.md` and F36 are authoritative. Before this
concept is used for implementation, its affected detail must be rewritten into
the phase's approved implementation contract.

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

- Welche Daten werden im M2 verschlüsselt?
- Welche Exportformate brauchen wir?
- Wie werden Profile/Haushalte bei Löschung behandelt?

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
