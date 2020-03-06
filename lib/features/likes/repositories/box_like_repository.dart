import 'dart:collection';

import 'package:bookzbox/common/errors/error_types.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxLikeRepository {
  /// Marks a box as liked.
  Future<Either<NetworkError, bool>> addLike(String boxId, String userId);

  /// Unmarks the box with the passed box id as liked by the user.
  Future<Either<NetworkError, bool>> removeLike(String boxId, String userId);

  /// Gets a broadcast stream containing a list of all the likes belonging to the user passed in the [userId] parameter.
  Future<Stream<HashSet<String>>> likesStreamFor(String userId);
}
