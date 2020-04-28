import 'package:bookzbox/features/box/models/book.dart';
import 'package:dartz/dartz.dart';

abstract class IBookRepository {
  /// Find a book by using the books ISBN.
  ///
  /// Returns either a `String` with an error message or the found `Book`.
  Future<Either<String, Book>> isbnLookup(String isbn);
}
