# Mappm Design System Mock

## Purpose

This static HTML mock is the first visual review surface for the Mappm design
system. It is not production UI and must not contain real private data.

Open:

```text
docs/design-system/Mock/index.html
```

## Pages

| Page | Role |
|---|---|
| `index.html` | Portal, brand summary, palette and source links. |
| `pages/corporate-design.html` | Corporate design overview, brand idea and handoff map. |
| `pages/corporate-logo.html` | Logo status, app icon usage, missing logo-system work. |
| `pages/corporate-colors.html` | Brand colors and product color translation. |
| `pages/corporate-voice.html` | Tone, wording and privacy-safe copy. |
| `pages/corporate-standards.html` | Usage gates and rollout checklist. |
| `pages/foundations.html` | Foundations overview and token promotion rules. |
| `pages/color-palette.html` | Color palette, semantic roles and contrast notes. |
| `pages/icon-set.html` | Product icon family, usage rules and core icon map. |
| `pages/fonts.html` | Typography scale, weights and copy density. |
| `pages/spacing.html` | Spacing, radius, density and elevation. |
| `pages/product-shell.html` | Desktop/mobile shell and workbench direction. |
| `pages/components.html` | Component catalogue and shared state taxonomy. |
| `pages/component-buttons.html` | Buttons, command hierarchy and action rules. |
| `pages/component-forms.html` | Forms, field anatomy and validation states. |
| `pages/component-form-interactions.html` | Interactive picker, sensitive and mobile form behavior. |
| `pages/component-form-governance.html` | Lifecycle, locale, permission, async validation, review and bulk-import governance. |
| `pages/component-navigation.html` | Tabs, segments, sidebar and command navigation. |
| `pages/component-status.html` | Status chips, sync, backup, privacy and review signals. |
| `pages/component-tags.html` | Tag chips, tag rules, filtering and edit behavior. |
| `pages/component-feedback.html` | Banners, empty states, failures, progress and retry. |
| `pages/data-display.html` | Lists, document rows, facts and timelines. |
| `pages/patterns.html` | Capture, Draft Inbox, document detail and export patterns. |
| `pages/vault-cloud-lifecycle.html` | Mappm Account, Local/Cloud authority, Core Assist, migration, Detached Recovery, cancellation, grace/read-only, exit and deletion separation. |
| `pages/component-accessibility.html` | Contrast, keyboard, text scale and QA gates. |

## Rules

- Use synthetic document examples only.
- Do not add real names, addresses, medical facts, insurance numbers, or
  identity documents.
- Every visible page must include at least one concrete visual example, not only
  tables or explanatory copy.
- Tag/filter chip examples should preserve the useful visual language from the
  existing Flutter `FilterTab`: rounded 24px pill shape, count badge, coral
  active state, and subtle active shadow.
- Workflow label examples should preserve the useful visual language from the
  existing Flutter workflow badges: uppercase text, 20px radius, arrow
  separators, solid colored past/current states, grey outlined future states,
  and current-state shadow.
- Promote stable visual choices into `docs/design-system/concepts/` and
  `docs/design-system/Decisions/`.
- Keep the mock static: no build step, no external runtime dependencies.
- Shared navigation lives in `assets/js/navigation.js`.

## Concept Handoff

Implementation-facing frontend rules are documented in:

| Concept | Mock coverage |
|---|---|
| `docs/concepts/CONCEPT_F19_DESIGN_SYSTEM_GOVERNANCE.md` | Portal, SSOT, page ownership. |
| `docs/concepts/CONCEPT_F20_CORPORATE_DESIGN.md` | Corporate Design pages. |
| `docs/concepts/CONCEPT_F21_FOUNDATIONS_AND_TOKENS.md` | Foundations, palette, icons, fonts, spacing. |
| `docs/concepts/CONCEPT_F22_SHELL_AND_NAVIGATION.md` | Product shell and navigation controls. |
| `docs/concepts/CONCEPT_F23_COMPONENT_SYSTEM.md` | Components, buttons, status, tags, feedback, data display. |
| `docs/concepts/CONCEPT_F24_FORM_FAMILY.md` | Forms draft; requires follow-up before implementation. |
| `docs/concepts/CONCEPT_F25_ACCESSIBILITY_PATTERNS_AND_VISUAL_QA.md` | Patterns, accessibility, privacy and visual QA. |
| `docs/concepts/CONCEPT_F36_VAULT_MODES_CLOUD_LIFECYCLE.md` | Account/device, Vault choice, Assist, migration, entitlement, Detached Recovery, cancellation, exit and deletion UX. |
| `docs/design-system/concepts/MP-DS-04_COMPONENT_SYSTEM.md` | Normative DS-04-01..29 family mapping and gates. |
| `docs/design-system/concepts/MP-DS-05_PRODUCT_PATTERNS.md` | Product composition patterns. |
| `docs/design-system/concepts/MP-DS-06_ACCESSIBILITY_AND_QUALITY_GATES.md` | Accessibility and visual evidence gates. |
| `docs/design-system/concepts/MP-DS-07_PLATFORM_ADAPTATION.md` | Desktop/mobile adaptation rules. |
