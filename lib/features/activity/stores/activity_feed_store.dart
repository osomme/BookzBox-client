import 'dart:async';

import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:mobx/mobx.dart';

part 'activity_feed_store.g.dart';

class ActivityFeedStore = _ActivityFeedStore with _$ActivityFeedStore;

abstract class _ActivityFeedStore with Store {
  final IActivtiyRepository _repository;

  StreamSubscription<Iterable<ActivityItem>> _streamSubscription;

  @observable
  List<ActivityItem> _feedItems = List();

  @observable
  bool _hasError = false;

  @computed
  List<ActivityItem> get feedItems => _feedItems;

  @computed
  int get numUnreadMatchAndLikes => activityNotifications.where((i) => !i.read).length;

  @computed
  bool get hasUnreadMatchAndLikes => numUnreadMatchAndLikes != 0;

  @computed
  List<ActivityItem> get activityNotifications =>
      _feedItems.where((i) => i.type is LikeActivity || i.type is MatchActivity).toList();

  @computed
  List<ActivityItem> get chatNotifications =>
      _feedItems.where((i) => i.type is MessageActivity).toList();

  @computed
  int get numUnreadChatMessages => chatNotifications.where((c) => !c.read).length;

  @computed
  bool get hasUnreadChatMessages => numUnreadChatMessages != 0;

  @computed
  bool get hasUnread => hasUnreadChatMessages || hasUnreadMatchAndLikes;

  @computed
  int get numTotalUnread => numUnreadChatMessages + numUnreadMatchAndLikes;

  @computed
  bool get hasError => _hasError;

  _ActivityFeedStore(this._repository);

  @action
  Future<void> loadFeed(String userId) async {
    final stream = await _repository.activityFeed(userId);
    _streamSubscription = stream.listen(
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

  @action
  void markAsRead(String userId, String activityId) =>
      _repository.markAsRead(userId, activityId);

  void dispose() {
    _streamSubscription?.cancel();
  }
}
