import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';

abstract class IFeedService {
  /// Returns an optional type containing either a list of boxes, or a feed error.
  Future<Either<FeedError, List<Box>>> getNextBoxes(int number, DateTime fromDate);
}
