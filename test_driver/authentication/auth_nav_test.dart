import 'package:bookzbox/common/widgets/keys.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/// Tests for navigating between the different authentication screens.
void main() {
  group('AUTHENTICATION NAVIGATION', () {
    final newAccountNavBtn = find.byValueKey(Keys.newAccountNavButtonKey);
    final newAccountScreen = find.byValueKey(Keys.newAccountScreenKey);
    final authLoginRegisterToggleBtn = find.byValueKey(Keys.authLoginRegisterToggleBtnKey);
    final loginScreen = find.byValueKey(Keys.loginWithEmailScreenKey);

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Clicking new account button should direct user to new account screen.', () async {
      await driver.tap(newAccountNavBtn);
      await driver.waitFor(newAccountScreen);
    });

    test('Clicking the existing-user-button should direct user to the login screen.', () async {
      await driver.tap(authLoginRegisterToggleBtn);
      await driver.waitFor(loginScreen);
    });
  });
}
