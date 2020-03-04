/*
class Like {
  final String id;
  final String likedByUserId;
  final String likedUserId;
  final String boxId;
  final String boxName;
  final DateTime timestamp;

  Like({
    this.id,
    this.likedByUserId,
    this.likedUserId,
    this.boxId,
    this.boxName,
    this.timestamp,
  });

  //TODO: toFirestore factory
}
*/

import 'package:bookzbox/features/activity/activity.dart';
import 'package:flutter/material.dart';

/// Class which represents an event where another user likes one of the client user's boxes.
class Like extends ActivityType {
  final String likedByUserId;
  final String likedByUsername;
  final String boxTitle;

  Like({
    @required this.likedByUserId,
    @required this.likedByUsername,
    @required this.boxTitle,
  });
}
