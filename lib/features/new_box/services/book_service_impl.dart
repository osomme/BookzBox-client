import 'package:bookzbox/features/box/models/book.dart';
import 'package:bookzbox/features/new_box/services/book_service.dart';
import 'package:dartz/dartz.dart';

class BookService extends IBookService {
  BookService._privateConstructor();

  static final BookService instance = BookService._privateConstructor();

  @override
  Future<Either<String, Book>> isbnLookup(String isbn) async {
    // TODO execute isbn lookup at https://www.googleapis.com/books/v1/volumes?q=isbn:9780451526342
    return null;
  }
}
