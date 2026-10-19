import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/shell.dart';
import 'content/apps.dart';
import 'pages/app_page.dart';
import 'pages/apps_page.dart';
import 'pages/cv_page.dart';
import 'pages/home.dart';
import 'pages/services_page.dart';
import 'pages/about_page.dart';
import 'pages/not_found_page.dart';

class App extends StatelessComponent {
  const App({super.key});
  @override
  Component build(BuildContext context) => Router(
    routes: [
      _route('/', 'Lukas Simon', '', const HomePage()),
      _route('/apps', 'Apps — Lukas Simon', 'Apps', const AppsPage()),
      _route('/services', 'Services — Lukas Simon', 'Services', const ServicesPage()),
      _route('/about', 'About — Lukas Simon', 'About', const AboutPage()),
      _route('/cv', 'CV — Lukas Simon', 'CV', const CvPage()),
      for (final app in personalApps) ...[
        _route('/apps/${app.slug}', '${app.name} — Lukas Simon', 'Apps', AppPage(app)),
        _route('/apps/${app.slug}/privacy', 'Privacy policy — ${app.name}', 'Apps', LegalPage(app, isPrivacy: true)),
        _route('/apps/${app.slug}/terms', 'Terms of use — ${app.name}', 'Apps', LegalPage(app, isPrivacy: false)),
      ],
      _route('/404', 'Page not found — Lukas Simon', '', const NotFoundPage()),
    ],
  );
  Route _route(String path, String title, String current, Component page) => Route(
    path: path,
    title: title,
    builder: (_, _) => SiteShell(current: current, path: path == '/' ? '' : '$path/', child: page),
  );
}
