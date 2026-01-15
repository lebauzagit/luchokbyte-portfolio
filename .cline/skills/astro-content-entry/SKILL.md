---
name: astro-content-entry
description: Add or update portfolio work entries in src/content/work (and src/content/work/es). Use when creating new projects, editing case studies, or updating portfolio content.
---

# Astro Content Entry

Use this skill when the user asks to add or edit portfolio/work content.

## Scope
- Collection: src/content/work
- Locales: default and Spanish in src/content/work/es
- File types: .md or .mdx

## Workflow
1. Identify the target slug (file name) and locale(s).
2. Read the existing entry if it exists.
3. Update frontmatter and body content while preserving style and tone.
4. If new entry, mirror structure between locales.
5. Keep links and image paths consistent with public/assets.

## Requirements
- Keep frontmatter keys consistent with existing entries.
- Ensure bilingual parity (same fields, localized copy).
- Do not break markdown/MDX syntax.

## Output
- Confirm which files were created/updated.
- Summarize the changes briefly.
