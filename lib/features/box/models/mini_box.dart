import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/helpers/status_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Represents a minimal version of a box.
class MiniBox {
  final String id;
  BoxStatus status;
  final DateTime publishDateTime;
  final String title;

  /// The URL to the thumbnail of the first book in the box.
  final String bookThumbnailUrl;

  MiniBox({
    @required this.id,
    @required this.status,
    @required this.publishDateTime,
    @required this.title,
    @required this.bookThumbnailUrl,
  });

  factory MiniBox.fromFirestore(Map<dynamic, dynamic> data, String boxId) {
    return MiniBox(
      id: boxId,
      status: (data['status'] as int).toBoxStatus(),
      publishDateTime: DateTime.fromMillisecondsSinceEpoch((data['publishDateTime'] as int)),
      title: data['title'],
      bookThumbnailUrl: data['bookThumbnailUrl'],
    );
  }
}
