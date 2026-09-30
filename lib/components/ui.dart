import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../site_config.dart';

class Eyebrow extends StatelessComponent {
  const Eyebrow(this.label, {super.key});
  final String label;
  @override
  Component build(BuildContext context) => p(classes: 'eyebrow', [.text(label)]);
}

class ActionLink extends StatelessComponent {
  const ActionLink(this.label, this.path, {this.primary = false, this.download, super.key});
  final String label, path;
  final String? download;
  final bool primary;
  @override
  Component build(BuildContext context) => a(
    href: siteUrl(path),
    download: download,
    classes: 'button ${primary ? 'primary' : 'secondary'}',
    [.text(label)],
  );
}

class PageIntro extends StatelessComponent {
  const PageIntro({required this.eyebrow, required this.title, required this.description, super.key});
  final String eyebrow, title, description;
  @override
  Component build(BuildContext context) => div(classes: 'page-intro', [
    Eyebrow(eyebrow),
    h1([
      for (final (index, line) in title.split('\n').indexed) ...[
        if (index > 0) br(),
        .text(line),
      ],
    ]),
    p(classes: 'lead', [.text(description)]),
  ]);
}

class SectionHeading extends StatelessComponent {
  const SectionHeading(this.title, {this.trailing, super.key});
  final String title;
  final Component? trailing;
  @override
  Component build(BuildContext context) => div(classes: 'section-heading', [
    div(classes: 'section-title', [
      h2([.text(title)]),
    ]),
    if (trailing != null) trailing!,
  ]);
}
