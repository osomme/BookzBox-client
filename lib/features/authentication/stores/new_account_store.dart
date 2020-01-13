import 'package:bookzbox/features/authentication/stores/login_credentials_store.dart';
import 'package:mobx/mobx.dart';

part 'new_account_store.g.dart';

class NewAccountStore = _NewAccountStore with _$NewAccountStore;

abstract class _NewAccountStore extends LoginCredentialsStore with Store {
  @observable
  String _username;

  @computed
  String get username => _username;

  @computed
  String get usernameError {
    if (_username == null) {
      return null;
    }
    // Removes whitespace from username and checks if there are non-word charcters in the username.
    final anyIllegalChars = RegExp(r'\W').hasMatch(_username.replaceAll(' ', ''));
    return (_username.length < 5 || _username.length > 14) || anyIllegalChars
        ? 'Username invalid'
        : null;
  }

  @computed
  bool get usernameIsValid => usernameError == null;

  @override
  bool get credentialsAreValid =>
      super.credentialsAreValid && _username != null && usernameError == null;

  @override
  @action
  void reset() {
    _username = null;
    super.reset();
  }

  @action
  void setUsername(String username) => _username = username.trim();
}
