import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFeedRepo extends Mock implements IFeedRepository {}

void main() {
  group('Box feed store', () {
    var mockRepo = MockFeedRepo();
    var store = FeedStore(mockRepo);

    setUp(() {
      mockRepo = MockFeedRepo();
      store = FeedStore(mockRepo);
    });

    group('Computed', () {
      test('[boxes] should contain the boxes retrieved from the repository', () async {
        fail('Not implemented yet');
      });
    });
  });
}
