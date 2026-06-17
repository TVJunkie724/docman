# Ordna Design System Mock

## Purpose

This static HTML mock is the first visual review surface for the Ordna design
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
| `pages/component-navigation.html` | Tabs, segments, sidebar and command navigation. |
| `pages/component-status.html` | Status chips, sync, backup, privacy and review signals. |
| `pages/component-tags.html` | Tag chips, tag rules, filtering and edit behavior. |
| `pages/component-feedback.html` | Banners, empty states, failures, progress and retry. |
| `pages/data-display.html` | Lists, document rows, facts and timelines. |
| `pages/patterns.html` | Capture, Draft Inbox, document detail and export patterns. |
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
