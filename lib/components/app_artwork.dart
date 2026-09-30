import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/apps.dart';
import '../theme.dart';

/// Graphic identities for the projects; deliberately not fabricated screenshots.
class AppArtwork extends StatelessComponent {
  const AppArtwork(this.app, {super.key});
  final PersonalApp app;
  @override
  Component build(BuildContext context) => div(
    classes: 'app-art art-${app.slug}',
    attributes: {'aria-hidden': 'true'},
    [
      div(classes: 'concept-window', [
        div(classes: 'concept-toolbar', [span([]), span([]), span([])]),
        div(classes: 'concept-content', [
          switch (app.slug) {
            'toolbox' => div(classes: 'tool-grid', [
              for (final shape in ['square', 'circle', 'cross', 'bars']) div(classes: 'tool-shape shape-$shape', []),
            ]),
            'travelo' => div(classes: 'travel-globe', [
              div(classes: 'globe-equator', []),
              div(classes: 'globe-meridian', []),
              div(classes: 'globe-orbit', []),
              div(classes: 'globe-point', []),
            ]),
            _ => div(classes: 'code-grid', [
              for (var i = 0; i < 16; i++) span(classes: 'code-dot dot-${i % 4} ${i < 4 ? 'solved' : ''}', []),
            ]),
          },
        ]),
      ]),
    ],
  );

  @css
  static List<StyleRule> get styles => [
    css('.app-art').styles(
      display: .flex,
      position: .relative(),
      height: 240.px,
      overflow: .hidden,
      justifyContent: .center,
      alignItems: .center,
    ),
    css('.art-toolbox').styles(
      backgroundColor: const Color('#183d7b'),
      raw: {'background-image': 'linear-gradient(135deg, #29292f, #24242b)'},
    ),
    css('.art-travelo').styles(
      backgroundColor: const Color('#164b51'),
      raw: {'background-image': 'linear-gradient(135deg, #1d2d2b, #192724)'},
    ),
    css('.art-code-breaker').styles(
      backgroundColor: const Color('#3b315a'),
      raw: {'background-image': 'linear-gradient(135deg, #22263d, #1c2135)'},
    ),
    css('.concept-window').styles(
      position: .relative(),
      width: 76.percent,
      height: 210.px,
      padding: .all(14.px),
      border: .all(width: 6.px, color: const Color('#33333b')),
      radius: .circular(16.px),
      transform: .translate(y: 26.px),
      backgroundColor: surface,
    ),
    css('.art-code-breaker .concept-window').styles(width: 138.px, height: 250.px, radius: .circular(22.px)),
    css('.concept-toolbar').styles(
      display: .flex,
      margin: .only(bottom: 20.px),
      gap: .all(5.px),
    ),
    css('.concept-toolbar span')
        .styles(width: 5.px, height: 5.px, radius: .circular(50.percent), backgroundColor: const Color('#60606c')),
    css('.concept-content').styles(display: .flex, justifyContent: .center, alignItems: .center),
    css('.tool-grid').styles(
      display: .grid,
      width: 180.px,
      height: 135.px,
      gridTemplate: GridTemplate(columns: columns(2)),
      gap: .all(12.px),
    ),
    css('.tool-shape').styles(
      position: .relative(),
      border: .all(width: 2.px, color: const Color('#7b87ce')),
      radius: .circular(9.px),
    ),
    css('.shape-circle').styles(radius: .circular(12.px), backgroundColor: blue),
    css('.shape-cross').styles(
      border: .none,
      backgroundColor: const Color('#639cff'),
      raw: {
        'clip-path':
            'polygon(35% 0,65% 0,65% 35%,100% 35%,100% 65%,65% 65%,65% 100%,35% 100%,35% 65%,0 65%,0 35%,35% 35%)',
      },
    ),
    css('.shape-bars').styles(
      border: .none,
      radius: .circular(0.px),
      raw: {'background': 'repeating-linear-gradient(0deg, #b4d1ff 0 10px, transparent 10px 24px)'},
    ),
    css('.travel-globe').styles(
      position: .relative(),
      width: 120.px,
      height: 120.px,
      border: .all(width: 2.px, color: const Color('#9cddd8')),
      radius: .circular(50.percent),
      transform: .rotate((-22).deg),
    ),
    css('.globe-equator').styles(
      position: .absolute(top: 49.percent, left: 0.px, right: 0.px),
      height: 1.px,
      backgroundColor: const Color('#9cddd8'),
    ),
    css('.globe-meridian').styles(
      position: .absolute(top: 0.px, bottom: 0.px, left: 37.px, right: 37.px),
      border: .all(width: 1.px, color: const Color('#9cddd8')),
      radius: .circular(50.percent),
    ),
    css('.globe-orbit').styles(
      position: .absolute(top: 29.px, left: (-32).px),
      width: 210.px,
      height: 88.px,
      border: .all(width: 2.px, color: const Color('#61b8b1')),
      radius: .circular(50.percent),
      transform: .rotate((-20).deg),
    ),
    css('.globe-point').styles(
      position: .absolute(top: 29.px, right: (-21).px),
      width: 13.px,
      height: 13.px,
      radius: .circular(50.percent),
      backgroundColor: const Color('#d1f5e9'),
    ),
    css('.code-grid').styles(
      display: .grid,
      width: 90.px,
      gridTemplate: GridTemplate(columns: columns(4)),
      gap: .all(6.px),
    ),
    css('.code-dot').styles(
      width: 18.px,
      height: 18.px,
      border: .all(width: 1.px, color: const Color('#a597bc')),
      radius: .circular(50.percent),
    ),
    css('.code-dot.solved').styles(backgroundColor: blue),
    css('.code-dot.dot-1').styles(backgroundColor: const Color('#687cff')),
    css('.code-dot.dot-3').styles(backgroundColor: const Color('#d5d9ff')),
    css('.app-card .card-body').styles(display: .flex, padding: .all(26.px), flexDirection: .column, flex: .grow(1)),
    css('.app-card:focus-visible .app-art, .app-card:hover .app-art').styles(filter: .brightness(115)),
    css('.app-card .app-art').styles(transition: Transition('filter', duration: 180.ms)),
    css('.product-page > .app-art').styles(
      height: 340.px,
      margin: .only(top: 40.px),
      radius: .circular(10.px),
    ),
  ];
}
