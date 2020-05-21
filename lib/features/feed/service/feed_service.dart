import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';

abstract class IFeedService {
  /// Get recommendations for a specific user, limiting the amount of recommendations by [limit].
  ///
  /// Returns either an error or a list of boxes.
  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxRecommendations(
      String userId, int limit,
      {double latitude = -1.0, double longitude = -1.0});
}
