<!-- Agent.md: Cultural base para agentes (no es para humanos) -->
<!-- Generado para integrarse con el sistema de Skills. -->

# Agent Cultural Base

<!-- METADATA -->
Project: luchokbyte-portfolio
Generated-For: internal-agent
Version: 1.0

<!-- WARNING: Este archivo está pensado como contexto cultural y operativo
     para agentes generativos. Mantener entre 250 y 500 líneas. -->

## Project Overview

El proyecto es un portfolio personal estático construido con Astro.
Contiene contenido en `src/content`, páginas en `src/pages`, componentes UI en
`src/components` y estilos globales en `src/styles/global.css`.

Objetivo del agente: actuar como un asistente técnico con conocimiento del
dominio cultural del repo para automatizar tareas (añadir items de portafolio,
refactor UI, generar PRs, etc.) usando Skills especializadas.

## Arquitectura del Proyecto

- Stack principal: Astro (framework estático), TypeScript, CSS moderno.
- Estructura relevante:
  - `src/pages/` — rutas públicas, incluyendo internacionalización (`es/`).
  - `src/content/` — contenido del portafolio (MDX) organizado por `work/`.
  - `src/components/` — componentes UI reutilizables (Hero, Nav, ProjectImage,...).
  - `public/` — assets estáticos (images, backgrounds).
  - `styles/global.css` — base de estilos.

## Flujo de trabajo esperado

- Contenido nuevo de proyectos: crear archivo MDX en `src/content/work/` y
  añadir referencia (si aplica) en `src/pages/work/[...id].astro` o en el
  sistema de contenido según convenga.
- Cambios UI: modificar componentes en `src/components/` y probar en páginas
  relevantes (`index.astro`, `work/[...id].astro`).
- Publicación: ramas dedicadas y PRs con descripciones automáticas generadas
  por la skill `generate-pr`.

## Guías de Estilo (Cultural)

1. Código:
   - TypeScript + Astro: preferir tipos explícitos en boundaries públicas.
   - Evitar side-effects en módulos; operaciones I/O en scripts o endpoints.
2. Contenido (MDX):
   - Frontmatter mínimo: `title`, `date`, `description`, `tags`.
   - Imágenes en `public/assets/` y rutas relativas en MDX.
3. UI:
   - Componentes pequeños, composición sobre herencia.
   - Preferir clases utilitarias y variables en `global.css`.
4. Internacionalización:
   - Mantener paralelo `es/` en `src/pages` y en `src/content/work` cuando
     exista traducción; evitar duplicidad innecesaria.

## Reglas de Negocio (Resumen)

- Cada entrada de `work/` representa un proyecto público. Debe tener
  metadatos (title, description, date) y al menos una imagen de preview.
- Los cambios en UI deben incluir una justificación breve en el commit/PR.
- Los assets grandes (> 2MB) deben colocarse en `public/backgrounds` y no
  incluirse directamente en commits sin optimización.

## Agente: Responsabilidades y Limitaciones

- Responsabilidades:
  - Sugerir y aplicar cambios locales en el repo según skills autorizadas.
  - Mantener consistencia con las guías de estilo y reglas de negocio.
- Limitaciones:
  - No ejecutar despliegues automáticos ni subir secretos.
  - No modificar archivos fuera del repo (sin permisos explícitos).

## Autoinvoke Skills

Los agentes deben, antes de ejecutar cualquier tarea, comprobar si existe una
skill cuyo `Trigger` coincida con la petición del usuario. Si existe, la
skill debe ser autoinvocada siguiendo estas reglas:

- Las skills con `Scope: UI` deben autoinvocarse en el subcontexto UI.
- Las skills con `Scope: Data` deben autoinvocarse en el subcontexto de
  contenido (`src/content`) y páginas.
- Las skills con `Scope: Root` pueden operar sobre configuración general
  y scripts.

Autoinvoke logic (pseudoregla):

1. Normalizar la petición del usuario a tokens clave (ej. "añadir proyecto",
   "refactorizar header", "crear PR").
2. Buscar skills cuyo `Trigger` contenga uno de los tokens o coincida por
   expresión regular.
3. Si existe exactamente una skill coincidente, autoinvocarla; si hay varias,
   pedir confirmación al humano y listar motivos y alcance.

<!-- SKILLS-START -->
<!-- Las entradas de skills serán insertadas aquí por `sync.sh` -->
<!-- SKILLS-END -->

## Formato de Referencias a Skills

Las skills se referencian por ruta relativa en el repo: `skills/<skill-name>`.
Cada skill contiene `skill.md` con metadata y una carpeta `assets/` con
ejemplos "perfectos" para one-shot learning.

## Protocolo de Ejecución

1. El agente valida triggers contra `skills/*/skill.md`.
2. Ejecuta la skill con las herramientas permitidas indicadas en `Tools`.
3. Reporta cambios proponiendo un diff/PR y espera aprobación humana para
   push/merge.

## Convenciones para Skill Metadata

- `Name`: identificador corto.
- `Description`: texto breve sobre propósito.
- `Trigger`: patrones/keywords que activan la skill.
- `Scope`: uno de `UI`, `Data`, `Root`.
- `Tools`: lista de herramientas permitidas (bash, read, write, git).

## Notas Operativas

- Mantener este archivo como la única fuente de verdad cultural; `sync.sh`
  actualiza las referencias automáticamente desde las skills.

## Ejemplos de uso (escenarios comunes)

1) Añadir un proyecto nuevo (flujo):
   - Usuario: "Añade un proyecto llamado X con descripción Y y una imagen." 
   - El agente busca skills con trigger "añadir proyecto" -> `add-project-item`.
   - Autoinvocación: `add-project-item` crea MDX en `src/content/work/`.
   - Agente sugiere PR con título y cuerpo generados.

2) Refactor UI (header simplificado):
   - Usuario: "Refactoriza el header para usar composición y variables CSS."
   - El agente encuentra `ui-refactor` por trigger "refactor" + "header".
   - Aplica cambios locales en `src/components/Nav.astro` y genera diff.

3) Generar PR automáticamente:
   - Usuario: "Prepara un PR con los cambios locales y una descripción corta."
   - El agente activa `generate-pr` para crear la rama, commit y mensaje.

## Buenas prácticas para las skills

- Cada skill debe ser idempotente: repetir la ejecución no debe provocar
  duplicados ni inconsistencias.
- Metadata clara y triggers específicos reducen falsas coincidencias.
- Los assets en `skills/*/assets` deben incluir un ejemplo de código mínimo
  y uno ideal para one-shot learning.

## Seguridad y Privacidad

- Nunca incluir credenciales, tokens o secretos en `Agent.md` ni en `skills`.
- Las operaciones de push/merge deben requerir confirmación humana.

## Formato de Inserción Automática (sync.sh)

El script `sync.sh` debe reemplazar el bloque entre `<!-- SKILLS-START -->`
`<!-- SKILLS-END -->` con una lista organizada por `Scope` donde cada entrada
contenga:

- Nombre de la skill
- Trigger
- Ruta relativa a `skill.md`
- Breve descripción

Ejemplo de línea generada:
- `UI` - `ui-refactor` — trigger: "refactor" — path: `skills/ui-refactor/skill.md`

## Mantenimiento

- Las skills deben tener tests o ejemplos en `assets/` que permitan validar
  su comportamiento en reproducción local.
- Actualizaciones culturales (p.ej. cambios en guías de estilo) deben
  versionarse en `Agent.md` con fecha y autor humano.

## Fallbacks y Conflictos

- Si múltiples skills coinciden con un trigger, el agente debe pedir
  aclaración al humano antes de ejecutar.
- Si ninguna skill coincide, el agente puede sugerir la creación de una nueva
  skill basada en la petición.

## Changelog

- 1.0: Base inicial con reglas de autoinvocación y formato de skills.

## Fin del Agent Cultural Base

