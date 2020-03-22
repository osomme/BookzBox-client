import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/box/box.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/models/box_feed_list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseFeedService implements IFeedService {
  final _firestore = Firestore.instance; //TODO: Inject through parameter

  @override
  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxesFrom(
      int number, DateTime fromDate) async {
    print('Fetching feed boxes...');
    final boxes = await _firestore
        .collection('boxes')
        .where('status', isEqualTo: 0)
        .where('publishDateTime',
            isGreaterThan: Timestamp.fromDate(fromDate).millisecondsSinceEpoch)
        .orderBy('publishDateTime', descending: true)
        .limit(number)
        .getDocuments()
        .then((docs) => docs.documents.map((b) => BoxFeedListItem.fromFirestore(b)).toList())
        .catchError((error) => print(error));

    return boxes != null
        ? Right(boxes)
        : Left(NetworkError.noInternet); //TODO: Replace with better solution.
  }

  /// Returns a stream of BoxFeedListItems.
  /// [userId] the user ID belonging to the client user. Any boxes that belong to them are filtered out.
  Future<Stream<Iterable<BoxFeedListItem>>> getBoxesStream(String userId) async {
    // Box status is stored as an integer in Firestore (0 = public, 1 = hidden, 2 = traded)
    // Filtering locally as a temp solution since the stream does not load document
    // updates if a 'where' query is performed on the initial Firestore snapshot query.
    return _firestore
        .collection('feed_boxes')
        //.where('status', isEqualTo: 0)
        .orderBy('publishDateTime', descending: true)
        .snapshots()
        .map((snap) => snap.documents
            .map((b) => BoxFeedListItem.fromFirestore(b))
            .where((b) => b.publisherId != userId && b.status == BoxStatus.public));
  }
}
