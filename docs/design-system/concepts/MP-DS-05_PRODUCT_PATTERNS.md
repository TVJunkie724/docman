---
title: "MP-DS-05 Product Patterns"
description: "Normative composition patterns for Mappm product workflows"
tags: [design-system, product-patterns, workflows, responsive]
lastUpdated: "2026-07-12"
status: "active-draft"
owner: "ui-concept"
---

# MP-DS-05 Product Patterns

## Scope

Defines how approved components compose into capture, Draft Inbox, document,
Vorgang, profile, search, settings, sync/backup, export and support surfaces.
It does not define domain policy, repository contracts or Flutter widget trees.

## Pattern Contract

Every product pattern must name:

- entry point, first visible state and successful outcome.
- empty, loading, partial, offline, error, retry, blocked and permission states.
- desktop and mobile structure, focus order and keyboard behavior.
- source of truth, fake repository scenarios and contract/Microcks boundary.
- sensitive-data exposure, logging/diagnostic limits and screenshot policy.
- exact F, MP-DS and pillar owners.

## Initial Pattern Families

| Pattern | Primary sources | Status |
|---|---|---|
| Desktop shell/workbench | F22/F33, MP-DS-02 | active-draft |
| Mobile capture companion | F17/F29/F33, Capture pillar | planned |
| Draft Inbox review | F24/F27-F30/F34, Capture/Cases pillars | planned |
| Document/Vorgang detail | F33-F35, Cases/Records pillar | planned |
| Search/list/filter | F33-F35, Search pillar | planned |
| Settings/configuration | F13/F24/F35, Admin pillar | planned |
| Account/Vault/Assist/backup/sync/conflict/migration/recovery | F18/F34-F36, Account/Cloud/Identity, Intelligence and Data pillars | active-baseline for Account/Vault/Assist lifecycle; remaining patterns planned |
| Export/sharing/support | F5/F18/F34/F35, Export/Support pillars | planned |

## Accessibility, Verification And Stop Rules

Patterns require German copy, semantics, visible focus, text scaling, reduced
motion and responsive evidence. Stop if a pattern is built from a mock alone,
if mobile/desktop behavior is missing, or if backend/data policy is invented by
the UI. Handoff to `ui-architect` only from an approved phase contract.
