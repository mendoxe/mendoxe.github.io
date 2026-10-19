import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/app_band.dart';
import '../content/apps.dart';
import '../site_config.dart';
import '../theme.dart';

class AppPage extends StatelessComponent {
  const AppPage(this.app, {super.key});
  final PersonalApp app;

  @override
  Component build(BuildContext context) => .fragment([
    AppBand(app, level: 1),
    section(
      classes: 'section wrap',
      attributes: {'aria-labelledby': 'features'},
      [
        h2(id: 'features', classes: 'section-head', [.text('What it does')]),
        div(classes: 'feature-grid', [
          for (final (title, description) in app.features)
            div(classes: 'feature', [
              h3([.text(title)]),
              p([.text(description)]),
            ]),
        ]),
      ],
    ),
    if (app.screenshots.isNotEmpty)
      section(
        classes: 'section screenshots',
        attributes: {'aria-labelledby': 'screenshots'},
        [
          div(classes: 'wrap', [
            h2(id: 'screenshots', classes: 'section-head', [.text('Screenshots')]),
            div(classes: 'shot-grid ${app.landscapeScreenshots ? 'landscape' : 'portrait'}', [
              for (final shot in app.screenshots)
                figure([
                  a(
                    href: siteUrl(shot.assetPath),
                    attributes: {'aria-label': 'Open ${shot.caption} at full size'},
                    [img(src: siteUrl(shot.assetPath), alt: shot.alt, loading: .lazy)],
                  ),
                  figcaption([.text(shot.caption)]),
                ]),
            ]),
          ]),
        ],
      ),
    section(
      classes: 'section wrap documents',
      attributes: {'aria-labelledby': 'documents'},
      [
        h2(id: 'documents', [.text('Documents')]),
        ul([
          li([
            a(href: siteUrl('${app.path}privacy/'), [.text('Privacy policy')]),
          ]),
          li([
            a(href: siteUrl('${app.path}terms/'), [.text('Terms of use')]),
          ]),
        ]),
      ],
    ),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.feature-grid').styles(
      display: .grid,
      gridTemplate: GridTemplate(
        columns: GridTracks([
          GridTrack.repeat(TrackRepeat.autoFit, [GridTrack(TrackSize.minmax(TrackSize(220.px), TrackSize.fr(1)))]),
        ]),
      ),
      gap: Gap(row: 40.px, column: 32.px),
    ),
    css('.feature').styles(
      padding: .only(top: 20.px),
      border: .only(
        top: BorderSide(width: 2.px, color: foreground, style: .solid),
      ),
    ),
    css('.feature h3').styles(
      margin: .only(bottom: 10.px),
      fontSize: 21.px,
    ),
    css('.feature p').styles(color: muted),
    css('.screenshots').styles(backgroundColor: wash),
    css('.shot-grid').styles(
      display: .grid,
      gap: Gap(row: 40.px, column: 24.px),
    ),
    css('.shot-grid.portrait').styles(
      gridTemplate: GridTemplate(
        columns: GridTracks([
          GridTrack.repeat(TrackRepeat.autoFill, [GridTrack(TrackSize.minmax(TrackSize(180.px), TrackSize.fr(1)))]),
        ]),
      ),
    ),
    css('.shot-grid.landscape').styles(
      gridTemplate: GridTemplate(
        columns: GridTracks([
          GridTrack.repeat(TrackRepeat.autoFill, [
            GridTrack(TrackSize.minmax(TrackSize(.expression('min(320px, 100%)')), TrackSize.fr(1))),
          ]),
        ]),
      ),
    ),
    css('.shot-grid a').styles(display: .block, radius: .circular(16.px)),
    css('.shot-grid img').styles(
      width: 100.percent,
      radius: .circular(16.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 8.px, blur: 24.px, color: const Color('#1720381f')),
    ),
    css('.shot-grid figcaption').styles(
      margin: .only(top: 12.px),
      color: muted,
      fontSize: 16.px,
    ),
    css(
      '.documents',
    ).styles(display: .flex, flexWrap: .wrap, justifyContent: .spaceBetween, alignItems: .baseline, gap: .all(16.px)),
    css('.documents h2').styles(fontSize: 24.px),
    css('.documents ul').styles(display: .flex, gap: .all(32.px), listStyle: .none),
  ];
}

class LegalPage extends StatelessComponent {
  const LegalPage(this.app, {required this.isPrivacy, super.key});
  final PersonalApp app;
  final bool isPrivacy;
  @override
  Component build(BuildContext context) => section(classes: 'wrap page-head legal', [
    a(href: siteUrl(app.path), classes: 'legal-back', [AppIcon(app, size: 40), .text(app.name)]),
    h1([.text(isPrivacy ? 'Privacy policy' : 'Terms of use')]),
    p(classes: 'legal-notice', [.text('Not yet published. This page is a placeholder, not an active legal document.')]),
    p(classes: 'lead', [
      .text(
        isPrivacy
            ? 'The privacy policy will explain what information ${app.name} handles, why it needs it, and how to contact me about your data.'
            : 'The terms will explain the conditions for using ${app.name}, including availability, acceptable use and support.',
      ),
    ]),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.legal').styles(minHeight: 60.vh),
    css('.legal-back').styles(
      display: .inlineFlex,
      margin: .only(bottom: 40.px),
      alignItems: .center,
      gap: .all(12.px),
      fontWeight: .w600,
      textDecoration: .none,
    ),
    css('.legal-back .app-icon').styles(width: 40.px, height: 40.px),
    css('.legal-notice').styles(
      maxWidth: 36.em,
      margin: .only(bottom: 24.px),
      padding: .symmetric(vertical: 14.px, horizontal: 18.px),
      radius: .circular(10.px),
      fontSize: 16.px,
      backgroundColor: wash,
    ),
  ];
}
