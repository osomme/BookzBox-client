import 'package:bookzbox/features/authentication/models/models.dart';
import 'package:bookzbox/features/authentication/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final IAuthRepository _repository;

  @observable
  User _user;

  @computed
  User get user => _user;

  @computed
  bool get isLoggedIn => _user != null;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage;

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
    isLoading = true;
    final result = await _repository.registerWithEmail(email, password, username);
    result.fold(
      (error) => errorMessage = error,
      (user) => _user = user,
    );
    isLoading = false;
  }

  @action
  Future<void> signInWithGoogle() async {
    isLoading = true;
    final result = await _repository.signInWithGoogle();
    result.fold(
      (error) => errorMessage = error,
      (user) => _user = user,
    );
    isLoading = false;
  }

  @action
  Future<void> signInWithEmail(String email, String password) async {
    isLoading = true;
    final result = await _repository.signInWithEmail(email, password);
    result.fold(
      (error) => errorMessage = error,
      (user) => _user = user,
    );
    isLoading = false;
  }

  @action
  Future<void> _checkAuthStatus() async {
    isLoading = true;
    _user = await _repository.user;
    isLoading = false;
  }
}
