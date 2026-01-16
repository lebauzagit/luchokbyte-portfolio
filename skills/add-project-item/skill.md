---
Name: add-project-item
Description: Creates a new portfolio entry in the work content collection with
  required frontmatter and image references.
Trigger: "add project" | "new project" | "create project" | "add portfolio item"
Scope: Data
Tools: bash, read, write, git
---

# add-project-item

Use this skill when the user requests adding a new portfolio project. The skill
is idempotent and generates a new MDX entry with required frontmatter.

Constraints:
- Use Tailwind only for any UI changes.
- Do not edit or add custom CSS.

Checklist:
- Create MDX file in src/content/work/.
- Ensure required frontmatter fields exist.
- Reference images from public/assets/.
- Mirror content in es/ when requested.
