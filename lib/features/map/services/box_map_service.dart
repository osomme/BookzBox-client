import 'package:bookzbox/features/map/box_map.dart';
import 'package:dartz/dartz.dart';

/// Service which provides methods for retrieving map boxes.
abstract class IMapBoxService {
  /// Loads all map boxes.
  Future<Either<MapError, List<BoxMapItem>>> getAllBoxes();
}
