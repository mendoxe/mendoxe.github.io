import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/app_band.dart';
import '../content/apps.dart';
import '../content/portfolio.dart';
import '../content/profile.dart';
import '../site_config.dart';
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

/// The name, followed by the apps as if they were more letters.
class HomeHero extends StatelessComponent {
  const HomeHero({super.key});
  @override
  Component build(BuildContext context) => section(classes: 'hero wrap', [
    div(classes: 'hero-title', [
      h1([
        span([.text('Lukas')]),
        span([.text('Simon')]),
      ]),
      nav(
        classes: 'hero-apps',
        attributes: {'aria-label': 'My apps'},
        [
          for (final app in personalApps) a(href: siteUrl('#${app.slug}'), [AppIcon(app, size: 96, alt: app.name)]),
        ],
      ),
    ]),
    p(classes: 'lead hero-intro', [.text(PortfolioCopy.heroIntro)]),
    div(classes: 'hero-links', [
      a(href: 'mailto:${Profile.email}', classes: 'button', [.text('Email me')]),
      a(href: Profile.github, [.text('GitHub')]),
      a(href: Profile.linkedin, [.text('LinkedIn')]),
    ]),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.hero').styles(
      padding: .only(top: .expression('clamp(48px, 9vw, 128px)'), bottom: .expression('clamp(56px, 8vw, 112px)')),
    ),
    css('.hero-title').styles(
      display: .flex,
      margin: .only(bottom: .expression('clamp(28px, 4vw, 48px)')),
      flexWrap: .wrap,
      alignItems: .end,
      gap: Gap(row: 24.px, column: .expression('clamp(20px, 3vw, 40px)')),
    ),
    css('.hero h1').styles(fontSize: .expression('clamp(64px, 13vw, 168px)'), lineHeight: 0.86.em),
    css('.hero h1 span').styles(display: .block),
    css('.hero-apps').styles(
      display: .flex,
      padding: .only(bottom: .expression('clamp(4px, 1.1vw, 16px)')),
      gap: .all(.expression('clamp(10px, 1.4vw, 18px)')),
    ),
    css('.hero-apps a').styles(
      display: .block,
      radius: .circular(22.5.percent),
      transition: Transition('transform', duration: 150.ms, curve: .easeOut),
      animation: Animation(
        name: 'icon-in',
        duration: 520.ms,
        curve: .cubicBezier(0.2, 0.9, 0.3, 1.25),
        fillMode: .both,
      ),
    ),
    for (var i = 1; i <= 5; i++)
      css('.hero-apps a:nth-child($i)').styles(raw: {'animation-delay': '${120 + i * 70}ms'}),
    css('.hero-apps a:hover').styles(transform: .translate(y: (-4).px)),
    css('.hero-apps .app-icon').styles(width: .expression('clamp(54px, 7.4vw, 96px)'), height: .auto),
    css.keyframes('icon-in', {
      'from': Styles(opacity: 0, transform: .combine([.translate(y: 16.px), .scale(0.7)])),
      'to': Styles(opacity: 1, transform: .none),
    }),
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
  Component build(BuildContext context) => section(id: 'apps', classes: 'apps-section', [
    div(classes: 'wrap apps-head', [
      if (standalone) h1([.text('Apps')]) else h2([.text('Apps')]),
    ]),
    for (final app in personalApps) AppBand(app, level: standalone ? 2 : 3),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.apps-head').styles(
      padding: .only(top: 56.px, bottom: 40.px),
    ),
    css('.apps-section').styles(
      border: .only(
        top: BorderSide(width: 1.px, color: hairline, style: .solid),
      ),
    ),
  ];
}
