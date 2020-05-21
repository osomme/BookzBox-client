import 'package:bookzbox/features/box/models/models.dart';
import 'package:dartz/dartz.dart';

/// Interface which contains methods for updating a box.
abstract class IBoxUpdaterService {
  /// Updates the box status in the database.
  ///
  /// [updatedBox] The box that is being updated.
  Future<Either<String, Box>> updateStatus(Box updatedBox);
}
