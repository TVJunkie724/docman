---
title: "AI-03 Human Review Evidence"
description: "Human-in-the-loop review, correction, acceptance and evidence trail"
tags: [ai, human-review, evidence]
status: "draft"
owner: "ai/compliance"
lastUpdated: "2026-07-25"
---

# AI-03 Human Review Evidence

`Human Review` bezeichnet in M1 die sichtbare Pruefung und Korrektur durch die
Nutzerin selbst. Er bezeichnet keine Einsicht in Produktivdokumente durch
Mappm-Mitarbeitende. Normale Korrekturen sind weder Dokumentspende noch
Einwilligung in Training, Analyseverbesserung oder menschliche
Inhaltspruefung. Eine solche spaetere Option benoetigt einen eigenen,
ausdruecklichen Product-/Privacy-/Security-/Legal-/AI-/Ops-Contract.

## Required Behavior

- Suggestions are distinguishable from user-confirmed facts.
- Users can accept, edit, reject and explain corrections.
- Review state is persisted when legally or operationally required.
- Evidence/source snippets are shown when relevant.

## Stop Rules

- Stop if AI output can become product truth without review and correction.
- Stop if ordinary user review is interpreted as consent to staff access,
  training, online learning, fine-tuning or analysis improvement.
