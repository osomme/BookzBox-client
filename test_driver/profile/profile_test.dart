import 'package:bookzbox/common/widgets/keys.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/// Integration tests for 'my profile'.
void main() {
  group('MY PROFILE', () {
    final profileNavBtn = find.byValueKey(Keys.profileNavBtnKey);
    final profileScreen = find.byValueKey(Keys.profileScreenKey);
    final boxesTabBtn = find.byValueKey(Keys.profileBoxesTabBtnKey);
    final boxItem = find.byValueKey(Keys.miniBoxItemKey + 0.toString());
    final bookPreference = find.byValueKey(Keys.bookPreferenceChipKey + 0.toString());
    final preferencesTabBtn = find.byValueKey(Keys.profilePreferencesTabBtnKey);

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    group('LOGIN', () {
      /// The e-mail to use to log in to the test account.
      final String realEmail = 'test@test.test'; // TODO: Add/clear before/after running tests.
      /// The password to use to log in to the test account.
      final String realPassword = 'test12345'; // TODO: Add/clear before/after running tests.

      final authSelectEmailBtn = find.byValueKey(Keys.authSelectEmailBtnKey);
      final loginScreen = find.byValueKey(Keys.loginWithEmailScreenKey);
      final loginBtn = find.byValueKey(Keys.loginBtnKey);
      final emailInputField = find.byValueKey(Keys.emailInputFieldKey);
      final passwordInputField = find.byValueKey(Keys.passwordInputFieldKey);
      final homeScreen = find.byValueKey(Keys.homeScreenKey);

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
    });

    group('NAVIGATE', () {
      test(
          'Clicking the bottom navigation button representing profile should direct user to profile screen.',
          () async {
        await driver.waitFor(profileNavBtn);
        await driver.scrollIntoView(profileNavBtn);
        await driver.tap(profileNavBtn);
        await driver.waitFor(profileScreen);
      });
    });

    group('BOXES', () {
      /// Navigating to the "boxes"-tab should trigger a load of
      /// all boxes for that user. This test checks that at least one box
      /// is loaded confirming the link the between the modules.
      test('Navigating to "boxes"-tab should load and display boxes.', () async {
        await driver.waitFor(boxesTabBtn);
        await driver.tap(boxesTabBtn);
        await driver.waitFor(boxItem);
      });
    });

    group('PREFERENCES', () {
      /// Navigating to the "preferences"-tab should trigger a load of
      /// all book preferences for that user. This test checks that at least one
      /// preference is loaded confirming the link the between the modules.
      test('Navigating to "preferences"-tab should load and display book preferences.', () async {
        await driver.waitFor(preferencesTabBtn);
        await driver.tap(preferencesTabBtn);
        await driver.waitFor(bookPreference);
      });
    });
  });
}
