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

  final _$_boxesAtom = Atom(name: '_FeedStore._boxes');

  @override
  List<BoxFeedListItem> get _boxes {
    _$_boxesAtom.context.enforceReadPolicy(_$_boxesAtom);
    _$_boxesAtom.reportObserved();
    return super._boxes;
  }

  @override
  set _boxes(List<BoxFeedListItem> value) {
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

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init(String userId) {
    return _$initAsyncAction.run(() => super.init(userId));
  }
}
