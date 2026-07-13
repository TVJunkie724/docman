---
title: "Decision - Contextual Review Actions and Financial Roll-ups"
description: "Schlanke kontextuelle Aktionen beim Dokument-Review sowie deduplizierte finanzielle Zusammenfassungen in Vorgaengen"
tags: [decision, product, assisted-review, actions, financial-facts, rollup, ux]
lastUpdated: "2026-07-14"
status: "accepted"
owner: "product-concept"
---

# Decision - Contextual Review Actions and Financial Roll-ups

## Status

Accepted on 2026-07-14.

## Contextual Review Actions

Assisted Review proposes only the few actions most relevant to the document.
It does not show a universal wall of checkboxes. Typical actions include:

- assign managed person, household or organization;
- link an existing Case or create a manual/guided Case;
- link an existing Record or create/update a Record version;
- link a contract/subscription and set a document role;
- create or link a Claim/submission;
- mark payment open/paid and create a due-date reminder;
- mark for tax review and select period/subject;
- mark as business-relevant;
- attach to warranty/asset context;
- create a task or reminder;
- add to Quick Access;
- prepare controlled export/handoff.

The UI shows two or three ranked actions and places the rest under a restrained
secondary action menu. Suggestions expose evidence and are easy to confirm,
edit, reject and undo.

## Matching and Automation

```text
capture
  -> extract type, date, actors, amount and identifiers
  -> match managed subject
  -> match Record/contract
  -> match Case/workflow/Claim
  -> propose document roles and actions
  -> user confirms or corrects
```

An explicit capture context or prior user-confirmed rule may preselect a match.
Low-risk automation may become provisional auto-routing only when the applicable
Assist decision permits it. Person/organization ownership, jurisdiction,
tax/legal classification and external actions remain intentionally confirmed.

No broad event is inferred from a single ambiguous document. All automatic
routes have undo and history.

## Financial Facts

Every Case can reference confirmed `FinancialEntry` facts, but the UI renders a
financial summary only when relevant data exists.

| Data | Visible treatment |
|---|---|
| no confirmed financial entries | no empty financial section |
| one confirmed amount | one calm amount row |
| multiple comparable period amounts | optional small chart |
| reimbursement Case | invoice, reimbursements and remaining own share |
| tax collection | candidate/confirmed evidence count and meaningful confirmed total |
| Custom project | simple total; category/provider detail only when requested by the product pattern |

Mappm is not a generic analytics dashboard.

## Parent Roll-up

For a `part_of` CaseLink, eligible confirmed financial entries roll up into the
parent by default. `caused_by`, `follow_up_to` and `related_to` do not roll up
automatically.

Roll-up operates on stable `FinancialEntry` IDs, not document links. The same
invoice linked to parent, child, tax collection and subscription is counted once
per applicable summary. Proposed/unconfirmed amounts do not silently affect
totals.

Closing or unlinking a Case does not delete financial facts. The UI can show
where a rolled-up amount originated without forcing an accounting-style drill
down.

## Slim Visualization Rules

- No chart for one value.
- No empty chart placeholder.
- Use a small line chart only for a meaningful sequence.
- Desktop hover, mobile tap and keyboard focus reveal exact point values.
- Screen readers receive an equivalent concise value sequence or summary.
- Avoid forecasts, accounting KPIs, dense legends and configurable dashboards.
- Label invoice totals as invoice history unless a fixed price change is known.

## Stop Rules

Stop if:

- every possible action is always visible;
- an Assist suggestion silently finalizes sensitive ownership or jurisdiction;
- a financial section appears without data;
- the same FinancialEntry can be counted twice through multiple links;
- loose related Cases silently alter parent totals;
- proposed OCR/AI amounts enter confirmed summaries;
- visualizations turn Mappm into bookkeeping or business intelligence software.
