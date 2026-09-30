import 'dart:io';

Future<void> preview(String base, {int port = 8080}) async {
  final root = Directory('build/jaspr').absolute;
  if (!root.existsSync()) throw StateError('Build first: dart run tool/site.dart build');
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
  stdout.writeln('Preview: http://localhost:$port$base (Ctrl+C to stop)');
  await for (final request in server) {
    try {
      final urlPath = request.uri.path;
      if (base != '/' && urlPath == base.substring(0, base.length - 1)) {
        request.response.redirect(Uri(path: base));
        await request.response.close();
        continue;
      }
      final segments = request.uri.pathSegments;
      final safe = urlPath.startsWith(base) && !segments.any((s) => s == '..' || s.contains('\\'));
      var relative = safe ? urlPath.substring(base.length) : '__not_found__';
      var file = File('${root.path}/$relative');
      if (safe && Directory(file.path).existsSync() && !urlPath.endsWith('/')) {
        request.response.redirect(Uri(path: '$urlPath/'));
        await request.response.close();
        continue;
      }
      if (relative.isEmpty || relative.endsWith('/')) relative += 'index.html';
      file = File('${root.path}/$relative');
      if (!safe || !file.existsSync()) {
        file = File('${root.path}/404.html');
        request.response.statusCode = HttpStatus.notFound;
      }
      final extension = file.path.split('.').last;
      request.response.headers.set('Content-Type', switch (extension) {
        'html' => 'text/html; charset=utf-8',
        'css' => 'text/css; charset=utf-8',
        'js' => 'text/javascript; charset=utf-8',
        'svg' => 'image/svg+xml',
        'ttf' => 'font/ttf',
        'pdf' => 'application/pdf',
        _ => 'application/octet-stream',
      });
      await file.openRead().pipe(request.response);
    } catch (error) {
      stderr.writeln(error);
      await request.response.close();
    }
  }
}
