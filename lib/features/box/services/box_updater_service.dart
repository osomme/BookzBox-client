import 'package:bookzbox/features/box/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class IBoxUpdaterService {
  Future<Either<String, Box>> updateStatus(Box updatedBox);
}
