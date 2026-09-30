import 'dart:io';

import 'site.dart' as site;

/// Keep CI logic in Dart; YAML is only GitHub's required workflow declaration.
Future<void> main() => site.main(['build', '--base=${Platform.environment['SITE_BASE'] ?? '/'}']);
