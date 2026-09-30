# Content editing

## Start here

- Name, introduction, focus, and optional public email/GitHub/LinkedIn links: `lib/content/profile.dart`.
- App names, slugs, draft descriptions and features: `lib/content/apps.dart`.
- CV sections: `lib/pages/cv_page.dart` and `tool/generate_cv.dart`.
- Shared type/color/spacing rules: `lib/theme.dart`.
- App/legal layout: `lib/pages/app_page.dart`.

The requested name is **Lukas Simon**. Employment, education, skills, email, and LinkedIn are sourced from the supplied May 2025 CV. Lukas confirmed Seznam ended in July 2026 and the Ventrata Engineering Lead role began in August 2026, leading Flutter development. Seznam roles are condensed into a single progression entry. On 30 September 2026, Lukas confirmed that CTU talks are ongoing and supplied his GitHub account, linked as `https://github.com/mendoxe`. Introductory and app positioning copy remains provisional.

The seated portrait (`web/images/hero-image.jpg`) is the tiny header avatar. The lakeside portrait (`web/images/profile-image.jpg`) sits inside a grey frame in About. These are supplied photos; replace them when newer images are available.

Keep the public copy direct. Describe apps by their purpose; avoid diminutives such as “small apps,” motivational slogans, numbered section labels, and decorative arrows.

Selected Apps contains only Toolbox, Travelo, and Code breaker. Work and Services use headings without introductory paragraphs. Both “Get in touch” buttons open an email draft to the confirmed address `42lukas.simon@gmail.com`; this address is shared with the footer and PDF.

Header and mobile navigation contain Work, Services, and About. The CV download lives in About; the standalone CV route remains available from the footer.

## Needed before a finished personal launch

- Review the introduction and services copy; the professional title is Engineering Lead at Ventrata.
- Additional Ventrata achievements, when available.
- App screenshots, with permission to use them.
- Real app availability, supported platforms, store URLs, and support contact.

The website and generated PDF share structured experience and education in `lib/content/profile.dart`. CTU speaking runs from March 2023 to the present, confirmed by Lukas; the CV no longer carries a draft label or a confirmation notice. The brief CV omits the earlier helpdesk job, long course lists, birth date, and telephone number. Do not infer language proficiency from the old graphical ratings.

The ordered launch checklist is [TODO.md](../TODO.md), beginning with services copy and containing separate information and legal tasks for each app. Follow up with focused questions when returning to those tasks.

## App status

Lukas confirmed on 30 September 2026 that Toolbox and Code breaker are released. Travelo is still in active development and has not been released. `PersonalApp.isReleased` records this distinction and supplies the landing-page status message. Platforms, store links, support details, and product descriptions still need verification per app.

## App documents

Each app already has permanent privacy and terms routes. Those routes clearly state that no active legal document is published on this site. Prioritize Toolbox and Code breaker because they are already released; ask whether existing published policies should be reused before drafting replacements. Before writing final policies, gather: publisher/contact, distribution/platforms, data collected and purposes, storage and retention, analytics/crash reporting, third-party SDKs, accounts, purchases/subscriptions, age requirements, applicable regions, and user support/deletion process. Do not copy assertions from one app to another without verifying them.

Final documents should have a clear effective date and app identity. Add support or other required pages as the actual app needs become known.

## Fonts

Manrope is served locally from `web/fonts/Manrope.ttf` under its included SIL Open Font License. Source: [Google Fonts Manrope](https://github.com/google/fonts/tree/main/ofl/manrope). `tool/fetch_fonts.dart` is an optional maintenance command, not part of ordinary builds. Review asset/license diffs after fetching updates.
