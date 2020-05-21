import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'login_credentials_store.g.dart';

/// Store responsible for determining whether a set of email and password combination is valid.
class LoginCredentialsStore = _LoginCredentialsStore with _$LoginCredentialsStore;

abstract class _LoginCredentialsStore with Store {
  @observable
  String _email;

  @observable
  String _password;

  /// The currently set email.
  @computed
  String get email => _email ?? '';

  /// The currently set password.
  @computed
  String get password => _password ?? '';

  /// Whether the current email and password combination is valid.
  @computed
  bool get credentialsAreValid => _email != null && _password != null
      ? isEmail(_email) && _password.length >= 8
      : false;

  /// A string representation of the current email error, or null if there is no error.
  @computed
  String get emailError {
    if (_email == null) {
      return null;
    }
    return !isEmail(_email) ? "Invalid E-mail address" : null;
  }

  /// A string representation of the current password error, or null if there is no error.
  @computed
  String get passwordError {
    if (_password == null) {
      return null;
    }
    return _password.isEmpty || _password.length < 8
        ? "Password must be greater than 8 characters"
        : null;
  }

  /// Whether the email is valid or not.
  @computed
  bool get emailIsValid => emailError == null;

  /// Whether the password is valid or not.
  @computed
  bool get passwordIsValid => passwordError == null;

  /// Sets the current password.
  ///
  /// [password] The password that is being set.
  @action
  void setPassword(String password) =>
      _password = password?.replaceAll(RegExp(r'\s'), '');

  /// Sets the current email.
  ///
  /// [email] The email that is being set.
  @action
  void setEmail(String email) =>
      _email = email?.replaceAll(RegExp(r'\s'), '')?.toLowerCase();

  /// Resets the email and password combination.
  @action
  void reset() {
    _email = null;
    _password = null;
  }
}
