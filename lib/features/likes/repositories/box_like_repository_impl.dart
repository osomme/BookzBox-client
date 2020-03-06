import 'dart:collection';

import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:dartz/dartz.dart';

/// Repository responsible for providing a means of storing and retrieving state related to liking a box.
class BoxLikeRepository implements IBoxLikeRepository {
  final IBoxLikeService _service;

  BoxLikeRepository(this._service);

  /// Unmarks the box with the passed box id as liked by the user.
  @override
  Future<Either<NetworkError, bool>> removeLike(String boxId, String userId) =>
      _service.removeLike(boxId, userId);

  /// Marks a box as liked.
  @override
  Future<Either<NetworkError, bool>> addLike(String boxId, String userId) =>
      _service.addLike(boxId, userId);

  /// Gets a broadcast stream containing a list of all the likes belonging to the user passed in the [userId] parameter.
  @override
  Future<Stream<HashSet<String>>> likesStreamFor(String userId) =>
      _service.likesStreamFor(userId);
}
