import 'dart:async';

import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/location/services/location_service.dart';
import 'package:mobx/mobx.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

abstract class _FeedStore with Store {
  static const int _recommendationLimit = 20;

  StreamSubscription<Iterable<BoxFeedListItem>> _streamSubscription;

  final IFeedRepository _repo;
  final ILocationService _locationService;

  @observable
  List<BoxFeedListItem> _boxes = List();

  @observable
  NetworkError _error;

  @observable
  bool _initialLoadingOngoing = false;

  @observable
  double _latitude = -1.0;

  @observable
  double _longitude = -1.0;

  @computed
  NetworkError get error => _error;

  @computed
  List<BoxFeedListItem> get boxes => _boxes;

  @computed
  bool get initialLoadingOngoing => _initialLoadingOngoing;

  _FeedStore(this._repo, this._locationService);

  @action
  Future<void> init(String userId) async {
    _initialLoadingOngoing = true;

    final locationData = await _locationService.getLocation();
    locationData.fold(
      (error) {
        print('No user location @ feed_store.dart');
      },
      (point) async {
        _latitude = point.latitude;
        _longitude = point.longitude;
      },
    );

    await fetchBoxes(userId);
  }

  /// Disposes the resources that the store is using.
  void dispose() {
    print('Disposing box feed stream');
    _streamSubscription?.cancel();
  }

  /// Fetch [limit] amount of boxes for the user with id [userid].
  /// This method sets the boxes after retreival.
  @action
  Future<void> fetchBoxes(String userId) async {
    if (userId == null || userId.isEmpty) {
      return;
    }
    final res = await _repo.getBoxRecommendations(userId, _recommendationLimit,
        latitude: _latitude, longitude: _longitude);
    res.fold(
      (err) => _error = err,
      (boxes) {
        _initialLoadingOngoing = false;
        _boxes = boxes;
      },
    );
  }

  @action
  void markAsRead(int index) {
    _repo.removeRecommendation(_boxes[index]);
  }
}
