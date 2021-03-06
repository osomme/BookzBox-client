import 'dart:convert';

import 'package:bookzbox/features/box/models/book.dart';
import 'package:bookzbox/features/box/models/books_api_response.dart';
import 'package:bookzbox/features/new_box/services/book_service.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

/// Class which calls the Google Books API as an implementation of the [IBookService] interface.
class BookService extends IBookService {
  BookService._privateConstructor();

  /// A singleton instance of the book service.
  static final BookService instance = BookService._privateConstructor();

  /// Looks up an ISBN code in the Google Books API.
  /// [isbn] is the ISBN code that is used to fetch the book data. The code can be either ISBN-10 or ISBN-13.
  @override
  Future<Either<String, Book>> isbnLookup(String isbn) async {
    try {
      final sanitizedISBN = isbn.replaceAll(RegExp(r'[\s-]+'), '');
      final res = await http.get(
          'https://www.googleapis.com/books/v1/volumes?q=isbn=$sanitizedISBN&printTypes=books');
      final response = BooksApiResponse.fromJson(json.decode(res.body));
      if (response.items.isNotEmpty) {
        final book = response.items.firstWhere((book) {
          return book.volumeInfo.industryIdentifiers.any((i) => i.identifier == isbn);
        }).toDomain();
        return Right(book);
      } else {
        // No results from API.
        return Left('Book not found');
      }
    } on StateError catch (e) {
      // Thrown if the book is not in the result list from the API.
      print(e);
      return Left(e.toString());
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }
}
