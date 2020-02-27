import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/errors/box_details_error.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxDetailsRepository {
  Future<Either<BoxDetailsError, Box>> getBox(String boxId);
}
