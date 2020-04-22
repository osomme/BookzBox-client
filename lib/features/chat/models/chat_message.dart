import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Represents a chat message between two users.
class ChatMessage {
  /// The ID of the user that posted the message.
  final String postedByUserId;

  /// The content of the message. Can be either a text or an URL pointing to an image or media type. See [contentType].
  final String content;

  /// A timestamp representing the date and time that the message was posted.
  final DateTime timestamp;

  /// The content type that the message represents. Can be a text message or an URL pointing to a media object.
  final ChatMessageType contentType;

  ChatMessage({
    @required this.postedByUserId,
    @required this.content,
    @required this.timestamp,
    this.contentType = ChatMessageType.Text,
  });

  /// Maps a message item from Firebase Firestore document to a [ChatMessage] object.
  factory ChatMessage.fromFirebase(DocumentSnapshot snapshot) {
    final data = snapshot.data;
    return ChatMessage(
      postedByUserId: data['postedByUserId'] ?? '',
      content: data['content'] ?? '',
      timestamp: (data['timestamp'] as Timestamp)?.toDate() ?? DateTime.now(),
      contentType:
          (data['contentType'] as int)?.toChatMessageType() ?? ChatMessageType.Text,
    );
  }
}

/// Determines which content type the message is.
/// [Image] represents an image content type
/// [Text] represents a simple text content type
enum ChatMessageType { Image, Text }

extension MessageTypeParser on int {
  /// Converts an integer to a [ChatMessageType]. Used for parsing JSON and
  /// Firebase objects that represent enums as integers.
  ChatMessageType toChatMessageType() {
    switch (this) {
      case 0:
        return ChatMessageType.Image;
      case 1:
        return ChatMessageType.Text;
      default:
        throw 'Unknown chat message type. Must be in range [0-1]';
    }
  }
}
