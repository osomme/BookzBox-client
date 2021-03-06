// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on _FeedStore, Store {
  Computed<bool> _$isInitializedComputed;

  @override
  bool get isInitialized =>
      (_$isInitializedComputed ??= Computed<bool>(() => super.isInitialized))
          .value;
  Computed<String> _$userIdComputed;

  @override
  String get userId =>
      (_$userIdComputed ??= Computed<String>(() => super.userId)).value;
  Computed<NetworkError> _$errorComputed;

  @override
  NetworkError get error =>
      (_$errorComputed ??= Computed<NetworkError>(() => super.error)).value;
  Computed<List<BoxFeedListItem>> _$boxesComputed;

  @override
  List<BoxFeedListItem> get boxes =>
      (_$boxesComputed ??= Computed<List<BoxFeedListItem>>(() => super.boxes))
          .value;
  Computed<bool> _$initialLoadingOngoingComputed;

  @override
  bool get initialLoadingOngoing => (_$initialLoadingOngoingComputed ??=
          Computed<bool>(() => super.initialLoadingOngoing))
      .value;

  final _$_userIdAtom = Atom(name: '_FeedStore._userId');

  @override
  String get _userId {
    _$_userIdAtom.context.enforceReadPolicy(_$_userIdAtom);
    _$_userIdAtom.reportObserved();
    return super._userId;
  }

  @override
  set _userId(String value) {
    _$_userIdAtom.context.conditionallyRunInAction(() {
      super._userId = value;
      _$_userIdAtom.reportChanged();
    }, _$_userIdAtom, name: '${_$_userIdAtom.name}_set');
  }

  final _$_isInitializedAtom = Atom(name: '_FeedStore._isInitialized');

  @override
  bool get _isInitialized {
    _$_isInitializedAtom.context.enforceReadPolicy(_$_isInitializedAtom);
    _$_isInitializedAtom.reportObserved();
    return super._isInitialized;
  }

  @override
  set _isInitialized(bool value) {
    _$_isInitializedAtom.context.conditionallyRunInAction(() {
      super._isInitialized = value;
      _$_isInitializedAtom.reportChanged();
    }, _$_isInitializedAtom, name: '${_$_isInitializedAtom.name}_set');
  }

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

  final _$_latitudeAtom = Atom(name: '_FeedStore._latitude');

  @override
  double get _latitude {
    _$_latitudeAtom.context.enforceReadPolicy(_$_latitudeAtom);
    _$_latitudeAtom.reportObserved();
    return super._latitude;
  }

  @override
  set _latitude(double value) {
    _$_latitudeAtom.context.conditionallyRunInAction(() {
      super._latitude = value;
      _$_latitudeAtom.reportChanged();
    }, _$_latitudeAtom, name: '${_$_latitudeAtom.name}_set');
  }

  final _$_longitudeAtom = Atom(name: '_FeedStore._longitude');

  @override
  double get _longitude {
    _$_longitudeAtom.context.enforceReadPolicy(_$_longitudeAtom);
    _$_longitudeAtom.reportObserved();
    return super._longitude;
  }

  @override
  set _longitude(double value) {
    _$_longitudeAtom.context.conditionallyRunInAction(() {
      super._longitude = value;
      _$_longitudeAtom.reportChanged();
    }, _$_longitudeAtom, name: '${_$_longitudeAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init(String userId) {
    return _$initAsyncAction.run(() => super.init(userId));
  }

  final _$fetchBoxesAsyncAction = AsyncAction('fetchBoxes');

  @override
  Future<void> fetchBoxes(String userId) {
    return _$fetchBoxesAsyncAction.run(() => super.fetchBoxes(userId));
  }

  final _$markAsReadAsyncAction = AsyncAction('markAsRead');

  @override
  Future<void> markAsRead(String userId, int index) {
    return _$markAsReadAsyncAction.run(() => super.markAsRead(userId, index));
  }
}
