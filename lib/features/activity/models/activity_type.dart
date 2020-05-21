import 'package:flutter/material.dart';

/// Abstract base class representing an ActivityType.
abstract class ActivityType {}

/// Class which represents an activity notice for an event where a user sends a message to the client user.
class MessageActivity extends ActivityType {
  /// The username of the other user.
  final String otherUserName;

  /// An URL to an image that can be used as an thumbnail to represent the other user.
  final String otherUserThumbnail;

  /// The contents of the last message.
  final String lastMessage;

  /// The ID of the chat.
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
  /// The username of the other user in the match.
  final String matchUsername;

  // Needed for on-click which takes client user to a chat with the other user.
  final String chatId;

  MatchActivity({
    @required this.matchUsername,
    @required this.chatId,
  });
}

/// Class which represents an event related to a box trade within a match.
class TradeActivity extends ActivityType {
  /// The username of the other user in the trade.
  final String username;

  /// The type of trade event that the notification represents.
  final TradeEvent event;

  /// The ID of the match.
  final String matchId;

  TradeActivity({
    @required this.username,
    @required this.event,
    @required this.matchId,
  });
}

/// Represents an event type for a trade activity item.
enum TradeEvent { Accepted, Rejected, New, Unknown }
