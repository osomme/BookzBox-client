import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Represents a chat message between two users.
class ChatMessage {
  final String postedByUserId;
  final String content;
  final DateTime timestamp;
  final ChatMessageType contentType;

  ChatMessage({
    @required this.postedByUserId,
    @required this.content,
    @required this.timestamp,
    this.contentType = ChatMessageType.Text,
  });

  factory ChatMessage.fromFirebase(DocumentSnapshot snapshot) {
    final data = snapshot.data;
    return ChatMessage(
      postedByUserId: data['postedByUserId'] ?? '',
      content: data['content'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
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
