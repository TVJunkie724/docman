---
title: "Decision - Jurisdictional Tax Document Collection"
description: "Produktgrenze fuer private und geschaeftliche Steuer-Unterlagensammlung ohne Buchhaltungs- oder Steuerberatungsclaim"
tags: [decision, product, tax, jurisdiction, business, documents, workflows, compliance]
lastUpdated: "2026-07-16"
status: "accepted-direction"
owner: "product-concept"
---

# Decision - Jurisdictional Tax Document Collection

## Status

Accepted as product direction on 2026-07-14. No specific tax workflow may ship
before its country/regime definition, sources, professional owner and current
legal review are approved through WF-01/WF-02 and the regulatory gates.

## Decision

Mappm may help private persons and managed organizations collect, classify,
review and export tax-relevant documents. It does not initially calculate tax,
guarantee deductibility, submit a return or replace bookkeeping/tax advice.

A tax collection is a normal Case with explicit applicability metadata, not a
separate domain subtype:

```text
Case
  domainTemplateId: tax_document_collection
  workflowPatternId: collection
  managedSubjectId
  country / jurisdiction
  taxRegime or collectionPurpose
  periodStart / periodEnd
  cadence: monthly | quarterly | yearly | event_based | custom
  workflowDefinitionId / version optional
  status
```

The UI never assumes that every user is an employee or that every tax period is
annual. Austrian `Arbeitnehmerveranlagung` is one possible reviewed template,
not the generic model.

## Supported Product Flows

Depending on an approved country pack, Mappm may support:

- private annual evidence collection;
- self-employed or organization document collection by configured period;
- preparation for periodic or annual professional handoff;
- collection of notices, requests and decisions;
- payment/refund reconciliation;
- linked objection or follow-up Cases.

Exact cadence, eligibility, categories, deadlines and terminology come only
from the applicable reviewed definition or explicit user configuration.

## Review Action

For potentially relevant documents, Assisted Review may offer a concise action:

```text
For tax review
```

After activation Mappm confirms or proposes:

- managed person or organization;
- country/jurisdiction;
- collection purpose/regime;
- period;
- optional category;
- optional relevant amount/share;
- status `candidate`, not `deductible` or `accepted`.

If no matching Case exists, Mappm offers to create one. The document remains in
all existing contract, subscription, purchase or other Case contexts and gains
an additional link. It is never copied.

The same action is available for single documents, bulk selection and
retrospective search results. A user-confirmed recurring rule may preselect
future matching documents, but legal/tax relevance stays reviewable and
reversible.

## Collection and Output

A tax Case may provide:

- document count and completeness status;
- candidate/confirmed distinction;
- simple confirmed amount total where meaningful;
- missing-document tasks and deadlines;
- controlled export for the user or professional adviser;
- links back to original contract, Case, Record and evidence.

It does not provide a tax return form, ledger, account reconciliation, binding
deduction decision, tax forecast or official filing unless a later separately
approved product decision expands scope.

## Country and Change Governance

- Language never selects tax jurisdiction.
- Applicable subject type, residence, organization seat, period, regime and
  event date must be explicit or reviewed.
- Every template is dated, versioned and source-backed.
- Regulatory changes trigger review, withdrawal or a new workflow version.
- Existing historical collections remain readable and auditable.

The dated, non-normative Austrian discovery inventory lives in
`docs/discovery/AUSTRIA_TAX_CASE_CATALOG_DRAFT.md`. It explores employee,
personal-income, VAT, corporate, partnership, procedural and professional-
handoff candidates, but does not close OQ-010 or authorize an AT workflow pack.
The broader preliminary country mapping is in
`docs/discovery/AUSTRIA_CASE_WORKFLOW_COUNTRY_PACK_DRAFT.md`.

## Stop Rules

Stop if:

- the generic UI assumes employee status or annual cadence;
- `candidate` is presented as legally deductible;
- a country rule is encoded in Flutter UI;
- private and organization tax collections are mixed;
- an export claims completeness without an explicit review state;
- Mappm drifts into bookkeeping or tax advice without a new accepted decision.
