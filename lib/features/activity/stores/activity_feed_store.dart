import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:mobx/mobx.dart';

part 'activity_feed_store.g.dart';

class ActivityFeedStore = _ActivityFeedStore with _$ActivityFeedStore;

abstract class _ActivityFeedStore with Store {
  final IActivtiyRepository _repository;

  @observable
  ObservableStream<Iterable<ActivityItem>> _feed;

  @observable
  List<ActivityItem> _feedItems = List();

  @observable
  bool _hasError = false;

  @computed
  List<ActivityItem> get feedItems => _feedItems;

  @computed
  int get numUnread => _feedItems.where((i) => !i.read).length;

  @computed
  bool get hasUnread => numUnread != 0;

  @computed
  List<ActivityItem> get activityNotifications =>
      _feedItems.where((i) => i.type is LikeActivity || i.type is MatchActivity).toList();

  @computed
  bool get hasError => _hasError;

  _ActivityFeedStore(this._repository);

  void loadFeed(String userId) async {
    final stream = await _repository.activityFeed(userId);
    _feed = ObservableStream(stream);
    _feed.listen(
      (data) {
        if (hasError) {
          _hasError = false;
        }
        _feedItems = data.toList();
      },
      onError: (error) {
        _hasError = true;
        print('Error while listening to activity feed stream: $error');
      },
    );
  }
}
