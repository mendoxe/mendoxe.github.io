# Architecture

## A website built in Dart

Jaspr 0.23.5 renders semantic HTML and CSS at build time. Its component model resembles Flutter, but this project deliberately does not embed the Flutter engine: a content-led website benefits from selectable text, native links, accessible markup, and small static payloads. The installed Flutter SDK can supply Dart; the build itself needs only Dart 3.13+.

There is no authored JavaScript or standalone CSS source, backend, database, analytics, or external font request. Browser CSS remains the layout mechanism, expressed with Jaspr's typed Dart APIs. A Dart client component enhances the native mobile disclosure menu by closing it when a link is selected, focus or a click leaves the menu, or the viewport becomes desktop-sized. Escape closes it and returns focus to its toggle. Event subscriptions are disposed with the component. GitHub workflow YAML and the SVG favicon are small declarative exceptions to Dart source.

## Source map

| Location | Responsibility |
| --- | --- |
| `lib/main.server.dart` | Document, shared metadata, base URL, local assets |
| `lib/app.dart` | Explicit pre-rendered routes |
| `lib/content/` | Profile, app records (copy, palette, screenshots), services |
| `lib/theme.dart` | Colour tokens, type scale, layout primitives, buttons |
| `lib/components/shell.dart` | Skip link, header, main landmark, contact footer |
| `lib/components/header.dart` | Sticky header; hydrated mobile-menu enhancements |
| `lib/components/app_band.dart` | App icon and the full-width app band used on home, directory and app pages |
| `lib/pages/` | Home (hero, apps, About, Services), CV, app directory, app page, legal placeholders, 404 |
| `lib/main.client.dart` | Hydrates the header |
| `lib/site_config.dart` | Base normalization and internal URL helper |
| `tool/` | Dart CLI, PDF generator, build verification, local server, font fetcher |
| `web/` | Local font and licence, favicon, portrait, app icons and screenshots, generated CV |

Jaspr discovers `@css` rules at build time. Each component keeps its styles in a static `@css` getter next to its markup; shared tokens live in `theme.dart`.

## Design

The site is dark only. The ground is a deep ink blue (`#0f1526`) with light foreground text; colour comes only from the apps. Schibsted Grotesk (variable, 400–900) is the single typeface: heavy and tightly tracked for display, regular for body text. There are no eyebrow labels, icon fonts, or decorative numbering.

The home hero sets the name across two lines with the five real app icons following "Simon" like extra letters; below 720px they wrap under the name. The icons link to their bands and pop in once on load, the site's only automatic motion; reduced-motion preferences disable it.

Each app has a band in its own palette (`AppPalette`; text colours meet 4.5:1 on the ground). Bands alternate copy and visual sides on desktop and stack below 860px. The visual is two portrait screenshots rising from the band's bottom edge, one landscape screenshot, or, for apps without screenshots, the large icon (hidden on phones, where the small icon above the name remains). The same band is the hero of each app page (`level: 1`), followed by features, a screenshot gallery when screenshots exist, and links to the legal routes. The footer on every page is the contact block with the email address set large.

The sticky header holds the name (home link), Apps, About, Services and an Email me button. Below 720px a native `details` menu holds the links. Section links are base-aware home anchors that work from every route; standalone About, Services and Apps routes mark their nav link with `aria-current`. Raw click listeners preserve anchor defaults, since Jaspr's typed `onClick` prevents them.

## Routing and app ownership

```text
/
/services/
/about/
/cv/
/apps/
/apps/<slug>/{privacy/,terms/}   for toolbox, code-breaker, emberline, quizness, travelo
/404/ → also copied to /404.html for GitHub Pages
```

Each app's index is its landing page. All pages are generated from explicit routes; no SPA fallback is required. Separate app domains are optional future work.

`SITE_BASE` is a compile-time value, default `/`. CI gets the authoritative base path from GitHub's configure-pages action. `siteUrl()` prepends it to all links and assets. The local preview reads the last build's base from `build/site-base.txt` and serves that same prefix.

## Content and CV

`Profile` feeds the website and PDF with shared employment, education, and skills. The `pdf` package produces a one-page A4 document with print-friendly Helvetica. Builds regenerate the PDF before Jaspr copies assets.

App records hold release status: Toolbox and Code breaker are released (confirmed by Lukas); Emberline, Quizness and Travelo are unreleased according to their repositories. Features are taken from each app's code and docs. Legal routes are labeled placeholders, not invented policies. [TODO.md](../TODO.md) tracks app information and legal tasks.

## Growth

Add an app record, its `icon.jpg` and any screenshots under `web/images/apps/<slug>/`; the route factory generates its landing and legal routes. For lengthy finalized legal documents, introduce typed content sections only when justified.
