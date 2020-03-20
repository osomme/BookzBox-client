// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapStore on _MapStore, Store {
  Computed<List<BoxMapItem>> _$boxesComputed;

  @override
  List<BoxMapItem> get boxes =>
      (_$boxesComputed ??= Computed<List<BoxMapItem>>(() => super.boxes)).value;
  Computed<Option<LatLng>> _$userPositionComputed;

  @override
  Option<LatLng> get userPosition => (_$userPositionComputed ??=
          Computed<Option<LatLng>>(() => super.userPosition))
      .value;
  Computed<MapError> _$errorComputed;

  @override
  MapError get error =>
      (_$errorComputed ??= Computed<MapError>(() => super.error)).value;
  Computed<bool> _$isLoadingBoxesComputed;

  @override
  bool get isLoadingBoxes =>
      (_$isLoadingBoxesComputed ??= Computed<bool>(() => super.isLoadingBoxes))
          .value;
  Computed<bool> _$hasActiveFilterComputed;

  @override
  bool get hasActiveFilter => (_$hasActiveFilterComputed ??=
          Computed<bool>(() => super.hasActiveFilter))
      .value;
  Computed<BoxFilterValues> _$filtersComputed;

  @override
  BoxFilterValues get filters =>
      (_$filtersComputed ??= Computed<BoxFilterValues>(() => super.filters))
          .value;

  final _$_filtersAtom = Atom(name: '_MapStore._filters');

  @override
  BoxFilterValues get _filters {
    _$_filtersAtom.context.enforceReadPolicy(_$_filtersAtom);
    _$_filtersAtom.reportObserved();
    return super._filters;
  }

  @override
  set _filters(BoxFilterValues value) {
    _$_filtersAtom.context.conditionallyRunInAction(() {
      super._filters = value;
      _$_filtersAtom.reportChanged();
    }, _$_filtersAtom, name: '${_$_filtersAtom.name}_set');
  }

  final _$_boxesAtom = Atom(name: '_MapStore._boxes');

  @override
  List<BoxMapItem> get _boxes {
    _$_boxesAtom.context.enforceReadPolicy(_$_boxesAtom);
    _$_boxesAtom.reportObserved();
    return super._boxes;
  }

  @override
  set _boxes(List<BoxMapItem> value) {
    _$_boxesAtom.context.conditionallyRunInAction(() {
      super._boxes = value;
      _$_boxesAtom.reportChanged();
    }, _$_boxesAtom, name: '${_$_boxesAtom.name}_set');
  }

  final _$_isLoadingBoxesAtom = Atom(name: '_MapStore._isLoadingBoxes');

  @override
  bool get _isLoadingBoxes {
    _$_isLoadingBoxesAtom.context.enforceReadPolicy(_$_isLoadingBoxesAtom);
    _$_isLoadingBoxesAtom.reportObserved();
    return super._isLoadingBoxes;
  }

  @override
  set _isLoadingBoxes(bool value) {
    _$_isLoadingBoxesAtom.context.conditionallyRunInAction(() {
      super._isLoadingBoxes = value;
      _$_isLoadingBoxesAtom.reportChanged();
    }, _$_isLoadingBoxesAtom, name: '${_$_isLoadingBoxesAtom.name}_set');
  }

  final _$_errorAtom = Atom(name: '_MapStore._error');

  @override
  MapError get _error {
    _$_errorAtom.context.enforceReadPolicy(_$_errorAtom);
    _$_errorAtom.reportObserved();
    return super._error;
  }

  @override
  set _error(MapError value) {
    _$_errorAtom.context.conditionallyRunInAction(() {
      super._error = value;
      _$_errorAtom.reportChanged();
    }, _$_errorAtom, name: '${_$_errorAtom.name}_set');
  }

  final _$_userPositionAtom = Atom(name: '_MapStore._userPosition');

  @override
  Option<LatLng> get _userPosition {
    _$_userPositionAtom.context.enforceReadPolicy(_$_userPositionAtom);
    _$_userPositionAtom.reportObserved();
    return super._userPosition;
  }

  @override
  set _userPosition(Option<LatLng> value) {
    _$_userPositionAtom.context.conditionallyRunInAction(() {
      super._userPosition = value;
      _$_userPositionAtom.reportChanged();
    }, _$_userPositionAtom, name: '${_$_userPositionAtom.name}_set');
  }

  final _$_fetchUserLocationAsyncAction = AsyncAction('_fetchUserLocation');

  @override
  Future<void> _fetchUserLocation() {
    return _$_fetchUserLocationAsyncAction
        .run(() => super._fetchUserLocation());
  }

  final _$_fetchBoxesAsyncAction = AsyncAction('_fetchBoxes');

  @override
  Future<void> _fetchBoxes() {
    return _$_fetchBoxesAsyncAction.run(() => super._fetchBoxes());
  }

  final _$_MapStoreActionController = ActionController(name: '_MapStore');

  @override
  void setBoxFilter(BoxFilterValues filters) {
    final _$actionInfo = _$_MapStoreActionController.startAction();
    try {
      return super.setBoxFilter(filters);
    } finally {
      _$_MapStoreActionController.endAction(_$actionInfo);
    }
  }
}
