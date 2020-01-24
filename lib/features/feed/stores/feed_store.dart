import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

abstract class _FeedStore with Store {
  final IFeedRepository _repo;

  @observable
  ObservableList<Box> _boxes = ObservableList();

  @observable
  Option<String> _errorMessage;

  @observable
  bool _isLoading = false;

  @computed
  Option<String> get errorMessage => _errorMessage;

  @computed
  ObservableList<Box> get boxes => _boxes;

  @computed
  bool get isLoading => _isLoading;

  _FeedStore(this._repo) {
    _fetchBoxes();
  }

  @action
  void _fetchBoxes() {
    _wrapLoading(() async {
      final result = await _repo.getNextBoxes(10, DateTime.now());
      result.fold(
        (error) => _errorMessage = some(error.toString()),
        (boxes) => _boxes.addAll(boxes),
      );
    });
  }

  /// Utility method which takes an async function as parameter and resets error
  /// message while setting the loading property to true while the function is running.
  @action
  Future<void> _wrapLoading(Function function) async {
    _errorMessage = None();
    _isLoading = true;
    await function();
    _isLoading = false;
  }
}
