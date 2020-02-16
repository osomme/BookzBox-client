import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';

abstract class IFeedService {
  /// Returns an optional type containing either a list of boxes, or a feed error.
  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxesFrom(
      int number, DateTime fromDate);
}
