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
  Computed<MiniBox> _$currentBoxComputed;

  @override
  MiniBox get currentBox =>
      (_$currentBoxComputed ??= Computed<MiniBox>(() => super.currentBox))
          .value;
  Computed<bool> _$isFirstVisibilityChangeComputed;

  @override
  bool get isFirstVisibilityChange => (_$isFirstVisibilityChangeComputed ??=
          Computed<bool>(() => super.isFirstVisibilityChange))
      .value;
  Computed<BoxStatus> _$startBoxStatusComputed;

  @override
  BoxStatus get startBoxStatus => (_$startBoxStatusComputed ??=
          Computed<BoxStatus>(() => super.startBoxStatus))
      .value;
  Computed<String> _$updateErrorComputed;

  @override
  String get updateError =>
      (_$updateErrorComputed ??= Computed<String>(() => super.updateError))
          .value;

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

  final _$_currentBoxAtom = Atom(name: '_ProfileBoxStore._currentBox');

  @override
  MiniBox get _currentBox {
    _$_currentBoxAtom.context.enforceReadPolicy(_$_currentBoxAtom);
    _$_currentBoxAtom.reportObserved();
    return super._currentBox;
  }

  @override
  set _currentBox(MiniBox value) {
    _$_currentBoxAtom.context.conditionallyRunInAction(() {
      super._currentBox = value;
      _$_currentBoxAtom.reportChanged();
    }, _$_currentBoxAtom, name: '${_$_currentBoxAtom.name}_set');
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

  final _$_startBoxStatusAtom = Atom(name: '_ProfileBoxStore._startBoxStatus');

  @override
  BoxStatus get _startBoxStatus {
    _$_startBoxStatusAtom.context.enforceReadPolicy(_$_startBoxStatusAtom);
    _$_startBoxStatusAtom.reportObserved();
    return super._startBoxStatus;
  }

  @override
  set _startBoxStatus(BoxStatus value) {
    _$_startBoxStatusAtom.context.conditionallyRunInAction(() {
      super._startBoxStatus = value;
      _$_startBoxStatusAtom.reportChanged();
    }, _$_startBoxStatusAtom, name: '${_$_startBoxStatusAtom.name}_set');
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

  final _$_isFirstVisibilityChangeAtom =
      Atom(name: '_ProfileBoxStore._isFirstVisibilityChange');

  @override
  bool get _isFirstVisibilityChange {
    _$_isFirstVisibilityChangeAtom.context
        .enforceReadPolicy(_$_isFirstVisibilityChangeAtom);
    _$_isFirstVisibilityChangeAtom.reportObserved();
    return super._isFirstVisibilityChange;
  }

  @override
  set _isFirstVisibilityChange(bool value) {
    _$_isFirstVisibilityChangeAtom.context.conditionallyRunInAction(() {
      super._isFirstVisibilityChange = value;
      _$_isFirstVisibilityChangeAtom.reportChanged();
    }, _$_isFirstVisibilityChangeAtom,
        name: '${_$_isFirstVisibilityChangeAtom.name}_set');
  }

  final _$_updateErrorAtom = Atom(name: '_ProfileBoxStore._updateError');

  @override
  String get _updateError {
    _$_updateErrorAtom.context.enforceReadPolicy(_$_updateErrorAtom);
    _$_updateErrorAtom.reportObserved();
    return super._updateError;
  }

  @override
  set _updateError(String value) {
    _$_updateErrorAtom.context.conditionallyRunInAction(() {
      super._updateError = value;
      _$_updateErrorAtom.reportChanged();
    }, _$_updateErrorAtom, name: '${_$_updateErrorAtom.name}_set');
  }

  final _$updateBoxVisibilityAsyncAction = AsyncAction('updateBoxVisibility');

  @override
  Future<dynamic> updateBoxVisibility() {
    return _$updateBoxVisibilityAsyncAction
        .run(() => super.updateBoxVisibility());
  }

  final _$_ProfileBoxStoreActionController =
      ActionController(name: '_ProfileBoxStore');

  @override
  void init(String userId, bool myProfile) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.init(userId, myProfile);
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
  void handleUpdateRes(Either<String, Box> res) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.handleUpdateRes(res);
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

  @override
  void setCurrentBox(MiniBox box) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.setCurrentBox(box);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsFirstVisibilityChange(bool isFirstChange) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.setIsFirstVisibilityChange(isFirstChange);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartBoxStatus(BoxStatus status) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.setStartBoxStatus(status);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUpdateError(String err) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.setUpdateError(err);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBoxStatus(BoxStatus status, int index) {
    final _$actionInfo = _$_ProfileBoxStoreActionController.startAction();
    try {
      return super.setBoxStatus(status, index);
    } finally {
      _$_ProfileBoxStoreActionController.endAction(_$actionInfo);
    }
  }
}
