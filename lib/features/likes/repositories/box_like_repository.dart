import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxLikeRepository {
  /// Checks if the box belonging to the passed boxId parameter is liked by the user with the passed userId.
  Future<Either<NetworkError, bool>> isBoxLiked(String boxId, String userId);

  /// Marks a box as liked.
  Future<Either<NetworkError, bool>> addLike(String boxId, String userId);

  /// Unmarks the box with the passed box id as liked by the user.
  Future<Either<NetworkError, bool>> removeLike(String boxId, String userId);
}
