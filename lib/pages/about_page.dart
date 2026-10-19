import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/profile.dart';
import '../site_config.dart';
import '../theme.dart';

class AboutPage extends StatelessComponent {
  const AboutPage({super.key});
  @override
  Component build(BuildContext context) => const AboutSection(standalone: true);
}

class AboutSection extends StatelessComponent {
  const AboutSection({this.standalone = false, super.key});
  final bool standalone;
  @override
  Component build(BuildContext context) => section(id: 'about', classes: 'section wrap about', [
    div(classes: 'about-side', [
      if (standalone) h1([.text('About')]) else h2([.text('About')]),
      img(
        src: siteUrl('images/profile-image.jpg'),
        alt: 'Lukas Simon by a lake',
        classes: 'about-photo',
        loading: .lazy,
        width: 1125,
        height: 1999,
      ),
    ]),
    div(classes: 'about-body', [
      p(classes: 'lead', [.text(Profile.approach)]),
      p([.text(Profile.background)]),
      ol(classes: 'experience', [
        for (final role in Profile.experience)
          li([
            span(classes: 'experience-period', [.text(role.period)]),
            strong([.text(role.company)]),
            span([.text(role.role)]),
          ]),
      ]),
      a(
        href: siteUrl('downloads/lukas-simon-cv.pdf'),
        download: 'lukas-simon-cv.pdf',
        classes: 'button',
        [.text('Download CV (PDF)')],
      ),
    ]),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.about').styles(
      display: .grid,
      minHeight: .expression(screenHeight),
      alignContent: .start,
      gridTemplate: GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(2))])),
      gap: .all(.expression('clamp(32px, 6vw, 96px)')),
    ),
    css('.about-photo').styles(
      width: 160.px,
      margin: .only(top: 32.px),
      radius: .circular(12.px),
      raw: {'aspect-ratio': '4 / 5', 'object-fit': 'cover'},
    ),
    css('.about-body').styles(display: .flex, flexDirection: .column, alignItems: .start, gap: .all(24.px)),
    css('.about-body p').styles(maxWidth: 36.em),
    css('.experience').styles(
      width: 100.percent,
      margin: .symmetric(vertical: 16.px),
      border: .only(
        top: BorderSide(width: 1.px, color: hairline, style: .solid),
      ),
      listStyle: .none,
    ),
    css('.experience li').styles(
      display: .grid,
      padding: .symmetric(vertical: 16.px),
      border: .only(
        bottom: BorderSide(width: 1.px, color: hairline, style: .solid),
      ),
      alignItems: .baseline,
      gridTemplate: GridTemplate(
        columns: GridTracks([GridTrack(TrackSize(200.px)), GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.auto)]),
      ),
      gap: .all(16.px),
    ),
    css('.experience-period').styles(color: muted, fontSize: 16.px, raw: {'font-variant-numeric': 'tabular-nums'}),
    css.media(MediaQuery.screen(maxWidth: 860.px), [
      css('.about').styles(gridTemplate: GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))]))),
      css('.about-side').styles(display: .flex, justifyContent: .spaceBetween, alignItems: .start),
      css('.about-photo').styles(width: 112.px, margin: .zero),
    ]),
    css.media(MediaQuery.screen(maxWidth: 560.px), [
      css('.experience li').styles(
        gridTemplate: GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.auto)])),
        gap: Gap(row: 2.px, column: 16.px),
      ),
      css('.experience-period').styles(raw: {'grid-column': '1 / -1'}),
    ]),
  ];
}
