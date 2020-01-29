import 'package:bookzbox/features/box/models/book.dart';
import 'package:bookzbox/features/new_box/repositories/book_repository.dart';
import 'package:bookzbox/features/new_box/services/book_service.dart';
import 'package:dartz/dartz.dart';

class BookRepository extends IBookRepository {
  final IBookService _service;

  BookRepository(this._service);

  @override
  Future<Either<String, Book>> isbnLookup(String isbn) async => _service.isbnLookup(isbn);
}
