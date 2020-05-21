import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'box_feed_book.g.dart';

/// A minimized version of a `Book`.
@HiveType(typeId: 1)
class BoxFeedBook {
  /// A list of categories.
  @HiveField(0)
  final List<String> categories;

  /// The thumbnail URL that points to an image.
  @HiveField(1)
  final String thumbnailUrl;

  BoxFeedBook({
    @required this.categories,
    @required this.thumbnailUrl,
  });

  /// Maps a Firebase or JSON map to [BoxFeedBook] domain model.
  factory BoxFeedBook.fromFirebase(Map<dynamic, dynamic> book) => BoxFeedBook(
        categories: List.from(book['categories']),
        thumbnailUrl: book['thumbnailUrl'] as String,
      );

  /// Maps a list of Firebase or JOSN map book objects to [List<BoxFeedBook>].
  static List<BoxFeedBook> fromFirebaseList(List<dynamic> bookList) =>
      bookList.map((b) => BoxFeedBook.fromFirebase(b)).toList();
}
