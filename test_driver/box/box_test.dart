import 'package:bookzbox/common/widgets/keys.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/// Use care when running this test. It is fully integrated with
/// operational systems. It adds real data to real systems.
void main() {
  group('BOX TEST', () {
    final profileNavBtn = find.byValueKey(Keys.profileNavBtnKey);
    final profileScreen = find.byValueKey(Keys.profileScreenKey);
    final newBoxBtn = find.byValueKey(Keys.newBoxMainBtnKey);
    final newBoxScreen = find.byValueKey(Keys.newBoxScreenKey);
    final profileScrollView = find.byValueKey(Keys.profileMainScreenScrollViewKey);
    final addBookBtn = find.byValueKey(Keys.addBookBtnKey);
    final isbnLookupDialog = find.byValueKey(Keys.isbnLookupDialogKey);
    final isbnInputField = find.byValueKey(Keys.isbnInputFieldKey);
    final findBookBtn = find.byValueKey(Keys.findBookBtnKey);
    final bookDialog = find.byValueKey(Keys.bookDialogKey);
    final bookConditionNew = find.byValueKey(Keys.bookConditionNewKey);
    final addBookDialogBtn = find.byValueKey(Keys.addBookDialogBtnKey);
    final boxTitleInputField = find.byValueKey(Keys.boxTitleInputFieldKey);
    final boxPublishBtn = find.byValueKey(Keys.boxPublishBtnKey);
    final boxDetailsScreen = find.byValueKey(Keys.boxDetailsScreenKey);

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

    group('CREATE', () {
      test('Clicking "new box"-button should open "new box"-screen.', () async {
        await driver.scrollUntilVisible(profileScrollView, newBoxBtn);
        await driver.scrollIntoView(newBoxBtn);
        await driver.tap(newBoxBtn);
        await driver.waitFor(newBoxScreen);
      });

      test('Clicking "add book"-button should open lookup dialog.', () async {
        await driver.waitFor(addBookBtn);
        await driver.tap(addBookBtn);
        await driver.waitFor(isbnLookupDialog);
      });

      test('ISBN dialog should direct to book dialog after lookup.', () async {
        await driver.waitFor(isbnInputField);
        await driver.tap(isbnInputField);
        await driver.enterText('9788215031040');
        await driver.tap(findBookBtn);
        await driver.waitFor(bookDialog);
      });

      test('Add book should remove dialog.', () async {
        await driver.tap(bookConditionNew);
        await driver.tap(addBookDialogBtn);
        await driver.waitForAbsent(bookDialog);
      });

      test('Add title.', () async {
        await driver.tap(boxTitleInputField);
        await driver.enterText('Books');
      });
    });

    group('PUBLISH', () {
      test('Clicking publish should direct user to box details page.', () async {
        await driver.tap(boxPublishBtn);
        await driver.waitFor(boxDetailsScreen);
      });
    });
  });
}
