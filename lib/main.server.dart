import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'content/profile.dart';
import 'main.server.options.dart';
import 'site_config.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);
  runApp(
    Document(
      title: 'Lukas Simon',
      lang: 'en',
      base: siteBase,
      head: [
        meta(name: 'description', content: Profile.introduction),
        meta(name: 'theme-color', content: '#101215'),
        meta(name: 'color-scheme', content: 'dark'),
        link(href: siteUrl('favicon.svg'), rel: 'icon', type: 'image/svg+xml'),
        link(
          href: siteUrl('fonts/Manrope.ttf'),
          rel: 'preload',
          as: 'font',
          type: 'font/ttf',
          attributes: {'crossorigin': ''},
        ),
      ],
      body: const App(),
    ),
  );
}
