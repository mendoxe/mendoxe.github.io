// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:personal_site/components/app_artwork.dart' as _app_artwork;
import 'package:personal_site/components/hero_visual.dart' as _hero_visual;
import 'package:personal_site/pages/home.dart' as _home;
import 'package:personal_site/component_styles.dart' as _component_styles;
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
  styles: () => [
    ..._component_styles.componentStyles,
    ..._theme.theme,
    ..._app_artwork.AppArtwork.styles,
    ..._hero_visual.HeroVisual.styles,
    ..._home.HomePage.styles,
  ],
);
