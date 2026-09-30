import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/apps.dart';
import '../site_config.dart';
import 'app_artwork.dart';

class AppIcon extends StatelessComponent {
  const AppIcon(this.app, {super.key});
  final PersonalApp app;
  @override
  Component build(BuildContext context) =>
      span(classes: 'app-icon ${app.slug}', attributes: {'aria-hidden': 'true'}, [.text(app.symbol)]);
}

class AppCard extends StatelessComponent {
  const AppCard(this.app, {super.key});
  final PersonalApp app;
  @override
  Component build(BuildContext context) => a(href: siteUrl(app.path), classes: 'app-card', [
    div(classes: 'card-art-frame', [AppArtwork(app)]),
    div(classes: 'card-body', [
      div(classes: 'card-heading', [
        h3([.text(app.name)]),
        span(classes: 'category-pill', [.text(app.category.toLowerCase())]),
      ]),
      p(classes: 'card-description', [.text(app.description)]),
      span(classes: 'card-link', [.text('View ${app.name}')]),
    ]),
  ]);
}
