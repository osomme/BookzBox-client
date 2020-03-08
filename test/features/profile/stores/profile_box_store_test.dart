import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/errors/box_details_error.dart';
import 'package:bookzbox/features/new_box/repositories/box_repository.dart';
import 'package:bookzbox/features/profile/stores/profile_box_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBoxRepo extends Mock implements IBoxRepository {}

void main() {
  group('Profile box store', () {
    var mockBoxRepo = MockBoxRepo();
    var store = ProfileBoxStore(mockBoxRepo);

    setUp(() {
      mockBoxRepo = MockBoxRepo();
      store = ProfileBoxStore(mockBoxRepo);
    });

    test('Should only update box status if the status has changed.', () {
      store.setStartBoxStatus(BoxStatus.private);
      store.setCurrentBoxStatus(BoxStatus.private);

      verifyZeroInteractions(mockBoxRepo);
    });

    test('When box status update fails, then error is updated.', () async {
      final initialError = 'none';

      when(mockBoxRepo.getBox(any)).thenAnswer((_) => Future.value((Right(box))));
      when(mockBoxRepo.updateStatus(box)).thenAnswer((_) => Future.value(Left('error')));

      store.setCurrentBox(miniBox);
      store.setStartBoxStatus(BoxStatus.public);
      store.setCurrentBoxStatus(BoxStatus.private);
      store.setUpdateError(initialError);
      await store.updateBoxVisibility();
      expect(store.updateError, isNot(initialError));
    });
  });
}

// Default miniBox
var miniBox = MiniBox(
  id: null,
  status: null,
  publishDateTime: null,
  title: null,
  bookThumbnailUrl: null,
);

// Default normal box
var box = Box(
  id: null,
  publisher: null,
  books: null,
  status: null,
  publishDateTime: null,
  latitude: null,
  longitude: null,
  title: null,
  description: null,
);
