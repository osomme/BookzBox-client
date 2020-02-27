import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxDetailsService {
  Future<Either<BoxDetailsError, Box>> getBox(String boxId);
}
