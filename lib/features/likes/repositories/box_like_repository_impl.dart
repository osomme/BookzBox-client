import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:dartz/dartz.dart';

/// Repository responsible for providing a means of storing and retrieving state related to liking a box.
class BoxLikeRepository implements IBoxLikeRepository {
  final IBoxLikeService _service;

  BoxLikeRepository(this._service);

  /// Checks if the box belonging to the passed boxId parameter is liked by the user with the passed userId.
  @override
  Future<Either<NetworkError, bool>> isBoxLiked(String boxId, String userId) =>
      _service.isBoxLiked(boxId, userId);

  /// Unmarks the box with the passed box id as liked by the user.
  @override
  Future<Either<NetworkError, bool>> removeLike(String boxId, String userId) =>
      _service.removeLike(boxId, userId);

  /// Marks a box as liked.
  @override
  Future<Either<NetworkError, bool>> addLike(String boxId, String userId) =>
      _service.addLike(boxId, userId);
}
