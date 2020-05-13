import 'dart:async';

import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/location/services/location_service.dart';
import 'package:mobx/mobx.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

abstract class _FeedStore with Store {
  /// The maximum amount of box recommendations to fetch
  /// with each fetch.
  static const int _recommendationLimit = 10;

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

  /// Initialize the feed.
  /// This method first fetches the location of the user and there after
  /// boxes for the user. This method should be called once(1) after creating
  /// the feed store.
  @action
  Future<void> init(String userId) async {
    _initialLoadingOngoing = true;

    final locationData = await _locationService.getLocation();
    locationData.fold(
      (error) {
        print('No user location @ feed_store.dart with error: $error');
      },
      (point) {
        _latitude = point.latitude;
        _longitude = point.longitude;
      },
    );

    await fetchBoxes(userId);
  }

  /// Fetch [limit] amount of boxes for the user with id [userid].
  /// This method sets the boxes after retreival.
  @action
  Future<void> fetchBoxes(String userId) async {
    if (userId == null || userId.isEmpty) {
      print('User ID was null in feed store');
      return;
    }

    await internalFetchBoxes(userId);

    _initialLoadingOngoing = false;
  }

  @action
  Future<void> markAsRead(String userId, int index) async {
    if (userId == null || index < 0 || index >= _boxes.length) return;
    await _repo.removeRecommendation(userId, _boxes[index]);
  }

  Future<void> internalFetchBoxes(String userId) async {
    final res = await _repo.getBoxRecommendations(userId, _recommendationLimit + _boxes.length,
        latitude: _latitude, longitude: _longitude);
    res.fold(
      (err) => _error = err,
      (boxes) {
        boxes.shuffle();
        for (var box in boxes) {
          internalAddBoxIfNotAdded(box);
        }
      },
    );
  }

  void internalAddBoxIfNotAdded(BoxFeedListItem box) {
    if (!_boxes.contains(box)) {
      _boxes.add(box);
    }
  }
}
