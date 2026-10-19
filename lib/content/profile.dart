/// Shared by the website and PDF; history sourced from Lukas's supplied CV.
class Profile {
  static const name = 'Lukas Simon';
  static const role = 'Engineering Lead at Ventrata';
  static const introduction =
      'I build apps for mobile, desktop, and the web with Flutter, Dart and Jaspr, using a shared codebase, scalable architecture, and an interface that fits the platform.';
  static const approach =
      'I’m a software developer focused on multiplatform apps. Flutter and Dart come first. '
      'I care about architecture that stays maintainable and interfaces that are fast, '
      'predictable, and comfortable to use.';
  static const background =
      'I’m an Engineering Lead at Ventrata. Previously, I progressed from junior developer to Flutter Team Lead at Seznam.cz, building production apps and supporting the team behind them. I studied computer science and software engineering at CTU in Prague.';
  static const skills = [
    'Dart',
    'Flutter',
    'Jaspr',
    'Firebase & Supabase',
    'Java & Kotlin',
    'SQL & NoSQL',
    'Software architecture',
    'Team leadership',
  ];
  // Empty contact values are intentionally not rendered.
  static const email = '42lukas.simon@gmail.com';
  static const github = 'https://github.com/mendoxe';
  static const linkedin = 'https://www.linkedin.com/in/simon-lukas';
  static const experience = [
    Experience('Ventrata', 'Engineering Lead', 'Aug 2026 – present', ['Leading Flutter development.']),
    Experience('Seznam.cz', 'Flutter Team Lead', 'Jun 2020 – Jul 2026', [
      'Built multiple production and internal Flutter apps, progressing from proof of concept development to oversight of a division’s app portfolio.',
      'Developed CI/CD pipelines and led hiring, onboarding, management, and professional development.',
    ]),
    Experience('CTU in Prague', 'Speaker', 'Mar 2023 – present', [
      'Present Flutter and multiplatform development in a mobile development course.',
    ]),
  ];
  static const education = [
    'Master’s in Computer Science, CTU in Prague, 2021–2024',
    'Erasmus+ semester, DTU, Lyngby, 2022–2023',
    'Bachelor’s in Software Engineering, CTU in Prague, 2018–2021',
  ];
}

class Experience {
  const Experience(this.company, this.role, this.period, this.highlights);
  final String company;
  final String role;
  final String period;
  final List<String> highlights;
}
