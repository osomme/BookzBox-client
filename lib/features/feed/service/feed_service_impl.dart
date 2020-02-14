import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';

class FirebaseFeedService implements IFeedService {
  @override
  Future<Either<NetworkError, List<Box>>> getNextBoxes(
      int number, DateTime fromDate) async {
    //TODO: Add firebase support.
    return Right(testBoxes.take(number).toList());
  }
}

//TODO: Remove after enabling fetching from a remote data source.
/// For testing purposes:
final _user = User('abcdef');

final testBoxes = [
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
        thumbnailUrl:
            'https://wendyvancamp.files.wordpress.com/2014/02/the-lord-of-the-rings-book-cover.jpg',
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
        thumbnailUrl: 'https://universe.byu.edu/wp-content/uploads/2015/01/HP4cover.jpg',
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
        thumbnailUrl:
            'https://book-assets.openroadmedia.com/9781504044486-book-cover.jpg',
        title: 'Webutvikling',
      ),
    ],
    id: 'box2',
    description:
        'Since I an no longer taking any classes that use these books as their curriculum, I might as well sell them.',
    latitude: 5.751374,
    longitude: 58.9728622,
    publishDateTime: DateTime.now().subtract(Duration(days: 2)),
    status: BoxStatus.public,
    title: 'Some unused school books that I no longer have any need for',
    publisher: _user,
  ),
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
    latitude: 11.3557011,
    longitude: 59.1286776,
    publishDateTime: DateTime.now().subtract(Duration(days: 5)),
    status: BoxStatus.public,
    title: 'Two books by Ernest Hemingway',
    publisher: _user,
  ),
];
