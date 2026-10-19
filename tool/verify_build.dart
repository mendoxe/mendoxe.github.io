import 'dart:io';

import 'package:html/parser.dart' show parse;

import 'package:personal_site/content/apps.dart';

Future<void> verifyBuild(String base) async {
  final root = Directory('build/jaspr');
  final expected = [
    'index.html',
    'cv/index.html',
    'services/index.html',
    'about/index.html',
    'apps/index.html',
    '404.html',
    for (final app in personalApps) ...[
      '${app.path}index.html',
      '${app.path}privacy/index.html',
      '${app.path}terms/index.html',
    ],
  ];
  final failures = <String>[];
  final fragmentIds = <String, Set<String>>{};
  for (final path in expected) {
    final file = File('${root.path}/$path');
    if (!file.existsSync()) {
      failures.add('Missing $path');
      continue;
    }
    final document = parse(await file.readAsString());
    fragmentIds[path] = document.querySelectorAll('[id]').map((element) => element.id).toSet();
    if (document.querySelectorAll('h1').length != 1) failures.add('$path needs one h1');
    if (document.querySelector('main') == null) failures.add('$path has no main landmark');
    if (document.querySelector('title')?.text.trim().isEmpty ?? true) failures.add('$path has no title');
    if (document.querySelector('base')?.attributes['href'] != base) failures.add('$path has incorrect base');
    for (final element in document.querySelectorAll('[href], [src]')) {
      final value = element.attributes['href'] ?? element.attributes['src']!;
      final uri = Uri.parse(value);
      if (uri.hasScheme || value.startsWith('//')) continue;
      if (value.startsWith('#')) {
        if (document.getElementById(uri.fragment) == null) failures.add('$path: missing fragment $value');
        continue;
      }
      if (element.localName == 'base') continue;
      final resolved = Uri.parse('https://preview.invalid$base').resolve(value).path;
      if (!resolved.startsWith(base)) {
        failures.add('$path escapes base: $value');
        continue;
      }
      var target = resolved.substring(base.length);
      if (target.isEmpty || target.endsWith('/')) target += 'index.html';
      final targetFile = File('${root.path}/$target');
      if (!targetFile.existsSync()) {
        failures.add('$path: missing $value');
        continue;
      }
      if (uri.hasFragment) {
        final ids = fragmentIds.putIfAbsent(
          target,
          () => parse(targetFile.readAsStringSync()).querySelectorAll('[id]').map((element) => element.id).toSet(),
        );
        if (!ids.contains(uri.fragment)) failures.add('$path: missing fragment $value');
      }
    }
  }
  final pdf = await File('${root.path}/downloads/lukas-simon-cv.pdf').readAsBytes();
  if (String.fromCharCodes(pdf.take(5)) != '%PDF-') failures.add('CV is not a PDF');
  if (failures.isNotEmpty) throw StateError(failures.join('\n'));
  stdout.writeln('Verified ${expected.length} pages, local links, assets, landmarks, and CV download.');
}
