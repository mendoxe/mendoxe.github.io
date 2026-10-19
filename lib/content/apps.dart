/// Paths are relative to web/.
class AppScreenshot {
  const AppScreenshot(this.assetPath, {required this.caption, required this.alt});
  final String assetPath, caption, alt;
}

/// Colours of an app's band; text colours must reach 4.5:1 on [ground].
class AppPalette {
  const AppPalette({required this.ground, required this.text, required this.muted, required this.accent});
  final String ground, text, muted, accent;
}

class PersonalApp {
  const PersonalApp({
    required this.slug,
    required this.name,
    required this.kind,
    required this.description,
    required this.features,
    required this.isReleased,
    required this.palette,
    this.screenshots = const [],
    this.landscapeScreenshots = false,
  });
  final String slug, name, kind, description;
  final List<(String, String)> features;
  final bool isReleased, landscapeScreenshots;
  final AppPalette palette;
  final List<AppScreenshot> screenshots;
  String get path => 'apps/$slug/';
  String get iconPath => 'images/apps/$slug/icon.jpg';
  String get status => isReleased ? 'Released' : 'In development';
}

/// Toolbox and Code breaker release status confirmed by Lukas on 30 September 2026. Emberline, Quizness and
/// Travelo are unreleased according to their repositories. Features are taken from each app's code and docs.
const personalApps = [
  PersonalApp(
    slug: 'toolbox',
    name: 'Toolbox',
    kind: 'Everyday utilities',
    isReleased: true,
    description:
        'Converters, calculators, sensor tools and quick ways to decide, collected in one app. '
        'Pin the tools you use most and open them in a tap.',
    features: [
      ('Convert and calculate', 'Units, number bases, Roman numerals, tips, splitting a bill and health figures.'),
      ('Use the phone’s sensors', 'Compass, spirit level, ruler, noise meter, speedometer and metal detector.'),
      ('Text and codes', 'Password generator, QR scanner and generator, encoders, word count and a Caesar cipher.'),
      ('Decide and keep score', 'Coin flip, dice, random pick, wheel of fortune, team groups and a scoreboard.'),
    ],
    palette: AppPalette(ground: '#0b5fc4', text: '#ffffff', muted: '#d6e7ff', accent: '#ffffff'),
    screenshots: [
      AppScreenshot(
        'images/apps/toolbox/all-tools.jpg',
        caption: 'All tools, with favourites first',
        alt: 'Toolbox home screen with a search field, favourite tools and a grid of all tools.',
      ),
      AppScreenshot(
        'images/apps/toolbox/compass.jpg',
        caption: 'Compass',
        alt: 'Compass dial pointing to 324 degrees.',
      ),
      AppScreenshot(
        'images/apps/toolbox/passwords.jpg',
        caption: 'Password generator',
        alt: 'Password generator with a generated password, a length slider and character set options.',
      ),
      AppScreenshot(
        'images/apps/toolbox/noise-meter.jpg',
        caption: 'Noise meter',
        alt: 'Noise meter with a decibel chart over time, a level bar, and the current and maximum readings.',
      ),
      AppScreenshot(
        'images/apps/toolbox/fortune-wheel.jpg',
        caption: 'Wheel of fortune',
        alt: 'Wheel of fortune with four numbered segments and a control for the number of values.',
      ),
    ],
  ),
  PersonalApp(
    slug: 'code-breaker',
    name: 'Code breaker',
    kind: 'Logic game',
    isReleased: true,
    description:
        'Find the hidden code by deduction. Every guess tells you which symbols are in the right place, '
        'which are in the code but elsewhere, and which are not in it at all.',
    features: [
      ('Numbers, colours or shapes', 'Choose what the code is made of before each game.'),
      ('Three ways to play', 'A limited number of guesses, a race against the clock, or endless play.'),
      ('Repeated symbols', 'Allow a symbol to appear more than once for a harder code.'),
      ('Statistics', 'See how your past games went.'),
    ],
    palette: AppPalette(ground: '#221c48', text: '#f2f0fb', muted: '#bab3dc', accent: '#2dd4ef'),
  ),
  PersonalApp(
    slug: 'emberline',
    name: 'Emberline',
    kind: 'Tower defense game',
    isReleased: false,
    description:
        'Hold back the swarm across five worlds and twenty maps. Build and upgrade towers, '
        'command soldiers, and choose a specialization for every tower. Plays offline, without an account.',
    features: [
      (
        'Five towers, two paths each',
        'Every tower has eight levels and a permanent choice between two specializations.',
      ),
      ('Twenty maps', 'Five worlds, from Sunscar’s desert to the Ember Forge, with campaign and challenge modes.'),
      ('Twelve enemy species', 'Each with its own traits and counters, recorded in the enemy journal.'),
      ('Endless mode', 'Keep going after the campaign until your core falls.'),
    ],
    palette: AppPalette(ground: '#2a1d16', text: '#f7efe2', muted: '#cdbca6', accent: '#f2aa3c'),
    landscapeScreenshots: true,
    screenshots: [
      AppScreenshot(
        'images/apps/emberline/hold-the-line.jpg',
        caption: 'Barracks soldiers holding the road',
        alt: 'Desert battlefield with towers along a winding road, tower prices on the right and a tip about soldiers.',
      ),
      AppScreenshot(
        'images/apps/emberline/two-fronts.jpg',
        caption: 'Two entrances, two cores',
        alt: 'Desert map where enemies alternate between two roads, each leading to its own core.',
      ),
      AppScreenshot(
        'images/apps/emberline/evolve-your-towers.jpg',
        caption: 'Choosing a tower specialization',
        alt: 'Sentinel tower path choice between Rapid fire and Armor piercing, with level 8 statistics for each.',
      ),
      AppScreenshot(
        'images/apps/emberline/worlds-to-conquer.jpg',
        caption: 'Maps of the five worlds',
        alt: 'Map selection showing Copper Canyon, Saffron Dunes and Sunspire Temple in the Sunscar world.',
      ),
      AppScreenshot(
        'images/apps/emberline/enemy-journal.jpg',
        caption: 'Enemy journal',
        alt: 'Enemy journal cards for Crawler, Runner and Bulwark with health, damage and counters.',
      ),
      AppScreenshot(
        'images/apps/emberline/forest-frontier.jpg',
        caption: 'A forest map',
        alt: 'Forest battlefield with towers around a looping road and a soldier squad on the path.',
      ),
    ],
  ),
  PersonalApp(
    slug: 'quizness',
    name: 'Quizness',
    kind: 'Study and test',
    isReleased: false,
    description:
        'Study question sets and take tests, offline. Bring your own sets or write them in the app, '
        'and keep track of what you know.',
    features: [
      ('Study', 'Reveal answers, bookmark and annotate questions, and practise your mistakes with spaced review.'),
      ('Tests', 'Time limits, pass marks and partial credit. Leave a test and resume it later.'),
      ('Your own sets', 'Import from CSV, text or JSON, write questions in the editor, and export to share.'),
      ('More than multiple choice', 'Ordering and matching questions, with pictures, animations and video.'),
    ],
    palette: AppPalette(ground: '#2654dc', text: '#ffffff', muted: '#dce5ff', accent: '#ffffff'),
  ),
  PersonalApp(
    slug: 'travelo',
    name: 'Travelo',
    kind: 'Travel map',
    isReleased: false,
    description:
        'Mark the countries and regions you have visited on a world map or globe, '
        'see how much of the world you have covered, and plan trips with several stops.',
    features: [
      ('Map and globe', 'An offline world map, or a 3D globe you can spin and zoom.'),
      ('Labels', 'Mark countries as visited or wanted, or create your own labels and colours.'),
      ('Regions', 'Track the regions you have visited within a country.'),
      ('Trips', 'Plan routes with dates, stops, transport, accommodation and notes.'),
    ],
    palette: AppPalette(ground: '#272d70', text: '#ffffff', muted: '#c8ccf2', accent: '#7fd68c'),
  ),
];
