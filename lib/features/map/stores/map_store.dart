import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'map_store.g.dart';

class MapStore = _MapStore with _$MapStore;

abstract class _MapStore with Store {
  final ILocationService _locationService;

  final IBoxMapRepository _repository;

  @observable
  BoxFilterValues _filters = BoxFilterValues.noFilters();

  @observable
  List<BoxMapItem> _boxes = List();

  @observable
  bool _isLoadingBoxes = false;

  @observable
  MapError _error;

  @observable
  Option<LatLng> _userPosition = none();

  _MapStore(this._locationService, this._repository) {
    _fetchBoxes();
    _fetchUserLocation();
  }

  @computed
  List<BoxMapItem> get boxes {
    if (!_filters.hasAnyFilter) {
      return _boxes;
    }
    return _boxes.where((b) => _filters.filters.every((f) => f(b))).toList();
  }

  @computed
  Option<LatLng> get userPosition => _userPosition;

  @computed
  MapError get error => _error;

  @computed
  bool get isLoadingBoxes => _isLoadingBoxes;

  @computed
  bool get hasActiveFilter => _filters.hasAnyFilter;

  @computed
  BoxFilterValues get filters => _filters;

  @action
  void setBoxFilter(BoxFilterValues filters) => _filters = filters;

  @action
  Future<void> _fetchUserLocation() async {
    _error = null;
    final location = await _locationService.getLocation();
    location.fold(
      (error) {
        print('Failed to load user location in map store. Error: $error');
        _error = MapError.noLocationPermissions;
      },
      (loc) {
        print('Location found: $loc');
        _userPosition = some(loc);
      },
    );
  }

  @action
  Future<void> _fetchBoxes() async {
    _error = null;
    _isLoadingBoxes = true;
    final result = await _repository.getAllBoxes();
    result.fold(
      (error) => _error = error,
      (boxes) => _boxes = boxes,
    );
    _isLoadingBoxes = false;
    print('Finished loading boxes, length: ${_boxes.length}');
  }
}
