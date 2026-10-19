import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../site_config.dart';

class NotFoundPage extends StatelessComponent {
  const NotFoundPage({super.key});
  @override
  Component build(BuildContext context) => section(classes: 'wrap page-head not-found', [
    h1([.text('Page not found')]),
    p(classes: 'lead', [.text('The address may be mistyped, or the page has moved.')]),
    a(href: siteUrl(''), classes: 'button', [.text('Go to the home page')]),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.not-found').styles(minHeight: 60.vh),
    css('.not-found .lead').styles(margin: .only(bottom: 32.px)),
  ];
}
