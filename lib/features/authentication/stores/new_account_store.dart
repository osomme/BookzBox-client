import 'package:bookzbox/features/authentication/stores/login_credentials_store.dart';
import 'package:mobx/mobx.dart';

part 'new_account_store.g.dart';

/// Store which contains properties and methods for determining whether new user credentials are valid.
class NewAccountStore = _NewAccountStore with _$NewAccountStore;

abstract class _NewAccountStore extends LoginCredentialsStore with Store {
  @observable
  String _username;

  /// The currently set username.
  @computed
  String get username => _username;

  /// Returns a string representation of the current username error, or null if there is no error.
  @computed
  String get usernameError {
    if (_username == null) {
      return null;
    }
    // Removes whitespace from username and checks if there are non-word charcters in the username.
    final anyIllegalChars = RegExp(r'\W').hasMatch(_username.replaceAll(' ', ''));
    return (_username.length < 5 || _username.length > 14) || anyIllegalChars
        ? 'Username must be between 5 and 14 characters' //TODO: Replace with localized string
        : null;
  }

  /// Whether the currently set username is valid or not.
  @computed
  bool get usernameIsValid => usernameError == null;

  /// Whether the username, email and password combination is valid or not.
  @override
  bool get credentialsAreValid =>
      super.credentialsAreValid && _username != null && usernameError == null;

  /// Resets the currently set credentials.
  @override
  @action
  void reset() {
    _username = null;
    super.reset();
  }

  /// Sets the current username.
  ///
  /// [username] The username that is being set.
  @action
  void setUsername(String username) => _username = username.trim();
}
