import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';

/// Repository which provides methods for retrieving and interacting with a box recommendation service.
abstract class IFeedRepository {
  /// Retrieves a list of maximum [limit] size boxes based on recommendations.
  ///
  /// [userId] The ID of the user that is requesting the recommended boxes.
  /// [limit] The maximum number of boxes that will be returned.
  /// [latitude] OPTIONAL: The latitudinal position of the user that is requesting the recommendations.
  /// [longitude] OPTIONAL: The longitudinal position of the user that is requesting the recommendations.
  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxRecommendations(
      String userId, int limit,
      {double latitude = -1.0, double longitude = -1.0});

  /// Removes a recommendation from the recommendation system.
  ///
  /// [userId] The ID of the user that is performing the request.
  /// [item] The box feed item that is being removed.
  Future<void> removeRecommendation(String userId, BoxFeedListItem item);
}
