// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapStore on _MapStore, Store {
  Computed<BoxFeedListItem> _$boxComputed;

  @override
  BoxFeedListItem get box =>
      (_$boxComputed ??= Computed<BoxFeedListItem>(() => super.box)).value;
  Computed<bool> _$detailsWindowOpenComputed;

  @override
  bool get detailsWindowOpen => (_$detailsWindowOpenComputed ??=
          Computed<bool>(() => super.detailsWindowOpen))
      .value;

  final _$_boxAtom = Atom(name: '_MapStore._box');

  @override
  BoxFeedListItem get _box {
    _$_boxAtom.context.enforceReadPolicy(_$_boxAtom);
    _$_boxAtom.reportObserved();
    return super._box;
  }

  @override
  set _box(BoxFeedListItem value) {
    _$_boxAtom.context.conditionallyRunInAction(() {
      super._box = value;
      _$_boxAtom.reportChanged();
    }, _$_boxAtom, name: '${_$_boxAtom.name}_set');
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

  @override
  void removeCurrentBox() {
    final _$actionInfo = _$_MapStoreActionController.startAction();
    try {
      return super.removeCurrentBox();
    } finally {
      _$_MapStoreActionController.endAction(_$actionInfo);
    }
  }
}
