---
title: "Produkt-Säule - Templates and Workflows"
description: "Produktbereich fuer Vorgangsvorlagen, Checklisten, empfohlene nächste Schritte und workflowbasierte Assistenz"
tags: [pillar, templates, workflows, checklists, tasks]
lastUpdated: "2026-07-14"
version: "0.3"
status: "accepted-direction"
---

# Produkt-Säule - Templates and Workflows

## Zweck

DocMan soll wiederkehrende Lebenssituationen nicht jedes Mal bei null starten lassen.

Universelle Workflow-Muster:

- einreichen, warten, entscheiden und abrechnen;
- Schadenereignis dokumentieren und regulieren;
- Vertrag/Abo aktivieren, ändern und beenden;
- Kauf, Lieferung, Rückgabe, Garantie und Reklamation;
- Lebensereignis über mehrere Stellen koordinieren;
- Nachweis beantragen, erneuern oder ersetzen;
- Unterlagen für einen Zeitraum sammeln, prüfen und übergeben;
- Einspruch, Streit oder Rückforderung verfolgen.

Konkrete Domänenfamilien umfassen Gesundheit/Erstattung, Unfall/Versicherung,
Verträge/Abos, Kauf/Garantie, Behörden, Wohnen/Umzug, persönliche/familiäre
Ereignisse, Identität/Nachweise, Steuer-Unterlagensammlung, Bildung/Betreuung,
Arbeit/Einkommen, Fahrzeug/Mobilität und konkrete Reise-/Auslandsabläufe.

## Zielbild

Mappm besitzt eine generische Vorgangs-Engine und einen kuratierten,
versionierten Workflow-Katalog. Templates liefern nachvollziehbare Vorschläge,
keine starre Statusmaschine. Fachliche Varianten werden pro Rechtsraum,
Gültigkeitszeitraum und gegebenenfalls Institution veröffentlicht.

Ein Template kann vorschlagen:

- typische Dokumenttypen.
- Schritte, Ablaufzweige, Claims und bei eigenständigem Ziel typisierte
  Case-Beziehungen.
- Tasks und Fristen.
- Records, die verknüpft werden sollten.
- externe Aktionslinks.
- Facts, die später ausgewertet werden können.
- erwartete Antworten und Dokumente.
- typisierte Dokumentrollen wie Auslöser, Einreichung, Antwort, Entscheidung
  und Zahlungsbeleg.

Templates erzeugen nicht für jeden Akteur oder Dokumentstapel einen Vorgang.
Ein neuer Case entsteht erst bei eigenständig verständlichem Ziel und
Lebenszyklus. `Subvorgang` ist nur die UI-Rolle eines `part_of`-Links.
Dokumente können mehreren Vorgängen zugeordnet sein, ohne Dateien zu duplizieren.

Manuelle/Custom Cases sind ein gleichwertiger Produktpfad. Nutzer können sie
frei anlegen, aus ausgewählten Dokumenten bilden oder aus bestehenden Cases und
Dokumenten nachträglich einen übergeordneten Case erzeugen. Ein kompatibles
Template kann später bewusst übernommen werden.

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
- Case, CaseLink, Workflow-Schritt/-Zweig und Custom-Case-Ursprung so
  modellieren, dass Templates später möglich sind.

spaetere Milestones:

- Definition und technische Validierung des Katalogformats.
- fachlich geprüfte Golden Workflows für die ausgewählten Startmärkte.
- aus Templates erzeugte Aufgaben, Claims, Ablaufzweige, Case-Beziehungen und
  erwartete Dokumente.
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

Der vollständige Stand der konkret definierten Cases, Record-Kontexte,
Custom-Beispiele und nur benannten Kandidatenfamilien steht in
`docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
