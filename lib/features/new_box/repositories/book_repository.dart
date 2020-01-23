import 'package:bookzbox/features/box/models/book.dart';
import 'package:dartz/dartz.dart';

abstract class IBookRepository {
  Future<Either<String, Book>> isbnLookup(String isbn);
}
