import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'login_credentials_store.g.dart';

class LoginCredentialsStore = _LoginCredentialsStore with _$LoginCredentialsStore;

abstract class _LoginCredentialsStore with Store {
  @observable
  String _email;

  @observable
  String _password;

  @computed
  String get email => _email ?? '';

  @computed
  String get password => _password ?? '';

  @computed
  bool get credentialsAreValid => _email != null && _password != null
      ? isEmail(_email) && _password.isNotEmpty
      : false;

  @computed
  String get emailError {
    if (_email == null) {
      return null;
    }
    return !isEmail(_email) ? "Invalid E-mail address" : null;
  }

  @computed
  String get passwordError {
    if (_password == null) {
      return null;
    }
    return _password.isEmpty || _password.length < 8
        ? "Password must be greater than 8 characters"
        : null;
  }

  @computed
  bool get emailIsValid => emailError == null;

  @computed
  bool get passwordIsValid => passwordError == null;

  @action
  void setPassword(String password) =>
      _password = password?.replaceAll(RegExp(r'\s'), '');

  @action
  void setEmail(String email) =>
      _email = email?.replaceAll(RegExp(r'\s'), '')?.toLowerCase();

  @action
  void reset() {
    _email = null;
    _password = null;
  }
}
