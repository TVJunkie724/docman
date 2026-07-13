---
title: "Decision - Recurring Contracts and Subscriptions"
description: "Produktmodell fuer Vertraege, Abos, wiederkehrende Rechnungen, Kuendigungsfristen, Reminder und schlanke Rechnungsverlaeufe"
tags: [decision, product, contracts, subscriptions, records, invoices, reminders, insights]
lastUpdated: "2026-07-14"
status: "accepted"
owner: "product-concept"
---

# Decision - Recurring Contracts and Subscriptions

## Status

Accepted as product direction on 2026-07-14. Exact first-release contract
categories and country-specific cancellation rules remain phase scope.

## Decision

A recurring contract or subscription is a first-class `Record` with one calm
product context that combines its current facts, versions, recurring invoices,
timeline, tasks and workflow progress. Users do not receive a new Case for every
invoice or every ordinary lifecycle action.

The UI presents one contract/subscription detail even when the underlying model
separates:

- the durable `Record` and its versions;
- a long-running Case/workflow context where needed;
- documents and recurring invoices;
- tasks, reminders, events and financial facts;
- independently meaningful disputes as linked Cases.

Conclusion, activation, ordinary changes, price-change review, cancellation and
final invoice are stages or branches in the same contract context. A separate
linked Case is created only when a dispute or other work gains an independent
goal and lifecycle.

## Supported Categories

- streaming, media and software;
- mobile, internet and telecommunications;
- energy and household services;
- insurance and memberships;
- fitness, leisure, education and care;
- rent, lease and other recurring services.

Category-specific facts are optional and progressive. Mappm does not expose an
accounting-style configuration surface.

## Core Facts

The model may hold:

- provider and managed subject;
- product/tariff and customer reference;
- start, minimum term and status;
- billing cadence: monthly, quarterly, yearly or custom;
- renewal rule and next renewal;
- cancellation notice and next eligible cancellation date;
- expected billing period;
- current confirmed recurring amount;
- country/jurisdiction and source documents.

Additional facts such as service address, phone number, connection, device or
meter belong to category extensions. Facts are extracted as reviewable
suggestions and do not become mandatory merely because the category supports
them.

## Invoice Routing

The normal path begins with the first useful document:

```text
capture invoice
  -> classify invoice
  -> identify provider and managed subject
  -> match existing contract/subscription context
  -> propose role recurring_invoice and billing period
  -> confirm or correct
```

If no context exists, Mappm may propose `Create subscription/contract` from the
first sufficiently informative invoice. Repetition over several periods is a
fallback signal for previously unclassified documents, not a prerequisite.

After a user confirms a reliable matching rule, later invoices may be routed
provisionally with a visible undo/review path. Unexpected provider, customer
reference, amount, tariff, duplicate, post-termination invoice or other material
change returns to review.

## Tasks and Reminders

Tasks and reminders are linked to the contract context and may be triggered by
confirmed facts or workflow rules:

- review or pay an invoice;
- review a detected price change;
- cancel, renew or switch before a deadline;
- return equipment;
- verify a final invoice;
- expect a confirmation or refund.

Reminder policy separates date, offset and channel:

- quiet: agenda, badge or in-app reminder;
- notifying: privacy-safe OS/push notification;
- one or more offsets where the workflow requires them;
- user quiet hours and channel preference.

Mappm does not generate a noisy monthly cancellation reminder by default. A
review reminder is activated by user choice, a published workflow rule or a
material detected event such as a confirmed price change.

## Slim Invoice Chart

The contract detail may show one small line chart when at least two confirmed
periodic invoice amounts exist.

- X-axis: billing period.
- Y-axis: confirmed invoice amount.
- Desktop hover, mobile tap and keyboard focus reveal period and amount.
- A confirmed material change may receive one restrained marker.
- An accessible textual alternative is available to assistive technology.

Use **Preisentwicklung** only for a truly fixed recurring price. Use
**Rechnungsverlauf** for variable services such as energy or usage-dependent
telecom bills. Mappm does not infer that a higher total is a tariff increase.

The visible product does not add accounting dashboards, annual forecasts,
complex averages, discount analytics, consumption accounting or configurable
chart panels. The detail keeps only the calm chart and the next relevant action,
for example `Kuendbar bis 29. Juli - Erinnerung aktiv`.

## Stop Rules

Stop if:

- each recurring invoice creates a new Case;
- ordinary cancellation or plan change fragments the contract into unrelated UI;
- recurrence is assumed to be monthly;
- invoice total and fixed tariff price are presented as equivalent without evidence;
- a chart appears for a single amount or an empty financial state;
- Mappm becomes an accounting, forecasting or consumption-analysis product;
- an inferred subscription or cancellation rule is finalized without review.
