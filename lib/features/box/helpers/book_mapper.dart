import 'package:bookzbox/features/box/models/models.dart';

class BookMapper {
  /// Maps the passed `Book` to JSON.
  ///
  /// [book] The `Book` to map. Expected to be non-null.
  static Map<String, dynamic> map(final Book book) {
    return {
      "isbn13": book.isbn13,
      "isbn10": book.isbn10,
      "title": book.title,
      "subtitle": book.subtitle,
      "thumbnailUrl": book.thumbnailUrl,
      "fullSizeImageUrl": book.fullSizeImageUrl,
      "authors": book.authors,
      "pageCount": book.pageCount,
      "categories": book.categories,
      "publishYear": book.publishYear,
      "synopsis": book.synopsis,
      "publisher": book.publisher,
      "condition": book.condition.index,
    };
  }

  static List<Book> booksFromFirebase(List<dynamic> books) =>
      books.map((b) => bookFromFirebase(b)).toList();

  /// Creates a `Book` from the passed KV-pairs.
  ///
  /// [book] The KV-pairs containing book data. Expected to be non-null.
  static Book bookFromFirebase(Map<dynamic, dynamic> book) {
    return Book(
      publisher: book['publisher'],
      authors: List.from(book['authors']),
      categories: List.from(book['categories']),
      fullSizeImageUrl: book['fullSizeImageUrl'],
      thumbnailUrl: book['thumbnailUrl'],
      pageCount: book['pageCount'],
      publishYear: book['publishYear'],
      subtitle: book['subtitle'],
      synopsis: book['synopsis'],
      title: book['title'],
      isbn10: book['isbn10'],
      isbn13: book['isbn13'],
      condition: (book['condition'] == null
          ? BookCondition.Unknown
          : BookCondition.values[book['condition']]),
    );
  }
}
