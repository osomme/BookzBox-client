// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewAccountStore on _NewAccountStore, Store {
  Computed<String> _$usernameComputed;

  @override
  String get username =>
      (_$usernameComputed ??= Computed<String>(() => super.username)).value;
  Computed<String> _$usernameErrorComputed;

  @override
  String get usernameError =>
      (_$usernameErrorComputed ??= Computed<String>(() => super.usernameError))
          .value;
  Computed<bool> _$usernameIsValidComputed;

  @override
  bool get usernameIsValid => (_$usernameIsValidComputed ??=
          Computed<bool>(() => super.usernameIsValid))
      .value;

  final _$_usernameAtom = Atom(name: '_NewAccountStore._username');

  @override
  String get _username {
    _$_usernameAtom.context.enforceReadPolicy(_$_usernameAtom);
    _$_usernameAtom.reportObserved();
    return super._username;
  }

  @override
  set _username(String value) {
    _$_usernameAtom.context.conditionallyRunInAction(() {
      super._username = value;
      _$_usernameAtom.reportChanged();
    }, _$_usernameAtom, name: '${_$_usernameAtom.name}_set');
  }

  final _$_NewAccountStoreActionController =
      ActionController(name: '_NewAccountStore');

  @override
  void setUsername(String username) {
    final _$actionInfo = _$_NewAccountStoreActionController.startAction();
    try {
      return super.setUsername(username);
    } finally {
      _$_NewAccountStoreActionController.endAction(_$actionInfo);
    }
  }
}
