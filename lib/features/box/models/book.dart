import 'package:flutter/material.dart';

/// Represents a book.
class Book {
  final String isbn10;
  final String isbn13;
  final String title;
  final String thumbnailUrl;
  final String fullSizeImageUrl;
  final List<String> authors;
  final int pageCount;
  final List<String> categories;
  final String synopsis;
  final String publisher;
  final int publishYear;

  Book({
    this.isbn10,
    this.isbn13,
    this.title,
    this.thumbnailUrl,
    this.fullSizeImageUrl,
    this.authors,
    this.pageCount,
    this.categories,
    this.synopsis,
    this.publisher,
    this.publishYear,
  });
}
