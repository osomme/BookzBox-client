import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/book.dart';
import 'package:flutter/material.dart';

enum BoxStatus { public, private, traded }

/// Represents a box of books.
class Box {
  final User publisher;
  final List<Book> books;
  final BoxStatus status;
  final DateTime publishDateTime;
  final double latitude;
  final double longitude;
  final String title;
  final String description;

  Box({
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
