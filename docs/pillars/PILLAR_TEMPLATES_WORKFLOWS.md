---
title: "Produkt-Säule - Templates and Workflows"
description: "Produktbereich fuer Vorgangsvorlagen, Checklisten, empfohlene nächste Schritte und workflowbasierte Assistenz"
tags: [pillar, templates, workflows, checklists, tasks]
lastUpdated: "2026-07-12"
version: "0.2"
status: "accepted-direction"
---

# Produkt-Säule - Templates and Workflows

## Zweck

DocMan soll wiederkehrende Lebenssituationen nicht jedes Mal bei null starten lassen.

Beispiele:

- Arztbesuch.
- Autounfall.
- Umzug.
- Namensänderung.
- Geburt eines Kindes.
- Schulangelegenheit.
- Garantie/Reklamation.
- Versicherungsfall.

## Zielbild

Mappm besitzt eine generische Vorgangs-Engine und einen kuratierten,
versionierten Workflow-Katalog. Templates liefern nachvollziehbare Vorschläge,
keine starre Statusmaschine. Fachliche Varianten werden pro Rechtsraum,
Gültigkeitszeitraum und gegebenenfalls Institution veröffentlicht.

Ein Template kann vorschlagen:

- typische Dokumenttypen.
- sinnvolle Subvorgänge.
- Tasks und Fristen.
- Records, die verknüpft werden sollten.
- externe Aktionslinks.
- Facts, die später ausgewertet werden können.
- erwartete Antworten und Dokumente.
- typisierte Dokumentrollen wie Auslöser, Einreichung, Antwort, Entscheidung
  und Zahlungsbeleg.

Templates dürfen Subvorgänge erzeugen oder vorschlagen. Unabhängige verwandte
Vorgänge bleiben über typisierte Referenzen verbunden. Dokumente können mehreren
Vorgängen zugeordnet sein, ohne Dateien zu duplizieren.

## Internationalisierung

- Workflow-Familien definieren wiederverwendbare universelle Muster.
- Länder-/Regionspakete konkretisieren Rechtsraum, Institutionen, Nachweise,
  Fristen, Terminologie und Einreichungswege.
- Sprache ist nicht gleich Rechtsraum.
- Nicht unterstützte Kombinationen verwenden einen klar gekennzeichneten
  manuellen Vorgang.
- Jeder veröffentlichte Workflow braucht Version, Gültigkeit, Quellen,
  Reviewdatum, Owner, Risikoklasse und getestete Fallbacks.

## M2-Scope

M2:

- keine vollständige Template-Engine.
- Vorgangstypen und Subvorgang-Idee so modellieren, dass Templates später möglich sind.

spaetere Milestones:

- Definition und technische Validierung des Katalogformats.
- fachlich geprüfte Golden Workflows für die ausgewählten Startmärkte.
- aus Templates erzeugte Aufgaben, Subvorgänge und erwartete Dokumente.
- signierte Katalog-Updates und auditable Migrationen.

## Grenzen

- Templates dürfen keine rechtlich oder medizinisch verbindlichen Entscheidungen treffen.
- Automatische Statusänderungen brauchen Review.
- LLM-generierte Vorschläge gehören später zur Intelligence-Säule und bleiben bestätigungspflichtig.
- LLMs wählen nur aus veröffentlichten Definitionen; sie publizieren oder
  erfinden keine fachlich verbindlichen Abläufe.
- Laufende Vorgänge pinnen ihre Workflow-Version und wechseln nur über eine
  nachvollziehbare Migration.
- Länder-Support darf erst nach datierter fachlicher, rechtlicher und
  produktbezogener Prüfung beworben werden.

Normative Entscheidung:
`docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
