import 'package:bookzbox/features/activity/activity.dart';
import 'package:flutter/material.dart';

/// Class which represents an event where another user likes one of the client user's boxes.
class LikeActivity extends ActivityType {
  final String likedByUserId;
  final String likedByUsername;
  final String boxTitle;
  final String boxId;

  LikeActivity({
    @required this.likedByUserId,
    @required this.likedByUsername,
    @required this.boxTitle,
    @required this.boxId,
  });
}
