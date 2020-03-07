// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActivityFeedStore on _ActivityFeedStore, Store {
  Computed<List<ActivityItem>> _$feedItemsComputed;

  @override
  List<ActivityItem> get feedItems => (_$feedItemsComputed ??=
          Computed<List<ActivityItem>>(() => super.feedItems))
      .value;
  Computed<int> _$numUnreadMatchAndLikesComputed;

  @override
  int get numUnreadMatchAndLikes => (_$numUnreadMatchAndLikesComputed ??=
          Computed<int>(() => super.numUnreadMatchAndLikes))
      .value;
  Computed<bool> _$hasUnreadComputed;

  @override
  bool get hasUnread =>
      (_$hasUnreadComputed ??= Computed<bool>(() => super.hasUnread)).value;
  Computed<List<ActivityItem>> _$activityNotificationsComputed;

  @override
  List<ActivityItem> get activityNotifications =>
      (_$activityNotificationsComputed ??=
              Computed<List<ActivityItem>>(() => super.activityNotifications))
          .value;
  Computed<List<ActivityItem>> _$chatNotificationsComputed;

  @override
  List<ActivityItem> get chatNotifications => (_$chatNotificationsComputed ??=
          Computed<List<ActivityItem>>(() => super.chatNotifications))
      .value;
  Computed<int> _$numUnreadChatMessagesComputed;

  @override
  int get numUnreadChatMessages => (_$numUnreadChatMessagesComputed ??=
          Computed<int>(() => super.numUnreadChatMessages))
      .value;
  Computed<bool> _$hasUnreadChatMessagesComputed;

  @override
  bool get hasUnreadChatMessages => (_$hasUnreadChatMessagesComputed ??=
          Computed<bool>(() => super.hasUnreadChatMessages))
      .value;
  Computed<int> _$numTotalUnreadComputed;

  @override
  int get numTotalUnread =>
      (_$numTotalUnreadComputed ??= Computed<int>(() => super.numTotalUnread))
          .value;
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError)).value;

  final _$_feedItemsAtom = Atom(name: '_ActivityFeedStore._feedItems');

  @override
  List<ActivityItem> get _feedItems {
    _$_feedItemsAtom.context.enforceReadPolicy(_$_feedItemsAtom);
    _$_feedItemsAtom.reportObserved();
    return super._feedItems;
  }

  @override
  set _feedItems(List<ActivityItem> value) {
    _$_feedItemsAtom.context.conditionallyRunInAction(() {
      super._feedItems = value;
      _$_feedItemsAtom.reportChanged();
    }, _$_feedItemsAtom, name: '${_$_feedItemsAtom.name}_set');
  }

  final _$_hasErrorAtom = Atom(name: '_ActivityFeedStore._hasError');

  @override
  bool get _hasError {
    _$_hasErrorAtom.context.enforceReadPolicy(_$_hasErrorAtom);
    _$_hasErrorAtom.reportObserved();
    return super._hasError;
  }

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.context.conditionallyRunInAction(() {
      super._hasError = value;
      _$_hasErrorAtom.reportChanged();
    }, _$_hasErrorAtom, name: '${_$_hasErrorAtom.name}_set');
  }

  final _$loadFeedAsyncAction = AsyncAction('loadFeed');

  @override
  Future<void> loadFeed(String userId) {
    return _$loadFeedAsyncAction.run(() => super.loadFeed(userId));
  }

  final _$_ActivityFeedStoreActionController =
      ActionController(name: '_ActivityFeedStore');

  @override
  void markAsRead(String userId, String activityId) {
    final _$actionInfo = _$_ActivityFeedStoreActionController.startAction();
    try {
      return super.markAsRead(userId, activityId);
    } finally {
      _$_ActivityFeedStoreActionController.endAction(_$actionInfo);
    }
  }
}
