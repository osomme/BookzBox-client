import 'package:flutter_test/flutter_test.dart';
import 'package:bookzbox/features/authentication/authentication.dart';

void main() {
  group('Authentication input store', () {
    var store = LoginCredentialsStore();

    setUp(() => store = LoginCredentialsStore());

    group('Password', () {
      test('Null pasword should not be considered valid', () {
        store.setPassword(null);
        store.setEmail('blabla@valid.com');
        expect(store.credentialsAreValid, isFalse);
      });

      test('Password under 8 characters is not considered valid', () {
        for (var i = 0; i < 8; i++) {
          String password = '';
          for (var j = 0; j < i; j++) {
            password += 'x';
          }
          store.setPassword(password);
          expect(store.passwordIsValid, isFalse);
        }
      });

      test('Password containing 8 characters should be considered valid', () {
        store.setPassword('12345678');
        expect(store.passwordIsValid, isTrue);
      });

      test('Password containing more than 8 characters should be considered valid', () {
        store.setPassword('123456789');
        expect(store.passwordIsValid, isTrue);
      });

      test(
        'Password containing whitespace characters should have whitespace removed',
        () {
          // 9 characters in total, but with 8 whitespaces. Should not be valid.
          final whitespaceBefore = '        x';
          store.setPassword(whitespaceBefore);
          expect(store.password, equals('x'));

          final whitespaceAfter = 'y        ';
          store.setPassword(whitespaceAfter);
          expect(store.password, equals('y'));

          final whitespaceInbetween = '  z  ';
          store.setPassword(whitespaceInbetween);
          expect(store.password, equals('z'));
        },
      );
    });

    group("Email", () {
      test('Null email should not be considered valid', () {
        store.setEmail(null);
        store.setPassword('thisisavalidpassword');
        expect(store.credentialsAreValid, isFalse);
      });

      test('Whitespace characters should be trimmed', () {
        store.setEmail('  myemail  @ gmail.com  ');
        expect(store.email, 'myemail@gmail.com');
      });

      test('Should be normalized to lowercase characers', () {
        store.setEmail('MyEmail@Gmail.coM');
        expect(store.email, 'myemail@gmail.com');
      });

      test('Valid emails should be considered valid', () {
        validEmails.forEach((email) {
          store.setEmail(email);
          expect(store.emailIsValid, isTrue);
        });
      });

      test('Invalid emails should be considered invalid', () {
        invalidEmails.forEach((email) {
          store.setEmail(email);
          expect(store.emailIsValid, isFalse);
        });
      });
    });
  });
}

/// A list of valid emails. Used for testing purposes.
final validEmails = [
  'email@example.com',
  'firstname.lastname@example.com',
  'email@subdomain.example.com',
  '"email"@example.com',
  '1234567890@example.com',
  'email@example-one.com',
  'email@example.name',
  'email@example.museum',
  'email@example.co.jp',
  'firstname-lastname@example.com',
];

/// A list of invalid emails. Used for testing purposes.
final invalidEmails = [
  'plainaddress',
  '#@%^%#\$@#\$@#.com',
  '@example.com',
  'Joe Smith <email@example.com>',
  'email.example.com',
  'email@example@example.com',
  '.email@example.com',
  'email.@example.com',
  'email..email@example.com',
  'email@example.com (Joe Smith)',
  'email@example',
  'email@-example.com',
  'email@111.222.333.44444',
  'email@example..com',
  'Abc..123@example.com',
];
