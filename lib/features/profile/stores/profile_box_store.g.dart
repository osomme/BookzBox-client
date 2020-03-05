// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_box_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileBoxStore on _ProfileBoxStore, Store {
  Computed<BoxStatus> _$currentBoxStatusComputed;

  @override
  BoxStatus get currentBoxStatus => (_$currentBoxStatusComputed ??=
          Computed<BoxStatus>(() => super.currentBoxStatus))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading)).value;

  final _$myBoxesAtom = Atom(name: '_ProfileBoxStore.myBoxes');

  @override
  ObservableList<MiniBox> get myBoxes {
    _$myBoxesAtom.context.enforceReadPolicy(_$myBoxesAtom);
    _$myBoxesAtom.reportObserved();
    return super.myBoxes;
  }

  @override
  set myBoxes(ObservableList<MiniBox> value) {
    _$myBoxesAtom.context.conditionallyRunInAction(() {
      super.myBoxes = value;
      _$myBoxesAtom.reportChanged();
    }, _$myBoxesAtom, name: '${_$myBoxesAtom.name}_set');
  }

  final _$_currentBoxStatusAtom =
      Atom(name: '_ProfileBoxStore._currentBoxStatus');

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

  final _$_isLoadingAtom = Atom(name: '_ProfileBoxStore._isLoading');

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

  final _$_ProfileBoxStoreActionController =
      ActionController(name: '_ProfileBoxStore');

  @override
  void init(String userId) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.init(userId);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleResult(Either<String, List<MiniBox>> res) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.handleResult(res);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleFetchError(String err) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.handleFetchError(err);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleFetchSuccess(List<MiniBox> boxes) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.handleFetchSuccess(boxes);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentBoxStatus(BoxStatus status) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.setCurrentBoxStatus(status);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool isLoading) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.setIsLoading(isLoading);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }
}
