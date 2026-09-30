/// A trailing slash is essential for project Pages and nested routes.
String normalizeBase(String value) {
  final segments = value.split('/').where((s) => s.isNotEmpty).toList();
  if (segments.any((s) => !RegExp(r'^[a-zA-Z0-9._-]+$').hasMatch(s) || s == '.' || s == '..')) {
    throw ArgumentError.value(value, 'base', 'Expected a URL path, for example /personal-site/');
  }
  return segments.isEmpty ? '/' : '/${segments.join('/')}/';
}

final siteBase = normalizeBase(const String.fromEnvironment('SITE_BASE', defaultValue: '/'));
String siteUrl(String path) => '$siteBase${path.replaceFirst(RegExp(r'^/+'), '')}';
