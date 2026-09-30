import 'dart:io';

import 'package:personal_site/site_config.dart';

import 'generate_cv.dart';
import 'preview.dart';
import 'verify_build.dart';

Future<void> main(List<String> arguments) async {
  try {
    final command = arguments.isEmpty ? 'help' : arguments.first;
    final baseOption = arguments.where((a) => a.startsWith('--base=')).firstOrNull;
    final storedBase = File('build/site-base.txt');
    final base = normalizeBase(
      baseOption?.substring(7) ??
          (command == 'preview' && storedBase.existsSync() ? storedBase.readAsStringSync() : '/'),
    );
    final unknown = arguments.skip(1).where((a) => !a.startsWith('--base=')).toList();
    if (unknown.isNotEmpty) throw ArgumentError('Unknown options: ${unknown.join(', ')}');
    switch (command) {
      case 'dev':
        await generateCv();
        await _dart(['run', 'jaspr_cli:jaspr', 'serve', '--dart-define=SITE_BASE=$base']);
      case 'build':
        await generateCv();
        await _dart(['run', 'jaspr_cli:jaspr', 'build', '--port=8081', '--dart-define=SITE_BASE=$base']);
        await File('build/jaspr/404/index.html').copy('build/jaspr/404.html');
        await File('build/jaspr/.nojekyll').writeAsString('');
        await storedBase.writeAsString(base);
        await verifyBuild(base);
      case 'check':
        await _dart(['format', '--output=none', '--set-exit-if-changed', 'lib', 'tool', 'test']);
        await _dart(['analyze']);
        await _dart(['test']);
      case 'preview':
        await preview(base);
      case 'cv':
        await generateCv();
      case 'deploy':
        // Dispatch the already-pushed master branch. Never stage/commit/push implicitly.
        await _run('gh', ['workflow', 'run', 'pages.yml', '--ref', 'master']);
        stdout.writeln('Deployment requested for remote master. Track it with gh run list.');
      case 'help':
        stdout.writeln('''Personal site · Dart CLI

  dart run tool/site.dart dev                 Develop with Jaspr hot reload
  dart run tool/site.dart check               Format, analyze, test
  dart run tool/site.dart build               Generate CV + static site + verify
  dart run tool/site.dart build --base=/repo/  Build for a project Pages URL
  dart run tool/site.dart preview             Serve the last build, including 404s
  dart run tool/site.dart cv                  Regenerate the PDF only
  dart run tool/site.dart deploy              Redeploy remote master via GitHub CLI

Run from the repository root. Push to master to deploy changes automatically.
Deploy needs GitHub CLI authentication and Settings → Pages → GitHub Actions.''');
      default:
        throw ArgumentError('Unknown command: $command. Run dart run tool/site.dart help');
    }
  } catch (error) {
    stderr.writeln(error);
    exitCode = 1;
  }
}

Future<void> _dart(List<String> args) => _run(Platform.resolvedExecutable, args);
Future<void> _run(String executable, List<String> args) async {
  final process = await Process.start(executable, args, mode: ProcessStartMode.inheritStdio);
  final code = await process.exitCode;
  if (code != 0) throw ProcessException(executable, args, 'Command failed', code);
}
