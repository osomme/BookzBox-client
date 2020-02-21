import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

abstract class _FeedStore with Store {
  /// The number of boxes that will be fetched from the data source, per call.
  static const _fetchSize = 10;

  final IFeedRepository _repo;

  ReactionDisposer _listener;

  bool _shouldLoadAgain = true;

  @observable
  ObservableList<BoxFeedListItem> _boxes = ObservableList();

  @observable
  NetworkError _error;

  @observable
  bool _initialLoadingOngoing = false;

  @observable
  bool _incrementalLoading = false;

  @observable
  int _currentIndex = 0;

  @computed
  NetworkError get error => _error;

  @computed
  ObservableList<BoxFeedListItem> get boxes => _boxes;

  @computed
  bool get initialLoadingOngoing => _initialLoadingOngoing;

  @computed
  bool get incrementalLoading => _incrementalLoading;

  @computed
  int get currentIndex => _currentIndex;

  _FeedStore(this._repo);

  Future<void> init() async {
    /*
    await _initialFetch();
    // Creates a reaction that checks if the current index is less than 5. If it is,
    // it will load a new batch of boxes.
    _listener = autorun((_) {
      if (_shouldLoadAgain &&
          boxes.isNotEmpty &&
          (boxes.length - _currentIndex) <= (_fetchSize / 2)) {
        _incrementalLoad();
      }
    });
    */
  }

  @action
  void setIndex(int index) => _currentIndex = index >= 0 ? index : 0;

  @action
  Future<void> _incrementalLoad() async {
    _error = null;
    _incrementalLoading = true;
    final result = await _repo.getBoxesFrom(_fetchSize, boxes.last.publishedOn);
    _onBoxesLoaded(result);
    _incrementalLoading = false;
  }

  @action
  Future<void> _initialFetch() async {
    if (boxes.isNotEmpty) {
      return;
    }
    _error = null;
    _initialLoadingOngoing = true;
    final result = await _repo.getBoxesFrom(
        _fetchSize, DateTime.now().subtract(Duration(days: 365)));
    _onBoxesLoaded(result);
    _initialLoadingOngoing = false;
  }

  void _onBoxesLoaded(Either<NetworkError, List<BoxFeedListItem>> boxResponse) {
    boxResponse.fold(
      (error) => _error = error,
      (boxes) {
        if (boxes.length < _fetchSize) {
          // All boxes are already loaded from the datasource. Do not load again.
          _shouldLoadAgain = false;
        }
        _boxes.addAll(boxes);
      },
    );
  }

  /// Disposes the resources that the store is using.
  void dispose() => _listener();
}
