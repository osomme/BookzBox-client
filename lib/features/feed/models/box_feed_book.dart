import 'package:flutter/material.dart';

class BoxFeedBook {
  final List<String> categories;
  final String thumbnailUrl;

  BoxFeedBook({
    @required this.categories,
    @required this.thumbnailUrl,
  });

  factory BoxFeedBook.fromFirebase(Map<dynamic, dynamic> book) => BoxFeedBook(
        categories: List.from(book['categories']),
        thumbnailUrl: book['thumbnailUrl'] as String,
      );

  static List<BoxFeedBook> fromFirebaseList(List<dynamic> bookList) =>
      bookList.map((b) => BoxFeedBook.fromFirebase(b)).toList();
}
