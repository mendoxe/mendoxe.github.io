import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/app_card.dart';
import '../components/app_artwork.dart';
import '../components/ui.dart';
import '../content/apps.dart';
import '../site_config.dart';

class AppPage extends StatelessComponent {
  const AppPage(this.app, {super.key});
  final PersonalApp app;
  @override
  Component build(BuildContext context) => section(classes: 'page-section product-page', [
    a(href: siteUrl('apps/'), classes: 'text-link', [.text('All apps')]),
    div(classes: 'product-heading', [
      AppIcon(app),
      span([.text(app.name)]),
    ]),
    PageIntro(eyebrow: app.category, title: app.tagline, description: app.description),
    p(classes: 'release-note', [.text(app.releaseNote)]),
    AppArtwork(app),
    div(classes: 'feature-grid', [
      for (var i = 0; i < app.features.length; i++)
        article(classes: 'feature', [
          h2([.text(app.features[i].$1)]),
          p([.text(app.features[i].$2)]),
        ]),
    ]),
    const SectionHeading('App information'),
    div(classes: 'legal-links', [
      a(href: siteUrl('${app.path}privacy/'), [
        .text('Privacy policy'),
      ]),
      a(href: siteUrl('${app.path}terms/'), [
        .text('Terms & conditions'),
      ]),
    ]),
  ]);
}

class LegalPage extends StatelessComponent {
  const LegalPage(this.app, {required this.isPrivacy, super.key});
  final PersonalApp app;
  final bool isPrivacy;
  @override
  Component build(BuildContext context) => section(classes: 'page-section legal-page', [
    a(href: siteUrl(app.path), classes: 'text-link', [.text('Back to ${app.name}')]),
    PageIntro(
      eyebrow: '${app.name.toUpperCase()} / LEGAL',
      title: isPrivacy ? 'Privacy policy' : 'Terms & conditions',
      description: 'This page is being prepared.',
    ),
    p(classes: 'notice', [.text('Not yet published. This is a placeholder, not an active legal document.')]),
    p([
      .text(
        isPrivacy
            ? 'The privacy policy will explain what information the app handles, why it is needed, and how to get in touch about your data.'
            : 'The terms will explain the conditions for using the app, including availability, acceptable use, and support.',
      ),
    ]),
  ]);
}
