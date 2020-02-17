import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/features/new_box/models/box_error.dart';
import 'package:bookzbox/features/new_box/models/lookup_error.dart';
import 'package:bookzbox/features/new_box/repositories/book_repository.dart';
import 'package:bookzbox/features/new_box/repositories/box_repository.dart';
import 'package:bookzbox/features/new_box/services/publish_error.dart';
import 'package:bookzbox/features/new_box/stores/new_box_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBookRepo extends Mock implements IBookRepository {}

class MockBoxRepo extends Mock implements IBoxRepository {}

class MockLocationService extends Mock implements ILocationService {}

void main() {
  group('New box store', () {
    var mockBookRepo = MockBookRepo();
    var mockBoxRepo = MockBoxRepo();
    var mockLocationService = MockLocationService();
    var store = NewBoxStore(mockBookRepo, mockBoxRepo, mockLocationService);

    setUp(() {
      mockBookRepo = MockBookRepo();
      mockBoxRepo = MockBoxRepo();
      mockLocationService = MockLocationService();
      store = NewBoxStore(mockBookRepo, mockBoxRepo, mockLocationService);
    });

    test('When add book is called the book count should increase by one.', () {
      store.setCurrentBook(_validBook);
      store.addCurrentBook();
      expect(store.books.length, 1);
    });

    test('When add book is called with the current book as null, then count should not increase.',
        () {
      store.setCurrentBook(null);
      store.addCurrentBook();
      expect(store.books.length, 0);
    });

    test('[lookupError] should be set to not found error when lookup fails to find book.',
        () async {
      when(mockBookRepo.isbnLookup(any)).thenAnswer((_) => Future.value(Left('error')));
      store.setIsbn(_validISBN13);
      await store.findBook();
      expect(store.lookupError, LookupError.NotFound);
    });

    test('Attempting to lookup book with invalid ISBN should return false.', () async {
      store.setIsbn('345345345'); // Invalid length
      var res = await store.findBook();
      expect(res, false);
    });

    test('Attempting to publish box with invalid content should return with publish error.',
        () async {
      store.setIsbn('345345345'); // Invalid length
      store.setBoxTitle(null);
      var res = await store.publishBox(null);
      var actual;
      res.fold((err) => actual = err, (success) => actual = success);
      expect(actual, PublishError.Invalid);
    });

    group('Validation', () {
      test(
          'When validating an empty list of books, then [bookCountError] should represent invalid count.',
          () {
        store.validateBooks();
        expect(store.bookCountError, BoxError.InvalidBookCount);
      });

      test(
          'When validating a list of more than 1 book, then [bookCountError] should not contain an error.',
          () {
        store.books.add(_validBook);
        store.validateBooks();
        expect(store.bookCountError, BoxError.None);
      });

      test('When validating a null title, then [titleError] should contain an invalid title error.',
          () {
        store.setBoxTitle(_invalidNullTitle);
        store.validateTitle();
        expect(store.titleError, BoxError.InvalidTitle);
      });

      test(
          'When validating a title shorter than 4 characters, then [titleError] should contain an invalid title error.',
          () {
        store.setBoxTitle(_invalidShortTitle);
        store.validateTitle();
        expect(store.titleError, BoxError.InvalidTitle);
      });

      test(
          'When validating a title longer than or equal to 4 characters, then [titleError] should not contain any error.',
          () {
        store.setBoxTitle(_validTitle);
        store.validateTitle();
        expect(store.titleError, BoxError.None);
      });

      test('When both book count and title is valid, then the box should be valid.', () {
        store.setBoxTitle(_validTitle);
        store.books.add(_validBook);
        expect(true, store.isBoxContentValid());
      });

      test(
          'When an ISBN with invalid length is set, then [isbnError] should represent invalid isbn.',
          () {
        store.setIsbn('978821503104'); // Invalid length
        expect(LookupError.InvalidIsbn, store.isbnError);
      });

      test('When a valid ISBN13 is set, then [isbnError] should represent NO error.', () {
        store.setIsbn(_validISBN13);
        expect(LookupError.None, store.isbnError);
      });

      test('When a valid ISBN10 is set, then [isbnError] should represent NO error.', () {
        store.setIsbn(_validISBN10);
        expect(LookupError.None, store.isbnError);
      });
    });
  });
}

final Book _validBook = Book(
  authors: ['Ernest Hemingway'],
  categories: ['Action', 'Adventure'],
  fullSizeImageUrl:
      'https://upload.wikimedia.org/wikipedia/en/4/48/ErnestHemmingway_ForWhomTheBellTolls.jpg',
  isbn10: 'this-is-isbn10',
  isbn13: 'this-is-isbn13',
  pageCount: 513,
  publisher: 'Charles Scribners\'s Sons',
  publishYear: 1940,
  synopsis:
      'Tells the story of a young american volunteer attached to a Republican guerilla unit during the Spanish Civil War.',
  thumbnailUrl:
      'https://upload.wikimedia.org/wikipedia/en/4/48/ErnestHemmingway_ForWhomTheBellTolls.jpg',
  title: 'For Whom the Bell Tolls',
);

final String _validTitle = 'abcd';
final String _invalidShortTitle = 'abc';
final String _invalidNullTitle = null;
final String _validISBN13 = '9788215031040';
final String _validISBN10 = '0545010225';
