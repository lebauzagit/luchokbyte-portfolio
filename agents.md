# Agents.md - Guía de Desarrollo para LoloKByte Portfolio

## 📋 Tabla de Contenidos
- [Visión General del Proyecto](#visión-general-del-proyecto)
- [Stack Tecnológico](#stack-tecnológico)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Reglas para Documentación Markdown](#reglas-para-documentación-markdown)
- [Reglas para Componentes Astro](#reglas-para-componentes-astro)
- [Gestión de Estilos](#gestión-de-estilos)
- [Internacionalización (i18n)](#internacionalización-i18n)
- [Gestión de Paquetes](#gestión-de-paquetes)
- [Mejores Prácticas](#mejores-prácticas)

---

## 🎯 Visión General del Proyecto

**LoloKByte** es un portfolio personal desarrollado con Astro que presenta proyectos, habilidades y experiencia profesional. El proyecto está diseñado con un enfoque en rendimiento, accesibilidad y experiencia de usuario.

### Características Principales
- ✅ Diseño responsive para todos los dispositivos
- ✅ Soporte multiidioma (Inglés y Español)
- ✅ Modo oscuro/claro con transiciones suaves
- ✅ Showcase de proyectos con descripciones detalladas
- ✅ Sección de habilidades destacadas
- ✅ Formulario de contacto funcional
- ✅ Rendimiento optimizado con Astro
- ✅ SEO-friendly con metadata completa

---

## 🛠️ Stack Tecnológico

### Core
- **Astro 5.16.9**: Framework principal para sitios estáticos modernos
- **TypeScript 5.9.3**: Desarrollo type-safe
- **Tailwind CSS 4.1.18**: Framework de utilidades CSS
- **@tailwindcss/vite 4.1.18**: Integración de Tailwind con Vite

### Integraciones y Plugins
- **@astrojs/mdx 4.3.13**: Soporte para archivos MDX
- **astro-i18n-aut 0.7.3**: Internacionalización automática
- **@astrojs/check 0.9.6**: Validación de tipos

### Herramientas de Desarrollo
- **Prettier 3.7.4**: Formateo de código
- **prettier-plugin-astro 0.14.1**: Plugin para archivos Astro
- **pnpm**: Gestor de paquetes (preferido)

### Configuración de Build
```json
{
  "pnpm": {
    "overrides": {
      "vite": "^6.4.1"
    }
  }
}
```

---

## 📁 Estructura del Proyecto

```
lolo-kbyte/
├── public/                    # Archivos estáticos
│   └── assets/
│       └── backgrounds/       # Imágenes de fondo
│
├── src/
│   ├── components/            # Componentes Astro reutilizables
│   │   ├── ContactForm.astro
│   │   ├── FlagIcon.astro
│   │   ├── Footer.astro
│   │   ├── GenericCard.astro  # Componente de tarjeta genérico
│   │   ├── Grid.astro
│   │   ├── Hero.astro
│   │   ├── Icon.astro
│   │   ├── IconPaths.ts       # Definiciones de iconos SVG
│   │   ├── LanguageSwitcher.astro
│   │   ├── MainHead.astro
│   │   ├── Nav.astro
│   │   ├── Pill.astro
│   │   ├── PortfolioPreview.astro
│   │   ├── ProjectImage.astro
│   │   ├── SectionCard.astro
│   │   ├── Skills.astro
│   │   └── ThemeToggle.astro
│   │
│   ├── content/               # Content Collections
│   │   └── work/              # Proyectos del portfolio
│   │       ├── aimove-guide.mdx
│   │       ├── aimove-saas.md
│   │       ├── brotherst.md
│   │       ├── dynelink.md
│   │       ├── exeditec.md
│   │       ├── ylg.md
│   │       └── es/            # Traducciones al español
│   │           ├── aimove-guide.mdx
│   │           ├── aimove-saas.md
│   │           └── ...
│   │
│   ├── i18n/                  # Internacionalización
│   │   ├── ui.ts              # Traducciones
│   │   └── utils.ts           # Utilidades de i18n
│   │
│   ├── layouts/               # Layouts de página
│   │   └── BaseLayout.astro
│   │
│   ├── pages/                 # Rutas de la aplicación
│   │   ├── 404.astro
│   │   ├── index.astro
│   │   ├── work/
│   │   │   └── [...id].astro  # Páginas dinámicas de proyectos
│   │   └── es/                # Rutas en español
│   │       ├── index.astro
│   │       └── work/
│   │           └── [...id].astro
│   │
│   ├── styles/                # Estilos globales
│   │   └── global.css
│   │
│   └── content.config.ts      # Configuración de Content Collections
│
├── astro.config.mjs           # Configuración de Astro
├── package.json               # Dependencias del proyecto
├── tsconfig.json              # Configuración de TypeScript
└── README.md                  # Documentación del proyecto
```

---

## 📝 Reglas para Documentación Markdown

### Patrón Base: aimove-guide.mdx

Todos los archivos de documentación en `src/content/work/` deben seguir la estructura del archivo [aimove-guide.mdx](src/content/work/aimove-guide.mdx).

### 1. Frontmatter Obligatorio

```yaml
---
title: Título del Proyecto
publishDate: YYYY-MM-DD HH:MM:SS
img: /assets/Imagen_Proyecto_Dark.webp
img_alt: Descripción alternativa de la imagen (importante para SEO y accesibilidad)
description: |
  Descripción detallada del proyecto que se mostrará en la vista previa.
  Puede ser multi-línea usando el símbolo |
tags:
  - Tag1
  - Tag2
  - Tag3
---
```

#### Campos del Frontmatter:
- **title** (string, requerido): Título completo del proyecto
- **publishDate** (date, requerido): Fecha de publicación en formato ISO
- **img** (string, requerido): Ruta a la imagen del proyecto (preferir webp)
- **img_alt** (string, opcional): Descripción alt para accesibilidad
- **description** (string, requerido): Resumen del proyecto (markdown soportado)
- **tags** (array, requerido): Array de etiquetas relevantes

### 2. Importación de Componentes

```javascript
import GenericCard from '../../components/GenericCard.astro'
```

- Los componentes se importan al inicio del archivo MDX
- Usar rutas relativas correctas según la ubicación del archivo

### 3. Estructura de Contenido con GenericCard

```javascript
export const projectCards = [
	{
		title: "The Challenge",
		icon: "rocket-launch",
		content: [
			"Primer párrafo explicando el desafío principal",
			"- Punto clave 1",
			"- Punto clave 2",
			"- Punto clave 3"
		]
	},
	{
		title: "Technical Implementation",
		icon: "stack",
		content: [
			"- **Característica 1**: Descripción detallada",
			"- **Característica 2**: Descripción detallada",
			"- **Característica 3**: Descripción detallada"
		]
	},
	{
		title: "Key Features",
		icon: "atom",
		content: [
			"Lista de características principales del proyecto",
			"- Feature 1",
			"- Feature 2"
		]
	},
	{
		title: "Technologies Mastered",
		icon: "technologies",
		content: [
			"- Tecnología 1 y su uso específico",
			"- Tecnología 2 y su uso específico",
			"- Tecnología 3 y su uso específico"
		]
	},
	{
		title: "Impact & Results",
		icon: "trending",
		content: [
			"Resultados medibles y el impacto del proyecto"
		]
	}
];
```

#### Iconos Disponibles:
Consultar [IconPaths.ts](src/components/IconPaths.ts) para la lista completa. Algunos comunes:
- `rocket-launch`: Desafíos/Inicio
- `stack`: Arquitectura/Técnico
- `atom`: Características
- `technologies`: Stack tecnológico
- `trending`: Resultados/Impacto
- `experience`: UX/Experiencia
- `file-text`: Documentación

### 4. Formato de Contenido

#### Listas con Bullets
```markdown
"Punto 1",
"Punto 2",
"Punto 3"
```

#### Énfasis y Negrita
```markdown
"- **Término Importante**: Descripción del término"
```

#### Párrafos Múltiples
```javascript
content: [
	"Primer párrafo completo",
	"Segundo párrafo con más detalles",
	"Tercer párrafo con conclusiones"
]
```

### 5. Renderizado del Componente

```jsx
<GenericCard 
	cards={projectCards}
	gridColumns={2}
	showIcons={true}
/>
```

#### Props del GenericCard:
- **cards** (array, requerido): Array de objetos con title, icon, content
- **gridColumns** (number, opcional): Número de columnas (default: 1)
- **showIcons** (boolean, opcional): Mostrar iconos (default: true)
- **title** (string, opcional): Título de la sección
- **tagline** (string, opcional): Subtítulo de la sección
- **photo** (object, opcional): Objeto con src, alt, overlayText, width

### 6. Versionado Multiidioma

Para crear versión en español:
1. Duplicar el archivo en `src/content/work/es/`
2. Traducir todo el contenido manteniendo la estructura
3. Mantener los mismos tags en inglés para consistencia

```
src/content/work/
├── proyecto.mdx           # Versión en inglés
└── es/
    └── proyecto.mdx       # Versión en español
```

### 7. Optimización de Imágenes

- **Formato preferido**: WebP para mejor compresión
- **Ubicación**: `/public/assets/`
- **Naming**: Pascal_Case descriptivo (`Aimove_Dark.webp`)
- **Tamaños recomendados**:
  - Thumbnails: 800px ancho
  - Full images: 1200px-1600px ancho
- **Siempre incluir `img_alt`** para accesibilidad

---

## 🧩 Reglas para Componentes Astro

### 1. Estructura Base de Componente

```astro
---
// Imports
import OtroComponente from './OtroComponente.astro';

// Interface para props
interface Props {
	title: string;
	optional?: string;
}

// Destructuración de props
const { title, optional = 'default' } = Astro.props;
---

<!-- Template -->
<div class="component-class tailwindcss-class">
	<h2>{title}</h2>
	{optional && <p>{optional}</p>}
	<slot />
</div>

<!-- Estilos con scope -->
<style>
	/* Solo se permiten variables CSS o estilos críticos que no pueden expresarse con Tailwind */
	.component-class {
		--local-accent: var(--accent-regular);
	}
</style>
```

> **Nota:** Evita definir reglas de estilo visuales (colores, espaciado, tipografía, etc.) en `<style>`. Usa clases de Tailwind CSS en su lugar.

### 2. Convenciones de Nomenclatura

- **Componentes**: PascalCase (`GenericCard.astro`, `ContactForm.astro`)
- **Archivos de Imagen**: Caso hibrido Pascal_Snake_Case (`Project_Image_Dark.webp`)
- **Classes CSS**: kebab-case (`card-title`, `hero-section`)
- **Variables CSS**: doble guion (`--accent-color`, `--text-lg`)

> Las clases Tailwind deben usarse directamente en los elementos. No se definen clases personalizadas en `<style>` salvo excepciones justificadas (ej. animaciones complejas, soporte de variables).

### 3. Props y TypeScript

```typescript
interface Props {
	// Prop requerida
	title: string;
	
	// Prop opcional
	tagline?: string;
	
	// Prop con valores específicos
	align?: 'start' | 'center' | 'end';
	
	// Props complejas
	items: Array<{
		name: string;
		value: number;
	}>;
	
	// Props de componentes hijos
	class?: string;
}
```


### 4. Uso de Slots

```astro
---
// Componente padre
---

<div class="wrapper">
	<header>
		<slot name="header" />
	</header>
	
	<main>
		<slot /> <!-- Slot por defecto -->
	</main>
	
	<footer>
		<slot name="footer">
			<!-- Contenido por defecto si no se provee slot -->
			<p>Footer por defecto</p>
		</slot>
	</footer>
</div>
```


### 5. Estilos con Scope

```astro
<style>
	/* Únicamente para variables o overrides muy específicos */
	.title {
		color: var(--gray-0);
	}

	/* Responsive design solo si no es posible con Tailwind */
	@media (min-width: 50em) {
		.title {
			font-size: var(--text-4xl);
		}
	}
</style>
```

> **Recomendación:** Siempre que sea posible, usa las clases responsivas de Tailwind (`md:text-4xl`, `lg:p-8`, etc.) en lugar de `@media` en `<style>`.

### 6. Directivas de Astro

```astro
<!-- class:list para clases condicionales -->
<div class:list={['flex items-center gap-4 p-8 bg-gray-900 rounded-lg', isActive && 'ring-2 ring-accent-regular']}>

<!-- set:html para HTML raw (sanitizar siempre) -->
<p set:html={paragraph}></p>

<!-- client:* para islas interactivas -->
<InteractiveComponent client:load />
<LazyComponent client:visible />
<IdleComponent client:idle />
```

### 7. Componentes Reutilizables

#### Ejemplo: Hero Component
```astro
---
interface Props {
	title: string;
	tagline?: string;
	align?: 'start' | 'center';
}

const { align = 'center', tagline, title } = Astro.props;
const textAlignClass = align === 'start' ? 'text-start' : 'text-center';
---

<div class={`flex flex-col gap-4 ${textAlignClass}`}>
	<div class="flex flex-col gap-2">
		<h3 class="text-3xl font-bold text-gray-0">{title}</h3>
		{tagline && <p class="text-lg text-gray-400">{tagline}</p>}
	</div>
	<slot />
</div>
```

> **Importante:** Todo el diseño visual debe expresarse mediante clases de Tailwind CSS. No se usan estilos CSS personalizados para layout, colores, tipografía o espaciado.

---

### 8. Integración con Content Collections

```astro
---
import { getCollection } from 'astro:content';

// Obtener todas las entradas
const allProjects = await getCollection('work');

// Filtrar entradas
const filteredProjects = await getCollection('work', ({ data }) => {
	return data.tags.includes('TypeScript');
});

// Renderizar contenido
const { Content } = await entry.render();
---

<article>
	<Content />
</article>
```

---

## 🎨 Gestión de Estilos

### 1. Sistema de Variables CSS

El proyecto usa un sistema completo de variables CSS definidas en [global.css](src/styles/global.css).  
Estas variables están integradas con Tailwind a través de `theme.extend` en la configuración implícita de Tailwind v4 + Vite.

> **No se modifican ni eliminan las variables de `global.css`.** Se usan como base para temas, transiciones y valores compartidos.

### 2. Integración con Tailwind CSS v4

El proyecto usa **Tailwind CSS v4** con el plugin de Vite.

#### Configuración (astro.config.mjs)
```javascript
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  vite: {
    plugins: [tailwindcss()],
  }
});
```

#### Import Global (global.css)
```css
@import "tailwindcss";
```

> **Este archivo debe mantenerse intacto.** No se añaden reglas de estilo personalizadas aquí, salvo variables CSS necesarias para el tema.

#### Uso en Componentes
```astro
<!-- Mezclar Tailwind con CSS personalizado solo cuando sea estrictamente necesario -->
<div class="flex items-center gap-4 p-8 bg-gray-900 rounded-lg">
	<h2 class="text-3xl font-bold">Título</h2>
</div>
```

> **Prohibido:** crear hojas de estilo `.css` adicionales con reglas visuales. Todo el diseño debe hacerse con Tailwind.

### 3. Utility Classes Personalizadas

Las clases como `.stack`, `.gap-2`, `.wrapper` **ya no se definen en CSS**. En su lugar:

- `.stack` → `class="flex flex-col"`
- `.gap-2` → `class="gap-2"` (ya existe en Tailwind)
- `.wrapper` → `class="max-w-[83rem] w-full mx-auto px-6"`

> **Eliminadas** las reglas CSS personalizadas para layouts básicos. Se usan únicamente clases de Tailwind.

### 4. Transiciones de Tema

```css
/* global.css */
:root {
	--theme-transition: 0.2s ease-in-out;
}

body {
	background-color: var(--gray-999);
	color: var(--gray-0);
	transition: background-color var(--theme-transition), 
	            color var(--theme-transition);
}
```

> **Mantenido en `global.css`** porque depende de variables CSS y no puede expresarse fácilmente con Tailwind.

### 5. Responsive Design

Se implementa exclusivamente con las clases responsivas de Tailwind:

```astro
<h1 class="text-lg md:text-xl lg:text-2xl">Título responsive</h1>
```

> **Evitar** bloques `@media` en componentes. Usar `sm:`, `md:`, `lg:`, etc.

### 6. Backgrounds y Efectos

- **Glassmorphism**:  
  ```astro
  <div class="bg-black/5 backdrop-blur-sm border border-gray-800 rounded-xl">
  ```

- **Gradientes de texto**:  
  ```astro
  <h2 class="bg-gradient-to-r from-accent-light to-accent-dark bg-clip-text text-transparent">
    Título con gradiente
  </h2>
  ```

> Los gradientes personalizados se definen en `tailwind.config.ts` si son reutilizables. De lo contrario, se usan `from-`/`to-` con colores existentes.

---

## 🌍 Internacionalización (i18n)

### 1. Configuración Base

#### astro.config.mjs
```javascript
export default defineConfig({
  i18n: {
    defaultLocale: 'en',
    locales: ['en', 'es'],
  }
});
```

### 2. Sistema de Traducciones

#### Estructura de ui.ts
```typescript
export const languages = {
	en: 'EN',
	es: 'ES',
};

export const defaultLang = 'en';

export const ui = {
	en: {
		'nav.home': 'Home',
		'nav.projects': 'Projects',
		// ...más traducciones
	},
	es: {
		'nav.home': 'Inicio',
		'nav.projects': 'Proyectos',
		// ...más traducciones
	}
} as const;
```

### 3. Utilidades de i18n

```typescript
// utils.ts
export function getLangFromUrl(url: URL) {
	const [, lang] = url.pathname.split('/');
	if (lang in ui) return lang as keyof typeof ui;
	return defaultLang;
}

export function useTranslations(lang: keyof typeof ui) {
	return function t(key: keyof typeof ui[typeof defaultLang]) {
		return ui[lang][key] || ui[defaultLang][key];
	}
}
```

### 4. Uso en Componentes

```astro
---
import { getLangFromUrl, useTranslations } from '../i18n/utils';

const lang = getLangFromUrl(Astro.url);
const t = useTranslations(lang);
---

<nav>
	<a href="/">{t('nav.home')}</a>
	<a href="/projects">{t('nav.projects')}</a>
</nav>
```

### 5. Rutas Multiidioma

```
src/pages/
├── index.astro           # /
├── work/
│   └── [...id].astro     # /work/project-name
└── es/
    ├── index.astro       # /es
    └── work/
        └── [...id].astro # /es/work/project-name
```

### 6. Content Collections Multiidioma

```
src/content/work/
├── project.mdx           # Versión inglés
└── es/
    └── project.mdx       # Versión español
```

#### Lógica de Fallback
```astro
---
export async function getStaticPaths() {
	const entries = await getCollection('work');
	const bySlug = new Map(entries.map((entry) => 
		[entry.slug ?? entry.id, entry]
	));
	
	const baseEntries = entries.filter((entry) => 
		!(entry.slug || '').startsWith('es/')
	);
	
	return baseEntries.map((entry) => {
		const slug = entry.slug ?? entry.id;
		const localized = bySlug.get(`es/${slug}`);
		
		return {
			params: { id: slug },
			props: { 
				entry: localized ?? entry, 
				isFallback: !localized 
			},
		};
	});
}
---
```

### 7. LanguageSwitcher Component

```astro
---
import { languages } from '../i18n/ui';
import { getLangFromUrl } from '../i18n/utils';

const lang = getLangFromUrl(Astro.url);
const otherLang = lang === 'en' ? 'es' : 'en';
const currentPath = Astro.url.pathname;

// Construir URL del otro idioma
const otherLangUrl = lang === 'en' 
	? `/es${currentPath}` 
	: currentPath.replace('/es', '');
---

<a href={otherLangUrl} aria-label="Switch language">
	{languages[otherLang]}
</a>
```

### 8. Convenciones de Traducción

#### Namespacing
```typescript
// Agrupar traducciones por sección
'nav.home'
'nav.projects'
'hero.title'
'hero.tagline'
'contact.name'
'contact.email'
```

#### Interpolación
```typescript
// Para textos dinámicos, construir en el componente
const greeting = `${t('hello')}, ${userName}!`;
```

#### Pluralización
```typescript
// Crear claves separadas para singular/plural
'project.singular': 'project',
'project.plural': 'projects',
```

---

## 📦 Gestión de Paquetes

### 1. Gestor de Paquetes: pnpm

El proyecto usa **pnpm** como gestor de paquetes preferido.

#### Comandos Básicos
```bash
# Instalar dependencias
pnpm install

# Agregar dependencia
pnpm add nombre-paquete

# Agregar dependencia de desarrollo
pnpm add -D nombre-paquete

# Actualizar dependencias
pnpm update

# Remover dependencia
pnpm remove nombre-paquete
```

### 2. Scripts Disponibles

```json
{
  "scripts": {
    "dev": "astro dev",          // Servidor de desarrollo
    "build": "astro build",       // Build de producción
    "preview": "astro preview",   // Preview del build
    "astro": "astro"              // CLI de Astro
  }
}
```

#### Uso
```bash
pnpm dev      # Iniciar desarrollo en http://localhost:4321
pnpm build    # Crear build optimizado en /dist
pnpm preview  # Previsualizar build localmente
```

### 3. Dependencias del Proyecto

#### Dependencias Principales
```json
{
  "@astrojs/check": "^0.9.6",      // Validación de tipos
  "@astrojs/mdx": "^4.3.13",       // Soporte MDX
  "@tailwindcss/vite": "^4.1.18",  // Tailwind con Vite
  "astro": "^5.16.9",              // Framework Astro
  "astro-i18n-aut": "^0.7.3",      // i18n automático
  "tailwindcss": "^4.1.18",        // Framework CSS
  "typescript": "^5.9.3"           // TypeScript
}
```

#### Dependencias de Desarrollo
```json
{
  "prettier": "^3.7.4",                    // Formateo de código
  "prettier-plugin-astro": "^0.14.1"      // Plugin para Astro
}
```

### 4. Overrides de pnpm

```json
{
  "pnpm": {
    "overrides": {
      "vite": "^6.4.1"  // Forzar versión específica de Vite
    }
  }
}
```

### 5. Actualización de Dependencias

```bash
# Ver dependencias desactualizadas
pnpm outdated

# Actualizar interactivamente
pnpm update --interactive

# Actualizar a latest (con precaución)
pnpm update --latest
```

### 6. Versionado Semántico

```json
{
  "^5.16.9": "Compatible con 5.x.x (minor y patch)",
  "~5.16.9": "Compatible con 5.16.x (solo patch)",
  "5.16.9": "Versión exacta"
}
```

**Regla del proyecto**: Usar `^` para permitir actualizaciones seguras.

### 7. Lock File

- **Archivo**: `pnpm-lock.yaml`
- **NO modificar manualmente**
- **Commitear siempre** al repositorio
- **Regenerar con**: `pnpm install --frozen-lockfile`

---

## ✅ Mejores Prácticas

### 1. Organización de Código

#### Imports
```astro
---
// 1. Imports de librerías externas
import { getCollection } from 'astro:content';

// 2. Imports de componentes
import BaseLayout from '../layouts/BaseLayout.astro';
import Hero from '../components/Hero.astro';

// 3. Imports de utilidades
import { getLangFromUrl } from '../i18n/utils';

// 4. Imports de tipos
import type { CollectionEntry } from 'astro:content';

// 5. Lógica del componente
const lang = getLangFromUrl(Astro.url);
---
```

#### Estructura de Archivos
- Un componente por archivo
- Nombre del archivo = Nombre del componente
- Colocar en carpeta apropiada según función

### 2. Performance

#### Optimización de Imágenes
```astro
---
// Usar el componente Image de Astro
import { Image } from 'astro:assets';
import myImage from '../assets/image.png';
---

<Image 
	src={myImage} 
	alt="Descripción"
	width={800}
	height={600}
	loading="lazy"
/>
```

#### Code Splitting
```astro
<!-- Cargar componentes interactivos solo cuando sea necesario -->
<InteractiveMap client:visible />
<HeavyComponent client:idle />
```

#### Preload de Recursos Críticos
```astro
<link rel="preload" href="/fonts/main.woff2" as="font" type="font/woff2" crossorigin>
```

### 3. Accesibilidad

#### Landmarks Semánticos
```astro
<header>...</header>
<nav aria-label="Main navigation">...</nav>
<main>...</main>
<aside>...</aside>
<footer>...</footer>
```

#### ARIA Labels
```astro
<button aria-label="Close menu">
	<Icon name="close" />
</button>

<nav aria-label="Breadcrumb">
	<ol>...</ol>
</nav>
```

#### Contraste y Tamaño
- Ratio de contraste mínimo: 4.5:1 para texto normal
- Tamaño mínimo de texto: 16px
- Área mínima de click: 44x44px

### 4. SEO

#### Meta Tags
```astro
<head>
	<title>{title} | Portfolio</title>
	<meta name="description" content={description} />
	<meta property="og:title" content={title} />
	<meta property="og:description" content={description} />
	<meta property="og:image" content={image} />
	<meta property="og:type" content="website" />
	<meta name="twitter:card" content="summary_large_image" />
</head>
```

#### URLs Amigables
```
✅ /work/aimove-guide
❌ /work/1234
```

#### Sitemap
```astro
// Astro genera sitemap.xml automáticamente
// Configurar en astro.config.mjs si es necesario
```

### 5. Testing y Validación

#### Type Checking
```bash
# Validar tipos en el proyecto
pnpm astro check
```

#### Formateo de Código
```bash
# Formatear todo el código
pnpm prettier --write .

# Verificar formato
pnpm prettier --check .
```

#### Build Testing
```bash
# Build y preview antes de deploy
pnpm build && pnpm preview
```

### 6. Git Workflow

#### Commits Semánticos
```bash
feat: agregar nuevo componente ContactForm
fix: corregir error en navegación mobile
docs: actualizar README con nuevas instrucciones
style: formatear archivos con prettier
refactor: reorganizar estructura de carpetas
perf: optimizar imágenes del portfolio
```

#### Branches
```
main          # Producción
develop       # Desarrollo
feature/*     # Nuevas características
bugfix/*      # Correcciones
hotfix/*      # Correcciones urgentes
```

### 7. Comentarios y Documentación

#### Comentarios en Código
```astro
---
// Explicar decisiones complejas, no lo obvio
// ✅ Bueno: Explicar el "por qué"
// Usamos Map para búsqueda O(1) en lugar de filter O(n)
const bySlug = new Map(entries.map(...));

// ❌ Malo: Explicar el "qué" (obvio)
// Crear un nuevo Map
const bySlug = new Map();
---
```

#### JSDoc para Funciones Complejas
```typescript
/**
 * Obtiene el idioma actual desde la URL
 * @param url - URL de la página actual
 * @returns Código del idioma ('en' | 'es')
 */
export function getLangFromUrl(url: URL): keyof typeof ui {
	const [, lang] = url.pathname.split('/');
	if (lang in ui) return lang as keyof typeof ui;
	return defaultLang;
}
```

### 8. Seguridad

#### Sanitización de HTML
```astro
<!-- Usar set:html solo con contenido confiable -->
<div set:html={sanitizedContent}></div>

<!-- Preferir interpolación directa -->
<div>{userInput}</div>
```

#### Variables de Entorno
```bash
# .env
PUBLIC_API_URL=https://api.example.com
SECRET_KEY=secret_value

# Acceso en Astro
const apiUrl = import.meta.env.PUBLIC_API_URL;
```

#### .gitignore
```gitignore
node_modules/
dist/
.env
.env.local
.astro/
```

---

## 🚀 Flujo de Desarrollo

### 1. Configuración Inicial
```bash
# Clonar repositorio
git clone <repo-url>
cd lolo-kbyte

# Instalar dependencias
pnpm install

# Iniciar desarrollo
pnpm dev --open
```

### 2. Crear Nuevo Proyecto

1. Crear archivo MDX en `src/content/work/proyecto.mdx`
2. Seguir estructura de [aimove-guide.mdx](src/content/work/aimove-guide.mdx)
3. Agregar imágenes en `/public/assets/`
4. Crear versión en español en `src/content/work/es/proyecto.mdx`
5. Probar en desarrollo
6. Commitear cambios

### 3. Crear Nuevo Componente

1. Crear archivo en `src/components/NuevoComponente.astro`
2. Definir interface de Props
3. Implementar template y estilos
4. Importar y usar en páginas
5. Documentar props y uso

### 4. Agregar Traducciones

1. Agregar claves en `src/i18n/ui.ts` para ambos idiomas
2. Usar en componentes con `useTranslations()`
3. Verificar en ambos idiomas (/en y /es)

### 5. Deploy

```bash
# Build de producción
pnpm build

# Verificar build
pnpm preview

# El contenido de /dist está listo para deploy
```

---

## 📚 Recursos Adicionales

### Documentación Oficial
- [Astro Docs](https://docs.astro.build)
- [Tailwind CSS v4](https://tailwindcss.com/docs)
- [MDX Documentation](https://mdxjs.com/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)

### Herramientas Útiles
- [Astro VS Code Extension](https://marketplace.visualstudio.com/items?itemName=astro-build.astro-vscode)
- [Prettier VS Code Extension](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [WebP Converter](https://squoosh.app/) - Para optimizar imágenes

### Community
- [Astro Discord](https://astro.build/chat)
- [GitHub Discussions](https://github.com/withastro/astro/discussions)

---

## 🆘 Troubleshooting

### Error: "Cannot find module"
```bash
# Limpiar cache y reinstalar
rm -rf node_modules .astro dist
pnpm install
```

### Error: Type checking failed
```bash
# Regenerar tipos de Astro
pnpm astro sync
```

### Error: Tailwind styles not applying
```bash
# Verificar import en global.css
@import "tailwindcss";

# Reiniciar servidor de desarrollo
```

### Error: i18n routes not working
```bash
# Verificar configuración en astro.config.mjs
i18n: {
  defaultLocale: 'en',
  locales: ['en', 'es'],
}
```

---

## ⚠️ Advertencias Importantes

### Documentación vs Desarrollo de Software
Cuando se describan proyectos en las tarjetas `projectCards`, **SIEMPRE distinguir claramente** entre:
- **Documentar aplicaciones**: Crear guías, manuales, documentación técnica, sistemas de ayuda, plataformas de soporte
- **Desarrollar aplicaciones**: Construir código, APIs, interfaces, funcionalidades, arquitecturas técnicas

**Ejemplos correctos:**
- ✅ "Creé la plataforma de documentación completa para las aplicaciones móviles AIMove"
- ✅ "Desarrollé el sistema de documentación multi-layout para AIMove Hub"
- ✅ "Implementé interfaces de documentación especializada para aplicaciones móviles"

**Ejemplos incorrectos (evitar):**
- ❌ "Desarrollé las aplicaciones móviles AIMove con React Native"
- ❌ "Construí las APIs móviles y funcionalidades offline"
- ❌ "Implementé la arquitectura PWA y gestos táctiles"

**Por qué importa:** Evitar reclamar crédito por trabajo que no se realizó. Si solo se documentaron aplicaciones existentes, enfatizar el trabajo de documentación, no el desarrollo de las aplicaciones mismas.

---

## 📝 Changelog Template

Al hacer cambios significativos, documentar en este formato:

```markdown
## [Versión] - YYYY-MM-DD

### Added
- Nueva característica X

### Changed
- Modificación en componente Y

### Fixed
- Corrección de bug en Z

### Removed
- Eliminación de feature obsoleto
```

---


**Última actualización**: Enero 15, 2026  
**Versión del documento**: 1.0.0  
**Mantenedor**: Luis Enrique Bauza (@LuchoKbyte)
