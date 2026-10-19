# Content editing

## Start here

- Name, introduction, focus, and optional public email/GitHub/LinkedIn links: `lib/content/profile.dart`.
- App names, slugs, draft descriptions, features and screenshot records: `lib/content/apps.dart`.
- CV sections: `lib/pages/cv_page.dart` and `tool/generate_cv.dart`.
- Shared type/color/spacing rules: `lib/theme.dart`.
- App/legal layout: `lib/pages/app_page.dart`.

The requested name is **Lukas Simon**. Employment, education, skills, email, and LinkedIn are sourced from the supplied May 2025 CV. Lukas confirmed Seznam ended in July 2026 and the Ventrata Engineering Lead role began in August 2026, leading Flutter development. Seznam roles are condensed into a single progression entry. On 30 September 2026, Lukas confirmed that CTU talks are ongoing and supplied his GitHub account, linked as `https://github.com/mendoxe`. Introductory and app positioning copy remains provisional.

The lakeside portrait (`web/images/profile-image.jpg`) is the small photo in About. The supplied seated portrait remains available as an unused asset.

Keep the public copy direct. Describe apps by their purpose; avoid diminutives such as “small apps,” motivational slogans, eyebrow labels, numbered section labels, and decorative arrows. Do not claim availability, pricing or store presence that has not been confirmed.

The apps, in order: Toolbox, Code breaker, Emberline (repository `flutter/flutter_td`), Quizness, Travelo (repository `flutter/travel_tracker`). “Email me” in the header and hero, and the footer address, open an email draft to the confirmed address `42lukas.simon@gmail.com`, shared with the PDF.

Header navigation contains Apps, About and Services, plus Email me; the name links home. On phones the links sit in a native disclosure menu. The sections share the home page and are linked by anchors from every route. The CV download lives in About; the standalone CV route remains at `/cv/`. The hero introduction and footer sentence live in `PortfolioCopy`.

## Needed before a finished personal launch

- Review the introduction and services copy; the professional title is Engineering Lead at Ventrata.
- Additional Ventrata achievements, when available.
- Screenshots for Code breaker, Quizness and Travelo.
- Real app availability, supported platforms, store URLs, and support contact.

The website and generated PDF share structured experience and education in `lib/content/profile.dart`. CTU speaking runs from March 2023 to the present, confirmed by Lukas. The brief CV omits the earlier helpdesk job, long course lists, birth date, and telephone number. Do not infer language proficiency from the old graphical ratings.

The ordered launch checklist is [TODO.md](../TODO.md). Follow up with focused questions when returning to those tasks.

## App status

Lukas confirmed on 30 September 2026 that Toolbox and Code breaker are released. Emberline, Quizness and Travelo are unreleased: their repositories show open launch checklists and nothing uploaded to a store (checked 19 October 2026). `PersonalApp.isReleased` drives the “Released” or “In development” status. Platforms, store links and support details still need confirmation per app. App descriptions and features come from each app's code and docs.

## App icons, colours and screenshots

Each app needs `web/images/apps/<slug>/icon.jpg` (square, opaque, 288px; corners are rounded in CSS). Its `AppPalette` sets the band colours; keep `text` and `muted` at 4.5:1 or better against `ground`.

The current Toolbox screenshots are the uncomposed app captures from the Toolbox store-screenshot refresh; Emberline's are its Google Play phone captures. Toolbox's show sample data and demonstration sensor readings. Add screenshots by placing images in `web/images/apps/<slug>/` and listing them in order:

```dart
AppScreenshot(
  'images/apps/toolbox/compass.jpg',
  caption: 'Compass',
  alt: 'Compass dial pointing to 324 degrees.',
),
```

Paths are relative to `web/`; do not include the deployment prefix. Write the caption and alt text after looking at the image. Use one orientation per app; set `landscapeScreenshots` for landscape captures. The band shows the first two portrait or the first landscape screenshot; the app page shows them all in a gallery whose images link to the full-size file. Without screenshots the band shows the large icon and the app page omits the gallery.

## App documents

Each app already has permanent privacy and terms routes. Those routes clearly state that no active legal document is published on this site. Prioritize Toolbox and Code breaker because they are already released; ask whether existing published policies should be reused before drafting replacements. Before writing final policies, gather: publisher/contact, distribution/platforms, data collected and purposes, storage and retention, analytics/crash reporting, third-party SDKs, accounts, purchases/subscriptions, age requirements, applicable regions, and user support/deletion process. Do not copy assertions from one app to another without verifying them.

Final documents should have a clear effective date and app identity. Add support or other required pages as the actual app needs become known.

## Fonts

Schibsted Grotesk is served locally from `web/fonts/SchibstedGrotesk.ttf` under its included SIL Open Font License (`web/fonts/OFL.txt`). Source: [Google Fonts Schibsted Grotesk](https://github.com/google/fonts/tree/main/ofl/schibstedgrotesk). `tool/fetch_fonts.dart` is an optional maintenance command, not part of ordinary builds. Review asset/license diffs after fetching updates.
