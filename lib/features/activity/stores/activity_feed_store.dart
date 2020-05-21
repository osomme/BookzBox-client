import 'dart:async';

import 'package:bookzbox/features/activity/activity.dart';
import 'package:mobx/mobx.dart';

part 'activity_feed_store.g.dart';

/// Store which provides reactive properties and methods for interacting with a stream of activity feed notifications.
class ActivityFeedStore = _ActivityFeedStore with _$ActivityFeedStore;

abstract class _ActivityFeedStore with Store {
  final IActivtiyRepository _repository;

  StreamSubscription<Iterable<ActivityItem>> _streamSubscription;

  @observable
  List<ActivityItem> _feedItems = List();

  @observable
  bool _hasError = false;

  /// A list of all [ActivityItem]s.
  @computed
  List<ActivityItem> get feedItems => _feedItems;

  /// The total number of unread activity notifications.
  @computed
  int get numUnreadActivityNotifications =>
      activityNotifications.where((i) => !i.read).length;

  /// Whether there are any unread activity notifications.
  @computed
  bool get hasUnreadActivityNotifications => numUnreadActivityNotifications != 0;

  /// A list of all [ActivityItem] that are NOT chat message notifications.
  @computed
  List<ActivityItem> get activityNotifications =>
      _feedItems.where((i) => !(i.type is MessageActivity)).toList();

  /// A list of all [MessageActivity] items.
  @computed
  List<ActivityItem> get chatNotifications =>
      _feedItems.where((i) => i.type is MessageActivity).toList();

  /// The number of unread chat message notifications.
  @computed
  int get numUnreadChatMessages => chatNotifications.where((c) => !c.read).length;

  /// Whether there are any unread chat notificatations.
  @computed
  bool get hasUnreadChatMessages => numUnreadChatMessages != 0;

  /// Whether there are any unread notifications of any type.
  @computed
  bool get hasUnread => hasUnreadChatMessages || hasUnreadActivityNotifications;

  /// The total number of unread notifications.
  @computed
  int get numTotalUnread => numUnreadChatMessages + numUnreadActivityNotifications;

  /// Whether the activity feed stream has an error.
  @computed
  bool get hasError => _hasError;

  /// Constructor which takes a repository.
  _ActivityFeedStore(this._repository);

  /// Initializes the activity feed stream.
  ///
  /// [userId] The user ID of the user whose stream is being listened to.
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

  /// Marks a particular notification as read.
  ///
  /// [userId] The user ID of the user that owns the notification.
  /// [activityId] The ID of the activity that is being marked as read.
  @action
  void markAsRead(String userId, String activityId) =>
      _repository.markAsRead(userId, activityId);

  /// Marks all notifications as read.
  ///
  /// [userId] The user ID of the user whose notifications are being marked as read.
  @action
  void markAllAsRead(String userId) => _repository.markAllAsRead(userId);

  /// Cancels the activity feed stream and cleans up resources.
  void dispose() {
    _streamSubscription?.cancel();
  }
}
