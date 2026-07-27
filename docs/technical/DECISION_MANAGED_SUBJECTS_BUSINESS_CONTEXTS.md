---
title: "Decision - Managed Subjects and Business Contexts"
description: "Einheitliches Profilmodell fuer verwaltete Personen und Organisationen ohne verpflichtenden eigenen Login"
tags: [decision, product, profiles, persons, organizations, business, household, identity, permissions]
lastUpdated: "2026-07-22"
status: "accepted-direction"
owner: "product-concept"
---

# Decision - Managed Subjects and Business Contexts

## Status

Accepted as target product/domain direction on 2026-07-14. Commercial 1.0
activation of business contexts remains a release-scope decision because
business retention, tax and collaboration requirements need dated review.

## Decision

Mappm generalizes the existing managed-profile model to a managed subject:

```text
ManagedSubject
  PersonProfile
  OrganizationProfile
```

Both can own or be affected by documents, Records, Cases, Facts, submission events, tasks
and reminders. Both can be managed through another user's Mappm Account without
having their own login.

An own business is managed through the same interaction principle as a child's
profile: the account holder selects and manages the subject. The semantics and
legal fields differ, but no separate login is required.

## Subject Types

### PersonProfile

Examples:

- account holder;
- child;
- partner or adult household member;
- other person managed with an applicable permission basis.

### OrganizationProfile

Examples:

- sole proprietorship;
- company;
- association;
- other organization managed by the user.

An organization may later gain multiple managers, delegated access or its own
organization administration. That is an access expansion, not a change to the
document ownership model.

## Identity and Management Separation

Account/identity, managed subject and management grant remain separate:

- Account answers who authenticated.
- ManagedSubject answers in whose managed person/organization context Mappm
  stores and presents the information. It need not equal the literal
  recipient, named person or legal subject in a document.
- ManagementGrant answers who may manage it.
- ExternalParty answers who issued, received or participated in a document or
  process without being managed by the user.

A doctor, insurer, authority, merchant or telecom provider is normally an
`ExternalParty`, not an `OrganizationProfile`. The user's own company is a
managed `OrganizationProfile`.

## External Parties and Contact Profiles

ExternalParty is a reusable searchable actor/contact record for document
origin, sender, issuer, recipient, provider, payer or other participant. It may
represent a person such as a doctor or an organization such as a clinic,
insurer, authority, merchant or telecom provider.

It may progressively hold:

- display/legal name and party type;
- role/category and country;
- one or more postal addresses;
- email addresses and telephone numbers;
- website or reviewed portal link;
- stable provider, customer-facing or public identifiers where appropriate;
- aliases/previous names, source documents, verification state and merge
  history.

Only fields supported by user input or reviewable evidence become confirmed.
Contact details are sensitive and are neither mandatory for every party nor
silently shared across managed subjects. Duplicate parties can be merged only
with preview, link preservation and undo/history. ExternalParty participates in
enterprise search and can show its related documents, Records, Cases and
submission/decision events,
but it does not gain ownership or management rights from those links.

## Document and Case Roles

A document may carry distinct relationships:

- affected or owning managed subject;
- issuer/sender;
- recipient;
- payer;
- contract/subscription context;
- Case and document role;
- tax period or collection context.

A sole proprietor may be linked to both the natural person and the organization
without merging private and business context. Stable IDs and explicit links
prevent copies.

The selected ManagedSubject is user provenance and is authoritative for
management context and permission filtering. OCR/model output may extract
sender, issuer, recipient or named persons as optional metadata, but it does
not create a wrong-profile conflict or silently change the ManagedSubject.

## UX Direction

The user selects a managed context such as:

```text
Privat / Haushalt
Caroline
Kind A
Einzelunternehmen
GmbH
```

The selection filters documents, Records, Cases, tasks and insights while
preserving explicitly shared/cross-subject links. Business and private content
must not be silently mixed in lists, exports, notifications or search previews.

Creating an OrganizationProfile requires only the minimum fields needed for the
active workflow. Country-specific identifiers, addresses and tax data are
sensitive and added progressively.

## Product Boundary

Business contexts support:

- correct collection and classification of business documents;
- contracts, subscriptions, deadlines and Custom Cases;
- period/jurisdiction assignment;
- completeness review;
- controlled export or handoff to professional advisers.

Mappm does not become bookkeeping, payroll, banking, invoice issuance or tax
calculation software merely because an OrganizationProfile exists.

## Security and Compliance

- Person and organization access is explicit and audited where applicable.
- Identity or management changes never copy or silently transfer documents.
- Private/business export and deletion scope must be previewable.
- Business retention, legal hold, audit and professional handoff requirements
  are reviewed per supported country and product claim.
- Child and health data retain stricter privacy defaults than ordinary business
  metadata; a common profile mechanism does not imply equal sensitivity.

## Stop Rules

Stop if:

- organization context is represented only as a free-text tag;
- creating a company requires a separate login;
- private and business documents are mixed by default;
- an external provider is confused with a user-managed organization;
- sender/contact data is duplicated as uncontrolled free text when a confirmed
  ExternalParty relationship exists;
- enabling business collection silently claims accounting or tax compliance;
- profile type determines access without an explicit management/permission rule.
