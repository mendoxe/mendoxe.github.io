import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../site_config.dart';

/// Decorative devices with static skeleton screens, independent of product UI.
class HeroVisual extends StatelessComponent {
  const HeroVisual({super.key});
  @override
  Component build(BuildContext context) => div(
    classes: 'device-scene',
    attributes: {'aria-hidden': 'true'},
    [
      div(classes: 'device-canvas', [
        div(classes: 'device-laptop', [
          div(classes: 'laptop-lid', [const PlaceholderScreen(), span(classes: 'device-camera', [])]),
          div(classes: 'laptop-base', []),
        ]),
        div(classes: 'device-tablet', [const PlaceholderScreen(), span(classes: 'device-camera', [])]),
        div(classes: 'device-phone', [const PlaceholderScreen(), span(classes: 'device-camera', [])]),
      ]),
    ],
  );

  @css
  static List<StyleRule> get styles => [
    css('.device-scene').styles(
      position: .relative(),
      width: 100.percent,
      height: .auto,
      minWidth: 0.px,
      maxWidth: 470.px,
      aspectRatio: const AspectRatio(100, 90),
      margin: .symmetric(horizontal: .auto),
      raw: {'container-type': 'inline-size'},
    ),
    css('.device-canvas').styles(
      position: .absolute(top: 0.px, left: 0.px),
      width: 100.percent,
      height: 100.percent,
      fontSize: .expression('1cqw'),
    ),
    css('.device-laptop').styles(
      position: .absolute(top: 8.percent, right: 3.percent),
      width: 64.percent,
      height: .auto,
      aspectRatio: const AspectRatio(16, 10),
    ),
    css('.laptop-lid').styles(
      position: .absolute(top: 0.px, bottom: 1.4.em, left: 1.8.em, right: 1.8.em),
      border: .all(width: 0.3.em, color: const Color('#50505d')),
      radius: .circular(2.4.em),
      backgroundColor: const Color('#2c2c35'),
    ),
    css('.laptop-base').styles(
      position: .absolute(bottom: 0.px, left: 0.px, right: 0.px),
      height: 1.8.em,
      radius: .only(bottomLeft: Radius.circular(2.em), bottomRight: Radius.circular(2.em)),
      backgroundColor: const Color('#50505d'),
    ),
    css('.laptop-base::after').styles(
      content: '""',
      display: .block,
      width: 12.em,
      height: 0.7.em,
      margin: .symmetric(horizontal: .auto),
      radius: .only(bottomLeft: Radius.circular(0.7.em), bottomRight: Radius.circular(0.7.em)),
      backgroundColor: const Color('#222229'),
    ),
    css('.device-tablet').styles(
      position: .absolute(bottom: 12.percent, right: 12.percent),
      width: 43.percent,
      height: .auto,
      aspectRatio: const AspectRatio(3, 2),
      border: .all(width: 0.3.em, color: const Color('#50505d')),
      radius: .circular(3.em),
      backgroundColor: const Color('#2c2c35'),
    ),
    css('.device-phone').styles(
      position: .absolute(bottom: 12.percent, left: 3.percent),
      width: 25.percent,
      height: .auto,
      aspectRatio: const AspectRatio(100, 206),
      border: .all(width: 0.3.em, color: const Color('#50505d')),
      radius: .circular(4.4.em),
      backgroundColor: const Color('#2c2c35'),
    ),
    css('.device-phone, .device-tablet, .device-laptop').styles(
      filter: .dropShadow(offsetX: 0.px, offsetY: 2.em, spread: 2.4.em, color: const Color('#00000040')),
    ),
    css('.ambient-screen').styles(
      display: .flex,
      position: .absolute(top: 1.8.em, bottom: 1.2.em, left: 1.2.em, right: 1.2.em),
      padding: .all(2.4.em),
      radius: .circular(1.em),
      overflow: .hidden,
      flexDirection: .column,
      gap: .all(1.5.em),
      backgroundColor: const Color('#19191f'),
    ),
    css('.device-phone .ambient-screen').styles(
      position: .absolute(top: 1.em, bottom: 1.em, left: 1.em, right: 1.em),
      padding: .only(top: 5.em, bottom: 2.5.em, left: 2.em, right: 2.em),
      radius: .circular(3.2.em),
    ),
    css('.device-tablet .ambient-screen').styles(
      position: .absolute(top: 1.2.em, bottom: 1.2.em, left: 2.em, right: 1.2.em),
      radius: .circular(1.6.em),
    ),
    css('.skeleton-line').styles(
      display: .block,
      width: 70.percent,
      height: 0.8.em,
      radius: .circular(1.em),
      flex: .none,
      backgroundColor: const Color('#41414f'),
    ),
    css('.skeleton-title').styles(
      width: 45.percent,
      height: 1.3.em,
      margin: .only(bottom: 0.8.em),
      backgroundColor: const Color('#696b8d'),
    ),
    css('.skeleton-panel').styles(
      minHeight: 0.px,
      radius: .circular(1.3.em),
      flex: .grow(1),
      backgroundColor: const Color('#2c2e40'),
    ),
    css('.skeleton-row').styles(
      display: .flex,
      alignItems: .center,
      gap: .all(1.4.em),
      flex: .none,
    ),
    css('.skeleton-square').styles(
      width: 3.em,
      height: 3.em,
      radius: .circular(0.8.em),
      flex: .none,
      backgroundColor: const Color('#363744'),
    ),
    css('.skeleton-row .skeleton-line').styles(margin: .zero),
    css('.skeleton-row:nth-last-child(2) .skeleton-line').styles(width: 45.percent),
    css('.device-laptop .skeleton-row, .device-tablet .skeleton-row').styles(display: .none),
    css('.device-camera').styles(
      position: .absolute(top: 0.55.em, left: 50.percent),
      width: 0.6.em,
      height: 0.6.em,
      radius: .circular(50.percent),
      transform: .translate(x: (-50).percent),
      backgroundColor: const Color('#101015'),
    ),
    css('.device-tablet .device-camera').styles(
      position: .absolute(top: 50.percent, left: 0.65.em),
      transform: .translate(y: (-50).percent),
    ),
    css('.device-phone .device-camera').styles(
      position: .absolute(top: 1.9.em, left: 50.percent),
      width: 6.em,
      height: 1.4.em,
      radius: .circular(1.em),
    ),
  ];
}

class PlaceholderScreen extends StatelessComponent {
  const PlaceholderScreen({super.key});
  @override
  Component build(BuildContext context) => div(classes: 'ambient-screen', [
    span(classes: 'skeleton-line', []),
    span(classes: 'skeleton-line skeleton-title', []),
    div(classes: 'skeleton-panel', []),
    for (var i = 0; i < 3; i++)
      div(classes: 'skeleton-row', [span(classes: 'skeleton-square', []), span(classes: 'skeleton-line', [])]),
  ]);
}

class AboutPortrait extends StatelessComponent {
  const AboutPortrait({super.key});
  @override
  Component build(BuildContext context) => div(classes: 'portrait-placeholder', [
    img(
      src: siteUrl('images/profile-image.jpg'),
      alt: 'Lukas Simon by a lake',
      classes: 'about-photo',
      loading: .lazy,
      width: 1125,
      height: 1999,
    ),
  ]);
}
