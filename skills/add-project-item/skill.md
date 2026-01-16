---
Name: add-project-item
Description: Crea una nueva entrada de proyecto en `src/content/work/` y añade
  los metadatos mínimos. Automatiza la creación del archivo MDX y la imagen
  asociada.
Trigger: "añadir proyecto" | "add project" | "new project" | "create project"
Scope: Data
Tools: bash, read, write, git
---

# add-project-item

Use esta skill cuando el usuario solicite crear o añadir un nuevo proyecto
al portafolio. La skill es idempotente y genera un archivo MDX con frontmatter
mínimo.
