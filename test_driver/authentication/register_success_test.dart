import 'package:bookzbox/common/widgets/keys.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('REGISTER SUCCESS', () {
    /// The username  of the test account to use for the register test.
    final String realUsername = ''; // TODO: Add/clear before/after running tests.
    /// The e-mail of the test account used for registration and login tests.
    final String realEmail = ''; // TODO: Add/clear before/after running tests.
    /// The password to use to log in to the test account.
    final String realPassword = ''; // TODO: Add/clear before/after running tests.

    final newAccountNavBtn = find.byValueKey(Keys.newAccountNavButtonKey);
    final newAccountScreen = find.byValueKey(Keys.newAccountScreenKey);
    final registerBtn = find.byValueKey(Keys.registerBtnKey);
    final usernameInputField = find.byValueKey(Keys.usernameInputFieldKey);
    final emailInputField = find.byValueKey(Keys.emailInputFieldKey);
    final passwordInputField = find.byValueKey(Keys.passwordInputFieldKey);
    final homeScreen = find.byValueKey(Keys.homeScreenKey);

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Navigate to new account screen from auth selection screen.', () async {
      await driver.tap(newAccountNavBtn);
      await driver.waitFor(newAccountScreen);
    });

    test('Add username data.', () async {
      await driver.scrollIntoView(usernameInputField);
      await driver.tap(usernameInputField);
      await driver.enterText(realUsername);
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

    test('Clicking register with valid data should direct user to home screen.', () async {
      await driver.scrollIntoView(registerBtn);
      await driver.tap(registerBtn);
      await driver.waitFor(homeScreen);
    });
  });
}
