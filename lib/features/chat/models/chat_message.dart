import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessage {
  final String postedByUserId;
  final String content;
  final DateTime timestamp;

  ChatMessage({
    @required this.postedByUserId,
    @required this.content,
    @required this.timestamp,
  });

  factory ChatMessage.fromFirebase(DocumentSnapshot snapshot) {
    final data = snapshot.data;
    return ChatMessage(
      postedByUserId: data['postedByUserId'],
      content: data['content'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }
}
