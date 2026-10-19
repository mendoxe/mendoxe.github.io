import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/apps.dart';
import '../content/profile.dart';
import '../site_config.dart';
import '../theme.dart';

class CvPage extends StatelessComponent {
  const CvPage({super.key});
  @override
  Component build(BuildContext context) => div(classes: 'wrap cv', [
    div(classes: 'page-head', [
      h1([.text(Profile.name)]),
      p(classes: 'lead', [.text(Profile.role)]),
    ]),
    a(
      href: siteUrl('downloads/lukas-simon-cv.pdf'),
      download: 'lukas-simon-cv.pdf',
      classes: 'button',
      [.text('Download CV (PDF)')],
    ),
    CvSection('Profile', [
      p([.text(Profile.introduction)]),
    ]),
    CvSection('Skills', [
      p([.text(Profile.skills.join(', '))]),
    ]),
    CvSection('Experience', [
      for (final role in Profile.experience)
        article(classes: 'cv-entry', [
          h3([.text('${role.role}, ${role.company}')]),
          p(classes: 'muted', [.text(role.period)]),
          for (final highlight in role.highlights) p([.text(highlight)]),
        ]),
    ]),
    CvSection('Education', [
      for (final qualification in Profile.education) p([.text(qualification)]),
    ]),
    CvSection('Independent apps', [
      for (final app in personalApps)
        article(classes: 'cv-entry', [
          h3([
            a(href: siteUrl(app.path), [.text(app.name)]),
          ]),
          p(classes: 'muted', [.text('${app.kind}, ${app.status.toLowerCase()}')]),
          p([.text(app.description)]),
        ]),
    ]),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.cv').styles(padding: .only(bottom: 96.px)),
    css('.cv-section').styles(
      display: .grid,
      margin: .only(top: 56.px),
      padding: .only(top: 24.px),
      border: .only(
        top: BorderSide(width: 1.px, color: hairline, style: .solid),
      ),
      gridTemplate: GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(3))])),
      gap: .all(24.px),
    ),
    css('.cv-section h2').styles(fontSize: 21.px),
    css('.cv-section > div').styles(display: .flex, maxWidth: 40.em, flexDirection: .column, gap: .all(20.px)),
    css('.cv-entry h3').styles(fontSize: 21.px),
    css.media(MediaQuery.screen(maxWidth: 720.px), [
      css('.cv-section').styles(gridTemplate: GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))]))),
    ]),
  ];
}

class CvSection extends StatelessComponent {
  const CvSection(this.title, this.children, {super.key});
  final String title;
  final List<Component> children;
  @override
  Component build(BuildContext context) => section(classes: 'cv-section', [
    h2([.text(title)]),
    div(children),
  ]);
}
