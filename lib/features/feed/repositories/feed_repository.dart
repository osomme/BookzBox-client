import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/box/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class IFeedRepository {
  Future<Either<NetworkError, List<Box>>> getNextBoxes(int number, DateTime fromDate);
}
