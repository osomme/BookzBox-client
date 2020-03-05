import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/errors/box_details_error.dart';
import 'package:bookzbox/features/new_box/services/publish_error.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxRepository {
  Future<Either<PublishError, Box>> publish(Box box);

  /// Fetch all boxes for a specific user.
  /// Returns either an error string or a list of boxes.
  Future<Either<String, List<MiniBox>>> fetchUserBoxes(String userId);
  Future<Either<String, List<MiniBox>>> fetchOtherUsersBoxes(String userId);
  Future<Either<BoxDetailsError, Box>> getBox(String boxId);

  Future<Either<String, Box>> updateStatus(Box updatedBox);
}
