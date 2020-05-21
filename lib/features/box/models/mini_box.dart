import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/helpers/status_extensions.dart';
import 'package:flutter/material.dart';

/// Represents a minimal version of a box.
class MiniBox {
  /// The ID of the box.
  final String id;

  /// The [BoxStatus] of the box.
  BoxStatus status;

  /// The timestamp for when the box was published.
  final DateTime publishDateTime;

  /// The title of the box.
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

  /// Maps a Firestore document or JSON map to the [MiniBox] domain model.
  ///
  /// [data] The map data for the box.
  /// [boxId] The ID of the box.
  factory MiniBox.fromFirestore(Map<dynamic, dynamic> data, String boxId) {
    return MiniBox(
      id: boxId,
      status: (data['status'] as int).toBoxStatus(),
      publishDateTime:
          DateTime.fromMillisecondsSinceEpoch((data['publishDateTime'] as int)),
      title: data['title'],
      bookThumbnailUrl: data['bookThumbnailUrl'],
    );
  }
}
