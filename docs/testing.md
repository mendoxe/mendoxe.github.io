# Testing and verification

## Local checks

```text
dart format lib tool test
dart run tool/site.dart check
dart run tool/site.dart build
dart run tool/site.dart preview
```

`check` enforces formatting, runs the Dart/Jaspr analyzer, and runs unit tests. Base-path tests cover normalization and reject URL/query/traversal input. Tests focus on deployment behavior rather than snapshots of every static text component.

Every build runs `verify_build.dart`: it requires all 21 route documents, one H1 and a main landmark per page, a page title, the expected base tag, resolvable local navigation/assets and cross-page fragments, and a valid PDF signature.

For routing or hosting changes, repeat the build with `--base=/personal-site/`. Preview the new build and open nested URLs directly. The preview must return a real 404 status with the custom page for unknown paths.

## Browser review

- Desktop: review the complete home page (hero, apps, About, Services, footer), the standalone section routes, CV, directory, every app page, and both legal page types.
- Mobile: review at 320–390 CSS pixels; no horizontal page scroll, clipped text, overlapping controls, or tiny navigation.
- Full-screen sections: at 375×812, 390×844, 849 and 861px wide, 1440×900 and a short desktop, scroll to the hero, each app band, About and Services; each fills the viewport below the header and the next section does not show at the bottom. Longer content grows its section.
- App bands: check both sides of the 860px breakpoint. Desktop bands alternate sides; portrait screenshots rise from the band's bottom edge, the landscape one sits flush with it, and icon-only bands show one large icon (and no small one), also on phones where the bands stack. Text stays readable on every band colour.
- Keyboard: Tab shows a skip link above the sticky header, including after scrolling. Activating it moves focus to the main content. Focus is visible on links, icons and buttons on every band colour. Activate navigation and CV download.
- Check selected navigation (`aria-current` on standalone routes), page titles, deep links, back links, and footer.
- Confirm font, image and PDF requests succeed; no third-party runtime requests or console errors.
- Follow Apps, About and Services repeatedly from home and nested pages; each section must begin beneath the sticky header. On mobile, open the menu, choose each link, verify the menu closes, and check Escape returns focus to its toggle. The native disclosure and section links must also remain usable without JavaScript.
- Mobile menu: click outside, tab out, press Escape, and resize to desktop; the disclosure should close. On short screens its links must remain reachable by scrolling the menu.
- App pages: open each directly. Screenshot galleries use the portrait or landscape grid without overflow at 320px, show accurate alt text, load lazily, and link to full-size images at root and repository-prefix bases.
- Disable JavaScript: essential content, navigation, and PDF download still work.

## PDF

Run `dart run tool/site.dart cv` after content/layout edits. Open `web/downloads/lukas-simon-cv.pdf` and check page breaks, text selection, accents, spacing, and that no content is clipped. `pdfinfo` and `pdftoppm -png` can inspect/render it when available. The generator uses `MultiPage` so future content can flow across pages; keep section headers with their content when adding long employment history.

## CI

Pull requests check and build with a non-root `/preview/` prefix. Pushes to `master` check and verify output before the Pages deploy job runs. No deployment is performed from pull requests.
