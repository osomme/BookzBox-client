import 'package:flutter/material.dart';

abstract class ActivityType {}

/// Class which represents an activity notice for an event where a user sends a message to the client user.
class MessageActivity extends ActivityType {
  final String otherUserName;
  final String otherUserThumbnail;
  final String lastMessage;
  final String chatId;

  MessageActivity({
    @required this.otherUserName,
    @required this.otherUserThumbnail,
    @required this.lastMessage,
    @required this.chatId,
  });
}

/// Class which represents an event where the client user and another user match.
class MatchActivity extends ActivityType {
  final String matchUsername;

  // Needed for on-click which takes client user to a chat with the other user.
  final String chatId;

  MatchActivity({
    @required this.matchUsername,
    @required this.chatId,
  });
}
