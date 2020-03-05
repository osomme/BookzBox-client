import 'package:bookzbox/features/activity/activity.dart';
import 'package:mobx/mobx.dart';

part 'activity_feed_store.g.dart';

class ActivityFeedStore = _ActivityFeedStore with _$ActivityFeedStore;

abstract class _ActivityFeedStore with Store {
  final IActivtiyRepository _repository;

  @observable
  ObservableStream<Iterable<ActivityItem>> feed;

  _ActivityFeedStore(this._repository) {
    //feed = ObservableStream(_repository.activityFeed('23'));
  }
}
