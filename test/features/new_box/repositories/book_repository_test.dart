import 'package:bookzbox/features/new_box/repositories/book_repository_impl.dart';
import 'package:bookzbox/features/new_box/services/book_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBookService extends Mock implements IBookService {}

void main() {
  group('Book repository', () {
    var mockBookService = MockBookService();
    var repo = BookRepository(mockBookService);

    setUp(() {
      mockBookService = MockBookService();
      repo = BookRepository(mockBookService);
    });

    test('When performing ISBN lookup, the book service should be called once.', () async {
      await repo.isbnLookup('124246523');

      verify(mockBookService.isbnLookup(any)).called(1);
    });
  });
}
