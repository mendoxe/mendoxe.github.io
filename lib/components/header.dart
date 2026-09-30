import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../site_config.dart';
import '../content/profile.dart';

class Header extends StatelessComponent {
  const Header(this.current, {super.key});
  final String current;
  @override
  Component build(BuildContext context) => header(classes: 'site-header wrap', [
    a(
      href: siteUrl(''),
      classes: 'wordmark',
      attributes: {'aria-label': 'Lukas Simon — home'},
      [
        img(src: siteUrl('images/hero-image.jpg'), alt: '', classes: 'header-avatar', width: 28, height: 28),
        .text('Lukas Simon'),
      ],
    ),
    nav(
      classes: 'desktop-navigation',
      attributes: {'aria-label': 'Main navigation'},
      [
        for (final item in [('Work', '#work'), ('Services', '#services'), ('About', '#about')])
          a(
            href: siteUrl(item.$2),
            classes: current == item.$1 ? 'active' : null,
            attributes: {if (current == item.$1) 'aria-current': 'page'},
            [.text(item.$1)],
          ),
      ],
    ),
    a(href: 'mailto:${Profile.email}', classes: 'header-contact', [.text('Get in touch')]),
    details(classes: 'mobile-navigation', [
      summary(attributes: {'aria-label': 'Open navigation'}, [.text('Menu')]),
      nav(
        attributes: {'aria-label': 'Mobile navigation'},
        [
          for (final item in [('Work', '#work'), ('Services', '#services'), ('About', '#about')])
            a(href: siteUrl(item.$2), [.text(item.$1)]),
        ],
      ),
    ]),
  ]);
}
