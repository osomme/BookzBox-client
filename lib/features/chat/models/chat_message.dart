import 'package:flutter/material.dart';

class ChatMessage {
  final String postedByUsername;
  final String postedByUserId;
  final String content;
  final DateTime timestamp;

  ChatMessage({
    @required this.postedByUsername,
    @required this.postedByUserId,
    @required this.content,
    @required this.timestamp,
  });
}
