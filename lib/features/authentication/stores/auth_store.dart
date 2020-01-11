import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  bool isLoggedIn = false;

  @action
  void logIn() => isLoggedIn = true;

  @action
  void logOut() => isLoggedIn = false;
}
