import 'package:jaspr/dom.dart';

const background = Color('#0f1526');
const foreground = Color('#eef1f8');
const muted = Color('#9aa3bb');
const hairline = Color('#253049');
const wash = Color('#151c30');
const deep = Color('#090d18');

const displayTracking = '-0.035em';

/// Shared tokens, type scale and document styles. Component styles live with their components.
@css
List<StyleRule> get theme => [
  css('@font-face').styles(
    raw: {
      'font-family': 'Schibsted Grotesk',
      'src': 'url("fonts/SchibstedGrotesk.ttf") format("truetype")',
      'font-weight': '400 900',
      'font-display': 'swap',
    },
  ),
  css('*').styles(boxSizing: .borderBox),
  css('html').styles(
    backgroundColor: background,
    raw: {'color-scheme': 'dark', '--header-height': '72px', 'scroll-padding-top': 'var(--header-height)'},
  ),
  css('body').styles(
    margin: .zero,
    color: foreground,
    fontFamily: .list([FontFamily('Schibsted Grotesk'), FontFamilies.sansSerif]),
    fontSize: 18.px,
    lineHeight: 1.55.em,
    backgroundColor: background,
    raw: {'-webkit-font-smoothing': 'antialiased', 'text-rendering': 'optimizeLegibility'},
  ),
  css('h1, h2, h3, p, ul, ol, dl, dd, figure').styles(margin: .zero),
  css('ul, ol').styles(padding: .zero),
  css('h1, h2, h3').styles(fontWeight: .w700, lineHeight: 1.1.em, raw: {'text-wrap': 'balance'}),
  css('h1').styles(
    fontSize: .expression('clamp(48px, 8vw, 88px)'),
    fontWeight: .w800,
    lineHeight: 0.95.em,
    raw: {'letter-spacing': displayTracking},
  ),
  css('h2').styles(fontSize: .expression('clamp(32px, 4.4vw, 48px)'), raw: {'letter-spacing': '-0.025em'}),
  css('h3').styles(fontSize: 24.px, raw: {'letter-spacing': '-0.015em'}),
  css('p').styles(raw: {'text-wrap': 'pretty'}),
  css('a').styles(
    color: .inherit,
    textDecoration: TextDecoration(line: .underline),
    raw: {'text-decoration-thickness': '1px', 'text-underline-offset': '0.2em'},
  ),
  css('a:hover').styles(raw: {'text-decoration-thickness': '2px'}),
  css('a, button, summary').styles(raw: {'-webkit-tap-highlight-color': 'transparent'}),
  css(':focus-visible').styles(
    outline: Outline(color: .currentColor, width: OutlineWidth(2.px), style: .solid),
    raw: {'outline-offset': '4px'},
  ),
  css('::selection').styles(color: background, backgroundColor: foreground),
  css('img').styles(display: .block, maxWidth: 100.percent, height: .auto),
  css('.wrap').styles(
    width: .expression('min(1160px, calc(100% - 96px))'),
    margin: .symmetric(horizontal: .auto),
  ),
  css('.lead').styles(maxWidth: 34.em, fontSize: .expression('clamp(20px, 2.2vw, 24px)'), lineHeight: 1.4.em),
  css('.muted').styles(color: muted),
  css('.section').styles(padding: .symmetric(vertical: .expression('clamp(64px, 9vw, 120px)'))),
  css('.section-head').styles(
    display: .flex,
    margin: .only(bottom: .expression('clamp(32px, 5vw, 56px)')),
    flexWrap: .wrap,
    justifyContent: .spaceBetween,
    alignItems: .baseline,
    gap: .all(16.px),
  ),
  css('.page-head').styles(
    padding: .only(top: .expression('clamp(48px, 8vw, 96px)'), bottom: 40.px),
  ),
  css('.page-head h1').styles(margin: .only(bottom: 20.px)),
  css('.button').styles(
    display: .inlineFlex,
    minHeight: 48.px,
    padding: .symmetric(horizontal: 22.px),
    radius: .circular(999.px),
    transition: Transition('background-color', duration: 150.ms),
    alignItems: .center,
    color: background,
    fontSize: 16.px,
    fontWeight: .w600,
    textDecoration: .none,
    backgroundColor: foreground,
  ),
  css('.button:hover').styles(backgroundColor: const Color('#c9d2e8')),
  css('.skip-link').styles(
    position: .fixed(top: (-100).px, left: 16.px),
    zIndex: const ZIndex(30),
    padding: .all(12.px),
    color: background,
    backgroundColor: foreground,
  ),
  css('.skip-link:focus').styles(
    position: .fixed(top: 12.px, left: 16.px),
  ),
  css.media(MediaQuery.screen(maxWidth: 720.px), [
    css('.wrap').styles(width: .expression('calc(100% - 40px)')),
    css('body').styles(fontSize: 17.px),
  ]),
  css.media(const MediaQuery.raw('(prefers-reduced-motion: reduce)'), [
    css('*, *::before, *::after').styles(
      raw: {
        'transition-duration': '0s !important',
        'animation-duration': '0s !important',
        'animation-delay': '0s !important',
      },
    ),
  ]),
];
