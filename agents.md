# Agentes de IA Disponibles

Este documento describe los agentes de IA (basados en MCP - Model Context Protocol) que están disponibles para usar en este proyecto de portfolio.

## Servidores MCP Conectados

### 1. GitHub MCP Server (`github.com/github/github-mcp-server`)

Este agente proporciona herramientas para interactuar con GitHub, permitiendo automatizar tareas de desarrollo y gestión de repositorios.

#### Herramientas Disponibles:

- **add_comment_to_pending_review**: Agrega comentarios a revisiones pendientes de pull requests
- **add_issue_comment**: Agrega comentarios a issues específicos
- **assign_copilot_to_issue**: Asigna Copilot a un issue para resolución automática
- **create_branch**: Crea nuevas ramas en repositorios
- **create_or_update_file**: Crea o actualiza archivos en repositorios remotos
- **create_pull_request**: Crea pull requests
- **create_repository**: Crea nuevos repositorios
- **delete_file**: Elimina archivos de repositorios
- **fork_repository**: Hace fork de repositorios
- **get_commit**: Obtiene información detallada de commits
- **get_file_contents**: Obtiene contenido de archivos o directorios
- **get_label**: Obtiene información de etiquetas
- **get_latest_release**: Obtiene la última release
- **get_me**: Obtiene información del usuario autenticado
- **get_release_by_tag**: Obtiene release por tag específico
- **get_tag**: Obtiene información de tags
- **get_team_members**: Obtiene miembros de equipos
- **get_teams**: Obtiene equipos del usuario
- **issue_read**: Lee información de issues
- **issue_write**: Crea o actualiza issues
- **list_branches**: Lista ramas de repositorios
- **list_commits**: Lista commits de ramas
- **list_issue_types**: Lista tipos de issues disponibles
- **list_issues**: Lista issues con filtros
- **list_pull_requests**: Lista pull requests
- **list_releases**: Lista releases
- **list_tags**: Lista tags
- **merge_pull_request**: Merge de pull requests
- **pull_request_read**: Lee información de pull requests
- **pull_request_review_write**: Crea y gestiona revisiones de PRs
- **push_files**: Sube múltiples archivos en un commit
- **request_copilot_review**: Solicita revisión automática con Copilot
- **search_code**: Búsqueda avanzada de código
- **search_issues**: Búsqueda de issues
- **search_pull_requests**: Búsqueda de pull requests
- **search_repositories**: Búsqueda de repositorios
- **search_users**: Búsqueda de usuarios
- **sub_issue_write**: Gestiona sub-issues
- **update_pull_request**: Actualiza pull requests existentes
- **update_pull_request_branch**: Actualiza rama de PR con cambios base

### 2. Astro Site Manager (`astro-site-manager`)

Agente especializado para gestión de sitios Astro, proporcionando herramientas para desarrollo, construcción y mantenimiento.

#### Herramientas Disponibles:

- **build_site**: Construye el sitio para producción
- **start_dev_server**: Inicia el servidor de desarrollo
- **check_site_status**: Verifica el estado actual del sitio
- **run_site_checks**: Ejecuta verificaciones de calidad (linting, type checking)

### 3. Chrome DevTools (`chrome-devtools`)

Agente para automatización de navegador y debugging web, basado en Chrome DevTools Protocol.

#### Herramientas Disponibles:

- **click**: Hace clic en elementos de la página
- **close_page**: Cierra páginas del navegador
- **drag**: Arrastra elementos sobre otros
- **emulate**: Emula condiciones de red y CPU
- **evaluate_script**: Ejecuta JavaScript en la página
- **fill**: Rellena campos de formulario
- **fill_form**: Rellena múltiples campos de formulario
- **get_console_message**: Obtiene mensajes de consola
- **get_network_request**: Obtiene información de requests de red
- **handle_dialog**: Maneja diálogos del navegador
- **hover**: Hace hover sobre elementos
- **list_console_messages**: Lista mensajes de consola
- **list_network_requests**: Lista requests de red
- **list_pages**: Lista páginas abiertas
- **navigate_page**: Navega a URLs
- **new_page**: Abre nuevas páginas
- **performance_analyze_insight**: Analiza insights de performance
- **performance_start_trace**: Inicia trazado de performance
- **performance_stop_trace**: Detiene trazado de performance
- **press_key**: Presiona teclas o combinaciones
- **resize_page**: Redimensiona ventana del navegador
- **select_page**: Selecciona página activa
- **take_screenshot**: Toma capturas de pantalla
- **take_snapshot**: Toma snapshot del DOM
- **upload_file**: Sube archivos
- **wait_for**: Espera por texto específico

## Uso de los Agentes

Los agentes pueden ser utilizados a través del protocolo MCP para automatizar tareas comunes de desarrollo, gestión de proyectos y mantenimiento de sitios web. Cada agente tiene herramientas específicas que pueden ser llamadas según las necesidades del proyecto.

## Integración con el Portfolio

Este portfolio puede beneficiarse de estos agentes para:
- Automatizar la gestión de issues y pull requests
- Construir y desplegar el sitio automáticamente
- Realizar testing automatizado del navegador
- Gestionar el contenido y actualizaciones del portfolio

## Configuración

Los agentes están configurados a través de archivos de configuración MCP específicos para cada servidor. La autenticación y permisos se manejan según las credenciales configuradas para cada servicio.
