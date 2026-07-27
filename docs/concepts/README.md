---
title: "Mappm F-Konzept-Index"
description: "Lokaler Einstieg in alle querschnittlichen F-Konzepte ohne parallele Status- oder Freigabequelle"
tags: [concepts, index, frontend, foundation, design-system, product-ux]
lastUpdated: "2026-07-25"
status: "active"
owner: "ui-concept"
---

# Mappm F-Konzept-Index

## Zweck

Dieser Index macht die F-Konzepte direkt im Konzeptordner auffindbar. Er
definiert keine zweite Status-, Coverage- oder Freigabequelle.

Massgeblich bleiben:

- `docs/execution/CONCEPT_COVERAGE_MATRIX.md` fuer Familienabdeckung;
- `docs/execution/CONCEPT_FILE_QUALITY_MATRIX.md` fuer Status, Quality Contract
  und naechsten Gate je Datei;
- `docs/execution/DECISION_TRACEABILITY_MATRIX.md` fuer Produktentscheidungen,
  Abhaengigkeiten und Zielphasen;
- `docs/roadmap/PHASE_INDEX.md` fuer umsetzbare Roadmap-Slices;
- `docs/PROJECT_OVERVIEW_GUIDE.md` als produktweiter Einstieg.

## Foundation und Betrieb

| Konzept | Thema |
|---|---|
| [F1](CONCEPT_F1_PROJECT_STRUCTURE.md) | Projektstruktur |
| [F2](CONCEPT_F2_STATE_MANAGEMENT.md) | State Management |
| [F3](CONCEPT_F3_CODING_CONVENTIONS.md) | Coding Conventions |
| [F4](CONCEPT_F4_TESTING_STRATEGY.md) | Testing Strategy |
| [F5](CONCEPT_F5_ERROR_HANDLING.md) | Error Handling |
| [F6](CONCEPT_F6_ENVIRONMENT_CONFIGURATION.md) | Environment- und Instanzkonfiguration |
| [F7](CONCEPT_F7_LOGGING.md) | Logging |
| [F8](CONCEPT_F8_APP_STORE_COMPLIANCE.md) | Distribution und Store Readiness |
| [F8b](CONCEPT_F8B_REVIEW_ACCESS_STRATEGY.md) | Review Access |
| [F9](CONCEPT_F9_LEGAL_COMPLIANCE.md) | Legal, Privacy und Regulatory Compliance |
| [F10](CONCEPT_F10_LOCAL_STORAGE.md) | Client Storage, Vault Authority und Cache |
| [F11](CONCEPT_F11_API_INTEGRATION.md) | API Integration |
| [F12](CONCEPT_F12_SECURE_STORAGE.md) | Secure Storage |
| [F13](CONCEPT_F13_CONFIGURATION_PAGES.md) | Configuration Pages |
| [F14](CONCEPT_F14_FORM_FIELD_CATALOG.md) | Form Field Catalog |
| [F15](CONCEPT_F15_MOCK_REPOSITORY.md) | Mock Repository |
| [F16](CONCEPT_F16_CI_CD_PIPELINE.md) | CI/CD und Quality Gates |
| [F17](CONCEPT_F17_MOBILE_CAPTURE_PLAN.md) | Mobile Capture |
| [F18](CONCEPT_F18_NOTIFICATIONS_FAILURES_OBSERVABILITY.md) | Notifications, Failures und Observability |

## Design System und Interaktionsfamilien

| Konzept | Thema |
|---|---|
| [F19](CONCEPT_F19_DESIGN_SYSTEM_GOVERNANCE.md) | Design-System-Governance |
| [F20](CONCEPT_F20_CORPORATE_DESIGN.md) | Corporate Design |
| [F21](CONCEPT_F21_FOUNDATIONS_AND_TOKENS.md) | Foundations und Tokens |
| [F22](CONCEPT_F22_SHELL_AND_NAVIGATION.md) | Product Shell und Navigation |
| [F23](CONCEPT_F23_COMPONENT_SYSTEM.md) | Component System |
| [F24](CONCEPT_F24_FORM_FAMILY.md) | Form Family |
| [F25](CONCEPT_F25_ACCESSIBILITY_PATTERNS_AND_VISUAL_QA.md) | Accessibility, Product Patterns und Visual QA |
| [F26](CONCEPT_F26_BUTTON_FAMILY.md) | Button Family |
| [F27](CONCEPT_F27_FORM_FIELD_ANATOMY_VALIDATION.md) | Field Anatomy und Validation |
| [F28](CONCEPT_F28_FORM_PICKERS_AND_SELECTION_CONTROLS.md) | Pickers und Selection Controls |
| [F29](CONCEPT_F29_FORM_DATE_TIME_FILE_SCAN_CONTROLS.md) | Date-, Time-, File- und Scan-Controls |
| [F30](CONCEPT_F30_FORM_FACTS_LAYOUTS_AND_ASSISTED_REVIEW.md) | Facts, Layouts und Assisted Review |
| [F31](CONCEPT_F31_BRAND_SYSTEM_DETAIL.md) | Brand System Detail |
| [F32](CONCEPT_F32_FOUNDATIONS_TOKENS_TYPOGRAPHY_ICONS.md) | Tokens, Typography und Icons |
| [F33](CONCEPT_F33_SHELL_NAVIGATION_AND_WORKSPACE_LAYOUT.md) | Shell, Navigation und Workspace Layout |
| [F34](CONCEPT_F34_STATUS_TAGS_FEEDBACK_AND_DATA_DISPLAY.md) | Status, Tags, Feedback und Data Display |
| [F35](CONCEPT_F35_PRODUCT_PATTERNS_ACCESSIBILITY_AND_VISUAL_QA_DETAIL.md) | Product Patterns, Accessibility und Visual QA Detail |

## Produktweite UX-Vertraege

| Konzept | Thema |
|---|---|
| [F36](CONCEPT_F36_VAULT_MODES_CLOUD_LIFECYCLE.md) | Vault-Modi und Cloud-Lifecycle |
| [F37](CONCEPT_F37_CASE_RECORD_CONTEXTUAL_EXPERIENCE.md) | Case-, Record- und kontextuelle Erfahrung |
| [F38](CONCEPT_F38_ASYNC_PROCESSING_WAIT_EXPERIENCE.md) | Asynchrone Verarbeitung, Warteerfahrung, Background und Review Queue |

## Verwendung

- Vor UI-Planung zuerst `ui-onboarding`, dann das betroffene F-Konzept und die
  dort genannten Decisions lesen.
- Ein F-Konzept autorisiert allein keine Implementierung. Es benoetigt einen
  freigegebenen Phase-as-Implementation-Contract.
- Neue F-Konzepte werden in demselben Change hier, in Coverage-/Quality-Matrix
  und bei Bedarf in Roadmap, Design-System-Coverage und Skills registriert.
- Fachliche Case-, Dokument- und Country-Pack-Definitionen gehoeren in ihre
  jeweiligen Technical Decisions und projektlokalen Domain-Skills, nicht als
  neue F-Konzepte in diesen Ordner.

## Stop Rules

- Stop, wenn dieser Index Status oder Freigaben dupliziert.
- Stop, wenn ein neues F-Konzept nur hier, aber nicht in Coverage und Quality
  registriert wird.
- Stop, wenn ein fachlicher Case-Katalog als F-Konzept angelegt wird.
