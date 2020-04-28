import 'package:bookzbox/features/box/models/book.dart';
import 'package:dartz/dartz.dart';

abstract class IBookService {
  static IBookService instance;

  /// Find a `Book` using the books ISBN.
  ///
  /// [isbn] ISBN of the book to find.
  ///
  /// Returns either a `String` containing an error message or
  /// the found `Book`.
  Future<Either<String, Book>> isbnLookup(String isbn);
}
