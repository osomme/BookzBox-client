import 'package:bookzbox/features/box/models/book.dart';
import 'package:dartz/dartz.dart';

abstract class IBookService {
  static IBookService instance;

  Future<Either<String, Book>> isbnLookup(String isbn);
}
