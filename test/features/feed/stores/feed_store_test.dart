import 'package:bookzbox/common/errors/error_types.dart';
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

    group('Computed', () {
      test('[boxes] should contain the boxes retrieved from the repository', () async {
        fail('Not implemented yet');
      });
    });
  });
}
