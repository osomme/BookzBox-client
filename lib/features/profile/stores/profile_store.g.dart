// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  Computed<BoxStatus> _$currentBoxStatusComputed;

  @override
  BoxStatus get currentBoxStatus => (_$currentBoxStatusComputed ??=
          Computed<BoxStatus>(() => super.currentBoxStatus))
      .value;

  final _$myBoxesAtom = Atom(name: '_ProfileStore.myBoxes');

  @override
  ObservableList<MyBox> get myBoxes {
    _$myBoxesAtom.context.enforceReadPolicy(_$myBoxesAtom);
    _$myBoxesAtom.reportObserved();
    return super.myBoxes;
  }

  @override
  set myBoxes(ObservableList<MyBox> value) {
    _$myBoxesAtom.context.conditionallyRunInAction(() {
      super.myBoxes = value;
      _$myBoxesAtom.reportChanged();
    }, _$myBoxesAtom, name: '${_$myBoxesAtom.name}_set');
  }

  final _$profileAtom = Atom(name: '_ProfileStore.profile');

  @override
  Profile get profile {
    _$profileAtom.context.enforceReadPolicy(_$profileAtom);
    _$profileAtom.reportObserved();
    return super.profile;
  }

  @override
  set profile(Profile value) {
    _$profileAtom.context.conditionallyRunInAction(() {
      super.profile = value;
      _$profileAtom.reportChanged();
    }, _$profileAtom, name: '${_$profileAtom.name}_set');
  }

  final _$_currentBoxStatusAtom = Atom(name: '_ProfileStore._currentBoxStatus');

  @override
  BoxStatus get _currentBoxStatus {
    _$_currentBoxStatusAtom.context.enforceReadPolicy(_$_currentBoxStatusAtom);
    _$_currentBoxStatusAtom.reportObserved();
    return super._currentBoxStatus;
  }

  @override
  set _currentBoxStatus(BoxStatus value) {
    _$_currentBoxStatusAtom.context.conditionallyRunInAction(() {
      super._currentBoxStatus = value;
      _$_currentBoxStatusAtom.reportChanged();
    }, _$_currentBoxStatusAtom, name: '${_$_currentBoxStatusAtom.name}_set');
  }

  final _$_ProfileStoreActionController =
      ActionController(name: '_ProfileStore');

  @override
  void setCurrentBoxStatus(BoxStatus status) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction();
    try {
      return super.setCurrentBoxStatus(status);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }
}
