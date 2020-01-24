import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/feed/repositories/feed_repository.dart';
import 'package:bookzbox/features/feed/service/service.dart';
import 'package:dartz/dartz.dart';

class FirebaseFeedRepository implements IFeedRepository {
  final IFeedService _service;

  FirebaseFeedRepository(this._service);

  @override
  Future<Either<NetworkError, List<Box>>> getNextBoxes(
          int number, DateTime fromDate) async =>
      await _service.getNextBoxes(number, fromDate);
}
