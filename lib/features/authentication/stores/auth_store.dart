import 'package:bookzbox/features/authentication/models/models.dart';
import 'package:bookzbox/features/authentication/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final IAuthRepository _repository;

  @observable
  User _user;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage;

  @computed
  User get user => _user;

  @computed
  bool get isLoggedIn => _user != null;

  _AuthStore(this._repository) {
    _checkAuthStatus();
  }

  @action
  void logOut() {
    _repository.logOut();
    _user = null;
  }

  @action
  Future<void> registerUser(String username, String email, String password) async {
    errorMessage = null;
    isLoading = true;
    final result = await _repository.registerWithEmail(email, password, username);
    _handleLoginResult(result);
    isLoading = false;
  }

  @action
  Future<void> signInWithGoogle() async {
    errorMessage = null;
    isLoading = true;
    final result = await _repository.signInWithGoogle();
    _handleLoginResult(result);
    isLoading = false;
  }

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

  @action
  void clearError() => errorMessage = null;
}
