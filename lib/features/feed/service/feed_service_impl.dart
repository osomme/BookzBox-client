import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/models/box_feed_list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseFeedService implements IFeedService {
  final firebase = Firestore.instance; //TODO: Inject through parameter

  @override
  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxesFrom(
      int number, DateTime fromDate) async {
    final boxes = await firebase
        .collection('boxes')
        .where('publishDateTime', isGreaterThan: Timestamp.fromDate(fromDate))
        .orderBy('publishDateTime', descending: true)
        .limit(number)
        .getDocuments()
        .then((docs) =>
            docs.documents.map((b) => BoxFeedListItem.fromFirestore(b)).toList())
        .catchError((error) => print(error));

    return boxes != null
        ? Right(boxes)
        : Left(NetworkError.noInternet); //TODO: Replace with better solution.
  }
}
