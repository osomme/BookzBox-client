import 'package:bookzbox/data_access/local_storage.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFeedService extends Mock implements IFeedService {}

class MockLocalStorage extends Mock implements ILocalStorage<BoxFeedListItem> {}

void main() {
  group('Feed repository', () {
    var mockFeedService = MockFeedService();
    var mockLocalStorage = MockLocalStorage();
    var repo = FeedRepository(mockFeedService, mockLocalStorage);

    setUp(() {
      mockFeedService = MockFeedService();
      mockLocalStorage = MockLocalStorage();
      repo = FeedRepository(mockFeedService, mockLocalStorage);
    });

    test('When local storage has less than [limit] boxes, then feed service should be called.',
        () async {
      const int limit = 2;
      var boxes = List<BoxFeedListItem>.from([_validFeedBox]);

      when(mockFeedService.getBoxRecommendations(any, any, longitude: 0.0, latitude: 0.0))
          .thenAnswer((_) => Future.value(right(boxes)));
      when(mockLocalStorage.getItems(any)).thenAnswer((_) => Future.value(boxes));
      when(mockLocalStorage.storeAll(any, any)).thenReturn(null);

      await repo.getBoxRecommendations('userId', limit, latitude: 0.0, longitude: 0.0);

      verify(mockFeedService.getBoxRecommendations(any, any, latitude: 0.0, longitude: 0.0))
          .called(1);
    });

    test('When local storage has more than [limit] boxes, then feed service should not be called.',
        () async {
      const int limit = 0;
      var boxes = List<BoxFeedListItem>.from([_validFeedBox]);

      when(mockFeedService.getBoxRecommendations(any, any, longitude: 0.0, latitude: 0.0))
          .thenAnswer((_) => Future.value(right(boxes)));
      when(mockLocalStorage.getItems(any)).thenAnswer((_) => Future.value(boxes));
      when(mockLocalStorage.storeAll(any, any)).thenReturn(null);

      await repo.getBoxRecommendations('userId', limit, latitude: 0.0, longitude: 0.0);

      verifyZeroInteractions(mockFeedService);
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
