import 'package:bookzbox/common/widgets/keys.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/// A complete authentication sequence test.
void main() {
  group('AUTH SEQUENCE', () {
    /// The e-mail to use to log in to the test account.
    final String realEmail = ''; // TODO: Add/clear before/after running tests.
    /// The password to use to log in to the test account.
    final String realPassword = ''; // TODO: Add/clear before/after running tests.

    final authSelectEmailBtn = find.byValueKey(Keys.authSelectEmailBtnKey);
    final loginScreen = find.byValueKey(Keys.loginWithEmailScreenKey);
    final loginBtn = find.byValueKey(Keys.loginBtnKey);
    final emailInputField = find.byValueKey(Keys.emailInputFieldKey);
    final passwordInputField = find.byValueKey(Keys.passwordInputFieldKey);
    final homeScreen = find.byValueKey(Keys.homeScreenKey);
    final profileNavBtn = find.byValueKey(Keys.profileNavBtnKey);
    final profileMenuBtn = find.byValueKey(Keys.profileMenuBtnKey);
    final profileScreen = find.byValueKey(Keys.profileScreenKey);
    final logoutBtn = find.byValueKey(Keys.logoutBtnKey);
    final authSelectionScreen = find.byValueKey(Keys.authSelectionScreenKey);

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Navigate to login with email screen from auth selection screen.', () async {
      await driver.tap(authSelectEmailBtn);
      await driver.waitFor(loginScreen);
    });

    test('Add email data.', () async {
      await driver.scrollIntoView(emailInputField);
      await driver.tap(emailInputField);
      await driver.enterText(realEmail);
    });

    test('Add password data.', () async {
      await driver.scrollIntoView(passwordInputField);
      await driver.tap(passwordInputField);
      await driver.enterText(realPassword);
    });

    test('Clicking login with valid credentials should direct user to home screen.', () async {
      await driver.scrollIntoView(loginBtn);
      await driver.tap(loginBtn);
      await driver.waitFor(homeScreen);
    });

    test(
        'Clicking the bottom navigation button representing profile should direct user to profile screen.',
        () async {
      await driver.waitFor(profileNavBtn);
      await driver.scrollIntoView(profileNavBtn);
      await driver.tap(profileNavBtn);
      await driver.waitFor(profileScreen);
    });

    test('Clicking logout should direct user back to auth selection screen.', () async {
      await driver.tap(profileMenuBtn);
      await driver.waitFor(logoutBtn);
      await driver.tap(logoutBtn);
      await driver.waitFor(authSelectionScreen);
    });
  });
}
