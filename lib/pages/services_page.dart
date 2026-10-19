import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/services.dart';
import '../theme.dart';

class ServicesPage extends StatelessComponent {
  const ServicesPage({super.key});
  @override
  Component build(BuildContext context) => const ServicesSection(standalone: true);
}

class ServicesSection extends StatelessComponent {
  const ServicesSection({this.standalone = false, super.key});
  final bool standalone;
  @override
  Component build(BuildContext context) => section(id: 'services', classes: 'services', [
    div(classes: 'section wrap', [
      div(classes: 'section-head', [
        if (standalone) h1([.text('Services')]) else h2([.text('Services')]),
      ]),
      div(classes: 'service-list', [
        for (final (title, description, items) in services)
          article(classes: 'service', [
            if (standalone) h2([.text(title)]) else h3([.text(title)]),
            div([
              p([.text(description)]),
              ul([
                for (final item in items) li([.text(item)]),
              ]),
            ]),
          ]),
      ]),
    ]),
  ]);

  @css
  static List<StyleRule> get styles => [
    css('.services').styles(backgroundColor: wash),
    css('.service').styles(
      display: .grid,
      padding: .symmetric(vertical: 32.px),
      border: .only(
        top: BorderSide(width: 1.px, color: hairline, style: .solid),
      ),
      gridTemplate: GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))])),
      gap: .all(.expression('clamp(16px, 4vw, 64px)')),
    ),
    css('.service h2, .service h3').styles(fontSize: 24.px, raw: {'letter-spacing': '-0.015em'}),
    css('.service p').styles(maxWidth: 32.em),
    css('.service ul').styles(
      display: .flex,
      margin: .only(top: 16.px),
      flexWrap: .wrap,
      gap: .all(8.px),
      listStyle: .none,
    ),
    css('.service li').styles(
      padding: .symmetric(vertical: 4.px, horizontal: 12.px),
      border: .all(width: 1.px, color: hairline),
      radius: .circular(999.px),
      color: muted,
      fontSize: 15.px,
      backgroundColor: background,
    ),
    css.media(MediaQuery.screen(maxWidth: 720.px), [
      css('.service').styles(gridTemplate: GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))]))),
    ]),
  ];
}
