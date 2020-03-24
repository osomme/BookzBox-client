import 'dart:async';

import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/location/services/location_service.dart';
import 'package:mobx/mobx.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

abstract class _FeedStore with Store {
  StreamSubscription<Iterable<BoxFeedListItem>> _streamSubscription;

  final IFeedRepository _repo;
  final ILocationService _locationService;

  @observable
  List<BoxFeedListItem> _boxes = List();

  @observable
  NetworkError _error;

  @observable
  bool _initialLoadingOngoing = false;

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

    double lat = -1.0;
    double lng = -1.0;
    final locationData = await _locationService.getLocation();
    locationData.fold(
      (error) {
        print('No user location @ feed_store.dart');
      },
      (point) async {
        lat = point.latitude;
        lng = point.longitude;
      },
    );

    final res = await _repo.getBoxRecommendations(userId, 50, latitude: lat, longitude: lng);
    res.fold(
      (err) => _error = err,
      (boxes) {
        _initialLoadingOngoing = false;
        _boxes = boxes;
      },
    );
    // final stream = await _repo.getBoxesStream(userId);
    // _streamSubscription = stream.listen(
    //   (data) {
    //     print('Data loaded from stream with length: ${data.length}');
    //     _initialLoadingOngoing = false;
    //     _boxes = data.toList();
    //   },
    //   onError: (error) {
    //     print('Error while attempting to listen to box feed stream: $error');
    //     _error = NetworkError.noInternet;
    //   },
    // );
  }

  /// Disposes the resources that the store is using.
  void dispose() {
    print('Disposing box feed stream');
    _streamSubscription?.cancel();
  }
}
