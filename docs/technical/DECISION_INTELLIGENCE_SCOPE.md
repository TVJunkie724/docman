---
title: "Decision - Intelligence Scope"
description: "Entscheidung zum KI-/OCR-/LLM-Scope: Core Assist im Commercial Core, Advanced Assist als spätere kontrollierte Erweiterung"
tags: [decision, intelligence, assist, ocr, llm, commercial-core, managed-service]
lastUpdated: "2026-07-12"
status: "accepted-rebaseline"
---

# Decision - Intelligence Scope

## 2026 Trust Rebaseline

On-device and managed intelligence are the supported planning boundaries.
Customer Home Hub/self-hosted processing is not active scope. No real-document
Cloud processing starts before VC-02 plus provider, retention, training,
redaction, evidence and human-review decisions.

The former statement that OCR/classification is outside the first useful
product is superseded. Core Assist is required by
`DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md` and
`DECISION_COMMERCIAL_CORE_SCOPE.md`.

## Status

Accepted.

## Entscheidung

Core Assist is part of the sellable Commercial Core. It provides the accepted
minimum OCR/text extraction, document/actor/key-field classification,
case/workflow matching, search-index input and human review. Advanced Assist,
open-ended AI interaction and broad automation remain later slices.

Mappm implements these capabilities as a controlled processing pipeline:

```text
Dokument speichern
  -> Text/OCR extrahieren
  -> Dokumenttyp erkennen
  -> Felder vorschlagen
  -> bestehenden Vorgang oder veröffentlichte Workflow-Definition vorschlagen
  -> Nutzerin prüft
  -> akzeptierte Vorschläge übernehmen
```

## Zielrichtung

- On-device processing may handle approved capabilities where quality and
  platform resources are sufficient.
- Managed Assist is the planned quality path for capabilities that cannot be
  delivered reliably on supported client devices.
- Managed Assist is allowed only when
  `DECISION_TRUST_ENCRYPTION_DEPLOYMENT_MODEL.md` eingehalten wird: explizite
  Trust Boundary, klare Freigabe, keine Trainingsnutzung ohne Zustimmung,
  begrenzte Retention und loeschbare Processing-Artefakte.
- Vorschläge mit Review-Zustand.
- Keine stillen automatischen Statusänderungen.
- OCR-/LLM-Ergebnisse sind löschbar und privacy-sensibel.
- Keine frei erfundenen fachlichen Workflows, Fristen, Ansprüche oder
  Rechtsraum-Zuordnungen.
- Workflow-Vorschläge referenzieren eine kuratierte, gültige Definition gemäß
  `DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md` und erklären die
  verwendeten Dokument-/Profilmerkmale.

## Core Versus Advanced

Core Assist:

- is available in a meaningful limited Free entitlement;
- is planned in C2/C3 rather than deferred beyond the sellable product;
- supports search-first and review-first UX, not a mandatory AI chat;
- has manual/offline/opt-out fallbacks without claiming feature equivalence.

Advanced Assist may include higher quotas, broader extraction, semantic
answers, specialized processing and more automation. It cannot weaken evidence,
review, privacy or workflow-catalog rules.

## Konsequenzen

- C1 prepares account/device/entitlement, provider and secure processing
  boundaries.
- C2 delivers capture-to-Core-Assist-to-review as a complete vertical.
- C3 integrates accepted suggestions into cases, search, tasks and profiles.
- F9/F10/F11/F14/F17/F30 and AI/REG concepts govern the implementation.
- No real-document processing begins before VC-02/OQ-003 and applicable
  security/privacy/AI-regulatory gates are accepted.
