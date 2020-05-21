import 'dart:collection';

import 'package:bookzbox/common/errors/error_types.dart';
import 'package:dartz/dartz.dart';

/// Service which provides functions which allows for a user to like and unlike a box, as well as the
/// ability to check if they already have liked a box.
abstract class IBoxLikeService {
  /// Unmarks the box with the passed box id as liked by the user.
  ///
  /// [boxId] ID of the box whose like is being removed.
  /// [userId] The ID of the user that is removing their like.
  Future<Either<NetworkError, bool>> removeLike(String boxId, String userId);

  /// Adds a like to a box.
  ///
  /// [boxId] ID of the box that is being liked.
  /// [userId] The ID of the user that is liking the box.
  Future<Either<NetworkError, bool>> addLike(String boxId, String userId);

  /// Gets a broadcast stream containing a list of all the likes belonging to the user passed in the [userId] parameter.
  ///
  /// [userId] The user ID of the user whose like stream is being retrieved.
  Future<Stream<HashSet<String>>> likesStreamFor(String userId);
}
