import 'package:bookzbox/features/activity/models/models.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  /// Maps a Like ActivityItem to a Firestore compatible map. [this] must have
  ///  a type property which is an instance of Like.
  Map<String, dynamic> toFirestore() {
    return {
      'typename': 'like',
      'data': _typeToMap(this.type),
      'timestamp': Timestamp.fromDate(this.timestamp),
      'read': false,
    };
  }

  Map<String, dynamic> _typeToMap(ActivityType type) {
    if (type is LikeActivity) {
      return {
        'likedByUserId': type.likedByUserId,
        'boxId': type.boxId,
      };
    } else {
      throw 'Not implemented yet';
    }
  }

  factory ActivityItem.fromFirestore(Map<dynamic, dynamic> data, String id) {
    if (data['typename'] == 'like') {
      return ActivityItem(
        id: id,
        read: data['read'],
        timestamp: (data['timestamp'] as Timestamp).toDate(),
        type: LikeActivity(
          likedByUserId: data['data.likedByuserId'],
          likedByUsername: data['data.likedByusername'],
          boxTitle: data['data.boxTitle'],
          boxId: data['data.boxId'],
        ),
      );
    } else {
      throw 'Unknown activity type';
    }
  }
}

// User for testing purposes. //TODO: Remove after back-end logic is implemented.
final testActivityFeedItems = [
  ActivityItem(
    id: '1',
    type: LikeActivity(
      likedByUserId: '',
      likedByUsername: 'Hans Hansen',
      boxTitle: 'Old school books',
      boxId: '',
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
