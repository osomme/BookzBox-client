// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_credentials_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginCredentialsStore on _LoginCredentialsStore, Store {
  Computed<String> _$emailComputed;

  @override
  String get email =>
      (_$emailComputed ??= Computed<String>(() => super.email)).value;
  Computed<String> _$passwordComputed;

  @override
  String get password =>
      (_$passwordComputed ??= Computed<String>(() => super.password)).value;
  Computed<bool> _$credentialsAreValidComputed;

  @override
  bool get credentialsAreValid => (_$credentialsAreValidComputed ??=
          Computed<bool>(() => super.credentialsAreValid))
      .value;
  Computed<String> _$emailErrorComputed;

  @override
  String get emailError =>
      (_$emailErrorComputed ??= Computed<String>(() => super.emailError)).value;
  Computed<String> _$passwordErrorComputed;

  @override
  String get passwordError =>
      (_$passwordErrorComputed ??= Computed<String>(() => super.passwordError))
          .value;
  Computed<bool> _$emailIsValidComputed;

  @override
  bool get emailIsValid =>
      (_$emailIsValidComputed ??= Computed<bool>(() => super.emailIsValid))
          .value;
  Computed<bool> _$passwordIsValidComputed;

  @override
  bool get passwordIsValid => (_$passwordIsValidComputed ??=
          Computed<bool>(() => super.passwordIsValid))
      .value;

  final _$_emailAtom = Atom(name: '_LoginCredentialsStore._email');

  @override
  String get _email {
    _$_emailAtom.context.enforceReadPolicy(_$_emailAtom);
    _$_emailAtom.reportObserved();
    return super._email;
  }

  @override
  set _email(String value) {
    _$_emailAtom.context.conditionallyRunInAction(() {
      super._email = value;
      _$_emailAtom.reportChanged();
    }, _$_emailAtom, name: '${_$_emailAtom.name}_set');
  }

  final _$_passwordAtom = Atom(name: '_LoginCredentialsStore._password');

  @override
  String get _password {
    _$_passwordAtom.context.enforceReadPolicy(_$_passwordAtom);
    _$_passwordAtom.reportObserved();
    return super._password;
  }

  @override
  set _password(String value) {
    _$_passwordAtom.context.conditionallyRunInAction(() {
      super._password = value;
      _$_passwordAtom.reportChanged();
    }, _$_passwordAtom, name: '${_$_passwordAtom.name}_set');
  }

  final _$_LoginCredentialsStoreActionController =
      ActionController(name: '_LoginCredentialsStore');

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_LoginCredentialsStoreActionController.startAction();
    try {
      return super.setPassword(password);
    } finally {
      _$_LoginCredentialsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_LoginCredentialsStoreActionController.startAction();
    try {
      return super.setEmail(email);
    } finally {
      _$_LoginCredentialsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_LoginCredentialsStoreActionController.startAction();
    try {
      return super.reset();
    } finally {
      _$_LoginCredentialsStoreActionController.endAction(_$actionInfo);
    }
  }
}
