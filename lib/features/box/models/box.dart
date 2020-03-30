import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/book.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'box.g.dart';

@HiveType(typeId: 3)
enum BoxStatus {
  @HiveField(0)
  public,

  @HiveField(1)
  private,

  @HiveField(2)
  traded,
}

/// Represents a box of books.
class Box {
  String id;
  final User publisher;
  final List<Book> books;
  BoxStatus status;
  final DateTime publishDateTime;
  final double latitude;
  final double longitude;
  final String title;
  final String description;

  Box({
    @required this.id,
    @required this.publisher,
    @required this.books,
    @required this.status,
    @required this.publishDateTime,
    @required this.latitude,
    @required this.longitude,
    @required this.title,
    @required this.description,
  });
}
