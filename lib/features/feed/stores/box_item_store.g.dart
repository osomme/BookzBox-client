// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoxItemStore on _BoxItemStore, Store {
  Computed<bool> _$likeLoadingComputed;

  @override
  bool get likeLoading =>
      (_$likeLoadingComputed ??= Computed<bool>(() => super.likeLoading)).value;

  final _$_likeLoadingAtom = Atom(name: '_BoxItemStore._likeLoading');

  @override
  bool get _likeLoading {
    _$_likeLoadingAtom.context.enforceReadPolicy(_$_likeLoadingAtom);
    _$_likeLoadingAtom.reportObserved();
    return super._likeLoading;
  }

  @override
  set _likeLoading(bool value) {
    _$_likeLoadingAtom.context.conditionallyRunInAction(() {
      super._likeLoading = value;
      _$_likeLoadingAtom.reportChanged();
    }, _$_likeLoadingAtom, name: '${_$_likeLoadingAtom.name}_set');
  }

  final _$likeBoxAsyncAction = AsyncAction('likeBox');

  @override
  Future<void> likeBox(Box box) {
    return _$likeBoxAsyncAction.run(() => super.likeBox(box));
  }
}
