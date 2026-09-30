import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/ui.dart';
import '../content/apps.dart';
import '../content/profile.dart';
import '../site_config.dart';

class CvPage extends StatelessComponent {
  const CvPage({super.key});
  @override
  Component build(BuildContext context) => section(classes: 'page-section', [
    const PageIntro(eyebrow: 'CURRICULUM VITAE', title: Profile.name, description: Profile.role),
    div(classes: 'cv-toolbar', [
      const ActionLink('Download CV', 'downloads/lukas-simon-cv.pdf', primary: true, download: 'lukas-simon-cv.pdf'),
      span(classes: 'muted', [.text('PDF · A4')]),
    ]),
    const CvSection('Profile', child: p([.text(Profile.introduction)])),
    CvSection(
      'Focus',
      child: div(classes: 'tag-list', [
        for (final skill in Profile.skills) span(classes: 'tag', [.text(skill)]),
      ]),
    ),
    CvSection(
      'Independent projects',
      child: div([
        for (final app in personalApps)
          article(classes: 'cv-project', [
            a(href: siteUrl(app.path), classes: 'project-title', [.text(app.name)]),
            p([.text(app.description)]),
          ]),
      ]),
    ),
    CvSection(
      'Experience',
      child: div([
        for (final role in Profile.experience)
          article(classes: 'cv-project', [
            h3([.text('${role.role} · ${role.company}')]),
            p(classes: 'muted', [.text(role.period)]),
            for (final highlight in role.highlights) p([.text(highlight)]),
          ]),
      ]),
    ),
    CvSection(
      'Education',
      child: div([
        for (final qualification in Profile.education) p([.text(qualification)]),
      ]),
    ),
  ]);
}

class CvSection extends StatelessComponent {
  const CvSection(this.title, {required this.child, super.key});
  final String title;
  final Component child;
  @override
  Component build(BuildContext context) => section(classes: 'cv-section', [
    h2([.text(title)]),
    child,
  ]);
}
