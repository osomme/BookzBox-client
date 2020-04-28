import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxDetailsService {
  /// Fetch a specific `Box`.
  ///
  /// [boxId] Id of the box to fetch.
  ///
  /// Returns the fetched `Box` or an error.
  Future<Either<BoxDetailsError, Box>> getBox(String boxId);
}
