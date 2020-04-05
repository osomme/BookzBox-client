import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFeedRepo extends Mock implements IFeedRepository {}

class MockLocationService extends Mock implements ILocationService {}

void main() {
  group('Box feed store', () {
    var mockRepo = MockFeedRepo();
    var locService = LocationService();
    var store = FeedStore(mockRepo, locService);

    setUp(() {
      mockRepo = MockFeedRepo();
      locService = LocationService();
      store = FeedStore(mockRepo, locService);
    });

    test('When boxes are fetched, then [boxes] should be updated with the fetched boxes.',
        () async {
      var expectedBoxes = List<BoxFeedListItem>.from([_validFeedBox]);
      when(mockRepo.getBoxRecommendations(any, any))
          .thenAnswer((_) => Future.value(right(expectedBoxes)));

      await store.fetchBoxes('userABC');

      expect(store.boxes.length, expectedBoxes.length);
    });

    test('When duplicate boxes are fetched, then the boxes should not be added.', () async {
      var boxes = List<BoxFeedListItem>.from([_validFeedBox]);

      when(mockRepo.getBoxRecommendations(any, any)).thenAnswer((_) => Future.value(right(boxes)));

      await store.fetchBoxes('userABC'); // Get the boxes once.
      await store.fetchBoxes('userABC'); // Get the duplicate boxes.

      expect(store.boxes.length, boxes.length);
    });
  });
}

BoxFeedListItem _validFeedBox = BoxFeedListItem(
  id: 'agwfqdervdsdasd',
  title: 'A valid box',
  description: '',
  lat: 21.0,
  lng: -122.1,
  publisherId: 'user',
  status: BoxStatus.public,
  publishedOn: DateTime.now(),
  books: List.from([_validBook]),
);

BoxFeedBook _validBook = BoxFeedBook(
  categories: List(),
  thumbnailUrl: '',
);
