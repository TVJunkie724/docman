---
name: docman-ui-concept-review
description: Use when reviewing a DocMan concept or phase document for executability, completeness, over-engineering, contradictions, and UI-specific Clean Architecture future-proofing.
---

# DocMan UI Concept Review

Use this skill to review concept and phase documents before they move into implementation planning.

Read `.codex/skills/docman-ui-onboarding/SKILL.md` first when the review touches UI architecture.

## Criteria

Check every applicable criterion:

1. Executability: can the next agent act without follow-up questions?
2. Completeness: are steps, failure handling, affected areas, and merge expectations clear?
3. Over-engineering: does the phase include only what belongs here?
4. Contradictions: do references, numbers, branches, files, and phases match reality?
5. UI future-proofing, for UI concepts:
   - Clean Architecture boundaries are respected.
   - Future Riverpod/provider separation of concerns is clear without implementation-level wiring.
   - ASCII layout or widget diagrams exist where helpful.
   - The concept avoids prescribing exact widget choices, package versions, or provider internals.

## Process

1. Read the document completely.
2. Read referenced roadmaps, concepts, and phases as needed.
3. Check all criteria.
4. Present findings with exact lines and actionable fixes.
5. Apply only user-approved fixes unless the user asked you to fix directly.
6. Repeat until there are no findings.

## Finding Format

```markdown
| Line(s) | Problem | Priority | Fix Suggestion |
|---|---|---|---|
| 12-14 | ... | High/Medium/Low | ... |
```
