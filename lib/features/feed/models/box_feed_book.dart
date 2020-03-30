import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'box_feed_book.g.dart';

@HiveType(typeId: 1)
class BoxFeedBook {
  @HiveField(0)
  final List<String> categories;

  @HiveField(1)
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
