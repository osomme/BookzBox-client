import 'package:bookzbox/features/map/box_map.dart';
import 'package:dartz/dartz.dart';

class BoxMapFirebaseRepository implements IBoxMapRepository {
  final IMapBoxService _service;

  BoxMapFirebaseRepository(this._service);

  @override
  Future<Either<MapError, List<BoxMapItem>>> getAllBoxes() => _service.getAllBoxes();
}
