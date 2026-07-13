---
title: "Decision - Curated Jurisdictional Workflow Catalog"
description: "Verbindliches Zielmodell fuer kuratierte, versionierte und laenderspezifische Mappm-Vorgangsvorlagen"
tags: [decision, product, workflows, cases, internationalization, intelligence, compliance]
lastUpdated: "2026-07-14"
status: "accepted"
owner: "product-concept"
---

# Decision - Curated Jurisdictional Workflow Catalog

## Status

Accepted as product and architecture direction on 2026-07-12. The first
supported countries, workflow families and professional review owners remain
explicit release-scope decisions in WF-01 and WF-02.

## Decision

Mappm uses a generic case engine and a curated, versioned workflow catalog.
Domain-relevant workflows are prescribed product content, not ad-hoc sequences
invented by an LLM and not immutable control flow hardcoded into Flutter UI or
backend application services.

The product separates:

- universal workflow patterns;
- jurisdiction and regional variants;
- institution/provider capabilities;
- language and presentation;
- a concrete workflow instance attached to a `Case`.

The same app may be sold internationally, but it may claim guided workflow
support only for countries, regions and workflow families that are explicitly
published, dated, tested and reviewed.

## Product Rationale

Users need predictable guidance, especially for medical, insurance, legal,
financial and administrative documents. A fully free-form AI agent cannot be
the authority for obligations, deadlines, eligibility or required evidence.
Conversely, embedding every national process directly in client code would make
changes slow, untraceable and difficult to test.

Curated definitions provide the simplicity of predefined workflows while
remaining maintainable, reviewable and updateable as rules or provider
capabilities change.

## Layered Model

```text
Workflow family
  -> universal pattern
      -> jurisdiction variant
          -> regional/institution variant
              -> versioned workflow definition
                  -> case workflow instance
```

Example:

```text
Medical expense reimbursement
  -> capture invoice
  -> identify affected person and provider
  -> determine possible payer
  -> prepare submission
  -> wait for response/payment
  -> reconcile amounts
  -> evaluate secondary payer or review path
  -> close with an explicit outcome

Austria variant
  -> applicable social-insurance path
  -> optional supplementary-insurance Claim/branch in the same Case

Other jurisdiction
  -> its own payer, evidence, sequence and terminology
```

The universal pattern may be shared. Institutions, eligibility, evidence,
deadlines, submission channels and user-facing claims are defined only by an
applicable reviewed variant.

## Required Definition Metadata

Every published workflow definition must carry at least:

- stable definition ID and immutable version;
- workflow family and case type;
- supported country, jurisdiction and optional region;
- supported institution/provider variants;
- `validFrom`, optional `validTo`, publication date and last review date;
- languages and localization status;
- applicability, prerequisites and exclusion conditions;
- steps, branches, Claims/submissions, escalation points, Case relations and
  completion outcomes;
- expected documents, evidence roles and required facts;
- tasks, deadlines and the source of each deadline calculation;
- confirmation points and actions that always require user approval;
- source references, content owner and professional reviewer;
- risk classification and known limitations;
- supported integrations plus manual fallback paths;
- compatibility with prior definitions and migration policy.

Language never determines jurisdiction by itself. Applicability may depend on
the affected profile, residence, insurance or contract jurisdiction, document
issuer, service location, institution and event date. Ambiguous cases require
review.

## Case Composition and Document Relations

A workflow definition may create steps, tasks, events, Claims/submissions and
conditional branches inside one Case. A different sender, institution,
document set or local status does not create another Case. When a branch gains
an independently understandable goal and lifecycle, the workflow may suggest a
normal linked Case using `part_of`, `caused_by`, `follow_up_to` or `related_to`.
There is no separate Subcase domain entity.

A document may support multiple Cases, branches or Claims without file duplication.
Each `DocumentCaseLink` records its role, for example:

- trigger;
- submission;
- evidence;
- response;
- decision;
- payment proof;
- context.

One link may be primary for navigation. Primary does not imply exclusive
ownership.

## Intelligence Boundary

Intelligence may:

- classify a document and extract facts and actors;
- find an existing related case;
- rank applicable published workflow definitions;
- suggest a new Case, branch promotion, relation or next step;
- explain which document facts caused a suggestion;
- flag that no supported definition applies.

Intelligence must not:

- invent a binding workflow, deadline, entitlement or legal requirement;
- silently choose a jurisdiction or affected person;
- publish or modify workflow definitions;
- execute legal, medical or financial submissions without the required user
  confirmation;
- claim full support for an unpublished country/provider combination.

If no reviewed definition applies, Mappm offers a neutral manual case with
documents, relations, tasks and notes. It must clearly distinguish generic
organization from verified workflow guidance.

## Versioning and Updates

A running case pins the workflow definition version used to create it. A
catalog update never silently rewrites case history, completed steps, accepted
facts or prior decisions.

- New cases use the newest applicable approved version.
- Existing cases remain reproducible with their pinned definition.
- A material change may produce a review notice and an offered migration.
- Security- or law-relevant corrections use an explicit incident/change path.
- Migration records old/new versions, affected steps, user decisions and time.
- Expired definitions remain readable for historical cases but cannot be used
  for new cases unless an approved fallback explicitly permits it.

Catalog artifacts must be authenticated, integrity-checked and available to the
client according to the applicable offline policy. A failed update must not
corrupt existing definitions or cases.

## International Rollout

Technical international availability and domain workflow coverage are separate
claims. Mappm may provide capture, storage and search in a market before it
provides reviewed local workflows, provided the limitation is explicit before
purchase and during workflow selection.

Each country pack requires:

- named scope and unsupported areas;
- dated domain and legal review where applicable;
- localized terminology and accessible UX review;
- synthetic fixtures for every branch and boundary;
- update, withdrawal, incident and support ownership;
- release evidence for each supported platform.

Austria is a candidate reference pack because the initial medical-reimbursement
example is Austrian. It is not silently declared the only or first commercial
market by this decision.

## Commercial and Safety Consequences

- Workflow coverage is a versioned product capability and may be entitlement-
  aware, but access changes must not erase historical case meaning.
- Marketing and store copy list supported countries and workflow families.
- A workflow pack cannot ship as "beta" inside a production claim without an
  explicit risk and support contract.
- Current regulatory and provider rules must be rechecked at the dated release
  gate and at each material change trigger.
- The product must expose source, review date, applicability and limitations in
  a calm user-facing form for high-impact guidance.

## Out of Scope for This Decision

- selection of the first commercial countries and exact workflow families;
- final workflow-definition serialization format;
- catalog distribution protocol and signing technology;
- pricing and packaging of country or workflow packs;
- automated submission to external institutions;
- professional reviewer procurement and liability terms.

## Stop Rules

Stop implementation or release if:

- domain logic is being hardcoded into widgets or platform-specific UI;
- an LLM is treated as the source of a workflow obligation or deadline;
- a country workflow has no applicability, validity, source and owner metadata;
- a running case can change definition version without an auditable migration;
- unsupported markets receive a UI that implies verified local guidance;
- Case relations or multi-document contexts require file copies;
- a high-impact workflow lacks manual fallback, review and correction paths.

## Related Decisions

- `DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`
- `DECISION_DMS_TARGET_ARCHITECTURE.md`
- `DECISION_WORKFLOW_RULES.md`
- `DECISION_INTELLIGENCE_SCOPE.md`
- `DECISION_ASSISTED_REVIEW_SUGGESTIONS.md`
- `DECISION_SECURITY_PRIVACY_MODEL.md`
- `DECISION_LEGAL_PRIVACY_READINESS.md`
