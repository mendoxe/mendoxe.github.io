import 'package:jaspr/dom.dart';

const ink = Color('#111114');
const surface = Color('#1b1b20');
const borderColor = Color('#29292f');
const foreground = Color('#f0f0ec');
const muted = Color('#a0a0a9');
const blue = Color('#687cff');

GridTracks columns(int count) => GridTracks(List.generate(count, (_) => const GridTrack(TrackSize.fr(1))));

/// Shared design tokens and document styles. Component decoration lives separately.
@css
List<StyleRule> get theme => [
  css('@font-face').styles(
    raw: {
      'font-family': 'Manrope',
      'src': 'url("fonts/Manrope.ttf") format("truetype")',
      'font-weight': '200 800',
      'font-display': 'swap',
    },
  ),
  css('*').styles(boxSizing: .borderBox),
  css('html').styles(backgroundColor: ink, raw: {'color-scheme': 'dark'}),
  css('body').styles(
    margin: .zero,
    color: foreground,
    fontFamily: .list([FontFamily('Manrope'), FontFamilies.sansSerif]),
    fontSize: 15.px,
    lineHeight: 1.7.em,
    backgroundColor: ink,
  ),
  css('a').styles(color: .inherit, textDecoration: .none),
  css('a, button, summary').styles(raw: {'-webkit-tap-highlight-color': 'transparent'}),
  css('a:focus-visible, summary:focus-visible').styles(
    outline: Outline(color: blue, width: OutlineWidth(2.px), style: .solid),
    raw: {'outline-offset': '6px'},
  ),
  css('::selection').styles(color: ink, backgroundColor: blue),
  css('h1, h2, h3, p').styles(margin: .zero),
  css('h1, h2, h3').styles(fontWeight: .w600, lineHeight: 1.15.em),
  css('h1').styles(fontSize: .expression('clamp(2.6rem, 5vw, 4.5rem)'), letterSpacing: (-3).px),
  css('h2').styles(fontSize: 24.px, letterSpacing: (-0.7).px),
  css('h3').styles(fontSize: 25.px, letterSpacing: (-0.7).px),
  css('.wrap').styles(
    width: .expression('min(1120px, calc(100% - 144px))'),
    margin: .symmetric(horizontal: .auto),
  ),
  css('.muted, .quiet-note').styles(color: muted),
  css('.accent').styles(color: blue),
  css('.eyebrow').styles(
    margin: .only(bottom: 25.px),
    color: muted,
    fontFamily: FontFamilies.monospace,
    fontSize: 10.px,
    fontWeight: .w400,
    letterSpacing: 1.2.px,
  ),
  css('.lead').styles(maxWidth: 570.px, color: muted, fontSize: 17.px, lineHeight: 1.85.em),
  css('.text-link').styles(color: muted, fontSize: 13.px),
  css('.text-link:hover, .footer-links a:hover').styles(color: blue),
  css('.actions, .cv-toolbar').styles(display: .flex, flexWrap: .wrap, alignItems: .center, gap: .all(12.px)),
  css('.button').styles(
    display: .inlineFlex,
    minHeight: 48.px,
    padding: .symmetric(vertical: 12.px, horizontal: 21.px),
    border: .all(width: 1.px, color: borderColor),
    radius: .circular(40.px),
    transition: Transition('background-color', duration: 180.ms),
    alignItems: .center,
    gap: .all(22.px),
    fontSize: 13.px,
    fontWeight: .w600,
  ),
  css('.button.primary').styles(
    border: .all(width: 1.px, color: blue),
    color: ink,
    backgroundColor: blue,
  ),
  css('.button.primary:hover').styles(backgroundColor: const Color('#bfd5ff')),
  css('.button.secondary:hover').styles(backgroundColor: surface),
  css('.section-block').styles(
    padding: .symmetric(vertical: 48.px),
    border: .only(
      top: BorderSide(width: 1.px, color: borderColor, style: .solid),
    ),
  ),
  css('.section-heading, .section-title').styles(display: .flex, alignItems: .center, gap: .all(18.px)),
  css('.section-heading').styles(
    margin: .only(bottom: 30.px),
    justifyContent: .spaceBetween,
  ),
  css('.section-heading h2').styles(fontSize: 28.px),
  css('.index').styles(color: muted, fontFamily: FontFamilies.monospace, fontSize: 11.px),
  css('.app-grid, .feature-grid').styles(
    display: .grid,
    gridTemplate: GridTemplate(columns: columns(3)),
    gap: .all(18.px),
  ),
  css('.page-section').styles(
    minHeight: 65.vh,
    padding: .only(top: 70.px, bottom: 90.px),
  ),
  css('.page-intro').styles(margin: .only(bottom: 44.px)),
  css('.page-intro h1').styles(
    margin: .only(bottom: 24.px),
  ),
  css('.page-intro .lead').styles(maxWidth: 690.px),
  css('.quiet-note').styles(
    margin: .only(top: 34.px),
    fontSize: 13.px,
  ),
  css('.tag-list').styles(
    display: .flex,
    margin: .only(top: 24.px, bottom: 28.px),
    flexWrap: .wrap,
    gap: .all(8.px),
  ),
  css('.tag').styles(
    padding: .symmetric(vertical: 5.px, horizontal: 13.px),
    border: .all(width: 1.px, color: borderColor),
    radius: .circular(5.px),
    color: muted,
    fontSize: 12.px,
  ),
  css('.notice').styles(
    padding: .all(18.px),
    margin: .symmetric(vertical: 32.px),
    border: .only(
      left: BorderSide(color: blue, width: 2.px, style: .solid),
    ),
    color: muted,
    fontSize: 13.px,
    backgroundColor: surface,
  ),
  css('.blue-dot')
      .styles(display: .inlineBlock, width: 6.px, height: 6.px, radius: .circular(50.percent), backgroundColor: blue),
  css('.skip-link').styles(
    position: .absolute(top: (-100).px, left: 20.px),
    zIndex: const ZIndex(10),
    padding: .all(12.px),
    color: ink,
    backgroundColor: blue,
  ),
  css('.skip-link:focus').styles(
    position: .absolute(top: 12.px, left: 20.px),
  ),
  css.media(MediaQuery.screen(maxWidth: 800.px), [
    css('.wrap').styles(width: .expression('calc(100% - 48px)')),
    css('.app-grid, .feature-grid').styles(gridTemplate: GridTemplate(columns: columns(1))),
    css('h1').styles(letterSpacing: (-1.7).px),
    css('.page-section').styles(padding: .symmetric(vertical: 48.px)),
    css('.section-heading').styles(alignItems: .start, gap: .all(12.px)),
    css('.section-heading h2').styles(fontSize: 18.px),
    css('.section-title').styles(gap: .all(10.px)),
    css('.text-link').styles(whiteSpace: .noWrap),
  ]),
];
