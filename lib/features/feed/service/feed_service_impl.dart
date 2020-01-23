import 'package:bookzbox/features/authentication/authentication.dart';
import 'package:bookzbox/features/box/models/book.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:dartz/dartz.dart';

class FirebaseFeedService implements IFeedService {
  @override
  Future<Either<FeedError, List<Box>>> getNextBoxes(int number, DateTime fromDate) async {
    return Right([]);
  }
}
