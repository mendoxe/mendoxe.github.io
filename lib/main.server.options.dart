// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:personal_site/components/app_band.dart' as _app_band;
import 'package:personal_site/components/header.dart' as _header;
import 'package:personal_site/components/shell.dart' as _shell;
import 'package:personal_site/pages/about_page.dart' as _about_page;
import 'package:personal_site/pages/app_page.dart' as _app_page;
import 'package:personal_site/pages/cv_page.dart' as _cv_page;
import 'package:personal_site/pages/home.dart' as _home;
import 'package:personal_site/pages/not_found_page.dart' as _not_found_page;
import 'package:personal_site/pages/services_page.dart' as _services_page;
import 'package:personal_site/theme.dart' as _theme;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _header.Header: ClientTarget<_header.Header>(
      'header',
      params: __headerHeader,
    ),
  },
  styles: () => [
    ..._theme.theme,
    ..._app_band.AppBand.styles,
    ..._header.Header.styles,
    ..._shell.SiteFooter.styles,
    ..._about_page.AboutSection.styles,
    ..._app_page.AppPage.styles,
    ..._app_page.LegalPage.styles,
    ..._cv_page.CvPage.styles,
    ..._home.AppsSection.styles,
    ..._home.HomeHero.styles,
    ..._not_found_page.NotFoundPage.styles,
    ..._services_page.ServicesSection.styles,
  ],
);

Map<String, Object?> __headerHeader(_header.Header c) => {'current': c.current};
