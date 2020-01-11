// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  Computed<User> _$userComputed;

  @override
  User get user => (_$userComputed ??= Computed<User>(() => super.user)).value;
  Computed<bool> _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn)).value;

  final _$_userAtom = Atom(name: '_AuthStore._user');

  @override
  User get _user {
    _$_userAtom.context.enforceReadPolicy(_$_userAtom);
    _$_userAtom.reportObserved();
    return super._user;
  }

  @override
  set _user(User value) {
    _$_userAtom.context.conditionallyRunInAction(() {
      super._user = value;
      _$_userAtom.reportChanged();
    }, _$_userAtom, name: '${_$_userAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_AuthStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_AuthStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$registerUserAsyncAction = AsyncAction('registerUser');

  @override
  Future<void> registerUser(String username, String email, String password) {
    return _$registerUserAsyncAction
        .run(() => super.registerUser(username, email, password));
  }

  final _$signInWithGoogleAsyncAction = AsyncAction('signInWithGoogle');

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  final _$signInWithEmailAsyncAction = AsyncAction('signInWithEmail');

  @override
  Future<void> signInWithEmail(String email, String password) {
    return _$signInWithEmailAsyncAction
        .run(() => super.signInWithEmail(email, password));
  }

  final _$_checkAuthStatusAsyncAction = AsyncAction('_checkAuthStatus');

  @override
  Future<void> _checkAuthStatus() {
    return _$_checkAuthStatusAsyncAction.run(() => super._checkAuthStatus());
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void logOut() {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.logOut();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }
}
