import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/app_card.dart';
import '../components/hero_visual.dart';
import '../components/ui.dart';
import '../content/apps.dart';
import '../content/profile.dart';
import '../content/portfolio.dart';
import '../content/services.dart';
import '../home_styles.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});
  @override
  Component build(BuildContext context) => div(classes: 'portfolio', [
    const HomeHero(),
    const PlatformStrip(),
    const SelectedApps(),
    const ServicesSection(),
    const AboutSection(),
  ]);
  @css
  static List<StyleRule> get styles => homeStyles;
}

class HomeHero extends StatelessComponent {
  const HomeHero({super.key});
  @override
  Component build(BuildContext context) => section(classes: 'landing-hero', [
    div(classes: 'landing-copy', [
      h1([
        .text('Apps that feel'),
        br(),
        .text('native, '),
        em([.text('everywhere')]),
        br(),
        .text('they run.'),
      ]),
      p(classes: 'lead', [.text(Profile.introduction)]),
      const SocialLinks(),
    ]),
    const HeroVisual(),
  ]);
}

class SocialLinks extends StatelessComponent {
  const SocialLinks({super.key});
  @override
  Component build(BuildContext context) => div(classes: 'social-links', [
    a(href: Profile.github.isEmpty ? 'https://github.com/' : Profile.github, [.text('GitHub')]),
    a(href: Profile.linkedin.isEmpty ? 'https://www.linkedin.com/' : Profile.linkedin, [.text('LinkedIn')]),
  ]);
}

class PlatformStrip extends StatelessComponent {
  const PlatformStrip({super.key});
  @override
  Component build(BuildContext context) => div(classes: 'platform-strip', [
    div(classes: 'platform-list', [
      for (final name in ['iOS', 'Android', 'macOS', 'Windows', 'Web', 'CLI']) span([.text(name)]),
    ]),
    span(classes: 'stack-caption', [.text('Flutter · Dart · Jaspr')]),
  ]);
}

class PortfolioHeading extends StatelessComponent {
  const PortfolioHeading(this.label, this.title, this.italic, {super.key});
  final String label, title, italic;
  @override
  Component build(BuildContext context) => div(classes: 'portfolio-heading', [
    div([
      Eyebrow(label),
      h2([
        .text('$title '),
        em([.text(italic)]),
      ]),
    ]),
  ]);
}

class SelectedApps extends StatelessComponent {
  const SelectedApps({super.key});
  @override
  Component build(BuildContext context) => section(id: 'work', classes: 'portfolio-section', [
    const PortfolioHeading(
      'WORK',
      'Selected',
      'apps',
    ),
    div(classes: 'selected-grid', [for (final app in personalApps) AppCard(app)]),
  ]);
}

class ServicesSection extends StatelessComponent {
  const ServicesSection({super.key});
  @override
  Component build(BuildContext context) => section(id: 'services', classes: 'portfolio-section', [
    const PortfolioHeading(
      'SERVICES',
      'How I can',
      'help',
    ),
    div(classes: 'services-grid', [for (final service in services) ServiceCard(service), const ContactCard()]),
  ]);
}

class ServiceCard extends StatelessComponent {
  const ServiceCard(this.service, {super.key});
  final (String, String, List<String>, String) service;
  @override
  Component build(BuildContext context) => article(classes: 'service-card', [
    span(classes: 'service-icon', attributes: {'aria-hidden': 'true'}, [.text(service.$4)]),
    h3([.text(service.$1)]),
    p([.text(service.$2)]),
    ul([
      for (final item in service.$3) li([.text(item)]),
    ]),
  ]);
}

class ContactCard extends StatelessComponent {
  const ContactCard({super.key});
  @override
  Component build(BuildContext context) => article(classes: 'light-card contact-card', [
    const Eyebrow('HAVE A PROJECT IN MIND?'),
    h3([
      .text('Let’s work out what you need, and find the '),
      em([.text('right approach.')]),
    ]),
    p([.text(PortfolioCopy.contactIntro)]),
    a(href: 'mailto:${Profile.email}', classes: 'button contact-button', [.text('Get in touch')]),
    const ActionLink('View my CV', 'cv/'),
  ]);
}

class AboutSection extends StatelessComponent {
  const AboutSection({super.key});
  @override
  Component build(BuildContext context) => section(id: 'about', classes: 'portfolio-section about-portfolio', [
    const Eyebrow('ABOUT'),
    div(classes: 'about-layout', [
      div(classes: 'about-sidebar', [
        const AboutPortrait(),
        div(classes: 'about-facts', [
          div([
            const Eyebrow('FOCUS'),
            p([.text('Multiplatform apps')]),
          ]),
          div([
            const Eyebrow('STACK'),
            p([.text('Flutter · Dart · Jaspr')]),
          ]),
        ]),
      ]),
      div(classes: 'about-content', [
        h2([
          .text('Hi, I’m Lukas — I build apps for '),
          em([.text('every')]),
          .text(' screen.'),
        ]),
        p([.text(Profile.approach)]),
        p([.text(Profile.background)]),
        const ExperiencePreview(),
        div(classes: 'cv-toolbar', [
          const ActionLink(
            'Download CV',
            'downloads/lukas-simon-cv.pdf',
            primary: true,
            download: 'lukas-simon-cv.pdf',
          ),
          span(classes: 'stack-caption', [.text('PDF · A4')]),
        ]),
      ]),
    ]),
  ]);
}

class ExperiencePreview extends StatelessComponent {
  const ExperiencePreview({super.key});
  @override
  Component build(BuildContext context) => div(classes: 'experience-preview', [
    for (final role in Profile.experience.take(2))
      div([
        span(classes: 'stack-caption', [.text(role.period)]),
        strong([.text(role.company)]),
        span([.text(role.role)]),
      ]),
  ]);
}
