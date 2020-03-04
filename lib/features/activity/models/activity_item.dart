import 'package:bookzbox/features/activity/models/models.dart';
import 'package:flutter/material.dart';

class ActivityItem {
  final String id;
  final ActivityType type;
  final DateTime timestamp;

  /// Has the activity item been read by the user.
  final bool read;

  ActivityItem({
    @required this.id,
    @required this.type,
    @required this.timestamp,
    @required this.read,
  });
}

// User for testing purposes. //TODO: Remove after back-end logic is implemented.
final testActivityFeedItems = [
  ActivityItem(
    id: '1',
    type: LikeActivity(
      likedByUserId: '',
      likedByUsername: 'Hans Hansen',
      boxTitle: 'Old school books',
    ),
    timestamp: DateTime.now().subtract(Duration(seconds: 13)),
    read: false,
  ),
  ActivityItem(
    id: '2',
    type: MatchActivity(
      matchUserId: '',
      matchUserName: 'Tina85',
      boxTitle: 'Some thriller stuff',
      chatId: '',
    ),
    timestamp: DateTime.now().subtract(Duration(hours: 2)),
    read: true,
  ),
  ActivityItem(
    id: '3',
    type: MessageActivity(
      chatId: '',
      username: 'Martine Olsen',
      newMessageSnippet:
          'Hey, I would like to trade with you. This is an extended message to test how it looks when a message is quite long.',
    ),
    timestamp: DateTime.now().subtract(Duration(days: 43)),
    read: true,
  ),
];
