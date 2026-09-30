import 'dart:io';

/// One-time asset maintenance. Normal builds use the committed local font.
Future<void> main() async {
  final client = HttpClient();
  try {
    for (final asset in {
      'Manrope.ttf': 'Manrope%5Bwght%5D.ttf',
      'OFL.txt': 'OFL.txt',
    }.entries) {
      final uri = Uri.parse('https://raw.githubusercontent.com/google/fonts/main/ofl/manrope/${asset.value}');
      final response = await (await client.getUrl(uri)).close();
      if (response.statusCode != 200) throw HttpException('Font fetch: ${response.statusCode}', uri: uri);
      final file = File('web/fonts/${asset.key}');
      await file.parent.create(recursive: true);
      await response.pipe(file.openWrite());
      stdout.writeln('Saved ${file.path}');
    }
  } finally {
    client.close();
  }
}
