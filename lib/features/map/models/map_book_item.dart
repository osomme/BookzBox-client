import 'package:flutter/material.dart';

class MapBookItem {
  final List<String> categories;
  final List<String> authors;
  final String title;
  final String thumbnailUrl;

  MapBookItem({
    @required this.categories,
    @required this.thumbnailUrl,
    @required this.authors,
    @required this.title,
  });

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

  static List<MapBookItem> fromFirebaseList(List<dynamic> bookList) =>
      bookList.map((b) => MapBookItem.fromFirebase(b)).toList();
}
