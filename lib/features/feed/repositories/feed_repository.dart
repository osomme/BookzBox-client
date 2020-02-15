import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';

abstract class IFeedRepository {
  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxesFrom(
      int number, DateTime fromDate);
}
