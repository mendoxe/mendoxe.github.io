# Testing and verification

## Local checks

```text
dart format lib tool test
dart run tool/site.dart check
dart run tool/site.dart build
dart run tool/site.dart preview
```

`check` enforces formatting, runs the Dart/Jaspr analyzer, and runs unit tests. Base-path tests cover normalization and reject URL/query/traversal input. Tests focus on deployment behavior rather than snapshots of every static text component.

Every build runs `verify_build.dart`: it requires all 13 route documents, one H1 and a main landmark per page, a page title, the expected base tag, resolvable local navigation/assets, and a valid PDF signature.

For routing or hosting changes, repeat the build with `--base=/personal-site/`. Preview the new build and open nested URLs directly. The preview must return a real 404 status with the custom page for unknown paths.

## Browser review

- Desktop: review home, CV, directory, one app, and both legal page types.
- Mobile: review at 320–390 CSS pixels; no horizontal page scroll, clipped text, overlapping controls, or tiny navigation.
- Hero devices: check desktop, both sides of the 850px stacking breakpoint, and 320–390px mobile widths. The laptop should read as the widest device, phone and tablet bottoms should align, and all three silhouettes and their screen content should remain separate and contained.
- Keyboard: Tab shows a skip link and clear focus. Activate navigation and CV download.
- Check selected navigation, page titles, deep links, back links, and footer.
- Confirm font and PDF requests succeed; no third-party runtime requests or console errors.
- Check Work, Services, and About anchor navigation from home and nested pages. On mobile, open the native Menu and follow a link. Check the tiny header avatar and About portrait with its grey frame.
- Disable JavaScript: essential content, navigation, and PDF download still work.

## PDF

Run `dart run tool/site.dart cv` after content/layout edits. Open `web/downloads/lukas-simon-cv.pdf` and check page breaks, text selection, accents, spacing, and that no content is clipped. `pdfinfo` and `pdftoppm -png` can inspect/render it when available. The generator uses `MultiPage` so future content can flow across pages; keep section headers with their content when adding long employment history.

## CI

Pull requests check and build with a non-root `/preview/` prefix. Pushes to `master` check and verify output before the Pages deploy job runs. No deployment is performed from pull requests.
