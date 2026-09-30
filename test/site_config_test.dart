import 'package:personal_site/site_config.dart';
import 'package:test/test.dart';

void main() {
  test('root and repository base paths normalize consistently', () {
    expect(normalizeBase(''), '/');
    expect(normalizeBase('/'), '/');
    expect(normalizeBase('personal-site'), '/personal-site/');
    expect(normalizeBase('/personal-site/'), '/personal-site/');
    expect(normalizeBase('//group//site//'), '/group/site/');
  });
  test('rejects hostnames, query strings and traversal', () {
    for (final input in ['https://example.com', '/../', '/a/./', '/a?x=1', '/a#b', '/%2e%2e/']) {
      expect(() => normalizeBase(input), throwsArgumentError, reason: input);
    }
  });
}
