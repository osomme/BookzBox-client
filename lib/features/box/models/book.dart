import 'package:bookzbox/features/box/models/book_condition.dart';

class Book {
  final String isbn13;
  final String isbn10;
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final String fullSizeImageUrl;
  final List<String> authors;
  final int pageCount;
  final List<String> categories;
  final int publishYear;
  final String synopsis;
  final String publisher;
  BookCondition condition;

  Book({
    this.isbn13,
    this.isbn10,
    this.title,
    this.subtitle,
    this.thumbnailUrl,
    this.fullSizeImageUrl,
    this.authors,
    this.pageCount,
    this.categories,
    this.publishYear,
    this.synopsis,
    this.publisher,
    this.condition,
  });
}
