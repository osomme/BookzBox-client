import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/errors/box_details_error.dart';
import 'package:bookzbox/features/new_box/services/publish_error.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxRepository {
  /// Publishes the passed `Box`.
  ///
  /// [box] The non-null `Box` to publish.
  /// Returns either the published `Box`, with the generated id, on
  /// success or a `PublishError` if something went wrong.
  Future<Either<PublishError, Box>> publish(Box box);

  /// Fetch all boxes for a specific user.
  /// Returns either an error `String` or a `List` of `MiniBox`.
  Future<Either<String, List<MiniBox>>> fetchUserBoxes(String userId);

  /// Fetch all boxes for a specific user that is not
  /// the currently authenticated user.
  /// Returns either an error `String` or a `List` of `MiniBox`.
  Future<Either<String, List<MiniBox>>> fetchOtherUsersBoxes(String userId);

  /// Fetch a specific box with id [boxId].
  /// Returns either a `BoxDetailsError` or the fetched `Box`.
  Future<Either<BoxDetailsError, Box>> getBox(String boxId);

  /// Update a box with the updated content as provided by [updatedBox].
  /// Returns either a `String` on error or the updated `Box` on success.
  Future<Either<String, Box>> updateStatus(Box updatedBox);

  /// Deletes the box identified by [boxId].
  /// Returns `true` if successful; otherwise `false`.
  Future<bool> deleteBox(String boxId);
}
