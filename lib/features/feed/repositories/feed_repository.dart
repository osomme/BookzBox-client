import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';

abstract class IFeedRepository {
  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxesFrom(int number, DateTime fromDate);

  /// Returns a stream of BoxFeedListItems.
  /// [userId] the user ID belonging to the client user. Any boxes that belong to them are filtered out.
  Future<Stream<Iterable<BoxFeedListItem>>> getBoxesStream(String userId);

  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxRecommendations(
      String userId, int limit,
      {double latitude = -1.0, double longitude = -1.0});

  Future<void> removeRecommendation(String userId, BoxFeedListItem item);
}
