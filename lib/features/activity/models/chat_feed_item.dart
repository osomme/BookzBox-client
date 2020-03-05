import 'package:flutter/material.dart';

/// Represents a structure which contains information regarding
/// a chat conversation that the user is a participant in.
class ChatFeedItem {
  final String chatId;
  final String otherUserName;
  final String otherUserThumbnail;
  final String lastMessage;
  final DateTime timestamp;
  final bool read;

  ChatFeedItem({
    @required this.chatId,
    @required this.otherUserName,
    @required this.otherUserThumbnail,
    @required this.lastMessage,
    @required this.timestamp,
    @required this.read,
  });
}

/// Used for testing without need a back-end to pull data from.
final sampleChatItems = [
  ChatFeedItem(
    chatId: '1',
    otherUserName: 'Lars Pettersen',
    otherUserThumbnail: null,
    lastMessage: 'Another sample text...',
    timestamp: DateTime.now().subtract(Duration(hours: 2)),
    read: true,
  ),
  ChatFeedItem(
    chatId: '2',
    otherUserName: 'Gunhild67s',
    otherUserThumbnail: null,
    lastMessage: 'Thank you for the trade!',
    timestamp: DateTime.now().subtract(Duration(days: 12)),
    read: false,
  ),
  ChatFeedItem(
    chatId: '3',
    otherUserName: 'Tina Marie Svendsen',
    otherUserThumbnail: null,
    lastMessage:
        'This is a longer message to see how the text scales over a longer message. Lets see how it goes...',
    timestamp: DateTime.now().subtract(Duration(hours: 14)),
    read: true,
  ),
];
