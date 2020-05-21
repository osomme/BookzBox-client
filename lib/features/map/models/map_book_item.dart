import 'package:flutter/material.dart';

/// Domain model class representing a book in a map box item.
class MapBookItem {
  /// List of categories that the book is a part of.
  final List<String> categories;

  /// List of book authors.
  final List<String> authors;

  /// The title of the book.
  final String title;

  /// An URL pointing to the book cover image.
  final String thumbnailUrl;

  MapBookItem({
    @required this.categories,
    @required this.thumbnailUrl,
    @required this.authors,
    @required this.title,
  });

  /// Maps a Firestore document to an instance of the [MapBookItem] domain model.
  ///
  /// [book] A map containing key-value pairs of book data.
  factory MapBookItem.fromFirebase(Map<dynamic, dynamic> book) {
    final categories = book['categories'] != null
        ? List<String>.from(book['categories'])
        : List<String>();
    final authors =
        book['authors'] != null ? List<String>.from(book['authors']) : List<String>();
    return MapBookItem(
      categories: categories,
      thumbnailUrl: book['thumbnailUrl'] as String,
      authors: authors,
      title: book['title'] ?? '',
    );
  }

  /// Maps a list of Firestore documents to an instance of [List<MapBookItem>].
  ///
  /// [bookList] A list of maps containing book data.
  static List<MapBookItem> fromFirebaseList(List<dynamic> bookList) =>
      bookList.map((b) => MapBookItem.fromFirebase(b)).toList();
}
