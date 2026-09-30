import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/app_card.dart';
import '../components/ui.dart';
import '../content/apps.dart';

class AppsPage extends StatelessComponent {
  const AppsPage({super.key});
  @override
  Component build(BuildContext context) => section(classes: 'page-section', [
    const PageIntro(
      eyebrow: 'INDEPENDENT PROJECTS',
      title: 'My apps.',
      description: 'Toolbox, Travelo, and Code breaker. Find out about each project, along with its latest information and documentation.',
    ),
    div(classes: 'app-grid', [for (final app in personalApps) AppCard(app)]),
  ]);
}
