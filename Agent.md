<!-- Agent.md: Cultural base for agents (not for humans). -->
<!-- Maintained in English for cross-team sharing. -->

# Agent Cultural Base

<!-- METADATA -->
Project: luchokbyte-portfolio
Generated-For: internal-agent
Version: 2.0
Last-Updated: 2026-01-16

<!-- WARNING: This file is intended as cultural and operational context
     for generative agents. Keep between 250 and 500 lines. -->

## Project Overview

This repository is a personal portfolio built with Astro.
Content lives in MDX under the content collection.
Pages are in the pages tree and components in the components folder.
The UI should be composed using Tailwind utility classes only.
Avoid custom CSS and avoid modifying global CSS unless explicitly authorized.

Primary agent goal:
Automate repetitive tasks using specialized Skills.
Operate within the cultural constraints defined here.
Keep outputs consistent with team expectations and conventions.

## Architecture Summary

Core stack:
- Astro for static rendering and routing.
- TypeScript for typed templates and helpers.
- MDX for portfolio content.
- Tailwind for UI styling and layout.

Key folders:
- src/pages/ for routes and localized pages.
- src/content/ for MDX content collections.
- src/components/ for reusable UI components.
- public/ for static assets and images.
- src/styles/ is legacy and should not be modified.

Routing map (high level):
- src/pages/index.astro is the main landing page.
- src/pages/work/[...id].astro renders work detail pages.
- src/pages/es/ mirrors the English routes.

Component map (high level):
- Hero, Nav, Footer and SectionCard define main layout.
- PortfolioPreview and ProjectImage present work items.
- Grid and GenericCard provide layout primitives.
- LanguageSwitcher and ThemeToggle are utilities.

Assets map:
- public/assets/ contains project media.
- public/assets/backgrounds contains background art.

Build and preview commands:
- pnpm dev for local development.
- pnpm build for production build.
- pnpm preview for previewing the build.

Content model:
- Each work item is a single MDX document.
- The collection is split by locale when needed.
- Each entry must include required frontmatter.

Content schema (expected fields):
- title: string
- date: string (ISO 8601)
- description: string
- tags: string[]

Optional fields:
- role: string
- stack: string[]
- repo: url
- demo: url
- image: string (public path)

Slug conventions:
- Use lowercase with hyphens.
- Keep slugs stable after publishing.
- Mirror slug names across locales.

Internationalization:
- English is the default locale.
- Spanish mirrors content when translations exist.
- Keep structural parity between locales.

Localization rules:
- Keep headings aligned across locales.
- Preserve metadata fields across translations.
- If Spanish content is missing, do not create placeholder pages.
- Avoid mixing languages within a single MDX file.

## Cultural Rules (Non-Negotiable)

1. Tailwind only.
2. Do not add or edit custom CSS.
3. Do not add new CSS files.
4. Do not modify global styles without explicit approval.
5. Prefer utility classes over component-level styling.
6. If styling is required, use Tailwind classes in templates.
7. If a class is missing, extend Tailwind config only with approval.
8. Avoid inline styles entirely.
9. Avoid CSS variables and custom properties.
10. Avoid scoped style blocks in Astro components.

Tailwind usage rules:
- Prefer semantic grouping of classes.
- Use responsive variants for layout changes.
- Use spacing scale consistently.
- Prefer flex and grid utilities for layout.
- Use text and color utilities only from Tailwind.

## Business Rules

- Every portfolio entry represents a public project.
- Each entry must include title, date, description, tags.
- Each entry must have at least one preview image.
- Images must be optimized and stored in public assets.
- Content changes should not break routing.
- New content must follow collection schema rules.

## Content Conventions

Frontmatter required fields:
- title
- date (ISO format)
- description
- tags (array)

Recommended fields:
- role
- stack
- repo
- demo

Content rules:
- Keep paragraphs short and readable.
- Prefer concise, professional language.
- Avoid marketing fluff.
- Keep headings consistent across locales.

MDX formatting:
- Use Markdown headings in descending order.
- Avoid inline HTML unless required.
- Prefer list items for highlights and outcomes.

Image rules:
- Use public assets with stable paths.
- Prefer web-optimized formats.
- Keep filenames lowercase with hyphens.

Image optimization:
- Prefer webp or avif when available.
- Keep image width under 2400px.
- Avoid embedding base64 data.

## UI Conventions

- Compose with small, focused components.
- Favor composition over inheritance.
- Keep props minimal and well-typed.
- Avoid prop drilling if layout can be composed.
- Use Tailwind utility classes only.
- Keep layout semantics accessible.

Accessibility rules:
- Images must include meaningful alt text.
- Interactive elements must be keyboard accessible.
- Use semantic HTML tags when possible.

## TypeScript Conventions

- Prefer explicit types at public boundaries.
- Avoid any unless unavoidable.
- Prefer type aliases for data shapes.
- Keep helpers pure and side-effect free.

## Data and Content Workflow

Add or update work items:
1. Create or edit an MDX file in content collection.
2. Ensure required frontmatter is present.
3. Ensure any referenced images exist in public assets.
4. Validate that routes and listings render correctly.

Localization workflow:
1. Add English content first.
2. Mirror in Spanish when translation is ready.
3. Keep file slugs aligned across locales.

Validation checklist:
- Content builds without errors.
- Pages render in both locales.
- No missing image references.
- No custom CSS introduced.

## Automation Philosophy

- Prefer Skills over manual procedures.
- Skills must be idempotent.
- Skills must define clear triggers and scopes.
- Skills should minimize file churn.
- Skills should keep changes localized.

Automation boundaries:
- Skills must not modify node_modules or dist.
- Skills must not change lockfiles unless required.
- Skills must not add new styling frameworks.

## Autoinvoke Skills

Before performing any task:
1. Read all skill metadata from skills directories.
2. Compare the user request against each Trigger.
3. If exactly one Skill matches, auto-invoke it.
4. If multiple match, ask for clarification.
5. If none match, propose a new Skill.

Scope routing:
- Scope UI applies to src/components and page templates.
- Scope Data applies to src/content and data collections.
- Scope Root applies to scripts and configuration.

Trigger matching guidance:
- Normalize user request to lowercase tokens.
- Match keywords and regex patterns in Trigger.
- Prefer exact phrase matches when available.

## Skill Reference Block

<!-- SKILLS-START -->
<!-- SKILLS ARE INSERTED HERE BY sync.ps1 -->
<!-- SKILLS-END -->

## Skill Metadata Schema

Each skill must provide these fields:
- Name
- Description
- Trigger
- Scope
- Tools

Tools values are expected to be:
- bash
- read
- write
- git

Tools restrictions:
- Use read before write when unsure.
- Use git only when explicitly requested.
- Avoid destructive actions without approval.

## Execution Protocol

1. Validate triggers.
2. Load the skill context and assets.
3. Perform changes following cultural rules.
4. Verify results for consistency.
5. Summarize changes and propose next steps.

## Security and Privacy

- Never add credentials to any file.
- Do not create or store tokens.
- Do not run deployment commands.
- Do not change repository permissions.

## Quality Standards

- Keep diffs minimal and focused.
- Avoid unrelated formatting changes.
- Respect existing patterns in files.
- Do not introduce new dependencies unless required.

Linting expectations:
- Keep Astro files formatted.
- Keep MDX frontmatter aligned.
- Keep TypeScript types stable.

## Error Handling

- If a task conflicts with cultural rules, ask for approval.
- If a requested change requires CSS, reject and propose Tailwind-only alternative.
- If a skill is missing, propose a new skill.

## Examples (Canonical)

Example A: Add project entry
User request: Add a new project with title and description.
Expected action: Auto-invoke add-project-item.
Notes: Create MDX entry and reference assets.

Example B: UI refactor
User request: Refactor the header component.
Expected action: Auto-invoke ui-refactor.
Notes: Use Tailwind classes only.

Example C: Generate PR
User request: Create a PR for local changes.
Expected action: Auto-invoke generate-pr.
Notes: Include standard checklist.

Example D: Update content description
User request: Update a project description.
Expected action: Use Data scope and update MDX.
Notes: Keep frontmatter intact.

## Tailwind-Only Enforcement

This repository enforces Tailwind for all UI work.
Do not add custom CSS.
Do not modify existing CSS files.
Do not add scoped style blocks in Astro components.
If a layout or style cannot be expressed in Tailwind,
stop and request explicit approval for exceptions.

Enforcement triggers:
- Any request mentioning CSS must be redirected to Tailwind.
- Any request to edit global styles must be declined.
- Any request to add a style block must be declined.

## Operational Notes

- sync.ps1 keeps the skill list updated in this file.
- setup.ps1 prepares AI-specific skill link files.
- Skills under skills/ must include assets examples.

Agent reporting format:
- Summarize what changed.
- List touched files.
- Point out any required follow-ups.

## Maintenance Guidelines

- Update this file when architectural changes occur.
- Keep this file between 250 and 500 lines.
- Maintain clear, concise statements.

## Conflict Resolution

- When multiple skills match, prefer the narrower scope.
- If scopes are equal, ask the user to choose.
- If the user refuses to choose, propose a safe default.

## Prohibited Actions

- Adding CSS or custom styles.
- Introducing new styling frameworks.
- Modifying global styles without approval.
- Editing outside the repository.

## Required Actions

- Respect Tailwind-only rule.
- Keep MDX frontmatter complete.
- Keep localization parity when requested.
- Use skills as primary automation unit.

## Collaboration Notes

- Communicate changes succinctly.
- Provide file references for edits.
- Avoid long explanations.

Review notes:
- Provide short rationale for UI changes.
- Mention if new assets were added.
- Mention if localization was affected.

## Changelog

- 2.0: Recreated cultural base in English.
- 2.0: Enforced Tailwind-only styling policy.
- 2.0: Simplified architecture summary.
- 2.0: Added schema and workflow details.

## End of Agent Cultural Base



<!-- SKILLS-START -->
<!-- START GENERATED SKILLS: DO NOT EDIT MANUALLY -->

## Skills by Scope (auto-generated)

### UI
- UI - ui-refactor — trigger: "refactor" | "ui refactor" | "update header" | "redesign" — path: D:/projects/astro/lolokbyte-portfolio/skills/ui-refactor/skill.md

### Data
- Data - add-project-item — trigger: "add project" | "new project" | "create project" | "add portfolio item" — path: D:/projects/astro/lolokbyte-portfolio/skills/add-project-item/skill.md

### Root
- Root - generate-pr — trigger: "create pr" | "generate pr" | "open pull request" | "create pull request" — path: D:/projects/astro/lolokbyte-portfolio/skills/generate-pr/skill.md

<!-- END GENERATED SKILLS -->
<!-- SKILLS-END -->

