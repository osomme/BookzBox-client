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
        when(mockRepo.getNextBoxes(any, any))
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
        when(mockRepo.getNextBoxes(any, any))
            .thenAnswer((_) => Future.value(Right(_testBoxes)));
        final store = FeedStore(mockRepo);
        await store.init();
        expect(listEquals(store.boxes.toList(), _testBoxes), isTrue);
      });
    });
  });
}

final _user = User('abcdef');

final _testBoxes = [
  Box(
    books: <Book>[
      Book(
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
      ),
      Book(
        authors: ['Ernest Hemingway'],
        categories: ['Action', 'Adventure'],
        fullSizeImageUrl: 'https://upload.wikimedia.org/wikipedia/en/7/73/Oldmansea.jpg',
        isbn10: 'this-is-isbn10',
        isbn13: 'this-is-isbn13',
        pageCount: 435,
        publisher: 'Charles Scribners\'s Sons',
        publishYear: 1952,
        synopsis:
            'Tells the story of Santiago, an aging Cuban fisherman who struggles with a giant marlin far out in the Gulf Stream off the coast of Cuba.',
        thumbnailUrl: 'https://upload.wikimedia.org/wikipedia/en/7/73/Oldmansea.jpg',
        title: 'The Old Man and the Sea',
      ),
    ],
    id: 'box1',
    description: 'Just some books I am trying to get rid of',
    longitude: 45.2,
    latitude: 84.23,
    publishDateTime: DateTime.now().subtract(Duration(days: 5)),
    status: BoxStatus.public,
    title: 'Two books by Ernest Hemingway',
    publisher: _user,
  ),
  Box(
    books: <Book>[
      Book(
        authors: ['Tom Heine Nätt', 'Christian F. Heide'],
        categories: ['Educational', 'Computer Science', 'Security'],
        fullSizeImageUrl: 'http://www.datasikkerhetsboka.no/datasikkerhet.jpg',
        isbn10: 'this-is-isbn10',
        isbn13: 'this-is-isbn13',
        pageCount: 337,
        publisher: 'Gyldendal akademisk',
        publishYear: 2015,
        synopsis:
            'Learn computer security in a easy to digets way that does not require prerequisite knowledge of advanced computer topics',
        thumbnailUrl: 'http://www.datasikkerhetsboka.no/datasikkerhet.jpg',
        title: 'Datasikkerhet',
      ),
      Book(
        authors: ['Tom Heine Nätt', 'Eva M. Hornnes', 'Jostein Nordengen'],
        categories: ['Educational', 'Computer Science', 'Web development'],
        fullSizeImageUrl: null,
        isbn10: 'this-is-isbn10',
        isbn13: 'this-is-isbn13',
        pageCount: 372,
        publisher: 'Charles Scribners\'s Sons',
        publishYear: 2017,
        synopsis: 'A good entry point to start learning web development',
        thumbnailUrl: null,
        title: 'Webutvikling',
      ),
      Book(
        authors: ['Tom Heine Nätt', 'Eva M. Hornnes', 'Jostein Nordengen'],
        categories: ['Educational', 'Computer Science', 'Web development'],
        fullSizeImageUrl: null,
        isbn10: 'this-is-isbn10',
        isbn13: 'this-is-isbn13',
        pageCount: 372,
        publisher: 'Charles Scribners\'s Sons',
        publishYear: 2017,
        synopsis: 'A good entry point to start learning web development',
        thumbnailUrl: null,
        title: 'Webutvikling',
      ),
    ],
    id: 'box2',
    description:
        'Since I an no longer taking any classes that use these books as their curriculum, I might as well sell them.',
    longitude: 45.2,
    latitude: 84.23,
    publishDateTime: DateTime.now().subtract(Duration(days: 2)),
    status: BoxStatus.public,
    title: 'Some unused school books that I no longer have any need for',
    publisher: _user,
  ),
];
