// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_liked_boxes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyLikedBoxesStore on _MyLikedBoxesStore, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading)).value;
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError)).value;
  Computed<List<MiniBox>> _$boxesComputed;

  @override
  List<MiniBox> get boxes =>
      (_$boxesComputed ??= Computed<List<MiniBox>>(() => super.boxes)).value;

  final _$_isLoadingAtom = Atom(name: '_MyLikedBoxesStore._isLoading');

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

  final _$_hasErrorAtom = Atom(name: '_MyLikedBoxesStore._hasError');

  @override
  bool get _hasError {
    _$_hasErrorAtom.context.enforceReadPolicy(_$_hasErrorAtom);
    _$_hasErrorAtom.reportObserved();
    return super._hasError;
  }

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.context.conditionallyRunInAction(() {
      super._hasError = value;
      _$_hasErrorAtom.reportChanged();
    }, _$_hasErrorAtom, name: '${_$_hasErrorAtom.name}_set');
  }

  final _$_boxesAtom = Atom(name: '_MyLikedBoxesStore._boxes');

  @override
  List<MiniBox> get _boxes {
    _$_boxesAtom.context.enforceReadPolicy(_$_boxesAtom);
    _$_boxesAtom.reportObserved();
    return super._boxes;
  }

  @override
  set _boxes(List<MiniBox> value) {
    _$_boxesAtom.context.conditionallyRunInAction(() {
      super._boxes = value;
      _$_boxesAtom.reportChanged();
    }, _$_boxesAtom, name: '${_$_boxesAtom.name}_set');
  }
}
