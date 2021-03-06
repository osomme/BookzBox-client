import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/data_access/HiveBox.dart';
import 'package:bookzbox/data_access/local_storage.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/repositories/feed_repository.dart';
import 'package:bookzbox/features/feed/service/service.dart';
import 'package:dartz/dartz.dart';

class FeedRepository implements IFeedRepository {
  final IFeedService _service;
  final ILocalStorage<BoxFeedListItem> _recommendationStorage;

  FeedRepository(this._service, this._recommendationStorage);

  /// Gets the [limit] amount of recommended boxes.
  /// Boxes are only fetched from external sources if there are not
  /// 10 of the recommended boxes available locally.
  /// [userId] The id of the user of whom to get recommendations for.
  /// [limit] The maximum amount of recommendations to fetch externally.
  /// [latitude] Optional location parameter.
  /// [longitude] Optional location parameter.
  @override
  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxRecommendations(
      String userId, int limit,
      {double latitude = -1.0, double longitude = -1.0}) async {
    var boxes = await getLocalRecommendations(userId);

    if (boxes.length >= 10) {
      // Already got enough boxes stored locally.
      return right(boxes);
    }

    final result = await _service.getBoxRecommendations(
      userId,
      limit,
      latitude: latitude,
      longitude: longitude,
    );

    result.fold(
      (err) => print("Not saving locally as an error occured."),
      (boxes) async {
        await storeRecommendations(userId, boxes);
      },
    );

    if (result.isLeft()) {
      return result; // Just return the error.
    }
    return right(await getLocalRecommendations(userId));
  }

  /// Stores the recommended boxes locally.
  Future<void> storeRecommendations(String userId, List<BoxFeedListItem> boxes) async {
    await _recommendationStorage.storeAll(userId + HiveBox.recommendations, boxes);
  }

  /// Removes a recommendation for local storage.
  Future<void> removeRecommendation(String userId, BoxFeedListItem item) async {
    if (userId == null || item == null) {
      return;
    }
    await _recommendationStorage.remove(userId + HiveBox.recommendations, item.key);
  }

  Future<List<BoxFeedListItem>> getLocalRecommendations(String userId) async {
    return await _recommendationStorage.getItems(userId);
  }
}
