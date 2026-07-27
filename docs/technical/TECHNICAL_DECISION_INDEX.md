---
title: "Mappm Technical Decision Index"
description: "Vollstaendiges Inventar technischer Decisions und historischer Implementation-Plan-Tombstones"
tags: [technical, decisions, index, governance, traceability]
lastUpdated: "2026-07-25"
status: "active"
owner: "product-concept/data-architect/contract-api"
---

# Mappm Technical Decision Index

## Zweck

Dieser Index macht alle Artefakte unter `docs/technical/` auffindbar. Die
jeweilige Datei bleibt fuer Inhalt, Status und Stop Rules massgeblich. Die
produktweite Prioritaet und Abhaengigkeit wird weiterhin in
`docs/execution/DECISION_TRACEABILITY_MATRIX.md` gepflegt; offene Fragen stehen
ausschliesslich in `docs/discovery/OPEN_QUESTIONS_REGISTER.md`.

`accepted`, `accepted-direction`, `accepted-baseline`, `accepted-rebaseline`
und vergleichbare Statuswerte autorisieren noch keine Implementierung. Dafuer
ist immer ein gepruefter Phase-as-Implementation-Contract erforderlich.
`superseded*`-Artefakte bleiben nur fuer historische Traceability erhalten.

## Inventar

| Artefakt | Status | Owner |
|---|---|---|
| `DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md` | `accepted-direction` | product-concept |
| `DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md` | `accepted-baseline-re-review-required` | product-concept |
| `DECISION_API_CONTRACT_MOCKS.md` | `accepted` | contract-api |
| `DECISION_ASSISTED_REVIEW_SUGGESTIONS.md` | `accepted-rebaseline` | product-concept |
| `DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md` | `accepted-researched-baseline-professional-review-required` | product-concept/domain/compliance |
| `DECISION_AUTH_PAIRING.md` | `superseded` | product-concept/security |
| `DECISION_BACKEND_CONTRACT_FIRST_ARCHITECTURE.md` | `accepted-provisional` | contract-api/backend |
| `DECISION_BACKEND_ROLE.md` | `superseded` | backend/product |
| `DECISION_BACKUP_RESTORE_STRATEGY.md` | `accepted` | data-architect/operations/product |
| `DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md` | `accepted-direction` | product-concept |
| `DECISION_CASE_DOCUMENT_RECORD_MODEL.md` | `accepted` | product-concept/data-architect |
| `DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md` | `accepted` | product-concept/domain |
| `DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md` | `accepted` | product-concept |
| `DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md` | `accepted-baseline` | security/product |
| `DECISION_CODEGEN_ARTIFACT_POLICY.md` | `accepted` | foundation-builder |
| `DECISION_COMMERCIAL_CORE_SCOPE.md` | `accepted` | product-concept |
| `DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md` | `accepted` | product-concept |
| `DECISION_CROSS_DEVICE_CAPTURE_HANDOFF.md` | `draft` | product-concept/security/data-architect/contract-api/platform |
| `DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md` | `accepted` | product-concept |
| `DECISION_DATA_FLOW.md` | `superseded` | data-architect/product |
| `DECISION_DESKTOP_IMPORT_SCOPE.md` | `accepted` | product-concept/ui-concept |
| `DECISION_DISTRIBUTION_STRATEGY.md` | `superseded` | release/product |
| `DECISION_DMS_TARGET_ARCHITECTURE.md` | `accepted` | product-concept/data-architect |
| `DECISION_DOCUMENT_CAPTURE.md` | `accepted` | product-concept |
| `DECISION_DOCUMENT_METADATA_PREVIEW.md` | `accepted-rebaseline` | product-concept |
| `DECISION_DOCUMENT_TYPE_CATALOG.md` | `accepted-direction` | product-concept |
| `DECISION_DRAFT_INBOX_REVIEW_WORKFLOW.md` | `accepted` | product-concept |
| `DECISION_EXTERNAL_INTEGRATIONS_FIRST.md` | `accepted` | product-concept/security |
| `DECISION_FILE_STORAGE_AND_DOCKER_STACK.md` | `accepted` | data-architect/backend |
| `DECISION_FIRST_INSIGHTS_VERTICALS.md` | `accepted` | product-concept/domain |
| `DECISION_FIRST_UTILITY_SCOPE.md` | `superseded` | product-concept |
| `DECISION_FOUNDATION_CONCEPT_REWRITE.md` | `superseded-completed` | product-concept/ui-concept |
| `DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md` | `accepted` | backend/contract-api |
| `DECISION_HOME_HUB_CAPTURE_CONTRACT.md` | `accepted-shape-recontract-required` | contract-api |
| `DECISION_HOUSEHOLD_MANAGER_ACCESS.md` | `accepted` | product-concept/security |
| `DECISION_HOUSEHOLD_PROFILES_AND_ACCESS.md` | `accepted` | product-concept |
| `DECISION_IMPORT_DUPLICATE_DETECTION.md` | `accepted` | data-architect/product-concept |
| `DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` | `accepted-direction` | product-concept |
| `DECISION_INSURANCE_SETTLEMENT_MODEL.md` | `accepted-core` | product-concept |
| `DECISION_INTELLIGENCE_SCOPE.md` | `accepted-rebaseline` | product-concept/ai |
| `DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md` | `accepted-direction` | product-concept |
| `DECISION_LEGACY_READINESS_SCOPE.md` | `accepted` | foundation-builder/quality-readiness |
| `DECISION_LEGAL_PRIVACY_READINESS.md` | `superseded` | legal/compliance/product |
| `DECISION_LOCAL_DATABASE.md` | `accepted` | data-architect |
| `DECISION_LOCAL_EXPORT_NO_EXTERNAL_SHARING.md` | `accepted` | product-concept/security |
| `DECISION_LOCAL_LOGIN.md` | `superseded` | product-concept/security |
| `DECISION_MANAGED_SUBJECTS_BUSINESS_CONTEXTS.md` | `accepted-direction` | product-concept |
| `DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md` | `accepted` | product-concept |
| `DECISION_MILESTONE_QUALITY_GATES.md` | `accepted` | quality-readiness |
| `DECISION_MOBILE_CAPTURE_CONTEXT_SELECTION.md` | `accepted-rebaseline` | product-concept |
| `DECISION_MOBILE_CAPTURE_UPLOAD_STRATEGY.md` | `accepted` | data-architect/contract-api |
| `DECISION_MOBILE_OFFLINE_CAPTURE.md` | `accepted` | product-concept |
| `DECISION_MOBILE_SCANNER_TECHNOLOGY.md` | `provisional-accepted` | product-concept/ui-architect |
| `DECISION_MOCK_UI_STRATEGY.md` | `accepted` | ui-concept/quality-readiness |
| `DECISION_PREVIEW_GENERATION_STRATEGY.md` | `accepted` | product-concept/data-architect |
| `DECISION_PRIVACY_SYNC_SCOPE.md` | `accepted-direction-trust-details-open` | security/privacy/product |
| `DECISION_PRODUCT_LANGUAGE.md` | `accepted` | product-concept |
| `DECISION_PRODUCT_NAME.md` | `accepted` | product-concept |
| `DECISION_PROFILE_IDENTITY_AND_MANAGEMENT.md` | `accepted` | product-concept/security |
| `DECISION_PROFILE_SENSITIVE_DATA.md` | `accepted` | security/product-concept |
| `DECISION_PROFILE_SHARED_MANAGEMENT.md` | `accepted` | product-concept/security |
| `DECISION_RECORD_UI_LANGUAGE.md` | `accepted` | product-concept/ui-concept |
| `DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md` | `accepted` | product-concept |
| `DECISION_REPOSITORY_LAYOUT.md` | `accepted` | foundation/product |
| `DECISION_REVIEW_COMPLETION_VALIDATION.md` | `accepted-rebaseline` | product-concept |
| `DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md` | `accepted-direction` | product-concept/domain/compliance |
| `DECISION_SEARCH_TECHNOLOGY.md` | `accepted` | data-architect/product |
| `DECISION_SECURITY_PRIVACY_MODEL.md` | `accepted` | security/product-concept |
| `DECISION_STATE_MANAGEMENT.md` | `accepted` | foundation-builder/ui-architect |
| `DECISION_STRUCTURED_FACTS_MANUAL_ENTRY.md` | `accepted-rebaseline` | product-concept/domain |
| `DECISION_SYNC_CONFLICT_RESOLUTION.md` | `superseded` | data-architect/product-concept |
| `DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md` | `accepted-direction` | product-concept/data-architect |
| `DECISION_TEST_FIXTURES.md` | `accepted` | quality-readiness |
| `DECISION_TRUST_ENCRYPTION_DEPLOYMENT_MODEL.md` | `superseded` | security/product |
| `DECISION_UPLOAD_LIMITS_RETRY_RESUME_CLEANUP.md` | `accepted-principles-policy-required` | contract-api/operations |
| `DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` | `accepted` | product-concept |
| `DECISION_WORKFLOW_RULES.md` | `accepted` | product-concept/domain |
| `R2_TECHNICAL_FOUNDATION_IMPLEMENTATION_PLAN.md` | `superseded` | foundation-builder |
| `TECHNICAL_FOUNDATION_PLAN.md` | `superseded` | foundation-builder |

## Pflegevertrag

- Jede neue Datei unter `docs/technical/` wird in demselben Change in diesen
  Index aufgenommen.
- Jede Status- oder Owner-Aenderung wird hier und im betroffenen Frontmatter
  gemeinsam aktualisiert.
- Produktweite Decisions werden zusaetzlich in der Decision Traceability Matrix
  verankert; ein reines Inventar-Listing genuegt dafuer nicht.
- Ersetzte Dateien werden nicht still geloescht oder als aktiv gelesen. Sie
  nennen Nachfolger, Status und Implementierungsverbot.

## Stop Rules

- Stop, wenn eine technische Decision keinen Owner oder Status besitzt.
- Stop, wenn Status/Owner zwischen Frontmatter und Index abweichen.
- Stop, wenn ein neues technisches Artefakt weder indexiert noch als
  Implementation-Plan-Evidenz einem Owner zugeordnet ist.
- Stop, wenn ein `superseded*`-Artefakt Implementierung autorisieren soll.
