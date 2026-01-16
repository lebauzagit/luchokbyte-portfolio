---
Name: ui-refactor
Description: Refactors UI components using Tailwind utility classes only.
Trigger: "refactor" | "ui refactor" | "update header" | "redesign"
Scope: UI
Tools: bash, read, write, git
---

# ui-refactor

Use this skill when the user requests UI or component refactors.

Constraints:
- Tailwind-only styling. No custom CSS.
- Do not add or modify CSS files.
- Do not add scoped style blocks.

Checklist:
- Update Astro components in src/components/.
- Keep markup semantic and accessible.
- Use Tailwind utilities for layout and typography.
