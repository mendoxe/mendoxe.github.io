import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/portfolio.dart';
import '../content/profile.dart';
import '../site_config.dart';
import '../theme.dart';
import 'header.dart';

class SiteShell extends StatelessComponent {
  const SiteShell({required this.current, required this.path, required this.child, super.key});
  final String current;
  final String path;
  final Component child;
  @override
  Component build(BuildContext context) => .fragment([
    a(href: '${siteUrl(path)}#content', classes: 'skip-link', [.text('Skip to content')]),
    Header(current),
    main_(id: 'content', attributes: {'tabindex': '-1'}, [child]),
    const SiteFooter(),
  ]);
}

/// Every page ends with the way to get in touch.
class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});
  @override
  Component build(BuildContext context) => footer(id: 'contact', classes: 'site-footer', [
    div(classes: 'wrap', [
      p(classes: 'footer-intro', [.text(PortfolioCopy.contactIntro)]),
      a(href: 'mailto:${Profile.email}', classes: 'footer-email', [.text(Profile.email)]),
      div(classes: 'footer-meta', [
        span([.text('© ${DateTime.now().year} ${Profile.name}')]),
        div(classes: 'footer-links', [
          a(href: Profile.github, [.text('GitHub')]),
          a(href: Profile.linkedin, [.text('LinkedIn')]),
          a(href: siteUrl('cv/'), [.text('CV')]),
        ]),
      ]),
    ]),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.site-footer').styles(
      padding: .only(top: .expression('clamp(48px, 7vw, 80px)'), bottom: 32.px),
      color: foreground,
      backgroundColor: deep,
    ),
    css('.footer-intro').styles(
      maxWidth: 30.em,
      margin: .only(bottom: 16.px),
      color: muted,
    ),
    css('.footer-email').styles(
      display: .inlineBlock,
      fontSize: .expression('clamp(20px, 2.4vw, 28px)'),
      fontWeight: .w700,
      raw: {'letter-spacing': '-0.015em', 'overflow-wrap': 'anywhere'},
    ),
    css('.footer-meta').styles(
      display: .flex,
      padding: .only(top: 20.px),
      margin: .only(top: .expression('clamp(40px, 6vw, 64px)')),
      border: .only(
        top: BorderSide(width: 1.px, color: hairline, style: .solid),
      ),
      flexWrap: .wrap,
      justifyContent: .spaceBetween,
      gap: .all(16.px),
      color: muted,
      fontSize: 15.px,
    ),
    css('.footer-links').styles(display: .flex, gap: .all(24.px)),
  ];
}
