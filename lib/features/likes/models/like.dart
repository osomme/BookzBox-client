import 'package:bookzbox/features/activity/activity.dart';
import 'package:flutter/material.dart';

/// Class which represents an event where another user likes one of the client user's boxes.
class LikeActivity extends ActivityType {
  /// The ID of the user that liked the box.
  final String likedByUserId;

  /// The username of the user that liked the box.
  final String likedByUsername;

  /// The title of the box that was liked.
  final String boxTitle;

  /// The ID of the box that was liked.
  final String boxId;

  LikeActivity({
    @required this.likedByUserId,
    @required this.likedByUsername,
    @required this.boxTitle,
    @required this.boxId,
  });
}
