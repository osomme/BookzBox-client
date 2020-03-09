import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/feed/repositories/feed_repository.dart';
import 'package:bookzbox/features/feed/service/service.dart';
import 'package:dartz/dartz.dart';

class FeedRepository implements IFeedRepository {
  final IFeedService _service;

  FeedRepository(this._service);

  @override
  Future<Either<NetworkError, List<BoxFeedListItem>>> getBoxesFrom(
          int number, DateTime fromDate) async =>
      await _service.getBoxesFrom(number, fromDate);

  @override
  Future<Stream<Iterable<BoxFeedListItem>>> getBoxesStream(String userId) =>
      _service.getBoxesStream(userId);
}
