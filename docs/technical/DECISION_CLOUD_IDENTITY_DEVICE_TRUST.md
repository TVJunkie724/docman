---
title: "Decision - Mappm Identity and Device Trust Baseline"
description: "Baseline fuer Mappm-Accounts in Local/Cloud-Betrieb, Geräte-Sessions, Offline-Kontinuität, Recovery und spätere Identity Provider"
tags: [decision, identity, account, device-trust, local, cloud, auth, recovery]
lastUpdated: "2026-07-12"
status: "accepted-baseline"
owner: "security/product"
---

# Decision - Mappm Identity and Device Trust Baseline

## Status

Accepted baseline. Concrete identity provider, MFA/passkey policy, recovery and
EUDI/ID Austria relying-party use case require a later approved security/identity
phase. This baseline is rebaselined by
`DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md` for account-required normal
Local and Cloud operation.

## Decision

- Normal Local and Cloud product operation requires a Mappm Account and an
  authorized or securely cached device/session state.
- Local Vault data remains local-authoritative and can be accessed offline;
  account presence never implies Cloud document storage.
- Detached Recovery preserves existing Local data without an active account but
  is not a normal onboarding or acquisition mode.
- Customer Home-Hub QR/manual pairing is superseded.
- Device trust is account-scoped and revocable. Revocation affects normal
  service access but never silently deletes a valid Local Vault.
- Authentication, authorization, entitlement and Vault membership are separate
  decisions at runtime.
- EUDI/ID Austria remains an optional identity provider/trust boundary, not a
  mandatory login assumption.

## Required States

- signed out/reauth-required with Local Vault locked or offline-continuity
  behavior according to accepted policy.
- detached recovery with no Cloud services.
- signed in with free Local/Core Assist entitlement.
- signed in, no Cloud entitlement.
- signed in with Cloud entitlement.
- device pending verification.
- session expired/re-authentication required.
- device revoked/access denied.
- account recovery pending/completed/failed.
- cancellation/grace without loss of export/Local migration access.

## Security Rules

- tokens and recovery secrets use Secure Storage.
- authorization is enforced server-side for every Cloud operation.
- device/session identifiers carry no document/profile content.
- logs and notifications contain no tokens, email addresses, document names or
  private Vault metadata unless explicitly redacted and justified.
- account recovery cannot bypass the accepted Cloud key/trust model.

## Open Decision VC-08

- identity provider and account verification.
- MFA/passkey baseline.
- recovery support boundary and proof requirements.
- device limits per plan.
- EUDI/ID Austria use case.
- relationship between Mappm Account and household/profile membership.
- offline account/device cache duration and reauthentication behavior.
- detached-recovery reattachment and proof requirements.

These questions are one approval unit tracked as VC-08 in
`docs/discovery/OPEN_QUESTIONS_REGISTER.md`; implementation may not close them
piecemeal in code or provider defaults.

## Stop Rules

Stop identity implementation if account recovery, key recovery, device
revocation, entitlement denial, offline continuity or detached Local exit cannot
be represented without data loss or frontend-owned server policy assumptions.
