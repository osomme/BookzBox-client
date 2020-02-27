// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoxDetailsStore on _BoxDetailsStore, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading)).value;
  Computed<Box> _$boxComputed;

  @override
  Box get box => (_$boxComputed ??= Computed<Box>(() => super.box)).value;
  Computed<BoxDetailsError> _$errorComputed;

  @override
  BoxDetailsError get error =>
      (_$errorComputed ??= Computed<BoxDetailsError>(() => super.error)).value;

  final _$_isLoadingAtom = Atom(name: '_BoxDetailsStore._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.context.enforceReadPolicy(_$_isLoadingAtom);
    _$_isLoadingAtom.reportObserved();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.context.conditionallyRunInAction(() {
      super._isLoading = value;
      _$_isLoadingAtom.reportChanged();
    }, _$_isLoadingAtom, name: '${_$_isLoadingAtom.name}_set');
  }

  final _$_boxAtom = Atom(name: '_BoxDetailsStore._box');

  @override
  Box get _box {
    _$_boxAtom.context.enforceReadPolicy(_$_boxAtom);
    _$_boxAtom.reportObserved();
    return super._box;
  }

  @override
  set _box(Box value) {
    _$_boxAtom.context.conditionallyRunInAction(() {
      super._box = value;
      _$_boxAtom.reportChanged();
    }, _$_boxAtom, name: '${_$_boxAtom.name}_set');
  }

  final _$_errorAtom = Atom(name: '_BoxDetailsStore._error');

  @override
  BoxDetailsError get _error {
    _$_errorAtom.context.enforceReadPolicy(_$_errorAtom);
    _$_errorAtom.reportObserved();
    return super._error;
  }

  @override
  set _error(BoxDetailsError value) {
    _$_errorAtom.context.conditionallyRunInAction(() {
      super._error = value;
      _$_errorAtom.reportChanged();
    }, _$_errorAtom, name: '${_$_errorAtom.name}_set');
  }

  final _$fetchBoxDetailsAsyncAction = AsyncAction('fetchBoxDetails');

  @override
  Future<void> fetchBoxDetails(String boxId) {
    return _$fetchBoxDetailsAsyncAction.run(() => super.fetchBoxDetails(boxId));
  }
}
