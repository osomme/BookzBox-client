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
}
