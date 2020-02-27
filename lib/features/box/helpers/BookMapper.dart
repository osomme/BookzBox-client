import 'package:bookzbox/features/box/models/models.dart';

class BookMapper {
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
      "publisher": book.publisher
    };
  }

  static List<Book> booksFromFirebase(List<dynamic> books) =>
      books.map((b) => bookFromFirebase(b)).toList();

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
    );
  }
}
