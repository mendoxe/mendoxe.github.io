import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/ui.dart';

class NotFoundPage extends StatelessComponent {
  const NotFoundPage({super.key});
  @override
  Component build(BuildContext context) => section(classes: 'page-section', [
    const PageIntro(
      eyebrow: '404 / A WRONG TURN',
      title: 'Nothing here. Yet.',
      description: 'This page may have moved. Check the address or return to the homepage.',
    ),
    const ActionLink('Back to home', '', primary: true),
  ]);
}
