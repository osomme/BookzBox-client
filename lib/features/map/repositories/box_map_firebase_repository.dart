import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:dartz/dartz.dart';

class BoxMapFirebaseRepository implements IBoxMapRepository {
  final IMapBoxService _service;

  BoxMapFirebaseRepository(this._service);

  @override
  Future<Either<NetworkError, List<BoxMapItem>>> getAllBoxes() => _service.getAllBoxes();
}
