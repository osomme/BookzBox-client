import 'package:flutter/material.dart';

abstract class ActivityType {}

/// Class which represents an activity notice for an event where a user sends a message to the client user.
class MessageActivity extends ActivityType {
  //TODO: Implement logic for chat. Each chat between two users needs an ID.
  final String chatId;
  final String username; // Username of the other user messaging the client user
  final String newMessageSnippet; // Abbreviated view of new message

  MessageActivity({
    @required this.chatId,
    @required this.username,
    @required this.newMessageSnippet,
  });
}

/// Class which represents an event where the client user and another user match.
class MatchActivity extends ActivityType {
  final String matchUserId;
  final String matchUserName;
  final String boxTitle;

  // Needed for on-click which takes client user to a chat with the other user.
  final String chatId;

  MatchActivity({
    @required this.matchUserId,
    @required this.matchUserName,
    @required this.boxTitle,
    @required this.chatId,
  });
}
