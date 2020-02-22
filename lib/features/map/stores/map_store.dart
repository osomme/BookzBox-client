import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'map_store.g.dart';

class MapStore = _MapStore with _$MapStore;

abstract class _MapStore with Store {
  final ILocationService _locationService;

  @observable
  BoxFeedListItem _box;

  @observable
  Option<LatLng> _userPosition = none();

  _MapStore(this._locationService) {
    _fetchUserLocation();
  }

  @computed
  BoxFeedListItem get box => _box;

  @computed
  bool get detailsWindowOpen => _box != null;

  @computed
  Option<LatLng> get userPosition => _userPosition;

  @action
  Future<void> _fetchUserLocation() async {
    final location = await _locationService.getLocation();
    location.fold(
      (error) => print('Failed to get user location with error: $error'),
      (loc) {
        print('Location found: $loc');
        _userPosition = some(loc);
      },
    );
  }

  @action
  void setCurrentBox(BoxFeedListItem box) => this._box = box;

  @action
  void removeCurrentBox() => _box = null;
}
