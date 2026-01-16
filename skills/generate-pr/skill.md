---
Name: generate-pr
Description: Genera una rama, commit y un PR draft con un mensaje estandarizado
  a partir de cambios locales. Incluye plantilla de cuerpo y checklist.
Trigger: "create pr" | "generate pr" | "open pull request" | "create pull request"
Scope: Root
Tools: bash, read, write, git
---

# generate-pr

Automatiza la generación de la rama, commit y PR draft. No hace merge sin
confirmación humana.
