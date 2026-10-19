import 'dart:async';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

import '../content/profile.dart';
import '../site_config.dart';
import '../theme.dart';

/// Native disclosure and links also work before hydration or without JavaScript.
@client
class Header extends StatefulComponent {
  const Header(this.current, {super.key});
  final String current;

  @override
  State<Header> createState() => _HeaderState();

  @css
  static List<StyleRule> get styles => [
    css('.header-bar').styles(
      position: .sticky(top: 0.px),
      zIndex: const ZIndex(20),
      border: .only(
        bottom: BorderSide(width: 1.px, color: hairline, style: .solid),
      ),
      backgroundColor: background,
    ),
    css('.site-header').styles(
      display: .flex,
      minHeight: .variable('--header-height'),
      justifyContent: .spaceBetween,
      alignItems: .center,
      gap: .all(24.px),
    ),
    css('.wordmark').styles(
      fontSize: 20.px,
      fontWeight: .w800,
      textDecoration: .none,
      raw: {'letter-spacing': '-0.02em'},
    ),
    css('.site-header nav').styles(display: .flex, alignItems: .center, gap: .all(4.px)),
    css('.site-header nav a').styles(
      padding: .symmetric(vertical: 10.px, horizontal: 14.px),
      color: muted,
      fontSize: 16.px,
      fontWeight: .w500,
      textDecoration: .none,
    ),
    css('.site-header nav a:hover, .site-header nav a[aria-current]').styles(color: foreground),
    css('.site-header nav a[aria-current]').styles(
      textDecoration: TextDecoration(line: .underline),
      raw: {'text-decoration-thickness': '2px', 'text-underline-offset': '0.45em'},
    ),
    css('.site-header nav .nav-email').styles(
      margin: .only(left: 10.px),
      color: foreground,
    ),
    css('.site-header .nav-email').styles(
      padding: .symmetric(vertical: 8.px, horizontal: 16.px),
      border: .all(width: 1.px, color: foreground),
      radius: .circular(999.px),
    ),
    css('.site-header .nav-email:hover').styles(color: background, backgroundColor: foreground),
    css('.mobile-navigation').styles(display: .none),
    css.media(MediaQuery.screen(maxWidth: 720.px), [
      css('html').styles(raw: {'--header-height': '60px'}),
      css('.desktop-navigation').styles(display: .none),
      css('.mobile-navigation').styles(display: .block),
      css('.menu-toggle').styles(
        display: .flex,
        minHeight: 44.px,
        cursor: .pointer,
        alignItems: .center,
        gap: .all(10.px),
        listStyle: .none,
        fontSize: 16.px,
        fontWeight: .w500,
      ),
      css('.menu-toggle::-webkit-details-marker').styles(display: .none),
      css('.menu-icon').styles(
        display: .flex,
        width: 20.px,
        flexDirection: .column,
        gap: .all(5.px),
      ),
      css('.menu-icon span').styles(
        display: .block,
        height: 2.px,
        transition: Transition('transform', duration: 150.ms),
        backgroundColor: foreground,
      ),
      css('.mobile-navigation[open] .menu-icon span:first-child')
          .styles(transform: .combine([.translate(y: 3.5.px), .rotate(45.deg)])),
      css('.mobile-navigation[open] .menu-icon span:last-child')
          .styles(transform: .combine([.translate(y: (-3.5).px), .rotate((-45).deg)])),
      css('.mobile-menu').styles(
        position: .absolute(top: 100.percent, left: 0.px, right: 0.px),
        maxHeight: .expression('calc(100dvh - var(--header-height))'),
        padding: .symmetric(vertical: 8.px, horizontal: 20.px),
        border: .only(
          bottom: BorderSide(width: 1.px, color: hairline, style: .solid),
        ),
        backgroundColor: background,
        raw: {'overflow-y': 'auto', 'overscroll-behavior': 'contain'},
      ),
      css('.mobile-menu nav').styles(flexDirection: .column, alignItems: .stretch, gap: .all(.zero)),
      css('.mobile-menu nav a').styles(
        padding: .symmetric(vertical: 14.px, horizontal: 0.px),
        fontSize: 24.px,
      ),
      css('.mobile-menu nav .nav-email').styles(
        margin: .symmetric(vertical: 12.px),
        textAlign: .center,
        fontSize: 18.px,
      ),
    ]),
  ];
}

class _HeaderState extends State<Header> {
  final menuKey = GlobalNodeKey<web.HTMLDetailsElement>();
  final toggleKey = GlobalNodeKey<web.HTMLElement>();
  final subscriptions = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      subscriptions.add(
        web.EventStreamProviders.clickEvent.forTarget(web.document).listen((event) {
          if (!(menuKey.currentNode?.contains(event.target as web.Node?) ?? true)) closeMenu();
        }),
      );
      subscriptions.add(
        const web.EventStreamProvider<web.FocusEvent>('focusin').forTarget(web.document).listen((event) {
          if (!(menuKey.currentNode?.contains(web.document.activeElement) ?? true)) closeMenu();
        }),
      );
      subscriptions.add(
        web.EventStreamProviders.resizeEvent.forTarget(web.window).listen((event) {
          if (web.window.innerWidth > 720) closeMenu();
        }),
      );
    }
  }

  @override
  void dispose() {
    for (final subscription in subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  void closeMenu() {
    if (kIsWeb) menuKey.currentNode?.open = false;
  }

  Component navigation(String label) => nav(
    attributes: {'aria-label': label},
    [
      for (final (title, path) in [('Apps', '#apps'), ('About', '#about'), ('Services', '#services')])
        a(
          href: siteUrl(path),
          attributes: {if (component.current == title) 'aria-current': 'page'},
          // Jaspr's typed onClick prevents anchor navigation. This listener
          // only closes the disclosure and leaves the native link action intact.
          events: {'click': (event) => closeMenu()},
          [.text(title)],
        ),
      a(href: 'mailto:${Profile.email}', classes: 'nav-email', [.text('Email me')]),
    ],
  );

  @override
  Component build(BuildContext context) => header(classes: 'header-bar', [
    div(classes: 'site-header wrap', [
      a(href: siteUrl(''), classes: 'wordmark', [.text(Profile.name)]),
      div(classes: 'desktop-navigation', [navigation('Main navigation')]),
      details(
        key: menuKey,
        classes: 'mobile-navigation',
        events: {
          'keydown': (event) {
            if (kIsWeb && (event as web.KeyboardEvent).key == 'Escape') {
              closeMenu();
              toggleKey.currentNode?.focus();
            }
          },
        },
        [
          summary(key: toggleKey, classes: 'menu-toggle', [
            span([.text('Menu')]),
            span(classes: 'menu-icon', attributes: {'aria-hidden': 'true'}, [span([]), span([])]),
          ]),
          div(classes: 'mobile-menu', [navigation('Mobile navigation')]),
        ],
      ),
    ]),
  ]);
}
