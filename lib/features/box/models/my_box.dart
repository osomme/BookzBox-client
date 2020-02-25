import 'package:bookzbox/features/box/models/box.dart';
import 'package:flutter/material.dart';

/// Represents a minimal version of a box.
class MyBox {
  final String id;
  final BoxStatus status;
  final DateTime publishDateTime;
  final String title;

  /// The URL to the thumbnail of the first book in the box.
  final String bookThumbnailUrl;

  MyBox({
    @required this.id,
    @required this.status,
    @required this.publishDateTime,
    @required this.title,
    @required this.bookThumbnailUrl,
  });
}
