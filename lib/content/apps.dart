class PersonalApp {
  const PersonalApp({
    required this.slug,
    required this.name,
    required this.category,
    required this.tagline,
    required this.description,
    required this.features,
    required this.symbol,
    required this.isReleased,
  });
  final String slug, name, category, tagline, description, symbol;
  final List<(String, String)> features;
  final bool isReleased;
  String get path => 'apps/$slug/';
  String get releaseNote => isReleased ? 'Released.' : 'In active development. Not yet released.';
}

/// Release status is confirmed by Lukas; product positioning remains draft copy.
const personalApps = [
  PersonalApp(
    slug: 'toolbox',
    name: 'Toolbox',
    isReleased: true,
    category: 'EVERYDAY UTILITIES',
    symbol: '◫',
    tagline: 'Your everyday toolkit.',
    description: 'Practical utilities in one app. Find the tool you need and get on with the task.',
    features: [
      ('Utilities', 'Tools for everyday tasks, collected in one place.'),
      ('Consistent controls', 'A familiar layout across the toolkit.'),
      ('Direct access', 'Choose a tool and get started.'),
    ],
  ),
  PersonalApp(
    slug: 'travelo',
    name: 'Travelo',
    isReleased: false,
    category: 'TRAVEL COMPANION',
    symbol: '◎',
    tagline: 'Travel plans, together.',
    description: 'Organize your trips, keep track of places, and bring your travel plans together.',
    features: [
      ('Places', 'Keep track of destinations you want to visit.'),
      ('Planning', 'Bring the details of a trip into one place.'),
      ('On the road', 'Keep your plans accessible while you travel.'),
    ],
  ),
  PersonalApp(
    slug: 'code-breaker',
    name: 'Code breaker',
    isReleased: true,
    category: 'LOGIC & PLAY',
    symbol: '⠿',
    tagline: 'Crack the code.',
    description: 'A game of logic and deduction. Use the clues, test your guesses, and find the hidden code.',
    features: [
      ('Deduction', 'Use each clue to narrow down the possibilities.'),
      ('Guesses', 'Test a combination and work out your next move.'),
      ('The solution', 'Find the pattern behind the hidden code.'),
    ],
  ),
];
