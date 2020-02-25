import 'package:flutter/material.dart';

class MapBookItem {
  final List<String> categories;
  final String thumbnailUrl;

  MapBookItem({
    @required this.categories,
    @required this.thumbnailUrl,
  });

  factory MapBookItem.fromFirebase(Map<dynamic, dynamic> book) => MapBookItem(
        categories: List.from(book['categories']),
        thumbnailUrl: book['thumbnailUrl'] as String,
      );

  static List<MapBookItem> fromFirebaseList(List<dynamic> bookList) =>
      bookList.map((b) => MapBookItem.fromFirebase(b)).toList();
}
