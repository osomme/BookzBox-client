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

  factory ActivityItem.fromFirestore(Map<dynamic, dynamic> data, String id) {
    if (data['typename'] == 'like') {
      return _mapToLikeItem(data, id);
    } else if (data['typename'] == 'match') {
      return _mapToMatchItem(data, id);
    } else if (data['typename'] == 'chat') {
      return _mapToChatItem(data, id);
    } else {
      throw 'Unknown activity type';
    }
  }
}

ActivityItem _mapToLikeItem(Map<dynamic, dynamic> data, String id) {
  final likeData = data['data'];
  return ActivityItem(
    id: id,
    read: data['read'],
    timestamp: (data['timestamp'] as Timestamp).toDate(),
    type: LikeActivity(
      likedByUserId: likeData['likedByUserId'],
      likedByUsername: likeData['likedByUsername'],
      boxTitle: likeData['boxTitle'],
      boxId: likeData['boxId'],
    ),
  );
}

ActivityItem _mapToMatchItem(Map<dynamic, dynamic> data, String id) {
  final matchData = data['data'];
  return ActivityItem(
    id: id,
    type: MatchActivity(
      matchUsername: matchData['matchUserName'],
      chatId: matchData['chatRef'],
    ),
    timestamp: (data['timestamp'] as Timestamp).toDate(),
    read: data['read'],
  );
}

ActivityItem _mapToChatItem(Map<dynamic, dynamic> data, String id) {
  final chatData = data['data'];
  return ActivityItem(
    id: id,
    type: MessageActivity(
      otherUserName: chatData['otherUserName'],
      otherUserThumbnail: chatData['otherUserThumbnail'],
      lastMessage: chatData['lastMessage'],
      chatId: id,
    ),
    timestamp: data['timestamp'],
    read: data['read'],
  );
}
