import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:dartz/dartz.dart';

abstract class IMapBoxService {
  Future<Either<NetworkError, List<BoxMapItem>>> getAllBoxes();
}
