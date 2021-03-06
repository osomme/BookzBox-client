import 'package:bookzbox/features/authentication/models/models.dart';
import 'package:bookzbox/features/authentication/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

/// Store which contains reactive properties and methods for managing authentication state.
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final IAuthRepository _repository;

  @observable
  User _user;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage;

  /// The currently logged in user. Returns null if not logged in.
  @computed
  User get user => _user;

  /// Whether the user is currently logged in or not.
  @computed
  bool get isLoggedIn => _user != null;

  /// Constructor of the store which takes a [IAuthRepository] instance as its parameter.
  _AuthStore(this._repository) {
    _checkAuthStatus();
  }

  /// Logs out the currently logged in user.
  @action
  void logOut() {
    _repository.logOut();
    _user = null;
  }

  /// Registers a new user using the email registration method.
  ///
  /// [username] The username of the newly registered user.
  /// [email] The email of the newly registered user.
  /// [password] The password of the newly registered user.
  @action
  Future<void> registerUser(String username, String email, String password) async {
    errorMessage = null;
    isLoading = true;
    final result = await _repository.registerWithEmail(email, password, username);
    _handleLoginResult(result);
    isLoading = false;
  }

  /// Signs in the user using the Google authentication method.
  /// Registers a new account if the user does not already have an Google authenticated account.
  @action
  Future<void> signInWithGoogle() async {
    errorMessage = null;
    isLoading = true;
    final result = await _repository.signInWithGoogle();
    _handleLoginResult(result);
    isLoading = false;
  }

  /// Signs in the user using the email authentication method.
  ///
  /// [email] The email of the user account.
  /// [password] The password of the user account.
  @action
  Future<void> signInWithEmail(String email, String password) async {
    errorMessage = null;
    isLoading = true;
    final result = await _repository.signInWithEmail(email, password);
    _handleLoginResult(result);
    isLoading = false;
  }

  @action
  Future<void> _checkAuthStatus() async {
    isLoading = true;
    _user = await _repository.user;
    isLoading = false;
  }

  void _handleLoginResult(Either<String, User> result) => result.fold(
        (error) => errorMessage = error,
        (user) => _user = user,
      );

  /// Clears the currently set error message.
  @action
  void clearError() => errorMessage = null;
}
