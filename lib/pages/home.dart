import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/app_band.dart';
import '../content/apps.dart';
import '../content/portfolio.dart';
import '../content/profile.dart';
import '../theme.dart';
import 'about_page.dart';
import 'services_page.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});
  @override
  Component build(BuildContext context) => .fragment([
    const HomeHero(),
    const AppsSection(standalone: false),
    const AboutSection(),
    const ServicesSection(),
  ]);
}

/// The name, set large, with a short introduction.
class HomeHero extends StatelessComponent {
  const HomeHero({super.key});
  @override
  Component build(BuildContext context) => section(classes: 'hero wrap', [
    h1([
      span([.text('Lukas')]),
      span([.text('Simon')]),
    ]),
    p(classes: 'lead hero-intro', [.text(PortfolioCopy.heroIntro)]),
    div(classes: 'hero-links', [
      a(href: Profile.github, [.text('GitHub')]),
      a(href: Profile.linkedin, [.text('LinkedIn')]),
    ]),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.hero').styles(
      display: .flex,
      minHeight: .expression(screenHeight),
      padding: .symmetric(vertical: 48.px),
      flexDirection: .column,
      justifyContent: .center,
    ),
    css('.hero h1').styles(
      margin: .only(bottom: .expression('clamp(28px, 4vw, 48px)')),
      fontSize: .expression('clamp(64px, 13vw, 168px)'),
      lineHeight: 0.86.em,
    ),
    css('.hero h1 span').styles(display: .block),
    css('.hero-intro').styles(margin: .only(bottom: 32.px)),
    css('.hero-links').styles(
      display: .flex,
      flexWrap: .wrap,
      alignItems: .center,
      gap: Gap(row: 12.px, column: 28.px),
      fontWeight: .w500,
    ),
  ];
}

class AppsSection extends StatelessComponent {
  const AppsSection({required this.standalone, super.key});
  final bool standalone;
  @override
  Component build(BuildContext context) => section(id: 'apps', [
    if (standalone)
      h1(classes: 'wrap apps-title', [.text('Apps')])
    else
      h2(classes: 'visually-hidden', [.text('Apps')]),
    for (final app in personalApps) AppBand(app, level: standalone ? 2 : 3),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.apps-title').styles(
      padding: .only(top: 56.px, bottom: 40.px),
    ),
  ];
}
