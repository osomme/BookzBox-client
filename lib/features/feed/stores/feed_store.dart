import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:mobx/mobx.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

abstract class _FeedStore with Store {
  final IFeedRepository _repo;
  ReactionDisposer _listener;

  @observable
  ObservableList<Box> _boxes = ObservableList();

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
  ObservableList<Box> get boxes => _boxes;

  @computed
  bool get initialLoadingOngoing => _initialLoadingOngoing;

  @computed
  bool get incrementalLoading => _incrementalLoading;

  @computed
  int get currentIndex => _currentIndex;

  _FeedStore(this._repo);

  Future<void> init() async {
    await _initialFetch();
    // Creates a reaction that checks if the current index is less than 5. If it is,
    // it will load a new batch of boxes.
    _listener = autorun((_) {
      if (boxes.isNotEmpty && (boxes.length - _currentIndex) <= 5) {
        _incrementalLoad();
      }
    });
  }

  @action
  void setIndex(int index) {
    _currentIndex = index >= 0 ? index : 0;
  }

  @action
  Future<void> _incrementalLoad() async {
    _error = null;
    _incrementalLoading = true;
    final result = await _repo.getNextBoxes(10, boxes[_currentIndex].publishDateTime);
    result.fold(
      (error) => _error,
      (boxes) => _boxes.addAll(boxes),
    );
    _incrementalLoading = false;
  }

  @action
  Future<void> _initialFetch() async {
    _error = null;
    _initialLoadingOngoing = true;
    final result = await _repo.getNextBoxes(10, DateTime.now());
    result.fold(
      (error) => _error = error,
      (boxes) => _boxes.addAll(boxes),
    );
    _initialLoadingOngoing = false;
  }

  /// Disposes the resources that the store is using.
  void dispose() => _listener();
}
