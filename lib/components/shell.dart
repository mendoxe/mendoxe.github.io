import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/profile.dart';
import '../site_config.dart';
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
    main_(id: 'content', classes: 'wrap', [child]),
    const SiteFooter(),
  ]);
}

class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});
  @override
  Component build(BuildContext context) => footer(id: 'contact', classes: 'site-footer wrap', [
    div([
      if (Profile.email.isNotEmpty)
        a(href: 'mailto:${Profile.email}', classes: 'footer-name', [.text(Profile.email)])
      else
        span(classes: 'footer-name', [.text('Contact details coming soon')]),
    ]),
    div(classes: 'footer-links', [
      if (Profile.email.isNotEmpty) a(href: 'mailto:${Profile.email}', [.text('Email')]),
      if (Profile.github.isNotEmpty) a(href: Profile.github, [.text('GitHub')]),
      if (Profile.linkedin.isNotEmpty) a(href: Profile.linkedin, [.text('LinkedIn')]),
      a(href: siteUrl('cv/'), [.text('Curriculum vitae')]),
    ]),
    span(classes: 'stack-caption', [.text('© ${DateTime.now().year} Lukas Simon · Built with Jaspr · GitHub Pages')]),
  ]);
}
