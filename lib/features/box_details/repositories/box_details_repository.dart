import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/errors/box_details_error.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxDetailsRepository {
  /// Get the box with id equal to [boxId].
  ///
  /// Returns the `Box` if found; otherwise an error.
  ///
  /// [boxId] The ID of the box that is being loaded.
  Future<Either<BoxDetailsError, Box>> getBox(String boxId);
}
