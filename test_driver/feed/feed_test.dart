import 'package:bookzbox/common/widgets/keys.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/// Integration test checking the link between the feed screen and the recommendation system.
void main() {
  group('FEED TEST', () {
    final feedScreen = find.byValueKey(Keys.feedScreenKey);
    final feedItem = find.byValueKey(Keys.feedItemKey + 0.toString());

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
      final String realEmail = ''; // TODO: Add/clear before/after running tests.
      /// The password to use to log in to the test account.
      final String realPassword = ''; // TODO: Add/clear before/after running tests.

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

    group('RECOMMENDATIONS', () {
      test('When feed screen is open, it should load and display recommendations.', () async {
        await driver.waitFor(feedScreen);
        await driver.waitFor(feedItem);
      });
    });
  });
}
