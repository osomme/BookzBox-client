import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/likes/likes.dart';
import 'package:dartz/dartz.dart';

/// Service which provides functions which allows for a user to like and unlike a box, as well as the
/// ability to check if they already have liked a box.
abstract class IBoxLikeService {
  /// Checks if the box belonging to the passed boxId parameter is liked by the user with the passed userId.
  Future<Either<NetworkError, bool>> isBoxLiked(String boxId, String userId);

  /// Unmarks the box with the passed box id as liked by the user.
  Future<Either<NetworkError, bool>> removeLike(String boxId, String userId);

  /// Adds a like to a box.
  Future<Either<NetworkError, bool>> addLike(String boxId, String userId);
}
