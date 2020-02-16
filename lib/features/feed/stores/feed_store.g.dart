// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on _FeedStore, Store {
  Computed<NetworkError> _$errorComputed;

  @override
  NetworkError get error =>
      (_$errorComputed ??= Computed<NetworkError>(() => super.error)).value;
  Computed<ObservableList<BoxFeedListItem>> _$boxesComputed;

  @override
  ObservableList<BoxFeedListItem> get boxes => (_$boxesComputed ??=
          Computed<ObservableList<BoxFeedListItem>>(() => super.boxes))
      .value;
  Computed<bool> _$initialLoadingOngoingComputed;

  @override
  bool get initialLoadingOngoing => (_$initialLoadingOngoingComputed ??=
          Computed<bool>(() => super.initialLoadingOngoing))
      .value;
  Computed<bool> _$incrementalLoadingComputed;

  @override
  bool get incrementalLoading => (_$incrementalLoadingComputed ??=
          Computed<bool>(() => super.incrementalLoading))
      .value;
  Computed<int> _$currentIndexComputed;

  @override
  int get currentIndex =>
      (_$currentIndexComputed ??= Computed<int>(() => super.currentIndex))
          .value;

  final _$_boxesAtom = Atom(name: '_FeedStore._boxes');

  @override
  ObservableList<BoxFeedListItem> get _boxes {
    _$_boxesAtom.context.enforceReadPolicy(_$_boxesAtom);
    _$_boxesAtom.reportObserved();
    return super._boxes;
  }

  @override
  set _boxes(ObservableList<BoxFeedListItem> value) {
    _$_boxesAtom.context.conditionallyRunInAction(() {
      super._boxes = value;
      _$_boxesAtom.reportChanged();
    }, _$_boxesAtom, name: '${_$_boxesAtom.name}_set');
  }

  final _$_errorAtom = Atom(name: '_FeedStore._error');

  @override
  NetworkError get _error {
    _$_errorAtom.context.enforceReadPolicy(_$_errorAtom);
    _$_errorAtom.reportObserved();
    return super._error;
  }

  @override
  set _error(NetworkError value) {
    _$_errorAtom.context.conditionallyRunInAction(() {
      super._error = value;
      _$_errorAtom.reportChanged();
    }, _$_errorAtom, name: '${_$_errorAtom.name}_set');
  }

  final _$_initialLoadingOngoingAtom =
      Atom(name: '_FeedStore._initialLoadingOngoing');

  @override
  bool get _initialLoadingOngoing {
    _$_initialLoadingOngoingAtom.context
        .enforceReadPolicy(_$_initialLoadingOngoingAtom);
    _$_initialLoadingOngoingAtom.reportObserved();
    return super._initialLoadingOngoing;
  }

  @override
  set _initialLoadingOngoing(bool value) {
    _$_initialLoadingOngoingAtom.context.conditionallyRunInAction(() {
      super._initialLoadingOngoing = value;
      _$_initialLoadingOngoingAtom.reportChanged();
    }, _$_initialLoadingOngoingAtom,
        name: '${_$_initialLoadingOngoingAtom.name}_set');
  }

  final _$_incrementalLoadingAtom =
      Atom(name: '_FeedStore._incrementalLoading');

  @override
  bool get _incrementalLoading {
    _$_incrementalLoadingAtom.context
        .enforceReadPolicy(_$_incrementalLoadingAtom);
    _$_incrementalLoadingAtom.reportObserved();
    return super._incrementalLoading;
  }

  @override
  set _incrementalLoading(bool value) {
    _$_incrementalLoadingAtom.context.conditionallyRunInAction(() {
      super._incrementalLoading = value;
      _$_incrementalLoadingAtom.reportChanged();
    }, _$_incrementalLoadingAtom,
        name: '${_$_incrementalLoadingAtom.name}_set');
  }

  final _$_currentIndexAtom = Atom(name: '_FeedStore._currentIndex');

  @override
  int get _currentIndex {
    _$_currentIndexAtom.context.enforceReadPolicy(_$_currentIndexAtom);
    _$_currentIndexAtom.reportObserved();
    return super._currentIndex;
  }

  @override
  set _currentIndex(int value) {
    _$_currentIndexAtom.context.conditionallyRunInAction(() {
      super._currentIndex = value;
      _$_currentIndexAtom.reportChanged();
    }, _$_currentIndexAtom, name: '${_$_currentIndexAtom.name}_set');
  }

  final _$_incrementalLoadAsyncAction = AsyncAction('_incrementalLoad');

  @override
  Future<void> _incrementalLoad() {
    return _$_incrementalLoadAsyncAction.run(() => super._incrementalLoad());
  }

  final _$_initialFetchAsyncAction = AsyncAction('_initialFetch');

  @override
  Future<void> _initialFetch() {
    return _$_initialFetchAsyncAction.run(() => super._initialFetch());
  }

  final _$_FeedStoreActionController = ActionController(name: '_FeedStore');

  @override
  void setIndex(int index) {
    final _$actionInfo = _$_FeedStoreActionController.startAction();
    try {
      return super.setIndex(index);
    } finally {
      _$_FeedStoreActionController.endAction(_$actionInfo);
    }
  }
}
