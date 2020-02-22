// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapStore on _MapStore, Store {
  Computed<bool> _$detailsWindowOpenComputed;

  @override
  bool get detailsWindowOpen => (_$detailsWindowOpenComputed ??=
          Computed<bool>(() => super.detailsWindowOpen))
      .value;

  final _$boxAtom = Atom(name: '_MapStore.box');

  @override
  BoxFeedListItem get box {
    _$boxAtom.context.enforceReadPolicy(_$boxAtom);
    _$boxAtom.reportObserved();
    return super.box;
  }

  @override
  set box(BoxFeedListItem value) {
    _$boxAtom.context.conditionallyRunInAction(() {
      super.box = value;
      _$boxAtom.reportChanged();
    }, _$boxAtom, name: '${_$boxAtom.name}_set');
  }

  final _$_MapStoreActionController = ActionController(name: '_MapStore');

  @override
  void setCurrentBox(BoxFeedListItem box) {
    final _$actionInfo = _$_MapStoreActionController.startAction();
    try {
      return super.setCurrentBox(box);
    } finally {
      _$_MapStoreActionController.endAction(_$actionInfo);
    }
  }
}
