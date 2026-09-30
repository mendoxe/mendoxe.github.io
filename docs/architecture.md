# Architecture

## A website built in Dart

Jaspr 0.23.5 renders semantic HTML and CSS at build time. Its component model resembles Flutter, but this project deliberately does not embed the Flutter engine: a content-led website benefits from selectable text, native links, accessible markup, and small static payloads. The installed Flutter SDK can supply Dart; the build itself needs only Dart 3.13+.

There is no authored JavaScript or standalone CSS source, backend, database, analytics, or external font request. Browser CSS remains the layout mechanism, expressed with Jaspr's typed Dart APIs. GitHub workflow YAML and the SVG favicon are small declarative exceptions to Dart source.

## Source map

| Location | Responsibility |
| --- | --- |
| `lib/main.server.dart` | Document, shared metadata, base URL, local assets |
| `lib/app.dart` | Explicit pre-rendered routes |
| `lib/content/` | Shared profile and app models/copy |
| `lib/components/` | Shell, navigation, links, cards, and geometric artwork |
| `lib/pages/` | Home, CV, app directory, app detail, legal, 404 |
| `lib/theme.dart` | Shared tokens, typography, layout primitives |
| `lib/component_styles.dart` | Component-specific visual rules |
| `lib/components/hero_visual.dart` | Phone, laptop, and tablet silhouettes with static skeleton screens; framed About portrait |
| `lib/home_styles.dart` | Portfolio layout, rounded panels, serif accents, responsive navigation; hero stacks below 850px |
| `lib/components/app_artwork.dart` | App-specific graphic identities, reused on cards and landing pages |
| `lib/site_config.dart` | Base normalization and internal URL helper |
| `tool/` | Dart CLI, PDF generator, build verification, local server |
| `web/` | Committed local fonts/license, favicon, generated CV |

Jaspr discovers `@css` rules at build time. Styles live in Dart and use stable component class names. The hero devices and app compositions are decorative, hidden from assistive technology, and do not claim to be product screenshots. Hero screens contain static placeholder rectangles, with no animation. The laptop is the widest device, with the phone on the left and the tablet below the laptop; phone and tablet share a bottom edge, with clear gaps between all three. Their borders, padding, camera details, and shadows scale with the scene width using container-relative units. Screen content is inset inside each bezel and uses flexible panels to preserve the composition at mobile sizes. The supplied lakeside portrait has a grey frame in About; the seated portrait appears as a tiny header avatar. Manrope is paired with system Georgia italic for editorial accents. The landing page contains work, services, and about anchor sections; the header links to these from every route. LinkedIn and GitHub use the confirmed public profiles. The mobile menu uses native `details`/`summary` and works without JavaScript. Service and portfolio copy is provisional in `lib/content/`.

## Routing and app ownership

```text
/
/cv/
/apps/
/apps/toolbox/{privacy/,terms/}
/apps/travelo/{privacy/,terms/}
/apps/code-breaker/{privacy/,terms/}
/404/ → also copied to /404.html for GitHub Pages
```

Each app's index is its landing page. All pages are generated from explicit routes; no SPA fallback is required. The app directory links to these app microsites. Separate app domains are optional future work, not a prerequisite or paid dependency.

`SITE_BASE` is a compile-time value, default `/`. CI gets the authoritative base path from GitHub's configure-pages action. `siteUrl()` prepends it to all links. The local preview reads the last build's base from `build/site-base.txt` and serves that same prefix.

## Content and CV

`Profile` feeds the website and PDF with shared employment, education, and skills. The brief CV prioritizes Ventrata, a consolidated Seznam entry, and ongoing CTU speaking, confirmed by Lukas on 30 September 2026. The `pdf` package produces a one-page A4 document with print-friendly Helvetica. The website uses variable Manrope; the PDF normalizes punctuation for its built-in regular/bold faces. Builds regenerate the PDF before Jaspr copies assets.

App records include confirmed release status: Toolbox and Code breaker are released; Travelo is unreleased and in active development. Legal routes are intentionally labeled placeholders, not invented policies. Existing policies and app behavior must be gathered for the two released apps; Travelo's documents are deferred until its release behavior is known. [TODO.md](../TODO.md) tracks separate app information and legal tasks, with guided questions for each.

## Growth

Add an app record and the existing route factory generates its landing/legal routes. Add page-specific components when an app has real screenshots or distinct needs. For lengthy finalized legal documents, introduce typed content sections or a small Markdown content layer only when justified. Keep the shared shell and URL handling.
