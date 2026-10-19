import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/apps.dart';
import '../site_config.dart';
import '../theme.dart';

/// The app's real icon. Leave [alt] empty when the app's name is already next to it.
class AppIcon extends StatelessComponent {
  const AppIcon(this.app, {required this.size, this.alt = '', super.key});
  final PersonalApp app;
  final int size;
  final String alt;
  @override
  Component build(BuildContext context) =>
      img(src: siteUrl(app.iconPath), alt: alt, width: size, height: size, classes: 'app-icon');
}

/// A full-width band in the app's own colours. [level] 1 makes it the hero of the app's page.
class AppBand extends StatelessComponent {
  const AppBand(this.app, {required this.level, super.key});
  final PersonalApp app;
  final int level;

  @override
  Component build(BuildContext context) {
    final palette = app.palette;
    final name = [Component.text(app.name)];
    final shots = app.screenshots.take(app.landscapeScreenshots ? 1 : 2);
    final layout = shots.isEmpty ? 'icon-only' : (app.landscapeScreenshots ? 'landscape' : 'portrait');
    return section(
      id: level == 1 ? null : app.slug,
      classes: 'app-band band-${app.slug} $layout',
      attributes: {'aria-label': app.name},
      styles: Styles(
        raw: {
          '--ground': palette.ground,
          '--band-text': palette.text,
          '--band-muted': palette.muted,
        },
      ),
      [
        div(classes: 'wrap band-inner', [
          div(classes: 'band-copy', [
            if (level == 1) a(href: siteUrl('apps/'), classes: 'band-back', [.text('All apps')]),
            AppIcon(app, size: 72),
            switch (level) {
              1 => h1(classes: 'band-name', name),
              2 => h2(classes: 'band-name', name),
              _ => h3(classes: 'band-name', name),
            },
            p(classes: 'band-kind', [.text(app.kind)]),
            p(classes: 'band-description', [.text(app.description)]),
            if (level > 1) a(href: siteUrl(app.path), classes: 'band-link', [.text('More about ${app.name}')]),
          ]),
          div(
            classes: 'band-visual',
            [
              if (shots.isEmpty)
                AppIcon(app, size: 240)
              else
                for (final shot in shots)
                  img(src: siteUrl(shot.assetPath), alt: '', loading: .lazy, classes: 'band-shot'),
            ],
          ),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.app-icon').styles(
      radius: .circular(22.5.percent),
      shadow: BoxShadow.combine([
        BoxShadow(offsetX: 0.px, offsetY: 0.px, spread: 1.px, color: const Color('#17203814')),
        BoxShadow(offsetX: 0.px, offsetY: 2.px, blur: 6.px, color: const Color('#1720381f')),
      ]),
    ),
    css('.app-band').styles(
      overflow: .hidden,
      color: .variable('--band-text'),
      backgroundColor: .variable('--ground'),
    ),
    css('.band-quizness').styles(
      raw: {
        'background-image': 'radial-gradient(rgb(255 255 255 / 0.16) 1.5px, transparent 1.8px)',
        'background-size': '22px 22px',
      },
    ),
    css('.band-inner').styles(
      display: .grid,
      minHeight: .expression(screenHeight),
      alignItems: .stretch,
      gridTemplate: GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(5)), GridTrack(TrackSize.fr(6))])),
      gap: .all(.expression('clamp(32px, 6vw, 96px)')),
    ),
    css('.app-band:nth-of-type(even) .band-copy').styles(order: 2),
    css('.band-copy').styles(
      display: .flex,
      padding: .symmetric(vertical: .expression('clamp(56px, 7vw, 88px)')),
      flexDirection: .column,
      justifyContent: .center,
      alignItems: .start,
    ),
    css('.band-copy .app-icon').styles(
      width: 72.px,
      height: 72.px,
      margin: .only(bottom: 28.px),
    ),
    css('.band-back').styles(
      margin: .only(bottom: 40.px),
      color: .variable('--band-muted'),
      fontSize: 16.px,
    ),
    css('.band-name').styles(
      fontSize: .expression('clamp(44px, 6vw, 72px)'),
      fontWeight: .w800,
      lineHeight: 1.em,
      raw: {'letter-spacing': displayTracking},
    ),
    css('.band-kind').styles(
      margin: .only(top: 8.px),
      color: .variable('--band-muted'),
      fontSize: 20.px,
    ),
    css('.band-description').styles(
      maxWidth: 30.em,
      margin: .only(top: 24.px),
    ),
    css('.band-link').styles(
      margin: .only(top: 32.px),
      fontSize: 16.px,
      fontWeight: .w600,
    ),
    css('.band-visual').styles(display: .flex, minWidth: .zero, justifyContent: .center, gap: .all(24.px)),
    css('.icon-only .band-visual').styles(alignItems: .center),
    css('.icon-only .band-copy .app-icon').styles(display: .none),
    css('.icon-only .band-visual .app-icon').styles(
      width: .expression('clamp(160px, 22vw, 240px)'),
      height: .auto,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 24.px, blur: 48.px, color: const Color('#0b112440')),
    ),
    css('.portrait .band-visual, .landscape .band-visual').styles(alignItems: .end),
    css('.band-shot').styles(
      shadow: BoxShadow(offsetX: 0.px, offsetY: 0.px, blur: 40.px, color: const Color('#00000040')),
      raw: {'border-radius': '18px 18px 0 0', 'object-fit': 'cover', 'object-position': 'top'},
    ),
    css('.portrait .band-shot').styles(width: .expression('min(46%, 236px)'), height: 440.px),
    css('.portrait .band-shot:last-child').styles(height: 392.px),
    css('.landscape .band-shot').styles(width: 100.percent, raw: {'aspect-ratio': '16 / 9', 'align-self': 'end'}),
    css('.landscape .band-visual').styles(padding: .only(top: 64.px)),
    css.media(MediaQuery.screen(maxWidth: 860.px), [
      css('.band-inner').styles(display: .flex, flexDirection: .column, gap: .all(.zero)),
      css('.app-band:nth-of-type(even) .band-copy').styles(order: 0),
      css('.band-copy').styles(
        padding: .symmetric(vertical: 56.px),
        flex: .grow(1),
      ),
      css('.icon-only .band-visual').styles(
        padding: .only(bottom: 56.px),
        justifyContent: .start,
      ),
      css('.icon-only .band-visual .app-icon').styles(width: 140.px),
      css('.landscape .band-visual').styles(padding: .zero),
      css('.portrait .band-shot').styles(height: 320.px),
      css('.portrait .band-shot:last-child').styles(height: 280.px),
    ]),
  ];
}
