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
  String _userId;

  @observable
  bool _isInitialized = false;

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

  /// Has `init()` been called?
  @computed
  bool get isInitialized => _isInitialized;

  /// User id of the user of whom the feed is initialized for.
  /// Note: This value can be null.
  @computed
  String get userId => _userId;

  /// The error, if any, that the store contains. Is null if there is no error.
  @computed
  NetworkError get error => _error;

  /// The list of recommended boxes. Is an empty list if the boxes have not been loaded.
  @computed
  List<BoxFeedListItem> get boxes => _boxes;

  /// Whether the store is currently performing the initial load of boxes.
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
    _userId = userId;

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
    _isInitialized = true;
  }

  /// Fetch [limit] amount of boxes for the user with id [userid].
  /// This method sets the boxes after retreival.
  @action
  Future<void> fetchBoxes(String userId) async {
    if (userId == null || userId.isEmpty) {
      print('User ID was null in feed store');
      return;
    }

    await _internalFetchBoxes(userId);

    _initialLoadingOngoing = false;
  }

  /// Marks a list item as read.
  ///
  /// [userId] The ID of the user that is marking their recommendation as read.
  /// [index] The index of where the Box is in the [boxes] property.
  @action
  Future<void> markAsRead(String userId, int index) async {
    if (userId == null || index < 0 || index >= _boxes.length) return;
    await _repo.removeRecommendation(userId, _boxes[index]);
  }

  Future<void> _internalFetchBoxes(String userId) async {
    final res = await _repo.getBoxRecommendations(userId, _recommendationLimit + _boxes.length,
        latitude: _latitude, longitude: _longitude);
    res.fold(
      (err) => _error = err,
      (boxes) {
        boxes.shuffle();
        boxes.forEach((box) => _internalAddBoxIfNotAdded(box));
      },
    );
  }

  void _internalAddBoxIfNotAdded(BoxFeedListItem box) {
    if (!_boxes.contains(box)) {
      _boxes.add(box);
    }
  }
}
