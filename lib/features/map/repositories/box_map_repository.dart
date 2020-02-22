import 'package:bookzbox/features/map/box_map.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxMapRepository {
  Future<Either<MapError, List<BoxMapItem>>> getAllBoxes();
}
