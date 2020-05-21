import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'map_store.g.dart';

/// Store which contains reactive properties and methods for interacting with map boxes.
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

  /// Constructor which takes a repository and location service and immediatly loads boxes and user location.
  _MapStore(this._locationService, this._repository) {
    _fetchBoxes();
    _fetchUserLocation();
  }

  /// Gets a list of [BoxMapItem] according to the currently set filter.
  /// If no filter is set, then all loaded boxes are shown.
  @computed
  List<BoxMapItem> get boxes {
    if (!_filters.hasAnyFilter) {
      return _boxes;
    }
    return _boxes.where((b) => _filters.filters.every((f) => f(b))).toList();
  }

  /// The clients current latitudinal and longitudinal position.
  @computed
  Option<LatLng> get userPosition => _userPosition;

  /// A map error in the event of a network failure or such. See [MapError] for possible errors.
  @computed
  MapError get error => _error;

  /// Returns true if the store is curerntly loading boxes from service.
  @computed
  bool get isLoadingBoxes => _isLoadingBoxes;

  /// Returns true if the user has set a filter. Returns false if there is no active filter.
  @computed
  bool get hasActiveFilter => _filters.hasAnyFilter;

  /// The current filter input values.
  @computed
  BoxFilterValues get filters => _filters;

  /// Sets a box filter. Will automatically refresh the boxes property.
  ///
  /// [filters] The filters that will be applied.
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
        print('Location found in map store: $loc');
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
