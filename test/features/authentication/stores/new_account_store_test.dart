import 'package:flutter_test/flutter_test.dart';
import 'package:bookzbox/features/authentication/authentication.dart';

void main() {
  group('New Account store', () {
    var store = NewAccountStore();

    setUp(() => store = NewAccountStore());

    test('Should not consider username with less than 5 characters valid', () {
      final username = '1234';
      store.setUsername(username);
      expect(username.length, lessThan(5));
      expect(store.usernameIsValid, isFalse);
    });

    test('Should not consider username with more than 14 characters valid', () {
      final username = '123456789012345';
      store.setUsername(username);
      expect(username.length, greaterThan(14));
      expect(store.usernameIsValid, isFalse);
    });

    test('Usernames with spaces inside of them should be considered valid', () {
      final username = 'this is me';
      store.setUsername(username);
      expect(store.usernameIsValid, isTrue);
    });

    test('Should consider username with exactly 14 characters as valid', () {
      final username = '12345678901234';
      store.setUsername(username);
      expect(username.length, equals(14));
      expect(store.usernameIsValid, isTrue);
    });

    test('Should consider username with exactly 5 characters as valid', () {
      final username = '12345';
      store.setUsername(username);
      expect(username.length, equals(5));
      expect(store.usernameIsValid, isTrue);
    });

    test('Should strip whitespaces in beginning and end of username string', () {
      final username = '   abcdef   ';
      store.setUsername(username);
      expect(store.username, equals('abcdef'));
    });

    test('Non-alphanumerical characters should not be considered valid', () {
      final username = 'abc#de"f&&';
      store.setUsername(username);
      expect(store.usernameIsValid, isFalse);
    });
  });
}
