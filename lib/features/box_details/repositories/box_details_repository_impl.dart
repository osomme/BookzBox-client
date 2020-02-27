import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/box_details/errors/box_details_error.dart';
import 'package:bookzbox/features/box_details/repositories/box_details_repository.dart';
import 'package:dartz/dartz.dart';

class BoxDetailsRepository implements IBoxDetailsRepository {
  final IBoxDetailsService _service;

  BoxDetailsRepository(this._service);

  @override
  Future<Either<BoxDetailsError, Box>> getBox(String boxId) => _service.getBox(boxId);
}
