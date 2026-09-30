# Working in this repository

Read this file first, then [architecture](docs/architecture.md) and the relevant task guide in `docs/`.

## Project intent

A Dart-first personal website for Lukas Simon, built with Jaspr static rendering. One repository contains the personal pages and Toolbox, Travelo, and Code breaker microsites. GitHub Pages is the deployment target. No paid runtime services.

## Working agreements

- Use Dart for all scripts, automation, and CLI logic. YAML is only workflow/editor configuration. Do not add Node, npm, handwritten JavaScript, Tailwind, or a separate CSS pipeline.
- This is Jaspr, not a Flutter canvas app. Use modern `Component build(BuildContext context)` APIs, typed DOM components and typed Dart styles. Use `raw` only for missing style bindings.
- Keep build methods small and compositional. Extract cohesive, reusable components rather than making a generic widget for every line.
- Store personal/product copy in `lib/content/`. Do not invent employers, qualifications, release status, store links, tracking practices, or legal promises. Current descriptive copy is provisional.
- Keep all content and navigation usable without JavaScript. Introduce `@client` only for real browser interaction.
- Use `siteUrl()` for internal URLs and assets. Support root and repository-prefixed deployment. Preserve direct entry into every nested route.
- Use semantic headings, landmarks, explicit link labels, visible focus states, and sufficient contrast. Check mobile as well as desktop.
- Keep dependencies purposeful and commit `pubspec.lock`. Never manually edit generated `*.options.dart` files.
- Never read sibling app repositories unless asked. App behavior and legal facts must be supplied or verified explicitly.
- Do not publish, create a GitHub repository, or change remote settings unless requested. Local builds/previews are fine.
- The default and deployment branch is `master`, not `main`.

## Commands

```text
dart pub get
dart run tool/site.dart dev
dart run tool/site.dart check
dart run tool/site.dart build --base=/personal-site/
dart run tool/site.dart preview
```

Use `dart format lib tool test` before checks. Build verifies emitted pages and local links. A routing/deployment change must be built at both `/` and a non-root prefix. See `docs/testing.md` for visual checks.

## Local Jaspr skills

Version-matched official skills are committed in `.agents/skills/`. Start with `jaspr-fundamentals` and `jaspr-styling`; consult their references instead of guessing signatures. Read the hydration skill before adding client state. Refresh them deliberately when upgrading Jaspr with `dart run jaspr_cli:jaspr install-skills --agent general`.

`CLAUDE.md` and `GEMINI.md` must remain symlinks to this file, not copied instructions.

## Definition of done

Run the relevant checks, inspect the actual build, update affected docs, and report what was verified and any remaining content gaps. Keep changes scoped; no speculative frameworks or redundant tests.
