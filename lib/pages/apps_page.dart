import 'package:jaspr/jaspr.dart';

import 'home.dart';

class AppsPage extends StatelessComponent {
  const AppsPage({super.key});
  @override
  Component build(BuildContext context) => const AppsSection(standalone: true);
}
