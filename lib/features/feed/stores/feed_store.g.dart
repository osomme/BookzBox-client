// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on _FeedStore, Store {
  Computed<Option<String>> _$errorMessageComputed;

  @override
  Option<String> get errorMessage => (_$errorMessageComputed ??=
          Computed<Option<String>>(() => super.errorMessage))
      .value;
  Computed<ObservableList<Box>> _$boxesComputed;

  @override
  ObservableList<Box> get boxes =>
      (_$boxesComputed ??= Computed<ObservableList<Box>>(() => super.boxes))
          .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading)).value;

  final _$_boxesAtom = Atom(name: '_FeedStore._boxes');

  @override
  ObservableList<Box> get _boxes {
    _$_boxesAtom.context.enforceReadPolicy(_$_boxesAtom);
    _$_boxesAtom.reportObserved();
    return super._boxes;
  }

  @override
  set _boxes(ObservableList<Box> value) {
    _$_boxesAtom.context.conditionallyRunInAction(() {
      super._boxes = value;
      _$_boxesAtom.reportChanged();
    }, _$_boxesAtom, name: '${_$_boxesAtom.name}_set');
  }

  final _$_errorMessageAtom = Atom(name: '_FeedStore._errorMessage');

  @override
  Option<String> get _errorMessage {
    _$_errorMessageAtom.context.enforceReadPolicy(_$_errorMessageAtom);
    _$_errorMessageAtom.reportObserved();
    return super._errorMessage;
  }

  @override
  set _errorMessage(Option<String> value) {
    _$_errorMessageAtom.context.conditionallyRunInAction(() {
      super._errorMessage = value;
      _$_errorMessageAtom.reportChanged();
    }, _$_errorMessageAtom, name: '${_$_errorMessageAtom.name}_set');
  }

  final _$_isLoadingAtom = Atom(name: '_FeedStore._isLoading');

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

  final _$_wrapLoadingAsyncAction = AsyncAction('_wrapLoading');

  @override
  Future<void> _wrapLoading(Function function) {
    return _$_wrapLoadingAsyncAction.run(() => super._wrapLoading(function));
  }

  final _$_FeedStoreActionController = ActionController(name: '_FeedStore');

  @override
  void _fetchBoxes() {
    final _$actionInfo = _$_FeedStoreActionController.startAction();
    try {
      return super._fetchBoxes();
    } finally {
      _$_FeedStoreActionController.endAction(_$actionInfo);
    }
  }
}
