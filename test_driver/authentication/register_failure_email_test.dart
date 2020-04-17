import 'package:bookzbox/common/widgets/keys.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('REGISTER FAILURE EMAIL TAKEN', () {
    final String testUsernameValid = 'TestTest';
    final String testEmailValid = 'test@test.test'; // Previously registered email address.
    final String testPasswordValid = 'ValidTestPsw123';

    final newAccountNavBtn = find.byValueKey(Keys.newAccountNavButtonKey);
    final newAccountScreen = find.byValueKey(Keys.newAccountScreenKey);
    final registerBtn = find.byValueKey(Keys.registerBtnKey);
    final usernameInputField = find.byValueKey(Keys.usernameInputFieldKey);
    final emailInputField = find.byValueKey(Keys.emailInputFieldKey);
    final passwordInputField = find.byValueKey(Keys.passwordInputFieldKey);
    final authErrorText = find.byValueKey(Keys.authErrorTextKey);

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
      await driver.enterText(testUsernameValid);
    });

    test('Add email data.', () async {
      await driver.scrollIntoView(emailInputField);
      await driver.tap(emailInputField);
      await driver.enterText(testEmailValid);
    });

    test('Add password data.', () async {
      await driver.scrollIntoView(passwordInputField);
      await driver.tap(passwordInputField);
      await driver.enterText(testPasswordValid);
    });

    test('Clicking register with already registered email should show error.', () async {
      await driver.scrollIntoView(registerBtn);
      await driver.tap(registerBtn);

      await driver.waitFor(authErrorText);
    });
  });
}
