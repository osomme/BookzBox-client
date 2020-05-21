import 'package:bookzbox/features/map/box_map.dart';
import 'package:dartz/dartz.dart';

/// Repository which provides methods for retrieving map boxes.
abstract class IBoxMapRepository {
  /// Loads all map boxes.
  Future<Either<MapError, List<BoxMapItem>>> getAllBoxes();
}
