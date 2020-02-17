import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/authentication/models/models.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
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
      test(
          '[error] should be set to the error that is returned from the repository when repo fetch fails',
          () async {
        when(mockRepo.getBoxesFrom(any, any))
            .thenAnswer((_) => Future.value(Left(NetworkError.noInternet)));
        final store = FeedStore(mockRepo);
        await store.init();
        expect(store.error, NetworkError.noInternet);
      });

      test(
          '[currentIndex] should be set to the index that is passed in the parameter, if it is positive',
          () {
        store.setIndex(3);
        expect(store.currentIndex, equals(3));
      });

      test(
          '[currentIndex] should be set to 0 if a negative number is passed as argument to [setIndex]',
          () {
        store.setIndex(5); // To remove false positives
        store.setIndex(-1);
        expect(store.currentIndex, equals(0));
      });

      test('[boxes] should contain the boxes retrieved from the repository', () async {
        fail('Not implemented yet');
      });
    });
  });
}
