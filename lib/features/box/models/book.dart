import 'package:bookzbox/features/box/models/book_condition.dart';

/// Domain model which represents a book.
class Book {
  /// The ISBN-13 code for the book.
  final String isbn13;

  /// The ISBN-10 code for the book.
  final String isbn10;

  /// The title of the book.
  final String title;

  /// The subtitle of the book.
  final String subtitle;

  /// An URL to the thumbnail cover of the book.
  final String thumbnailUrl;

  /// An URL to the full-size cover of the book.
  final String fullSizeImageUrl;

  /// A list of authors of the book.
  final List<String> authors;

  /// The number of pages that the book contains.
  final int pageCount;

  /// A list of categories that the book has.
  final List<String> categories;

  /// The year that the book was published.
  final int publishYear;

  /// The synopsis of the book.
  final String synopsis;

  /// The name of the publisher of the book.
  final String publisher;

  /// The current condition of the book.
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
